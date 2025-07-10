package max.ohm.oneai.imageediting

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import kotlinx.coroutines.delay
import max.ohm.oneai.imageediting.network.FaceGenApiClient
import max.ohm.oneai.imageediting.network.FaceGenRequest

data class FaceGenUiState(
    val prompt: String = "",
    val negativePrompt: String = "anime, cartoon, drawing, big nose, long nose, fat, ugly, big lips, big mouth, face proportion mismatch, unrealistic, monochrome, lowres, bad anatomy, worst quality, low quality, blurry",
    val faceImageUrl: String = "",
    val width: String = "512",
    val height: String = "512",
    val samples: String = "1",
    val numInferenceSteps: String = "21",
    val guidanceScale: Double = 7.5,
    val generatedImageUrl: String? = null,
    val isLoading: Boolean = false,
    val error: String? = null
)

class FaceGenViewModel : ViewModel() {
    
    private val _uiState = MutableStateFlow(FaceGenUiState())
    val uiState: StateFlow<FaceGenUiState> = _uiState.asStateFlow()
    
    private val apiKey = ImageEditingApiKey().apiKey
    
    fun updatePrompt(prompt: String) {
        _uiState.value = _uiState.value.copy(prompt = prompt)
    }
    
    fun updateNegativePrompt(negativePrompt: String) {
        _uiState.value = _uiState.value.copy(negativePrompt = negativePrompt)
    }
    
    fun updateFaceImageUrl(url: String) {
        _uiState.value = _uiState.value.copy(faceImageUrl = url)
    }
    
    fun updateWidth(width: String) {
        _uiState.value = _uiState.value.copy(width = width)
    }
    
    fun updateHeight(height: String) {
        _uiState.value = _uiState.value.copy(height = height)
    }
    
    fun updateSamples(samples: String) {
        _uiState.value = _uiState.value.copy(samples = samples)
    }
    
    fun updateNumInferenceSteps(steps: String) {
        _uiState.value = _uiState.value.copy(numInferenceSteps = steps)
    }
    
    fun updateGuidanceScale(scale: Double) {
        _uiState.value = _uiState.value.copy(guidanceScale = scale)
    }
    
    fun generateFaceImage() {
        val currentState = _uiState.value
        
        // Validate inputs
        if (currentState.prompt.isBlank()) {
            _uiState.value = currentState.copy(error = "Please enter a prompt")
            return
        }
        
        if (currentState.faceImageUrl.isBlank()) {
            _uiState.value = currentState.copy(error = "Please provide a face image URL")
            return
        }
        
        viewModelScope.launch {
            _uiState.value = currentState.copy(isLoading = true, error = null)
            
            val request = FaceGenRequest(
                key = apiKey,
                prompt = currentState.prompt,
                negativePrompt = currentState.negativePrompt,
                faceImage = currentState.faceImageUrl,
                width = currentState.width,
                height = currentState.height,
                samples = currentState.samples,
                numInferenceSteps = currentState.numInferenceSteps,
                guidanceScale = currentState.guidanceScale
            )
            
            // Retry logic for API calls
            var retryCount = 0
            val maxRetries = 1
            var lastError: String? = null
            
            while (retryCount < maxRetries) {
                try {
                    val response = FaceGenApiClient.apiService.generateFace(request)
                    
                    if (response.status == "success" && !response.output.isNullOrEmpty()) {
                        _uiState.value = currentState.copy(
                            generatedImageUrl = response.output.firstOrNull(),
                            isLoading = false,
                            error = null
                        )
                        return@launch // Success, exit the function
                    } else {
                        val errorMsg = response.message ?: response.messege ?: "Failed to generate image"
                        lastError = errorMsg
                        
                        // Check if it's the "fetch request" error that needs retry
                        if (errorMsg.contains("fetch request", ignoreCase = true) || 
                            errorMsg.contains("fethc request", ignoreCase = true)) {
                            retryCount++
                            if (retryCount < maxRetries) {
                                // Wait before retrying (exponential backoff)
                                delay(1000L * retryCount)
                                continue
                            }
                        } else {
                            // Non-retryable error, exit immediately
                            _uiState.value = currentState.copy(
                                isLoading = false,
                                error = errorMsg
                            )
                            return@launch
                        }
                    }
                    
                } catch (e: Exception) {
                    lastError = e.message ?: "Unknown error occurred"
                    retryCount++
                    
                    if (retryCount < maxRetries) {
                        // Wait before retrying (exponential backoff)
                        delay(1000L * retryCount)
                    }
                }
            }
            
            // All retries exhausted
            _uiState.value = currentState.copy(
                isLoading = false,
                error = "Failed after $maxRetries attempts. Last error: $lastError"
            )
        }
    }
    
    fun clearGeneratedImage() {
        _uiState.value = _uiState.value.copy(generatedImageUrl = null)
    }
}
