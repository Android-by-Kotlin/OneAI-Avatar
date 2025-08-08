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

    // Function to convert technical error messages to user-friendly ones
    private fun getUserFriendlyErrorMessage(technicalError: String, modelName: String): String {
        return when {
            technicalError.contains("500") || technicalError.contains("503") || 
            technicalError.contains("Service Unavailable") || technicalError.contains("Internal Server Error") -> {
                "$modelName is experiencing heavy traffic. Please try another model or wait a moment."
            }
            technicalError.contains("429") || technicalError.contains("Too Many Requests") -> {
                "Too many requests to $modelName. Please wait a moment before trying again."
            }
            technicalError.contains("401") || technicalError.contains("Unauthorized") -> {
                "Authentication failed. Please check your API key configuration."
            }
            technicalError.contains("400") || technicalError.contains("Bad Request") -> {
                "Invalid request to $modelName. Please try a different prompt."
            }
            technicalError.contains("404") || technicalError.contains("Not Found") -> {
                "$modelName is currently unavailable. Please try another model."
            }
            technicalError.contains("timeout") || technicalError.contains("Timeout") -> {
                "$modelName is taking too long to respond. Please try again."
            }
            technicalError.contains("Network") || technicalError.contains("network") -> {
                "Network connection issue. Please check your internet connection."
            }
            else -> {
                "$modelName is currently unavailable. Please try another model."
            }
        }
    }

    var selectedModel by mutableStateOf("provider-4/imagen-4") // Default model - ImageGen-4

    private val _elapsedTimeInSeconds = MutableStateFlow(0L)
    val elapsedTimeInSeconds: StateFlow<Long> = _elapsedTimeInSeconds

    private val _totalGenerationTimeInSeconds = MutableStateFlow<Long?>(null)
    val totalGenerationTimeInSeconds: StateFlow<Long?> = _totalGenerationTimeInSeconds

    private var timerJob: Job? = null
    private var generationStartTime: Long = 0L

    // Initialize the ViewModel with default model
    init {
        // Ensure the default model is properly set
        selectedModel = "provider-4/imagen-4"
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
            selectedModel = "provider-4/imagen-4"
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
                            val technicalError = "Flux.1-schnell API Error: ${response.code()} - ${errorBody}"
                            errorMessage = getUserFriendlyErrorMessage(technicalError, "Flux Schnell")
                        }
                        isLoading = false
                    }
                    "provider-5/gpt-image-1" -> {
                        if (A4F_API_KEY == "YOUR_A4F_API_KEY_HERE" || A4F_API_KEY.isBlank()) {
                            errorMessage = "Please set your A4F API Key in A4FClinet"
                            isLoading = false
                            return@launch
                        }
                        val request = FluxImageGenerationRequest(
                            model = "provider-5/gpt-image-1", // Use the pro model
                            prompt = prompt.text,
                            n = 1,
                            size = "1024x1536"  //chatgpt app size
                            //size = "720x1280"
                           // size = "1080x2340"
                            //size = "1024x1024"
                        )
                        val response = FluxApiClient.apiService.generateImage(request)

                        if (response.isSuccessful) {
                            val generatedFluxImage = response.body()?.data?.firstOrNull()
                            imageUrl = generatedFluxImage?.url
                        } else {
                            val errorBody = response.errorBody()?.string() ?: "Unknown API error"
                            val technicalError = "GPT Image-1 API Error: ${response.code()} - ${errorBody}"
                            errorMessage = getUserFriendlyErrorMessage(technicalError, "GPT Image-1")
                        }
                        isLoading = false
                    }



                    "provider-4/imagen-4" -> {
                        if (A4F_API_KEY == "YOUR_A4F_API_KEY_HERE" || A4F_API_KEY.isBlank()) {
                            errorMessage = "Please set your A4F API Key in A4FClinet"
                            isLoading = false
                            return@launch
                        }
                        val request = FluxImageGenerationRequest(
                            model = "provider-4/imagen-4", // Use the pro model
                            prompt = prompt.text,
                            n = 1,
                            //  size = "1024x1536"  //chatgpt app size
                            size = "1024x1792"
                            //size = "720x1280"
                            // size = "1080x2340"
                            //size = "1024x1024"
                        )
                        val response = FluxApiClient.apiService.generateImage(request)

                        if (response.isSuccessful) {
                            val generatedFluxImage = response.body()?.data?.firstOrNull()
                            imageUrl = generatedFluxImage?.url
                        } else {
                            val errorBody = response.errorBody()?.string() ?: "Unknown API error"
                            val technicalError = "ImageGen-4 API Error: ${response.code()} - ${errorBody}"
                            errorMessage = getUserFriendlyErrorMessage(technicalError, "ImageGen-4")
                        }
                        isLoading = false
                    }

//                    "provider-4/imagen-4" -> {
//                        if (A4F_API_KEY == "YOUR_A4F_API_KEY_HERE" || A4F_API_KEY.isBlank()) {
//                            errorMessage = "Please set your A4F API Key in A4FClinet"
//                            isLoading = false
//                            return@launch
//                        }
//                        val request = FluxImageGenerationRequest(
//                            model = "provider-4/imagen-4", // Use the pro model
//                            prompt = prompt.text,
//                            n = 1,
//                           // size = "1024x1536"  //chatgpt app size
//                            size = "1024x1792"
//                            //size = "720x1280"
//                            // size = "1080x2340"
//                            //size = "1024x1024"
//                        )
//                        val response = FluxApiClient.apiService.generateImage(request)
//
//                        if (response.isSuccessful) {
//                            val generatedFluxImage = response.body()?.data?.firstOrNull()
//                            imageUrl = generatedFluxImage?.url
//                        } else {
//                            val errorBody = response.errorBody()?.string() ?: "Unknown API error"
//                            errorMessage = "Flux Pro API Error: ${response.code()} - ${errorBody}"
//                        }
//                        isLoading = false
//                    }



                    "provider-3/imagen-4.0-generate-preview-06-06" -> {
                        if (A4F_API_KEY == "YOUR_A4F_API_KEY_HERE" || A4F_API_KEY.isBlank()) {
                            errorMessage = "Please set your A4F API Key in A4FClinet"
                            isLoading = false
                            return@launch
                        }
                        val request = FluxImageGenerationRequest(
                            model = "provider-3/imagen-4.0-generate-preview-06-06", // Use the pro model
                            prompt = prompt.text,
                            n = 1,
                            // size = "1024x1536"  //chatgpt app size
                            size = "1024x1792"
                            //size = "720x1280"
                            // size = "1080x2340"
                            //size = "1024x1024"
                        )
                        val response = FluxApiClient.apiService.generateImage(request)

                        if (response.isSuccessful) {
                            val generatedFluxImage = response.body()?.data?.firstOrNull()
                            imageUrl = generatedFluxImage?.url
                        } else {
                            val errorBody = response.errorBody()?.string() ?: "Unknown API error"
                            val technicalError = "Imagen 4.0 Preview API Error: ${response.code()} - ${errorBody}"
                            errorMessage = getUserFriendlyErrorMessage(technicalError, "Imagen 4.0 Preview")
                        }
                        isLoading = false
                    }

                    "provider-4/imagen-3" -> {
                        if (A4F_API_KEY == "YOUR_A4F_API_KEY_HERE" || A4F_API_KEY.isBlank()) {
                            errorMessage = "Please set your A4F API Key in A4FClinet"
                            isLoading = false
                            return@launch
                        }
                        val request = FluxImageGenerationRequest(
                            model = "provider-4/imagen-3", // Use the pro model
                            prompt = prompt.text,
                            n = 1,
                          //  size = "1024x1536"  //chatgpt app size
                            size = "1024x1792"
                            //size = "720x1280"
                            // size = "1080x2340"
                            //size = "1024x1024"
                        )
                        val response = FluxApiClient.apiService.generateImage(request)

                        if (response.isSuccessful) {
                            val generatedFluxImage = response.body()?.data?.firstOrNull()
                            imageUrl = generatedFluxImage?.url
                        } else {
                            val errorBody = response.errorBody()?.string() ?: "Unknown API error"
                            val technicalError = "ImageGen-3 API Error: ${response.code()} - ${errorBody}"
                            errorMessage = getUserFriendlyErrorMessage(technicalError, "ImageGen-3")
                        }
                        isLoading = false
                    }


                    "provider-3/imagen-3.0-generate-002" -> {
                        if (A4F_API_KEY == "YOUR_A4F_API_KEY_HERE" || A4F_API_KEY.isBlank()) {
                            errorMessage = "Please set your A4F API Key in A4FClinet"
                            isLoading = false
                            return@launch
                        }
                        val request = FluxImageGenerationRequest(
                            model = "provider-3/imagen-3.0-generate-002", // Use the pro model
                            prompt = prompt.text,
                            n = 1,
                            //  size = "1024x1536"  //chatgpt app size
                            size = "1024x1792"
                            //size = "720x1280"
                            // size = "1080x2340"
                            //size = "1024x1024"
                        )
                        val response = FluxApiClient.apiService.generateImage(request)

                        if (response.isSuccessful) {
                            val generatedFluxImage = response.body()?.data?.firstOrNull()
                            imageUrl = generatedFluxImage?.url
                        } else {
                            val errorBody = response.errorBody()?.string() ?: "Unknown API error"
                            val technicalError = "Imagen 3.0 API Error: ${response.code()} - ${errorBody}"
                            errorMessage = getUserFriendlyErrorMessage(technicalError, "Imagen 3.0")
                        }
                        isLoading = false
                    }


                    "provider-3/FLUX.1.1-pro-ultra-raw" -> {
                        if (A4F_API_KEY == "YOUR_A4F_API_KEY_HERE" || A4F_API_KEY.isBlank()) {
                            errorMessage = "Please set your A4F API Key in A4FClinet"
                            isLoading = false
                            return@launch
                        }
                        val request = FluxImageGenerationRequest(
                            model = "provider-3/FLUX.1.1-pro-ultra-raw", // Use the pro model
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
                            val technicalError = "Flux Pro Ultra Raw API Error: ${response.code()} - ${errorBody}"
                            errorMessage = getUserFriendlyErrorMessage(technicalError, "Flux Pro Raw")
                        }
                        isLoading = false
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
                            val technicalError = "Flux Pro API Error: ${response.code()} - ${errorBody}"
                            errorMessage = getUserFriendlyErrorMessage(technicalError, "Flux Pro")
                        }
                        isLoading = false
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
                            val technicalError = "Flux Ultra Pro API Error: ${response.code()} - ${errorBody}"
                            errorMessage = getUserFriendlyErrorMessage(technicalError, "Flux Ultra Pro")
                        }
                        isLoading = false
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
                            val technicalError = "DALL-E 3 API Error: ${response.code()} - ${errorBody}"
                            errorMessage = getUserFriendlyErrorMessage(technicalError, "DALL-E 3")
                        }
                        isLoading = false
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
                            val technicalError = "Shuttle 3.1 Aesthetic API Error: ${response.code()} - ${errorBody}"
                            errorMessage = getUserFriendlyErrorMessage(technicalError, "Shuttle 3.1 Aesthetic")
                        }
                        isLoading = false
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
                            val technicalError = "Shuttle 3 Diffusion API Error: ${response.code()} - ${errorBody}"
                            errorMessage = getUserFriendlyErrorMessage(technicalError, "Shuttle 3 Diffusion")
                        }
                        isLoading = false
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
                            val technicalError = "Shuttle Jaguar API Error: ${response.code()} - ${errorBody}"
                            errorMessage = getUserFriendlyErrorMessage(technicalError, "Shuttle Jaguar")
                        }
                        isLoading = false
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
                            val technicalError = "Flux Dev API Error: ${response.code()} - ${errorBody}"
                            errorMessage = getUserFriendlyErrorMessage(technicalError, "Flux Dev")
                        }
                        isLoading = false
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
                            val technicalError = "FLUX Kontext Max API Error: ${response.code()} - ${errorBody}"
                            errorMessage = getUserFriendlyErrorMessage(technicalError, "FLUX Kontext Max")
                        }
                        isLoading = false
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
                            val technicalError = "FLUX Kontext Pro API Error: ${response.code()} - ${errorBody}"
                            errorMessage = getUserFriendlyErrorMessage(technicalError, "FLUX Kontext Pro")
                        }
                        isLoading = false
                    }
                    else -> {
                        // Log the invalid model for debugging
                        Log.e("ImageGeneration", "Invalid model selected: '$selectedModel'")
                        
                        // Try to use the default model as a fallback
                        if (selectedModel != "provider-4/imagen-4") {
                            Log.d("ImageGeneration", "Falling back to provider-4/imagen-4 model")
                            selectedModel = "provider-4/imagen-4"
                            
                            // Retry with the default model (ImageGen-4)
                            if (A4F_API_KEY == "YOUR_A4F_API_KEY_HERE" || A4F_API_KEY.isBlank()) {
                                errorMessage = "Please set your A4F API Key in A4FClient"
                                isLoading = false
                                return@launch
                            }
                            
                            val request = FluxImageGenerationRequest(
                                model = "provider-4/imagen-4",
                                prompt = prompt.text,
                                n = 1,
                                size = "1024x1792"
                            )
                            val response = FluxApiClient.apiService.generateImage(request)

                            if (response.isSuccessful) {
                                val generatedFluxImage = response.body()?.data?.firstOrNull()
                                imageUrl = generatedFluxImage?.url
                            } else {
                                val errorBody = response.errorBody()?.string() ?: "Unknown API error"
                                val technicalError = "ImageGen-4 API Error: ${response.code()} - ${errorBody}"
                                errorMessage = getUserFriendlyErrorMessage(technicalError, "ImageGen-4")
                            }
                            isLoading = false
                        } else {
                            errorMessage = "Invalid model selected: $selectedModel"
                            isLoading = false // Ensure loading stops if model is invalid before try-finally
                        }
                    }
                }
            } catch (e: Exception) {
                val technicalError = "Network or other error: ${e.message}"
                errorMessage = getUserFriendlyErrorMessage(technicalError, "Image generation")
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


