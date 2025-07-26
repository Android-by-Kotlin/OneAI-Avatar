package max.ohm.oneai.videogeneration

import android.content.Context
import android.graphics.Bitmap
import android.media.MediaMetadataRetriever
import android.util.Log
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import java.io.File
import java.io.FileOutputStream
import java.io.IOException

object VideoThumbnailGenerator {
    
    private const val TAG = "VideoThumbnailGenerator"
    
    /**
     * Generates a thumbnail from a video URL and saves it to internal storage
     * @param context Application context
     * @param videoUrl URL of the video (can be local file path or remote URL)
     * @param videoId Unique identifier for the video
     * @return Path to the saved thumbnail file, or null if generation failed
     */
    suspend fun generateThumbnail(
        context: Context,
        videoUrl: String,
        videoId: String
    ): String? {
        return withContext(Dispatchers.IO) {
            try {
                val retriever = MediaMetadataRetriever()
                
                try {
                    // Set data source - works for both local files and URLs
                    if (videoUrl.startsWith("http")) {
                        retriever.setDataSource(videoUrl, HashMap<String, String>())
                    } else {
                        retriever.setDataSource(videoUrl)
                    }
                    
                    // Get frame at 1 second (1,000,000 microseconds)
                    val bitmap = retriever.getFrameAtTime(
                        1000000L, // 1 second
                        MediaMetadataRetriever.OPTION_CLOSEST_SYNC
                    )
                    
                    if (bitmap != null) {
                        // Create thumbnail directory if it doesn't exist
                        val thumbnailDir = File(context.filesDir, "video_thumbnails")
                        if (!thumbnailDir.exists()) {
                            thumbnailDir.mkdirs()
                        }
                        
                        // Create thumbnail file
                        val thumbnailFile = File(thumbnailDir, "${videoId}_thumbnail.jpg")
                        
                        // Save bitmap to file
                        FileOutputStream(thumbnailFile).use { out ->
                            bitmap.compress(Bitmap.CompressFormat.JPEG, 85, out)
                        }
                        
                        Log.d(TAG, "Thumbnail generated successfully: ${thumbnailFile.absolutePath}")
                        return@withContext thumbnailFile.absolutePath
                    } else {
                        Log.e(TAG, "Failed to extract frame from video: $videoUrl")
                        return@withContext null
                    }
                    
                } finally {
                    try {
                        retriever.release()
                    } catch (e: Exception) {
                        Log.e(TAG, "Error releasing MediaMetadataRetriever", e)
                    }
                }
                
            } catch (e: Exception) {
                Log.e(TAG, "Error generating thumbnail for video: $videoUrl", e)
                return@withContext null
            }
        }
    }
    
    /**
     * Generates a scaled thumbnail bitmap for immediate use
     * @param context Application context
     * @param videoUrl URL of the video
     * @param maxWidth Maximum width of the thumbnail
     * @param maxHeight Maximum height of the thumbnail
     * @return Bitmap thumbnail or null if generation failed
     */
    suspend fun generateThumbnailBitmap(
        context: Context,
        videoUrl: String,
        maxWidth: Int = 320,
        maxHeight: Int = 180
    ): Bitmap? {
        return withContext(Dispatchers.IO) {
            try {
                val retriever = MediaMetadataRetriever()
                
                try {
                    if (videoUrl.startsWith("http")) {
                        retriever.setDataSource(videoUrl, HashMap<String, String>())
                    } else {
                        retriever.setDataSource(videoUrl)
                    }
                    
                    val bitmap = retriever.getFrameAtTime(
                        1000000L, // 1 second
                        MediaMetadataRetriever.OPTION_CLOSEST_SYNC
                    )
                    
                    if (bitmap != null) {
                        // Scale bitmap if needed
                        val scaledBitmap = if (bitmap.width > maxWidth || bitmap.height > maxHeight) {
                            val aspectRatio = bitmap.width.toFloat() / bitmap.height.toFloat()
                            val (newWidth, newHeight) = if (aspectRatio > 1) {
                                // Landscape
                                maxWidth to (maxWidth / aspectRatio).toInt()
                            } else {
                                // Portrait or square
                                (maxHeight * aspectRatio).toInt() to maxHeight
                            }
                            
                            val scaled = Bitmap.createScaledBitmap(bitmap, newWidth, newHeight, true)
                            if (scaled != bitmap) {
                                bitmap.recycle() // Recycle original if we created a new one
                            }
                            scaled
                        } else {
                            bitmap
                        }
                        
                        return@withContext scaledBitmap
                    }
                    
                } finally {
                    try {
                        retriever.release()
                    } catch (e: Exception) {
                        Log.e(TAG, "Error releasing MediaMetadataRetriever", e)
                    }
                }
                
            } catch (e: Exception) {
                Log.e(TAG, "Error generating thumbnail bitmap for video: $videoUrl", e)
            }
            
            return@withContext null
        }
    }
    
    /**
     * Deletes a thumbnail file
     * @param thumbnailPath Path to the thumbnail file
     */
    fun deleteThumbnail(thumbnailPath: String?) {
        if (thumbnailPath != null) {
            try {
                val file = File(thumbnailPath)
                if (file.exists()) {
                    file.delete()
                    Log.d(TAG, "Thumbnail deleted: $thumbnailPath")
                }
            } catch (e: Exception) {
                Log.e(TAG, "Error deleting thumbnail: $thumbnailPath", e)
            }
        }
    }
}
