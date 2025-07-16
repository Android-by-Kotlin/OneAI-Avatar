package max.ohm.oneai.stabilityai.viewmodel

import android.content.Context
import android.net.Uri
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import max.ohm.oneai.stabilityai.repository.StabilityRepository
import java.io.File

data class StabilityImageToImageUiState(
    val imageUri: Uri? = null,
    val prompt: String = "A galactic dog in space",
    val isLoading: Boolean = false,
    val generatedImageUrl: String? = null,
    val errorMessage: String? = null,
    val imageStrength: Float = 0.35f,
    val steps: Int = 30,
    val cfgScale: Int = 7
)

class StabilityImageToImageViewModel : ViewModel() {
    
    private val _uiState = MutableStateFlow(StabilityImageToImageUiState())
    val uiState: StateFlow<StabilityImageToImageUiState> = _uiState.asStateFlow()
    
    private var context: Context? = null
    
    fun setContext(context: Context) {
        this.context = context
    }
    
    fun updateImageUri(uri: Uri?) {
        _uiState.value = _uiState.value.copy(
            imageUri = uri,
            errorMessage = null
        )
    }
    
    fun updatePrompt(prompt: String) {
        _uiState.value = _uiState.value.copy(prompt = prompt)
    }
    
    fun updateImageStrength(strength: Float) {
        _uiState.value = _uiState.value.copy(imageStrength = strength)
    }
    
    fun updateSteps(steps: Int) {
        _uiState.value = _uiState.value.copy(steps = steps)
    }
    
    fun updateCfgScale(cfgScale: Int) {
        _uiState.value = _uiState.value.copy(cfgScale = cfgScale)
    }
    
    fun generateImage() {
        viewModelScope.launch {
            if (_uiState.value.imageUri == null) {
                _uiState.value = _uiState.value.copy(
                    errorMessage = "Please select an image first"
                )
                return@launch
            }
            
            if (context == null) {
                _uiState.value = _uiState.value.copy(
                    errorMessage = "Context not available. Please restart the app."
                )
                return@launch
            }
            
            _uiState.value = _uiState.value.copy(
                isLoading = true,
                errorMessage = null,
                generatedImageUrl = null
            )
            
            try {
                val response = StabilityRepository.generateImageToImage(
                    context = context!!,
                    imageUri = _uiState.value.imageUri!!,
                    prompt = _uiState.value.prompt
                )
                
                if (response?.status == "success" && response.imageData != null) {
                    val generatedFile = File.createTempFile("stability_generated", ".png", context!!.cacheDir)
                    generatedFile.writeBytes(response.imageData)
                    
                    _uiState.value = _uiState.value.copy(
                        isLoading = false,
                        generatedImageUrl = generatedFile.toURI().toString()
                    )
                } else {
                    _uiState.value = _uiState.value.copy(
                        isLoading = false,
                        errorMessage = response?.error ?: "Failed to generate image with Stability AI"
                    )
                }
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    errorMessage = "Network error: ${e.localizedMessage}"
                )
            }
        }
    }
    
    fun clearError() {
        _uiState.value = _uiState.value.copy(errorMessage = null)
    }
    
    fun clearResults() {
        _uiState.value = _uiState.value.copy(
            generatedImageUrl = null,
            errorMessage = null
        )
    }
}
