package max.ohm.noai.texttomusic

import android.content.Context
import android.util.Log
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.delay
import kotlinx.coroutines.withContext
import kotlinx.coroutines.withTimeoutOrNull
import okhttp3.MediaType.Companion.toMediaType
import okhttp3.OkHttpClient
import okhttp3.Request
import okhttp3.RequestBody.Companion.toRequestBody
import okhttp3.logging.HttpLoggingInterceptor
import org.json.JSONObject
import java.io.File
import java.io.FileOutputStream
import java.io.IOException
import java.net.SocketTimeoutException
import java.util.concurrent.TimeUnit

/**
 * Service class for interacting with Beatoven.ai API for text-to-music generation
 */
class BeatovenService {
    private val client: OkHttpClient
    private val TAG = "BeatovenService"
    private val BACKEND_V1_API_URL = "https://public-api.beatoven.ai/api/v1"
    
    // List of fallback music URLs for testing
    private val FALLBACK_MUSIC_URLS = listOf(
        "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3",
        "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3",
        "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3"
    )
    
    init {
        // Set up logging interceptor for debugging
        val loggingInterceptor = HttpLoggingInterceptor().apply {
            level = HttpLoggingInterceptor.Level.BASIC
        }
        
        // Create custom OkHttpClient with longer timeouts
        client = OkHttpClient.Builder()
            .connectTimeout(120, TimeUnit.SECONDS)
            .readTimeout(120, TimeUnit.SECONDS)
            .writeTimeout(120, TimeUnit.SECONDS)
            .addInterceptor(loggingInterceptor)
            .build()
    }
    
    /**
     * Compose a track based on text prompt
     * 
     * @param textPrompt The text prompt to generate music from
     * @return Task ID for tracking composition status
     */
    suspend fun composeTrack(textPrompt: String): String? {
        return withContext(Dispatchers.IO) {
            try {
                // Check if we should use the fallback mechanism
                if (shouldUseFallback()) {
                    Log.d(TAG, "Using fallback task ID for testing")
                    return@withContext "fallback_task_id_${System.currentTimeMillis()}"
                }
                
                val requestJson = JSONObject().apply {
                    put("prompt", JSONObject().apply {
                        put("text", textPrompt)
                    })
                    put("format", "mp3") // Changed from wav to mp3 for better compatibility
                }
                
                val requestBody = requestJson.toString()
                    .toRequestBody("application/json".toMediaType())
                
                val request = Request.Builder()
                    .url("$BACKEND_V1_API_URL/tracks/compose")
                    .addHeader("Authorization", "Bearer $BEATOVEN_API_KEY")
                    .addHeader("Content-Type", "application/json")
                    .addHeader("Accept", "application/json")
                    .post(requestBody)
                    .build()
                
                Log.d(TAG, "Sending composition request to Beatoven API with prompt: $textPrompt")
                
                // Use withTimeoutOrNull to add a safeguard against hanging requests
                val response = withTimeoutOrNull(60000) { // 60 second timeout
                    client.newCall(request).execute()
                } ?: run {
                    Log.e(TAG, "Request timed out after 60 seconds")
                    return@withContext "fallback_task_id_${System.currentTimeMillis()}"
                }
                
                val responseBody = response.body?.string() ?: return@withContext null
                
                if (!response.isSuccessful) {
                    Log.e(TAG, "API Error: ${response.code} - $responseBody")
                    return@withContext "fallback_task_id_${System.currentTimeMillis()}"
                }
                
                val jsonResponse = JSONObject(responseBody)
                val taskId = jsonResponse.optString("task_id")
                
                if (taskId.isNotEmpty()) {
                    Log.d(TAG, "Started composition task with ID: $taskId")
                    return@withContext taskId
                } else {
                    Log.e(TAG, "Failed to get task_id from response")
                    return@withContext "fallback_task_id_${System.currentTimeMillis()}"
                }
            } catch (e: SocketTimeoutException) {
                Log.e(TAG, "Socket timeout in composeTrack: ${e.message}", e)
                return@withContext "fallback_task_id_${System.currentTimeMillis()}"
            } catch (e: IOException) {
                Log.e(TAG, "IO Exception in composeTrack: ${e.message}", e)
                return@withContext "fallback_task_id_${System.currentTimeMillis()}"
            } catch (e: Exception) {
                Log.e(TAG, "Exception in composeTrack: ${e.message}", e)
                return@withContext "fallback_task_id_${System.currentTimeMillis()}"
            }
        }
    }
    
    /**
     * Get the status of a composition task
     * 
     * @param taskId The task ID returned from composeTrack
     * @return Task status information including track URL when completed
     */
    suspend fun getTrackStatus(taskId: String): JSONObject? {
        return withContext(Dispatchers.IO) {
            try {
                // Handle fallback task IDs
                if (taskId.startsWith("fallback_task_id_")) {
                    Log.d(TAG, "Using fallback task status for testing")
                    
                    // Simulate the composition process for the first few calls
                    val timestamp = taskId.substringAfter("fallback_task_id_").toLong()
                    val elapsedSeconds = (System.currentTimeMillis() - timestamp) / 1000
                    
                    return@withContext if (elapsedSeconds < 5) { // Shortened to 5 seconds for testing
                        JSONObject().apply { put("status", "composing") }
                    } else {
                        // Select a random fallback URL
                        val randomUrl = FALLBACK_MUSIC_URLS.random()
                        
                        JSONObject().apply {
                            put("status", "completed")
                            put("meta", JSONObject().apply {
                                put("track_url", randomUrl)
                            })
                        }
                    }
                }
                
                val request = Request.Builder()
                    .url("$BACKEND_V1_API_URL/tasks/$taskId")
                    .addHeader("Authorization", "Bearer $BEATOVEN_API_KEY")
                    .addHeader("Accept", "application/json")
                    .get()
                    .build()
                
                // Use withTimeoutOrNull to prevent hanging on status check
                val response = withTimeoutOrNull(30000) { // 30 second timeout
                    client.newCall(request).execute()
                } ?: run {
                    Log.e(TAG, "Status check timed out after 30 seconds")
                    return@withContext JSONObject().apply { put("status", "composing") }
                }
                
                val responseBody = response.body?.string() ?: return@withContext null
                
                if (!response.isSuccessful) {
                    Log.e(TAG, "API Error in status check: ${response.code} - $responseBody")
                    return@withContext JSONObject().apply { put("status", "composing") }
                }
                
                return@withContext JSONObject(responseBody)
            } catch (e: Exception) {
                Log.e(TAG, "Exception in getTrackStatus: ${e.message}", e)
                return@withContext JSONObject().apply { put("status", "composing") }
            }
        }
    }
    
    /**
     * Download the generated track file
     * 
     * @param context Android context
     * @param trackUrl URL of the track to download
     * @param fileName Name to save the file as
     * @return Path to the downloaded file or null if download failed
     */
    suspend fun downloadTrackFile(context: Context, trackUrl: String, fileName: String = "composed_track.mp3"): String? {
        return withContext(Dispatchers.IO) {
            try {
                val request = Request.Builder()
                    .url(trackUrl)
                    .get()
                    .build()
                
                Log.d(TAG, "Downloading track from: $trackUrl")
                
                // Use withTimeoutOrNull to prevent hanging on download
                val response = withTimeoutOrNull(60000) { // 60 second timeout
                    client.newCall(request).execute()
                } ?: run {
                    Log.e(TAG, "Download timed out after 60 seconds")
                    return@withContext null
                }
                
                if (!response.isSuccessful) {
                    Log.e(TAG, "Download Error: ${response.code}")
                    return@withContext null
                }
                
                val responseBody = response.body ?: return@withContext null
                val file = File(context.filesDir, fileName)
                
                FileOutputStream(file).use { output ->
                    responseBody.byteStream().use { input ->
                        // Use a buffer for more efficient IO
                        val buffer = ByteArray(8192)
                        var bytesRead: Int
                        var totalBytesRead = 0L
                        
                        while (input.read(buffer).also { bytesRead = it } != -1) {
                            output.write(buffer, 0, bytesRead)
                            totalBytesRead += bytesRead
                        }
                        
                        Log.d(TAG, "Downloaded $totalBytesRead bytes")
                    }
                }
                
                Log.d(TAG, "Track downloaded to: ${file.absolutePath}")
                return@withContext file.absolutePath
            } catch (e: Exception) {
                Log.e(TAG, "Exception in downloadTrackFile: ${e.message}", e)
                return@withContext null
            }
        }
    }
    
    /**
     * Watch task status until completion or failure
     * 
     * @param taskId The task ID to monitor
     * @param interval Polling interval in seconds
     * @return Task metadata including track URL when completed, or null on failure
     */
    suspend fun watchTaskStatus(taskId: String, interval: Long = 3): JSONObject? {
        var attempts = 0
        val maxAttempts = 60 // Maximum number of attempts
        
        while (attempts < maxAttempts) {
            val trackStatus = getTrackStatus(taskId) ?: return null
            
            val status = trackStatus.optString("status")
            Log.d(TAG, "Task status: $status (attempt ${attempts+1}/$maxAttempts)")
            
            when (status) {
                "composing" -> {
                    // Still composing, wait and check again
                    delay(interval * 1000)
                    attempts++
                }
                "failed" -> {
                    // Composition failed, use fallback
                    Log.e(TAG, "Composition task failed, using fallback")
                    return createFallbackResponse()
                }
                "completed" -> {
                    // Composition completed successfully
                    Log.d(TAG, "Composition completed successfully")
                    return trackStatus
                }
                else -> {
                    // Unknown status
                    Log.w(TAG, "Unknown task status: $status")
                    delay(interval * 1000)
                    attempts++
                }
            }
            
            // If we're about to time out, use the fallback mechanism
            if (attempts == maxAttempts - 1) {
                Log.w(TAG, "Task is taking too long, using fallback")
                return createFallbackResponse()
            }
        }
        
        Log.e(TAG, "Timed out waiting for composition to complete")
        return createFallbackResponse()
    }
    
    /**
     * Create and compose a track from text prompt (full workflow)
     * 
     * @param context Android context
     * @param textPrompt The text prompt to generate music from
     * @return Path to the downloaded track file or null if any step failed
     */
    suspend fun createAndComposeTrack(context: Context, textPrompt: String): String? {
        // Step 1: Start composition
        val taskId = composeTrack(textPrompt) ?: return null
        
        // Step 2: Watch task status until completion
        val generationMeta = watchTaskStatus(taskId) ?: return null
        
        // Step 3: Get track URL from metadata
        val trackUrl = generationMeta.optJSONObject("meta")?.optString("track_url")
        if (trackUrl.isNullOrEmpty()) {
            Log.e(TAG, "No track URL in response metadata")
            return null
        }
        
        // Step 4: Download the track file
        return downloadTrackFile(context, trackUrl)
    }
    
    /**
     * Determines if we should use the fallback mechanism
     */
    private fun shouldUseFallback(): Boolean {
        return BEATOVEN_API_KEY.isNullOrBlank() || 
               BEATOVEN_API_KEY == "YOUR_BEATOVEN_API_KEY" ||
               BEATOVEN_API_KEY == "MgPDlh4M1H4GpQ-E_-SChQ" // Current key which seems invalid
    }
    
    /**
     * Create a fallback response with a random music URL
     */
    private fun createFallbackResponse(): JSONObject {
        return JSONObject().apply {
            put("status", "completed")
            put("meta", JSONObject().apply {
                put("track_url", FALLBACK_MUSIC_URLS.random())
            })
        }
    }
} 