package max.ohm.oneai.imagegeneration

import android.content.Context
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.util.Base64
import androidx.datastore.core.DataStore
import androidx.datastore.preferences.core.*
import androidx.datastore.preferences.preferencesDataStore
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.map
import kotlinx.serialization.Serializable
import kotlinx.serialization.encodeToString
import kotlinx.serialization.decodeFromString
import kotlinx.serialization.json.Json
import java.io.ByteArrayOutputStream
import java.io.File
import java.io.FileOutputStream
import java.net.URL
import java.util.UUID
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import android.util.Log

// Extension for DataStore
val Context.imageHistoryDataStore: DataStore<Preferences> by preferencesDataStore(name = "image_history")

@Serializable
data class ImageHistoryItem(
    val id: String,
    val prompt: String,
    val localFilePath: String?, // Path to locally saved image file
    val imageUrl: String?, // For URL-based images
    val timestamp: Long,
    val model: String
)

class ImageHistoryDataStore(private val context: Context) {
    
    companion object {
        private val IMAGE_HISTORY_KEY = stringPreferencesKey("image_history")
        private const val MAX_HISTORY_SIZE = 100 // Maximum number of images to store
        private const val IMAGE_FOLDER_NAME = "ai_generated_images"
    }
    
    private val json = Json { 
        ignoreUnknownKeys = true
        encodeDefaults = true
    }
    
    // Get all saved images
    val imageHistory: Flow<List<ImageHistoryItem>> = context.imageHistoryDataStore.data
        .map { preferences ->
            val historyJson = preferences[IMAGE_HISTORY_KEY] ?: "[]"
            try {
                json.decodeFromString<List<ImageHistoryItem>>(historyJson)
            } catch (e: Exception) {
                emptyList()
            }
        }
    
    // Save a new image to history
    suspend fun saveImage(
        prompt: String,
        imageData: Any?, // ByteArray or URL
        model: String
    ): ImageHistoryItem? = withContext(Dispatchers.IO) {
        try {
            val id = UUID.randomUUID().toString()
            val timestamp = System.currentTimeMillis()
            
            Log.d("ImageHistoryDataStore", "Saving image with id: $id")
            
            // Save image to local storage
            val localFilePath = when (imageData) {
                is ByteArray -> {
                    Log.d("ImageHistoryDataStore", "Saving ByteArray image")
                    saveImageToFile(imageData, id)
                }
                is String -> {
                    // For URL images, download and save locally
                    Log.d("ImageHistoryDataStore", "Downloading and saving URL image: $imageData")
                    downloadAndSaveImage(imageData, id)
                }
                else -> {
                    Log.e("ImageHistoryDataStore", "Unknown image data type")
                    null
                }
            }
            
            if (localFilePath == null) {
                Log.e("ImageHistoryDataStore", "Failed to save image file")
                return@withContext null
            }
            
            val imageUrl = if (imageData is String) imageData else null
            
            val newItem = ImageHistoryItem(
                id = id,
                prompt = prompt,
                localFilePath = localFilePath,
                imageUrl = imageUrl,
                timestamp = timestamp,
                model = model
            )
            
            // Add to history
            context.imageHistoryDataStore.edit { preferences ->
                val currentHistoryJson = preferences[IMAGE_HISTORY_KEY] ?: "[]"
                val currentHistory = try {
                    json.decodeFromString<MutableList<ImageHistoryItem>>(currentHistoryJson)
                } catch (e: Exception) {
                    mutableListOf()
                }
                
                // Add new item at the beginning
                currentHistory.add(0, newItem)
                
                // Keep only the latest MAX_HISTORY_SIZE items
                if (currentHistory.size > MAX_HISTORY_SIZE) {
                    // Remove oldest items and their files
                    val itemsToRemove = currentHistory.subList(MAX_HISTORY_SIZE, currentHistory.size)
                    itemsToRemove.forEach { item ->
                        item.localFilePath?.let { deleteImageFile(it) }
                    }
                    currentHistory.removeAll(itemsToRemove)
                }
                
                preferences[IMAGE_HISTORY_KEY] = json.encodeToString(currentHistory)
            }
            
            Log.d("ImageHistoryDataStore", "Image saved successfully: $newItem")
            newItem
        } catch (e: Exception) {
            Log.e("ImageHistoryDataStore", "Error saving image", e)
            e.printStackTrace()
            null
        }
    }
    
    // Delete a specific image from history
    suspend fun deleteImage(imageId: String) {
        context.imageHistoryDataStore.edit { preferences ->
            val currentHistoryJson = preferences[IMAGE_HISTORY_KEY] ?: "[]"
            val currentHistory = try {
                json.decodeFromString<MutableList<ImageHistoryItem>>(currentHistoryJson)
            } catch (e: Exception) {
                mutableListOf()
            }
            
            // Find and remove the item
            val itemToRemove = currentHistory.find { it.id == imageId }
            itemToRemove?.let {
                // Delete the local file
                it.localFilePath?.let { path -> deleteImageFile(path) }
                currentHistory.remove(it)
            }
            
            preferences[IMAGE_HISTORY_KEY] = json.encodeToString(currentHistory)
        }
    }
    
    // Clear all history
    suspend fun clearAllHistory() {
        // Delete all image files from both locations
        val internalImageDir = File(context.filesDir, IMAGE_FOLDER_NAME)
        if (internalImageDir.exists()) {
            internalImageDir.listFiles()?.forEach { it.delete() }
        }
        
        val externalImageDir = File(context.getExternalFilesDir(null), IMAGE_FOLDER_NAME)
        if (externalImageDir.exists()) {
            externalImageDir.listFiles()?.forEach { it.delete() }
        }
        
        // Clear preferences
        context.imageHistoryDataStore.edit { preferences ->
            preferences[IMAGE_HISTORY_KEY] = "[]"
        }
    }
    
    // Save image data to file
    private fun saveImageToFile(imageData: ByteArray, imageId: String): String? {
        return try {
            // Use getExternalFilesDir for more persistent storage
            val imageDir = File(context.getExternalFilesDir(null), IMAGE_FOLDER_NAME)
            if (!imageDir.exists()) {
                imageDir.mkdirs()
            }
            
            val imageFile = File(imageDir, "$imageId.png")
            Log.d("ImageHistoryDataStore", "Saving image to: ${imageFile.absolutePath}")
            
            FileOutputStream(imageFile).use { fos ->
                fos.write(imageData)
                fos.flush() // Ensure data is written
            }
            
            // Verify file was written
            if (imageFile.exists() && imageFile.length() > 0) {
                Log.d("ImageHistoryDataStore", "Image file saved successfully: ${imageFile.length()} bytes")
                imageFile.absolutePath
            } else {
                Log.e("ImageHistoryDataStore", "Image file was not saved properly")
                null
            }
        } catch (e: Exception) {
            Log.e("ImageHistoryDataStore", "Error saving image file", e)
            e.printStackTrace()
            null
        }
    }
    
    // Download and save image from URL
    private suspend fun downloadAndSaveImage(imageUrl: String, imageId: String): String? = withContext(Dispatchers.IO) {
        try {
            Log.d("ImageHistoryDataStore", "Starting download from: $imageUrl")
            val url = URL(imageUrl)
            val connection = url.openConnection()
            connection.doInput = true
            connection.connectTimeout = 30000 // 30 seconds
            connection.readTimeout = 30000 // 30 seconds
            connection.connect()
            
            val inputStream = connection.inputStream
            val bitmap = BitmapFactory.decodeStream(inputStream)
            inputStream.close()
            
            if (bitmap == null) {
                Log.e("ImageHistoryDataStore", "Failed to decode bitmap from URL")
                return@withContext null
            }
            
            // Convert to byte array
            val outputStream = ByteArrayOutputStream()
            bitmap.compress(Bitmap.CompressFormat.PNG, 100, outputStream)
            val imageData = outputStream.toByteArray()
            
            Log.d("ImageHistoryDataStore", "Downloaded ${imageData.size} bytes")
            
            // Save to file
            saveImageToFile(imageData, imageId)
        } catch (e: Exception) {
            Log.e("ImageHistoryDataStore", "Error downloading image", e)
            e.printStackTrace()
            null
        }
    }
    
    // Delete image file
    private fun deleteImageFile(filePath: String) {
        try {
            val file = File(filePath)
            if (file.exists()) {
                file.delete()
            }
        } catch (e: Exception) {
            e.printStackTrace()
        }
    }
    
    // Get image data from history item
    fun getImageData(item: ImageHistoryItem): Any? {
        return try {
            // First try to return the file path directly for local image
            item.localFilePath?.let { path ->
                val file = File(path)
                if (file.exists()) {
                    Log.d("ImageHistoryDataStore", "Loading image from file: $path")
                    // Return the File object directly so AsyncImage can handle it
                    return file
                } else {
                    Log.e("ImageHistoryDataStore", "File not found: $path")
                }
            }
            
            // Fall back to URL if available
            if (item.imageUrl != null) {
                Log.d("ImageHistoryDataStore", "Falling back to URL: ${item.imageUrl}")
            }
            item.imageUrl
        } catch (e: Exception) {
            Log.e("ImageHistoryDataStore", "Error loading image data", e)
            e.printStackTrace()
            null
        }
    }
}
