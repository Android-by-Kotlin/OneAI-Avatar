package max.ohm.oneai.imagegeneration

import android.util.Base64
import android.util.Log
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
import max.ohm.oneai.a4f.A4FClient.A4F_API_KEY
import max.ohm.oneai.fluxproimagegen.network.FluxApiClient
import max.ohm.oneai.fluxproimagegen.network.FluxImageGenerationRequest
import max.ohm.oneai.network.ApiClient
import max.ohm.oneai.network.ImageGenerationRequest

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

    // Initialize the ViewModel with default model
    init {
        // Ensure the default model is properly set
        selectedModel = "flux.1-schnell"
    }

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

        // Log the current model for debugging
        Log.d("ImageGeneration", "Selected model: $selectedModel")

        // Ensure we have a valid model selected
        if (selectedModel.isBlank()) {
            // Set to default model if somehow blank
            selectedModel = "flux.1-schnell"
            Log.d("ImageGeneration", "Model was blank, set to default: $selectedModel")
        }

        isLoading = true
        generatedImageData = null
        imageUrl = null
        errorMessage = null
        startTimer() // Start the timer

        viewModelScope.launch {
            try {
                // Log the model being used for the API call
                Log.d("ImageGeneration", "Using model for API call: $selectedModel")
                
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
                    "provider-1/FLUX.1.1-pro" -> {
                        if (A4F_API_KEY == "YOUR_A4F_API_KEY_HERE" || A4F_API_KEY.isBlank()) {
                            errorMessage = "Please set your A4F API Key in A4FClinet"
                            isLoading = false
                            return@launch
                        }
                        val request = FluxImageGenerationRequest(
                            model = "provider-1/FLUX.1.1-pro", // Use the pro model
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
                            errorMessage = "Flux Pro API Error: ${response.code()} - ${errorBody}"
                        }
                    }
                    "provider-3/FLUX.1.1-pro-ultra" -> {
                        if (A4F_API_KEY == "YOUR_A4F_API_KEY_HERE" || A4F_API_KEY.isBlank()) {
                            errorMessage = "Please set your A4F API Key in A4FClinet"
                            isLoading = false
                            return@launch
                        }
                        val request = FluxImageGenerationRequest(
                            model = "provider-3/FLUX.1.1-pro-ultra",
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
                            errorMessage = "Flux Ultra Pro API Error: ${response.code()} - ${errorBody}"
                        }
                    }
                    "provider-3/dall-e-3" -> {
                        if (A4F_API_KEY == "YOUR_A4F_API_KEY_HERE" || A4F_API_KEY.isBlank()) {
                            errorMessage = "Please set your A4F API Key in A4FClinet"
                            isLoading = false
                            return@launch
                        }
                        val request = FluxImageGenerationRequest(
                            model = "provider-3/dall-e-3",
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
                    "provider-3/shuttle-3.1-aesthetic" -> {
                        if (A4F_API_KEY == "YOUR_A4F_API_KEY_HERE" || A4F_API_KEY.isBlank()) {
                            errorMessage = "Please set your A4F API Key in A4FClinet"
                            isLoading = false
                            return@launch
                        }
                        val request = FluxImageGenerationRequest(
                            model = "provider-3/shuttle-3.1-aesthetic",
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
                    "provider-3/shuttle-3-diffusion" -> {
                        if (A4F_API_KEY == "YOUR_A4F_API_KEY_HERE" || A4F_API_KEY.isBlank()) {
                            errorMessage = "Please set your A4F API Key in A4FClinet"
                            isLoading = false
                            return@launch
                        }
                        val request = FluxImageGenerationRequest(
                            model = "provider-3/shuttle-3-diffusion",
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
                    "provider-3/shuttle-jaguar" -> {
                        if (A4F_API_KEY == "YOUR_A4F_API_KEY_HERE" || A4F_API_KEY.isBlank()) {
                            errorMessage = "Please set your A4F API Key in A4FClinet"
                            isLoading = false
                            return@launch
                        }
                        val request = FluxImageGenerationRequest(
                            model = "provider-3/shuttle-jaguar",
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
                    "provider-3/FLUX.1-dev" -> {
                        if (A4F_API_KEY == "YOUR_A4F_API_KEY_HERE" || A4F_API_KEY.isBlank()) {
                            errorMessage = "Please set your A4F API Key in A4FClinet"
                            isLoading = false
                            return@launch
                        }
                        val request = FluxImageGenerationRequest(
                            model = "provider-3/FLUX.1-dev",
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
                            errorMessage = "Flux Dev API Error: ${response.code()} - ${errorBody}"
                        }
                    }
                    "provider-2/FLUX.1-kontext-max" -> {
                        if (A4F_API_KEY == "YOUR_A4F_API_KEY_HERE" || A4F_API_KEY.isBlank()) {
                            errorMessage = "Please set your A4F API Key in A4FClinet"
                            isLoading = false
                            return@launch
                        }
                        val request = FluxImageGenerationRequest(
                            model = "provider-2/FLUX.1-kontext-max",
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
                            errorMessage = "FLUX Kontext Max API Error: ${response.code()} - ${errorBody}"
                        }
                    }
                    "provider-1/FLUX.1-kontext-pro" -> {
                        if (A4F_API_KEY == "YOUR_A4F_API_KEY_HERE" || A4F_API_KEY.isBlank()) {
                            errorMessage = "Please set your A4F API Key in A4FClinet"
                            isLoading = false
                            return@launch
                        }
                        val request = FluxImageGenerationRequest(
                            model = "provider-1/FLUX.1-kontext-pro",
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
                            errorMessage = "FLUX Kontext Pro API Error: ${response.code()} - ${errorBody}"
                        }
                    }
                    else -> {
                        // Log the invalid model for debugging
                        Log.e("ImageGeneration", "Invalid model selected: '$selectedModel'")
                        
                        // Try to use the default model as a fallback
                        if (selectedModel != "flux.1-schnell") {
                            Log.d("ImageGeneration", "Falling back to flux.1-schnell model")
                            selectedModel = "flux.1-schnell"
                            
                            // Retry with the default model
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
                        } else {
                            errorMessage = "Invalid model selected: $selectedModel"
                            isLoading = false // Ensure loading stops if model is invalid before try-finally
                        }
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


