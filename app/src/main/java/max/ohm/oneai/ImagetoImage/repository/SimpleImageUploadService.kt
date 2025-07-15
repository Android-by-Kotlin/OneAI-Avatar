package max.ohm.oneai.imagetoimage.repository

import android.content.Context
import android.net.Uri
import android.util.Log
import com.google.firebase.storage.FirebaseStorage
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.tasks.await
import kotlinx.coroutines.withContext
import java.util.UUID

object SimpleImageUploadService {
    private const val TAG = "SimpleImageUpload"

    suspend fun uploadImageFromUri(context: Context, uri: Uri): String? = withContext(Dispatchers.IO) {
        try {
            Log.d(TAG, "Starting image upload from URI: $uri")

            val filename = "image_${UUID.randomUUID()}.jpg"
            val storageRef = FirebaseStorage.getInstance().reference.child("uploaded_images/$filename")
            
            val uploadTask = storageRef.putFile(uri).await()
            val downloadUrl = storageRef.downloadUrl.await().toString()

            Log.d(TAG, "Upload successful, URL: $downloadUrl")
            downloadUrl
        } catch (e: Exception) {
            Log.e(TAG, "Error during image upload", e)
            null
        }
    }
}
