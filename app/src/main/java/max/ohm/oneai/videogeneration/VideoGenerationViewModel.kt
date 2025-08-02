package max.ohm.oneai.videogeneration

import android.app.Application
import android.net.Uri
import android.util.Log
import androidx.lifecycle.AndroidViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.Job
import kotlinx.coroutines.delay
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import max.ohm.oneai.videogeneration.network.VideoApiClient
import max.ohm.oneai.videogeneration.network.VideoGenerationRequest
import max.ohm.oneai.a4f.A4FClient
import okhttp3.MediaType.Companion.toMediaTypeOrNull
import okhttp3.OkHttpClient
import okhttp3.Request
import okhttp3.RequestBody.Companion.toRequestBody
import org.json.JSONObject
import java.util.concurrent.TimeUnit
import android.util.Base64
import java.io.File
import java.io.FileOutputStream
import android.os.Environment
import max.ohm.oneai.videogeneration.modelslab.ModelsLabApiClient
import max.ohm.oneai.videogeneration.modelslab.ModelsLabVideoRequest

class VideoGenerationViewModel(application: Application) : AndroidViewModel(application) {

    private val _prompt = MutableStateFlow("")
    val prompt: StateFlow<String> = _prompt

    private val _videoUrl = MutableStateFlow<String?>(null)
    val videoUrl: StateFlow<String?> = _videoUrl

    private val _isLoading = MutableStateFlow(false)
    val isLoading: StateFlow<Boolean> = _isLoading

    private val _error = MutableStateFlow<String?>(null)
    val error: StateFlow<String?> = _error

    private val _elapsedTimeInSeconds = MutableStateFlow(0L)
    val elapsedTimeInSeconds: StateFlow<Long> = _elapsedTimeInSeconds

    private val _totalGenerationTimeInSeconds = MutableStateFlow<Long?>(null)
    val totalGenerationTimeInSeconds: StateFlow<Long?> = _totalGenerationTimeInSeconds

    private var timerJob: Job? = null
    private var generationStartTime: Long = 0L
    private var currentTaskId: String? = null
    private var retryCount = 0
    private val maxRetries = 3
    
    // State to track which generation method is being used
    private val _isUsingA4F = MutableStateFlow(false)
    val isUsingA4F: StateFlow<Boolean> = _isUsingA4F
    
    // State to track if using ModelsLab
    private val _isUsingModelsLab = MutableStateFlow(false)
    val isUsingModelsLab: StateFlow<Boolean> = _isUsingModelsLab
    
    // A4F generation state
    private val _a4fGenerationId = MutableStateFlow<String?>(null)
    val a4fGenerationId: StateFlow<String?> = _a4fGenerationId
    
    // ModelsLab generation state
    private val _modelsLabRequestId = MutableStateFlow<Long?>(null)
    val modelsLabRequestId: StateFlow<Long?> = _modelsLabRequestId
    
    private val a4fClient = OkHttpClient.Builder()
        .connectTimeout(30, TimeUnit.SECONDS)
        .readTimeout(30, TimeUnit.SECONDS)
        .writeTimeout(30, TimeUnit.SECONDS)
        .build()

    companion object {
        private const val TAG = "VideoGenViewModel"
    }
    
    private fun saveBase64VideoAndDisplay(base64Video: String) {
        viewModelScope.launch {
            try {
                Log.d(TAG, "Starting to decode base64 video. Length: ${base64Video.length}")
                val videoBytes = Base64.decode(base64Video, Base64.DEFAULT)
                Log.d(TAG, "Decoded video bytes. Size: ${videoBytes.size} bytes")
                
                // Use the app's cache directory instead of external storage
                val context = getApplication<Application>().applicationContext
                val cacheDir = context.cacheDir
                val tempFile = File(cacheDir, "a4f_video_${System.currentTimeMillis()}.mp4")
                
                withContext(Dispatchers.IO) {
                    FileOutputStream(tempFile).use { fos ->
                        fos.write(videoBytes)
                        fos.flush()
                    }
                }
                
                Log.d(TAG, "A4F video saved to: ${tempFile.absolutePath}, size: ${tempFile.length()} bytes")
                
                // Use the absolute path without file:// prefix for local files
                _videoUrl.value = tempFile.absolutePath
                _isUsingA4F.value = false
                _isUsingModelsLab.value = false
                stopTimerAndSetTotalTime(true)
                
            } catch (e: Exception) {
                Log.e(TAG, "Error saving A4F video: ${e.message}", e)
                handleError("Error saving A4F video: ${e.message}")
            }
        }
    }

    fun setPrompt(newPrompt: String) {
        _prompt.value = newPrompt
    }

    private fun startTimer() {
        _elapsedTimeInSeconds.value = 0L
        _totalGenerationTimeInSeconds.value = null
        generationStartTime = System.currentTimeMillis()
        timerJob?.cancel()
        timerJob = viewModelScope.launch {
            while (_isLoading.value) {
                _elapsedTimeInSeconds.value = (System.currentTimeMillis() - generationStartTime) / 1000
                delay(1000) 
            }
        }
    }

    private fun stopTimerAndSetTotalTime(isSuccess: Boolean) {
        timerJob?.cancel()
        val endTime = System.currentTimeMillis()
        val durationSeconds = (endTime - generationStartTime) / 1000
        _elapsedTimeInSeconds.value = durationSeconds
        if (isSuccess) {
            _totalGenerationTimeInSeconds.value = durationSeconds
        }
        _isLoading.value = false
    }

    fun generateVideo() {
        Log.d(TAG, "generateVideo called. Current prompt: ${_prompt.value}")
        _isLoading.value = true
        _error.value = null
        _videoUrl.value = null
        retryCount = 0
        currentTaskId = null
        startTimer()
        Log.d(TAG, "isLoading set to true, videoUrl set to null, timer started.")

        if (!VideoGenApiKey.validateCredentials()) {
            _error.value = "Invalid API credentials. Please check your API key and Group ID."
            stopTimerAndSetTotalTime(false)
            return
        }

        generateVideoInternal()
    }

fun generateModelsLabVideo() {
        Log.d(TAG, "generateModelsLabVideo called. Current prompt: ${_prompt.value}")
        _isLoading.value = true
        _isUsingModelsLab.value = true
        _error.value = null
        _videoUrl.value = null
        _modelsLabRequestId.value = null
        retryCount = 0
        startTimer()
        Log.d(TAG, "isLoading set to true, videoUrl set to null, timer started.")

        viewModelScope.launch {
            try {
                val request = ModelsLabVideoRequest(
                    key = ModelsLabApiClient.API_KEY,
                    prompt = _prompt.value
                )

                val response = ModelsLabApiClient.apiService.generateVideo(request)

                if (response.isSuccessful) {
                    val responseBody = response.body()!!
                    if (responseBody.status.equals("successful", true)) {
                        Log.d(TAG, "Video generation complete. URLs: ${responseBody.outputUrls?.joinToString()}")
                        _videoUrl.value = responseBody.outputUrls?.firstOrNull()
                        stopTimerAndSetTotalTime(true)
                    } else if (responseBody.status.equals("pending", true)) {
                        Log.d(TAG, "Video generation pending. RequestId: ${responseBody.id}")
                        _modelsLabRequestId.value = responseBody.id
                        pollModelsLabVideoCompletion(responseBody.id!!)
                    } else {
                        handleError("ModelsLab API Response Error: ${responseBody.error ?: responseBody.message}")
                    }
                } else {
                    handleError("ModelsLab API Error: ${response.code()} - ${response.message()}")
                }
            } catch (e: Exception) {
                Log.e(TAG, "ModelsLab API Exception: ${e.message}", e)
                handleError("ModelsLab Network Error: ${e.message}")
            }
        }
    }

    private fun pollModelsLabVideoCompletion(requestId: Long) {
        viewModelScope.launch {
            var attempts = 0
            val maxAttempts = 30 // Poll for up to 5 minutes (30 * 10 seconds)

            while (attempts < maxAttempts) {
                delay(10000) // Wait 10 seconds between polls

                try {
                    val response = withContext(Dispatchers.IO) {
                        ModelsLabApiClient.apiService.checkGenerationStatus(
                            apiKey = ModelsLabApiClient.API_KEY,
                            requestId = requestId
                        )
                    }

                    if (response.isSuccessful) {
                        val responseBody = response.body()!!
                        if (responseBody.status.equals("successful", true)) {
                            _videoUrl.value = responseBody.outputUrls?.firstOrNull()
                            stopTimerAndSetTotalTime(true)
                            return@launch
                        } else if (responseBody.status.equals("failed", true)) {
                            handleError("ModelsLab video generation failed.")
                            return@launch
                        }
                    }
                } catch (_: Exception) {
                    // Continue polling even if there's an error
                }

                attempts++
            }

            // Timeout
            handleError("ModelsLab video generation timed out.")
        }
    }

    fun generateTextToVideo() {
        Log.d(TAG, "generateTextToVideo called. Current prompt: ${_prompt.value}")
        _isLoading.value = true
        _isUsingA4F.value = true
        _error.value = null
        _videoUrl.value = null
        _a4fGenerationId.value = null
        retryCount = 0
        startTimer()
        Log.d(TAG, "isLoading set to true, videoUrl set to null, timer started.")

        if (A4FClient.A4F_API_KEY.isEmpty()) {
            _error.value = "A4F API key is missing. Please check your A4FClient.kt file."
            stopTimerAndSetTotalTime(false)
            return
        }

        viewModelScope.launch {
            try {
                val response = withContext(Dispatchers.IO) {
                    val json = JSONObject()
                    json.put("model", "provider-6/wan-2.1")
                    json.put("prompt", _prompt.value)
                    json.put("ratio", "16:9")
                    json.put("quality", "480p")
                    json.put("duration", 4)

                    val body = json.toString().toRequestBody("application/json; charset=utf-8".toMediaTypeOrNull())

                    val request = Request.Builder()
                        .url("${A4FClient.A4F_BASE_URL}video/generations") // Ensure this uses the A4F API endpoint separately
                        .addHeader("Authorization", "Bearer ${A4FClient.A4F_API_KEY}")
                        .post(body)
                        .build()

                    a4fClient.newCall(request).execute()
                }

                if (response.isSuccessful) {
                    val responseBodyString = response.body?.string() ?: "{}"
                    Log.d(TAG, "A4F API Response: $responseBodyString")
                    val responseBody = JSONObject(responseBodyString)
                    
                    // Check if response contains data array with b64_json
                    if (responseBody.has("data")) {
                        val dataArray = responseBody.getJSONArray("data")
                        if (dataArray.length() > 0) {
                            val firstData = dataArray.getJSONObject(0)
                            if (firstData.has("b64_json")) {
                                // Video is generated directly, save base64 to file
                                val base64Video = firstData.getString("b64_json")
                                saveBase64VideoAndDisplay(base64Video)
                                return@launch
                            }
                        }
                    }
                    
                    // Otherwise check for generation ID (async generation)
                    val generationId = responseBody.optString("id")
                    if (generationId != null && generationId.isNotEmpty()) {
                        Log.d(TAG, "A4F generation ID received: $generationId. Polling for video completion.")
                        _a4fGenerationId.value = generationId
                        pollForA4FVideoCompletion(generationId)
                    } else {
                        handleError("A4F API response format not recognized.")
                    }
                } else {
                    handleError("A4F API error: ${response.code}")
                }
            } catch (e: Exception) {
                Log.e(TAG, "A4F network error: ${e.message}", e)
                handleError("A4F network error: ${e.message}")
            }
        }
    }

    private fun pollForA4FVideoCompletion(generationId: String) {
        viewModelScope.launch {
            var attempts = 0
            val maxAttempts = 30 // Poll for up to 5 minutes (30 * 10 seconds)

            while (attempts < maxAttempts) {
                delay(10000) // Wait 10 seconds between polls

                try {
                    val response = withContext(Dispatchers.IO) {
                        val request = Request.Builder()
                            .url("${A4FClient.A4F_BASE_URL}video/generations/$generationId")
                            .addHeader("Authorization", "Bearer ${A4FClient.A4F_API_KEY}")
                            .get()
                            .build()

                        a4fClient.newCall(request).execute()
                    }

                    if (response.isSuccessful) {
                        val responseBodyString = response.body?.string() ?: "{}"
                        Log.d(TAG, "A4F Polling Response: $responseBodyString")
                        val responseBody = JSONObject(responseBodyString)

                        if (responseBody.optString("status") == "completed") {
                            val videoUrl = responseBody.optString("url")
                            if (videoUrl != null && videoUrl.isNotEmpty()) {
                                Log.d(TAG, "A4F video generation completed. Video URL: $videoUrl")
                                _videoUrl.value = videoUrl
                                _isUsingA4F.value = false
                                stopTimerAndSetTotalTime(true)
                                return@launch
                            } else {
                                handleError("A4F video URL not found in response.")
                                return@launch
                            }
                        } else if (responseBody.optString("status") == "failed") {
                            handleError("A4F video generation failed.")
                            return@launch
                        }
                    }
                } catch (e: Exception) {
                    // Continue polling even if there's an error
                }

                attempts++
            }

            // Timeout
            handleError("A4F video generation timed out.")
        }
    }
    
    private fun generateVideoInternal() {
        viewModelScope.launch {
            var success = false
            try {
                val authorization = "Bearer ${VideoGenApiKey.API_KEY}"
                val request = VideoGenerationRequest(model = "T2V-01-Director", prompt = _prompt.value)
                Log.d(TAG, "Sending video generation request with prompt: ${_prompt.value}, attempt: ${retryCount + 1}/${maxRetries + 1}")
                
                val response = VideoApiClient.apiService.generateVideo(authorization, request)

                if (response.isSuccessful) {
                    val responseBody = response.body()
                    if (responseBody?.taskId != null) {
                        currentTaskId = responseBody.taskId
                        Log.d(TAG, "Task ID received: ${responseBody.taskId}. Polling video status.")
                        pollVideoStatus(responseBody.taskId)
                        return@launch
                    } else {
                        Log.e(TAG, "Task ID not received. Full response: ${response.body().toString()}")
                        handleError("Task ID not received from generation API.")
                    }
                } else {
                    val errorBody = response.errorBody()?.string()
                    Log.e(TAG, "Error generating video: ${response.code()}, Body: $errorBody")
                    handleError("Error generating video (HTTP ${response.code()}): $errorBody")
                }
            } catch (e: Exception) {
                Log.e(TAG, "Network error in generateVideo: ${e.message}", e)
                handleError("Network error (generateVideo): ${e.message}")
            } finally {
                if (_isLoading.value && !success) {
                    stopTimerAndSetTotalTime(success)
                }
            }
        }
    }
    
    private fun handleError(errorMessage: String) {
        if (retryCount < maxRetries && !_isUsingA4F.value && !_isUsingModelsLab.value) {
            retryCount++
            Log.w(TAG, "Retrying video generation after error: $errorMessage (Attempt ${retryCount}/$maxRetries)")
            viewModelScope.launch {
                delay(2000) // Wait 2 seconds before retrying
                generateVideoInternal()
            }
        } else {
            Log.e(TAG, "Failed after $maxRetries retries: $errorMessage")
            _error.value = "$errorMessage\nFailed after $maxRetries retries."
            _isUsingA4F.value = false
            _isUsingModelsLab.value = false
            stopTimerAndSetTotalTime(false)
        }
    }

    private suspend fun pollVideoStatus(taskId: String) {
        Log.d(TAG, "pollVideoStatus called for taskId: $taskId")
        val authorization = "Bearer ${VideoGenApiKey.API_KEY}"
        var attempts = 0
        val maxAttempts = 60
        var success = false

        try {
            while (attempts < maxAttempts) {
                val currentAttempt = attempts + 1
                Log.d(TAG, "Polling attempt $currentAttempt/$maxAttempts for taskId: $taskId")
                val response = VideoApiClient.apiService.queryVideoGenerationStatus(authorization, taskId)
                val responseBody = response.body()

                if (response.isSuccessful && responseBody != null) {
                    Log.d(TAG, "Poll response: Status=${responseBody.status}, FileId=${responseBody.fileId}, BaseMsg=${responseBody.baseResp.statusMsg}")
                    if (responseBody.status == "Success" && responseBody.baseResp.statusMsg == "success") {
                        if (!responseBody.fileId.isNullOrEmpty()) {
                            Log.d(TAG, "Polling successful. File ID: ${responseBody.fileId}. Retrieving video file.")
                            retrieveVideoFile(responseBody.fileId)
                            return
                        } else {
                            Log.e(TAG, "Polling status success, but file_id is missing. Response: ${responseBody.toString()}")
                            handleError("Polling successful, but file ID is missing.")
                            break
                        }
                    } else if (responseBody.status.equals("Processing", ignoreCase = true) || 
                               responseBody.status.equals("Pending", ignoreCase = true) || 
                               responseBody.status.equals("Preparing", ignoreCase = true) || 
                               responseBody.status.equals("Queueing", ignoreCase = true) ||
                               responseBody.baseResp.statusMsg.equals("processing", ignoreCase = true)) {
                        Log.d(TAG, "Video still processing/queueing. Status: ${responseBody.status}, BaseMsg: ${responseBody.baseResp.statusMsg}")
                    } else { 
                        Log.e(TAG, "Polling returned non-success/non-processing status: ${responseBody.status}, BaseMsg: ${responseBody.baseResp.statusMsg}. Full Response: ${responseBody.toString()}")
                        handleError("Video generation failed or encountered an error during polling: Status: ${responseBody.status}, Message: ${responseBody.baseResp.statusMsg}")
                        break
                    }
                } else { 
                    val errorBodyString = response.errorBody()?.string()
                    Log.e(TAG, "Error polling status: HTTP ${response.code()}, Body: $errorBodyString. Full Response: ${responseBody?.toString()}")
                    handleError("Error polling status (HTTP ${response.code()}): $errorBodyString")
                    break
                }
                attempts++
                if (attempts < maxAttempts) delay(5000)
            }
            if (attempts == maxAttempts && _isLoading.value) {
                 Log.w(TAG, "Video generation timed out after $maxAttempts attempts for taskId: $taskId.")
                handleError("Video generation timed out.")
            }
        } catch (e: Exception) {
            Log.e(TAG, "Network error during polling loop for taskId: $taskId: ${e.message}", e)
            handleError("Network error (polling): ${e.message}")
        } finally {
            if (_isLoading.value && !success) { 
                stopTimerAndSetTotalTime(success)
            }
        }
    }

    private fun retrieveVideoFile(fileId: String) {
        Log.d(TAG, "retrieveVideoFile called for fileId: $fileId")
        var success = false
        viewModelScope.launch {
            try {
                val authorization = "Bearer ${VideoGenApiKey.API_KEY}"
                val groupId = VideoGenApiKey.GROUP_ID
                Log.d(TAG, "Retrieving video with groupId: $groupId, fileId: $fileId")
                
                val response = VideoApiClient.apiService.retrieveVideoFile(authorization, groupId, fileId)
                val responseBody = response.body()

                if (response.isSuccessful && responseBody?.file != null && responseBody.baseResp.statusMsg == "success") {
                    val fileData = responseBody.file
                    var rawUrl = fileData.downloadUrl
                    Log.d(TAG, "Video file retrieved. Raw Primary URL: ${rawUrl}, Raw Backup URL: ${fileData.backupDownloadUrl}")

                    if (rawUrl.isNullOrEmpty()) {
                        Log.w(TAG, "Primary downloadUrl is null or empty. Trying backupDownloadUrl.")
                        rawUrl = fileData.backupDownloadUrl
                    }

                    if (!rawUrl.isNullOrEmpty()) {
                        var decodedUrl = Uri.decode(rawUrl)
                        
                        if (!decodedUrl.startsWith("http")) {
                            decodedUrl = "https://$decodedUrl"
                            Log.d(TAG, "Added https:// prefix to URL")
                        }
                        
                        if (decodedUrl.contains("?")) {
                            val urlParts = decodedUrl.split("?")
                            if (urlParts.isNotEmpty()) {
                                decodedUrl = urlParts[0]
                                Log.d(TAG, "Removed query parameters from URL")
                            }
                        }
                        
                        Log.i(TAG, "Final processed video URL: $decodedUrl")
                        _videoUrl.value = decodedUrl
                        _error.value = null 
                        success = true
                    } else {
                        Log.e(TAG, "Both downloadUrl and backupDownloadUrl are null or empty. Response: ${responseBody.toString()}")
                        _error.value = "Failed to get a valid video download URL from API."
                    }
                } else {
                    val errorBodyString = response.errorBody()?.string()
                    val baseRespMsg = responseBody?.baseResp?.statusMsg
                    Log.e(TAG, "Error retrieving video file: HTTP ${response.code()}, BaseRespMsg: $baseRespMsg, ErrorBody: $errorBodyString. Full Response: ${responseBody?.toString()}")
                    _error.value = "Error retrieving video file (HTTP ${response.code()}): ${baseRespMsg ?: errorBodyString ?: "Unknown error"}"
                }
            } catch (e: Exception) {
                Log.e(TAG, "Network error retrieving file: ${e.message}", e)
                _error.value = "Network error (retrieveVideoFile): ${e.message}"
            } finally {
                stopTimerAndSetTotalTime(success)
            }
        }
    }
}


