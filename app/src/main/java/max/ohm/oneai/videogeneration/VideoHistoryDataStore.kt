package max.ohm.oneai.videogeneration

import android.content.Context
import androidx.datastore.core.DataStore
import androidx.datastore.preferences.core.Preferences
import androidx.datastore.preferences.core.edit
import androidx.datastore.preferences.core.stringPreferencesKey
import androidx.datastore.preferences.preferencesDataStore
import com.google.gson.Gson
import com.google.gson.reflect.TypeToken
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.map
import java.util.UUID

private val Context.videoDataStore: DataStore<Preferences> by preferencesDataStore(name = "video_history")

class VideoHistoryDataStore(private val context: Context) {
    
    private val gson = Gson()
    private val videoHistoryKey = stringPreferencesKey("video_history")
    
    val videoHistory: Flow<List<VideoHistoryItem>> = context.videoDataStore.data
        .map { preferences ->
            val json = preferences[videoHistoryKey] ?: "[]"
            try {
                val type = object : TypeToken<List<VideoHistoryItem>>() {}.type
                gson.fromJson<List<VideoHistoryItem>>(json, type) ?: emptyList()
            } catch (e: Exception) {
                emptyList()
            }
        }
    
    suspend fun addVideo(
        prompt: String,
        videoUrl: String,
        model: String = "Wan 2.1",
        thumbnailPath: String? = null
    ) {
        val newVideo = VideoHistoryItem(
            id = UUID.randomUUID().toString(),
            prompt = prompt,
            videoUrl = videoUrl,
            thumbnailPath = thumbnailPath,
            timestamp = System.currentTimeMillis(),
            model = model
        )
        
        context.videoDataStore.edit { preferences ->
            val currentJson = preferences[videoHistoryKey] ?: "[]"
            val currentList = try {
                val type = object : TypeToken<List<VideoHistoryItem>>() {}.type
                gson.fromJson<List<VideoHistoryItem>>(currentJson, type) ?: emptyList()
            } catch (e: Exception) {
                emptyList()
            }
            
            // Add new video to the beginning of the list
            val updatedList = listOf(newVideo) + currentList
            
            // Keep only the latest 50 videos
            val limitedList = updatedList.take(50)
            
            preferences[videoHistoryKey] = gson.toJson(limitedList)
        }
    }
    
    suspend fun removeVideo(videoId: String) {
        context.videoDataStore.edit { preferences ->
            val currentJson = preferences[videoHistoryKey] ?: "[]"
            val currentList = try {
                val type = object : TypeToken<List<VideoHistoryItem>>() {}.type
                gson.fromJson<List<VideoHistoryItem>>(currentJson, type) ?: emptyList()
            } catch (e: Exception) {
                emptyList()
            }
            
            // Find video to remove and delete its thumbnail
            val videoToRemove = currentList.find { it.id == videoId }
            videoToRemove?.thumbnailPath?.let { thumbnailPath ->
                VideoThumbnailGenerator.deleteThumbnail(thumbnailPath)
            }
            
            val updatedList = currentList.filter { it.id != videoId }
            preferences[videoHistoryKey] = gson.toJson(updatedList)
        }
    }
    
    suspend fun clearHistory() {
        context.videoDataStore.edit { preferences ->
            // Get current list to clean up thumbnails
            val currentJson = preferences[videoHistoryKey] ?: "[]"
            val currentList = try {
                val type = object : TypeToken<List<VideoHistoryItem>>() {}.type
                gson.fromJson<List<VideoHistoryItem>>(currentJson, type) ?: emptyList()
            } catch (e: Exception) {
                emptyList()
            }
            
            // Delete all thumbnails
            currentList.forEach { video ->
                video.thumbnailPath?.let { thumbnailPath ->
                    VideoThumbnailGenerator.deleteThumbnail(thumbnailPath)
                }
            }
            
            preferences[videoHistoryKey] = "[]"
        }
    }
    
    fun getVideoData(item: VideoHistoryItem): GeneratedVideo? {
        return try {
            GeneratedVideo(
                id = item.id,
                prompt = item.prompt,
                videoUrl = item.videoUrl,
                thumbnailPath = item.thumbnailPath,
                timestamp = item.timestamp,
                model = item.model
            )
        } catch (e: Exception) {
            null
        }
    }
}
