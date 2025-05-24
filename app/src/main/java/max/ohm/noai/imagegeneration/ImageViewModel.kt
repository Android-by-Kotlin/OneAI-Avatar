package max.ohm.noai.imagegeneration

import android.util.Base64
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.setValue
import androidx.compose.ui.text.input.TextFieldValue
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.launch
import max.ohm.noai.network.ApiClient
import max.ohm.noai.network.ImageGenerationRequest
import max.ohm.noai.network.ImageGenerationResponse
import max.ohm.noai.network.NebiusApiService
import retrofit2.Response

// --- ViewModel ---
class MainViewModel : ViewModel() {
    var prompt by mutableStateOf(TextFieldValue(""))
        private set // Allow external read but only internal write

    var generatedImageData by mutableStateOf<ByteArray?>(null)
        private set

    var isLoading by mutableStateOf(false)
        private set

    var errorMessage by mutableStateOf<String?>(null) // For showing Toast
        private set

    fun onPromptChange(newPrompt: TextFieldValue) {
        prompt = newPrompt
    }

    fun clearErrorMessage() {
        errorMessage = null
    }

    fun generateImage() {
        if (NEBIUS_API_KEY == "YOUR_NEBIUS_API_KEY_HERE") {
            errorMessage = "Please replace 'YOUR_NEBIUS_API_KEY_HERE' in MainActivity.kt"
            return
        }
        if (prompt.text.isBlank()) {
            errorMessage = "Please enter a prompt"
            return
        }

        isLoading = true
        generatedImageData = null // Clear previous image
        errorMessage = null

        viewModelScope.launch {
            try {
                val request = ImageGenerationRequest(prompt = prompt.text)
                // Add the "Bearer " prefix to the API key for the Authorization header
                val apiKeyHeader = "Bearer $NEBIUS_API_KEY"
                val response: Response<ImageGenerationResponse> =
                    (ApiClient.instance as NebiusApiService).generateImage(apiKeyHeader, request)

                if (response.isSuccessful && response.body() != null) {
                    val responseBody = response.body()!!
                    if (responseBody.data.isNotEmpty()) {
                        // Decode Base64 image data
                        val base64String = responseBody.data[0].base64Json
                        generatedImageData = Base64.decode(base64String, Base64.DEFAULT)
                    } else {
                        errorMessage = "API returned no image data."
                    }
                } else {
                    // Handle API error (e.g., invalid key, server error)
                    val errorBody = response.errorBody()?.string() ?: "Unknown API error"
                    errorMessage = "API Error: ${response.code()} - ${errorBody}"
                    System.err.println("API Error: ${response.code()} - $errorBody") // Log error
                }

            } catch (e: Exception) {
                errorMessage = "Network or other error: ${e.localizedMessage}"
                e.printStackTrace() // Log the full stack trace
            } finally {
                isLoading = false
            }
        }
    }
}