package max.ohm.oneai.stabilityai.viewmodel

import android.content.Context
import android.net.Uri
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.setValue
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.launch
import max.ohm.oneai.stabilityai.data.SketchToImageResponse
import max.ohm.oneai.stabilityai.repository.StabilityRepository
import java.io.File
import java.io.FileOutputStream

class SketchToImageViewModel : ViewModel() {
    
    var isLoading by mutableStateOf(false)
        private set
    
    var generatedImagePath by mutableStateOf<String?>(null)
        private set
    
    var errorMessage by mutableStateOf<String?>(null)
        private set
    
    var selectedImageUri by mutableStateOf<Uri?>(null)
        private set
    
    var prompt by mutableStateOf("a medieval castle on a hill")
        private set
    
    var controlStrength by mutableStateOf(0.7f)
        private set
    
    fun updateSelectedImage(uri: Uri?) {
        selectedImageUri = uri
    }
    
    fun updatePrompt(newPrompt: String) {
        prompt = newPrompt
    }
    
    fun updateControlStrength(strength: Float) {
        controlStrength = strength
    }
    
    fun generateImageFromSketch(context: Context) {
        if (selectedImageUri == null) {
            errorMessage = "Please select a sketch image first"
            return
        }
        
        if (prompt.isBlank()) {
            errorMessage = "Please enter a prompt"
            return
        }
        
        isLoading = true
        errorMessage = null
        generatedImagePath = null
        
        viewModelScope.launch {
            try {
                val response = StabilityRepository.sketchToImage(
                    context = context,
                    imageUri = selectedImageUri!!,
                    prompt = prompt
                )
                
                if (response?.imageData != null && response.status == "success") {
                    // Save the image to cache and get the path
                    val imageFile = File(context.cacheDir, "sketch_generated_${System.currentTimeMillis()}.webp")
                    FileOutputStream(imageFile).use { fos ->
                        fos.write(response.imageData!!)
                    }
                    generatedImagePath = imageFile.absolutePath
                } else {
                    errorMessage = response?.error ?: "Unknown error occurred"
                }
            } catch (e: Exception) {
                errorMessage = "Error: ${e.localizedMessage}"
            } finally {
                isLoading = false
            }
        }
    }
    
    fun clearError() {
        errorMessage = null
    }
    
    fun reset() {
        isLoading = false
        generatedImagePath = null
        errorMessage = null
        selectedImageUri = null
        prompt = "a medieval castle on a hill"
        controlStrength = 0.7f
    }
}
