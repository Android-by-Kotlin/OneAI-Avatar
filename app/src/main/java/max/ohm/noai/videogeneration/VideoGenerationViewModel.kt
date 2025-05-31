package max.ohm.noai.videogeneration

import android.net.Uri
import android.util.Log
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.delay
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.launch
import max.ohm.noai.videogeneration.network.VideoApiClient
import max.ohm.noai.videogeneration.network.VideoGenerationRequest

class VideoGenerationViewModel : ViewModel() {

    private val _prompt = MutableStateFlow("")
    val prompt: StateFlow<String> = _prompt

    private val _videoUrl = MutableStateFlow<String?>(null)
    val videoUrl: StateFlow<String?> = _videoUrl

    private val _isLoading = MutableStateFlow(false)
    val isLoading: StateFlow<Boolean> = _isLoading

    private val _error = MutableStateFlow<String?>(null)
    val error: StateFlow<String?> = _error

    companion object {
        private const val TAG = "VideoGenViewModel"
    }

    fun setPrompt(newPrompt: String) {
        _prompt.value = newPrompt
    }

    fun generateVideo() {
        Log.d(TAG, "generateVideo called. Current prompt: ${_prompt.value}")
        _isLoading.value = true
        _error.value = null
        _videoUrl.value = null
        Log.d(TAG, "isLoading set to true, videoUrl set to null.")

        if (!VideoGenApiKey.validateCredentials()) {
            _error.value = "Invalid API credentials. Please check your API key and Group ID."
            _isLoading.value = false
            return
        }

        viewModelScope.launch {
            try {
                val authorization = "Bearer ${VideoGenApiKey.API_KEY}"
                val request = VideoGenerationRequest(model = "T2V-01-Director", prompt = _prompt.value)
                Log.d(TAG, "Sending video generation request with prompt: ${_prompt.value}")
                
                val response = VideoApiClient.apiService.generateVideo(authorization, request)

                if (response.isSuccessful) {
                    val responseBody = response.body()
                    if (responseBody?.taskId != null) {
                        Log.d(TAG, "Task ID received: ${responseBody.taskId}. Polling video status.")
                        pollVideoStatus(responseBody.taskId)
                    } else {
                        Log.e(TAG, "Task ID not received. Full response: ${response.body().toString()}")
                        _error.value = "Task ID not received from generation API."
                        _isLoading.value = false
                    }
                } else {
                    val errorBody = response.errorBody()?.string()
                    Log.e(TAG, "Error generating video: ${response.code()}, Body: $errorBody")
                    _error.value = "Error generating video (HTTP ${response.code()}): $errorBody"
                    _isLoading.value = false
                }
            } catch (e: Exception) {
                Log.e(TAG, "Network error in generateVideo: ${e.message}", e)
                _error.value = "Network error (generateVideo): ${e.message}"
                _isLoading.value = false
            }
        }
    }

    private suspend fun pollVideoStatus(taskId: String) {
        Log.d(TAG, "pollVideoStatus called for taskId: $taskId")
        val authorization = "Bearer ${VideoGenApiKey.API_KEY}"
        var attempts = 0
        val maxAttempts = 60

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
                            _error.value = "Polling successful, but file ID is missing."
                            _isLoading.value = false
                            return
                        }
                    } else if (responseBody.status.equals("Processing", ignoreCase = true) || 
                               responseBody.status.equals("Pending", ignoreCase = true) || 
                               responseBody.status.equals("Preparing", ignoreCase = true) || 
                               responseBody.status.equals("Queueing", ignoreCase = true) ||
                               responseBody.baseResp.statusMsg.equals("processing", ignoreCase = true)) {
                        Log.d(TAG, "Video still processing/queueing. Status: ${responseBody.status}, BaseMsg: ${responseBody.baseResp.statusMsg}")
                    } else { 
                        Log.e(TAG, "Polling returned non-success/non-processing status: ${responseBody.status}, BaseMsg: ${responseBody.baseResp.statusMsg}. Full Response: ${responseBody.toString()}")
                        _error.value = "Video generation failed or encountered an error during polling: Status: ${responseBody.status}, Message: ${responseBody.baseResp.statusMsg}"
                        _isLoading.value = false
                        return 
                    }
                } else { 
                    val errorBodyString = response.errorBody()?.string()
                    Log.e(TAG, "Error polling status: HTTP ${response.code()}, Body: $errorBodyString. Full Response: ${responseBody?.toString()}")
                    _error.value = "Error polling status (HTTP ${response.code()}): $errorBodyString"
                    _isLoading.value = false
                    return
                }
                attempts++
                if (attempts < maxAttempts) delay(5000)
            }
            Log.w(TAG, "Video generation timed out after $maxAttempts attempts for taskId: $taskId.")
            _error.value = "Video generation timed out."
            _isLoading.value = false
        } catch (e: Exception) {
            Log.e(TAG, "Network error during polling loop for taskId: $taskId: ${e.message}", e)
            _error.value = "Network error (polling): ${e.message}"
            _isLoading.value = false
        }
    }

    private fun retrieveVideoFile(fileId: String) {
        Log.d(TAG, "retrieveVideoFile called for fileId: $fileId")
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
                        val decodedUrl = Uri.decode(rawUrl)
                        _videoUrl.value = decodedUrl
                        Log.i(TAG, "Video URL set after decoding: $decodedUrl")
                        _error.value = null 
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
                Log.d(TAG, "retrieveVideoFile finished. Setting isLoading to false. Current URL: ${_videoUrl.value}")
                _isLoading.value = false
            }
        }
    }
}
