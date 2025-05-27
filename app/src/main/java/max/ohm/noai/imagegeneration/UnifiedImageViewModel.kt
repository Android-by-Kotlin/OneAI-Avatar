package max.ohm.noai.imagegeneration

import android.util.Base64
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.setValue
import androidx.compose.ui.text.input.TextFieldValue
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.launch
import max.ohm.noai.fluxproimagegen.FLUXPRO_API_KEY
import max.ohm.noai.fluxproimagegen.network.FluxApiClient
import max.ohm.noai.fluxproimagegen.network.FluxImageGenerationRequest
import max.ohm.noai.network.ApiClient
import max.ohm.noai.network.ImageGenerationRequest

class UnifiedImageViewModel : ViewModel() {

    var prompt by mutableStateOf(TextFieldValue(""))
        private set

    var generatedImageData by mutableStateOf<ByteArray?>(null) // For base64 images (flux.1-schnell)
        private set

    var imageUrl by mutableStateOf<String?>(null) // For URL images (flux.1.1-pro)
        private set

    var isLoading by mutableStateOf(false)
        private set

    var errorMessage by mutableStateOf<String?>(null)
        private set

    var selectedModel by mutableStateOf("flux.1-schnell") // Default model

    fun updatePrompt(newPrompt: TextFieldValue) {
        prompt = newPrompt
    }

    fun updateSelectedModel(model: String) {
        selectedModel = model
        // Clear previous results when switching models
        generatedImageData = null
        imageUrl = null
        errorMessage = null
    }

    fun clearErrorMessage() {
        errorMessage = null
    }

    fun generateImage() {
        if (prompt.text.isBlank()) {
            errorMessage = "Please enter a prompt"
            return
        }

        isLoading = true
        generatedImageData = null
        imageUrl = null
        errorMessage = null

        viewModelScope.launch {
            try {
                when (selectedModel) {
                    "flux.1-schnell" -> {
                        if (NEBIUS_API_KEY == "YOUR_NEBIUS_API_KEY_HERE" || NEBIUS_API_KEY.isBlank()) {
                            errorMessage = "Please set your Nebius API Key in ImageGenApiKey.kt"
                            isLoading = false
                            return@launch
                        }
                        val request = ImageGenerationRequest(prompt = prompt.text)
                        val response = ApiClient.instance.generateImage("Bearer $NEBIUS_API_KEY", request)

                        if (response.isSuccessful && response.body() != null) {
                            val responseBody = response.body()!!
                            if (responseBody.data.isNotEmpty()) {
                                val base64String = responseBody.data[0].base64Json
                                generatedImageData = Base64.decode(base64String, Base64.DEFAULT)
                            } else {
                                errorMessage = "API returned no image data for flux.1-schnell."
                            }
                        } else {
                            val errorBody = response.errorBody()?.string() ?: "Unknown API error"
                            errorMessage = "Flux.1-schnell API Error: ${response.code()} - ${errorBody}"
                        }
                    }
                    "flux.1.1-pro" -> {
//                        if (max.ohm.noai.fluxproimagegen.FluxImageGenApiKey.API_KEY == "ddc-a4f-2e9bee7f17d640d7bcba8fb26cf48d46" || max.ohm.noai.fluxproimagegen.FluxImageGenApiKey.API_KEY.isBlank()) {
                        if (FLUXPRO_API_KEY == "YOUR_FLUXPRO_API_KEY_HERE" || FLUXPRO_API_KEY.isBlank()) {
                            errorMessage = "Please set your Flux Pro API Key in FluxImageGenApiKey.kt"
                            isLoading = false
                            return@launch
                        }
                        val request = FluxImageGenerationRequest(
                            model = "provider-2/flux.1.1-pro", // Use the pro model
                            prompt = prompt.text,
                            n = 1,
                            size = "1024x1024"
                        )
                        val response = FluxApiClient.apiService.generateImage(request)

                        if (response.isSuccessful) {
                            val generatedFluxImage = response.body()?.data?.firstOrNull()
                            imageUrl = generatedFluxImage?.url
                        } else {
                            val errorBody = response.errorBody()?.string() ?: "Unknown API error"
                            errorMessage = "Flux.1.1-pro API Error: ${response.code()} - ${errorBody}"
                        }
                    }
                    else -> {
                        errorMessage = "Invalid model selected."
                    }
                }
            } catch (e: Exception) {
                errorMessage = "Network or other error: ${e.message}"
                e.printStackTrace()
            } finally {
                isLoading = false
            }
        }
    }
}
