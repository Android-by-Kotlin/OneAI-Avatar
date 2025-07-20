package max.ohm.oneai.videogeneration

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.delay
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import max.ohm.oneai.a4f.A4FClient
import okhttp3.MediaType.Companion.toMediaTypeOrNull
import okhttp3.OkHttpClient
import okhttp3.Request
import okhttp3.RequestBody.Companion.toRequestBody
import org.json.JSONObject
import java.util.concurrent.TimeUnit

data class VideoGenerationState(
    val isLoading: Boolean = false,
    val videoUrl: String? = null,
    val error: String? = null,
    val generationId: String? = null
)

class NewVideoGenerationViewModel : ViewModel() {
    private val _state = MutableStateFlow(VideoGenerationState())
    val state: StateFlow<VideoGenerationState> = _state

    private val client = OkHttpClient.Builder()
        .connectTimeout(30, TimeUnit.SECONDS)
        .readTimeout(30, TimeUnit.SECONDS)
        .writeTimeout(30, TimeUnit.SECONDS)
        .build()

    fun generateVideo(prompt: String) {
        viewModelScope.launch {
            _state.value = _state.value.copy(isLoading = true, error = null, videoUrl = null)
            
            try {
                val response = withContext(Dispatchers.IO) {
                    val json = JSONObject()
                    json.put("model", "provider-6/wan-2.1")
                    json.put("prompt", prompt)
                    json.put("ratio", "16:9")
                    json.put("quality", "480p")
                    json.put("duration", 4)

                    val body = json.toString().toRequestBody("application/json; charset=utf-8".toMediaTypeOrNull())

                    val request = Request.Builder()
                        .url("${A4FClient.A4F_BASE_URL}video/generations") // Ensure this uses A4F endpoint
                        .addHeader("Authorization", "Bearer ${A4FClient.A4F_API_KEY}")
                        .post(body)
                        .build()

                    client.newCall(request).execute()
                }

                if (response.isSuccessful) {
                    val responseBody = response.body?.string()
                    val jsonResponse = JSONObject(responseBody ?: "{}")
                    
                    // Check if the API returns a generation ID first
                    if (jsonResponse.has("id")) {
                        val generationId = jsonResponse.getString("id")
                        _state.value = _state.value.copy(generationId = generationId)
                        
                        // Poll for the video URL
                        pollForVideoCompletion(generationId)
                    } else if (jsonResponse.has("url")) {
                        // If the API directly returns a URL
                        val videoUrl = jsonResponse.getString("url")
                        _state.value = _state.value.copy(
                            isLoading = false,
                            videoUrl = videoUrl
                        )
                    }
                } else {
                    _state.value = _state.value.copy(
                        isLoading = false,
                        error = "Failed to generate video: ${response.code}"
                    )
                }
            } catch (e: Exception) {
                _state.value = _state.value.copy(
                    isLoading = false,
                    error = "Error: ${e.message}"
                )
            }
        }
    }

    private fun pollForVideoCompletion(generationId: String) {
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

                        client.newCall(request).execute()
                    }

                    if (response.isSuccessful) {
                        val responseBody = response.body?.string()
                        val jsonResponse = JSONObject(responseBody ?: "{}")
                        
                        if (jsonResponse.has("status")) {
                            when (jsonResponse.getString("status")) {
                                "completed" -> {
                                    val videoUrl = jsonResponse.getString("url")
                                    _state.value = _state.value.copy(
                                        isLoading = false,
                                        videoUrl = videoUrl
                                    )
                                    return@launch
                                }
                                "failed" -> {
                                    _state.value = _state.value.copy(
                                        isLoading = false,
                                        error = "Video generation failed"
                                    )
                                    return@launch
                                }
                                // Continue polling for "processing" status
                            }
                        }
                    }
                } catch (e: Exception) {
                    // Continue polling even if there's an error
                }
                
                attempts++
            }

            // Timeout
            _state.value = _state.value.copy(
                isLoading = false,
                error = "Video generation timed out"
            )
        }
    }

    fun clearError() {
        _state.value = _state.value.copy(error = null)
    }
}
