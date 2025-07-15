package max.ohm.oneai.imagetoimage.viewmodel

import android.content.Context
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.net.Uri
import android.util.Base64
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import max.ohm.oneai.imagetoimage.repository.ImageToImageRepository
import max.ohm.oneai.imagetoimage.repository.SimpleImageUploadService
import java.io.ByteArrayOutputStream

data class ImageToImageUiState(
    val imageUrl: String = "",
    val prompt: String = "a girl standing in front of car in a dark background",
    val imageUri: Uri? = null,
    val isLoading: Boolean = false,
    val generatedImageUrl: String? = null,
    val errorMessage: String? = null
)

class ImageToImageViewModel : ViewModel() {
    
    private val _uiState = MutableStateFlow(ImageToImageUiState())
    val uiState: StateFlow<ImageToImageUiState> = _uiState.asStateFlow()
    
    private var context: Context? = null
    
    fun setContext(context: Context) {
        this.context = context
    }
    
    fun updateImageUrl(url: String) {
        _uiState.value = _uiState.value.copy(imageUrl = url, imageUri = null, errorMessage = null)
    }
    
    fun updatePrompt(prompt: String) {
        _uiState.value = _uiState.value.copy(prompt = prompt)
    }
    
    fun updateImageUri(uri: android.net.Uri?) {
        _uiState.value = _uiState.value.copy(imageUri = uri, imageUrl = "", errorMessage = null)
    }
    
    fun generateImage() {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(
                isLoading = true,
                errorMessage = null,
                generatedImageUrl = null
            )
            
            val imageUrl = when {
                _uiState.value.imageUrl.isNotBlank() -> _uiState.value.imageUrl
                _uiState.value.imageUri != null -> {
                    // Try to upload the image first
                    context?.let { ctx ->
val uploadedUrl = SimpleImageUploadService.uploadImageFromUri(ctx, _uiState.value.imageUri!!) ?: null
                        if (uploadedUrl != null) {
                            uploadedUrl
                        } else {
                            _uiState.value = _uiState.value.copy(
                                isLoading = false,
                                errorMessage = "Failed to upload image. Please make sure that the image service is configured properly."
                            )
                            return@launch
                        }
                    } ?: run {
                        _uiState.value = _uiState.value.copy(
                            isLoading = false,
                            errorMessage = "Context not available. Please restart the app."
                        )
                        return@launch
                    }
                }
                else -> {
                    _uiState.value = _uiState.value.copy(
                        isLoading = false,
                        errorMessage = "Please enter an image URL or select an image"
                    )
                    return@launch
                }
            }
        
            
            try {
                val response = ImageToImageRepository.generateImage(
                    initImageUrl = imageUrl,
                    prompt = _uiState.value.prompt
                )
                
                when {
                    response.status == "success" && !response.output.isNullOrEmpty() -> {
                        _uiState.value = _uiState.value.copy(
                            isLoading = false,
                            generatedImageUrl = response.output.first()
                        )
                    }
                    response.status == "processing" -> {
                        _uiState.value = _uiState.value.copy(
                            isLoading = false,
                            errorMessage = "Image is still processing. Please try again in a few seconds."
                        )
                    }
                    response.error != null -> {
                        _uiState.value = _uiState.value.copy(
                            isLoading = false,
                            errorMessage = "API Error: ${response.error}"
                        )
                    }
                    response.messege != null -> {  // Handle API typo
                        _uiState.value = _uiState.value.copy(
                            isLoading = false,
                            errorMessage = "API Message: ${response.messege}"
                        )
                    }
                    else -> {
                        _uiState.value = _uiState.value.copy(
                            isLoading = false,
                            errorMessage = "Failed to generate image: ${response.message ?: response.status ?: "Unknown error"}"
                        )
                    }
                }
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    errorMessage = "Network error: ${e.message}"
                )
            }
        }
    }
}
