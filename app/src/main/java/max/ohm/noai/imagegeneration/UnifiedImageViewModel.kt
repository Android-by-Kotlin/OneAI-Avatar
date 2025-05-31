package max.ohm.noai.imagegeneration

import android.util.Base64
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.setValue
import androidx.compose.ui.text.input.TextFieldValue
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.Job
import kotlinx.coroutines.delay
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.launch
import max.ohm.noai.a4f.A4FClient.A4F_API_KEY
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

    private val _elapsedTimeInSeconds = MutableStateFlow(0L)
    val elapsedTimeInSeconds: StateFlow<Long> = _elapsedTimeInSeconds

    private val _totalGenerationTimeInSeconds = MutableStateFlow<Long?>(null)
    val totalGenerationTimeInSeconds: StateFlow<Long?> = _totalGenerationTimeInSeconds

    private var timerJob: Job? = null
    private var generationStartTime: Long = 0L

    fun updatePrompt(newPrompt: TextFieldValue) {
        prompt = newPrompt
    }

    fun updateSelectedModel(model: String) {
        selectedModel = model
        // Clear previous results and timer when switching models
        generatedImageData = null
        imageUrl = null
        errorMessage = null
        _elapsedTimeInSeconds.value = 0L
        _totalGenerationTimeInSeconds.value = null
        timerJob?.cancel()
    }

    fun clearErrorMessage() {
        errorMessage = null
    }

    private fun startTimer() {
        _elapsedTimeInSeconds.value = 0L
        _totalGenerationTimeInSeconds.value = null
        generationStartTime = System.currentTimeMillis()
        timerJob?.cancel()
        timerJob = viewModelScope.launch {
            while (isLoading) { // Loop while isLoading is true
                _elapsedTimeInSeconds.value = (System.currentTimeMillis() - generationStartTime) / 1000
                delay(1000)
            }
        }
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
        startTimer() // Start the timer

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
                        if (A4F_API_KEY == "YOUR_A4F_API_KEY_HERE" || A4F_API_KEY.isBlank()) {
                            errorMessage = "Please set your A4F API Key in A4FClinet"
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
                    "flux.ultra-pro" -> {
                        if (A4F_API_KEY == "YOUR_A4F_API_KEY_HERE" || A4F_API_KEY.isBlank()) {
                            errorMessage = "Please set your A4F API Key in A4FClinet"
                            isLoading = false
                            return@launch
                        }
                        val request = FluxImageGenerationRequest(
                            model = "provider-4/flux-1.1-pro-ultra",
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
                            errorMessage = "Flux.ultra-pro API Error: ${response.code()} - ${errorBody}"
                        }
                    }
                    "provider-4/dall-e-3" -> {
                        if (A4F_API_KEY == "YOUR_A4F_API_KEY_HERE" || A4F_API_KEY.isBlank()) {
                            errorMessage = "Please set your A4F API Key in A4FClinet"
                            isLoading = false
                            return@launch
                        }
                        val request = FluxImageGenerationRequest(
                            model = "provider-4/dall-e-3",
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
                            errorMessage = "DALL-E 3 API Error: ${response.code()} - ${errorBody}"
                        }
                    }
                    "provider-4/shuttle-3.1-aesthetic" -> {
                        if (A4F_API_KEY == "YOUR_A4F_API_KEY_HERE" || A4F_API_KEY.isBlank()) {
                            errorMessage = "Please set your A4F API Key in A4FClinet"
                            isLoading = false
                            return@launch
                        }
                        val request = FluxImageGenerationRequest(
                            model = "provider-4/shuttle-3.1-aesthetic",
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
                            errorMessage = "Shuttle 3.1 Aesthetic API Error: ${response.code()} - ${errorBody}"
                        }
                    }
                    "provider-4/shuttle-3-diffusion" -> {
                        if (A4F_API_KEY == "YOUR_A4F_API_KEY_HERE" || A4F_API_KEY.isBlank()) {
                            errorMessage = "Please set your A4F API Key in A4FClinet"
                            isLoading = false
                            return@launch
                        }
                        val request = FluxImageGenerationRequest(
                            model = "provider-4/shuttle-3-diffusion",
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
                            errorMessage = "Shuttle 3 Diffusion API Error: ${response.code()} - ${errorBody}"
                        }
                    }
                    "provider-4/shuttle-jaguar" -> {
                        if (A4F_API_KEY == "YOUR_A4F_API_KEY_HERE" || A4F_API_KEY.isBlank()) {
                            errorMessage = "Please set your A4F API Key in A4FClinet"
                            isLoading = false
                            return@launch
                        }
                        val request = FluxImageGenerationRequest(
                            model = "provider-4/shuttle-jaguar",
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
                            errorMessage = "Shuttle Jaguar API Error: ${response.code()} - ${errorBody}"
                        }
                    }
                    "provider-4/flux-dev" -> {
                        if (A4F_API_KEY == "YOUR_A4F_API_KEY_HERE" || A4F_API_KEY.isBlank()) {
                            errorMessage = "Please set your A4F API Key in A4FClinet"
                            isLoading = false
                            return@launch
                        }
                        val request = FluxImageGenerationRequest(
                            model = "provider-4/flux-dev",
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
                            errorMessage = "Flux Dev (Provider 4) API Error: ${response.code()} - ${errorBody}"
                        }
                    }
                    "provider-2/flux.1-dev" -> {
                        if (A4F_API_KEY == "YOUR_A4F_API_KEY_HERE" || A4F_API_KEY.isBlank()) {
                            errorMessage = "Please set your A4F API Key in A4FClinet"
                            isLoading = false
                            return@launch
                        }
                        val request = FluxImageGenerationRequest(
                            model = "provider-2/flux.1-dev",
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
                            errorMessage = "Flux 1 Dev API Error: ${response.code()} - ${errorBody}"
                        }
                    }
                    else -> {
                        errorMessage = "Invalid model selected."
                        isLoading = false // Ensure loading stops if model is invalid before try-finally
                    }
                }
            } catch (e: Exception) {
                errorMessage = "Network or other error: ${e.message}"
                e.printStackTrace()
            } finally {
                isLoading = false // This will stop the timer loop in startTimer()
                if (generationStartTime > 0) { // Calculate total time only if generation started
                    _totalGenerationTimeInSeconds.value = (System.currentTimeMillis() - generationStartTime) / 1000
                }
                // No need to explicitly cancel timerJob here as isLoading=false handles it
                // and startTimer() cancels previous job
            }
        }
    }
}
