package max.ohm.oneai.imagetoimage

import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.util.Base64
import android.util.Log
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.setValue
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.Job
import kotlinx.coroutines.delay
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import max.ohm.oneai.a4f.A4FClient.A4F_API_KEY
import max.ohm.oneai.imagetoimage.modelslabapikey.MODELSLAB_API_KEY
import okhttp3.MediaType.Companion.toMediaType
import okhttp3.OkHttpClient
import okhttp3.Request
import okhttp3.RequestBody.Companion.toRequestBody
import org.json.JSONObject
import java.io.ByteArrayOutputStream
import java.util.concurrent.TimeUnit

class UnifiedImageToImageViewModel : ViewModel() {

    // Selected input image
    var selectedImage by mutableStateOf<Bitmap?>(null)
        private set

    // Generated output
    var generatedImageBitmap by mutableStateOf<Bitmap?>(null)
        private set

    var generatedImageUrl by mutableStateOf<String?>(null)
        private set

    // UI States
    var isLoading by mutableStateOf(false)
        private set

    var errorMessage by mutableStateOf<String?>(null)
        private set

    var selectedModel by mutableStateOf("flux-img2img") // Default model
        private set

    // Prompt and parameters
    var prompt by mutableStateOf("")
    var negativePrompt by mutableStateOf("")
    var strength by mutableStateOf(0.7f)
    var guidanceScale by mutableStateOf(7.5f)
    var steps by mutableStateOf(20)

    // Timer states
    private val _elapsedTimeInSeconds = MutableStateFlow(0L)
    val elapsedTimeInSeconds: StateFlow<Long> = _elapsedTimeInSeconds

    private val _totalGenerationTimeInSeconds = MutableStateFlow<Long?>(null)
    val totalGenerationTimeInSeconds: StateFlow<Long?> = _totalGenerationTimeInSeconds

    private var timerJob: Job? = null
    private var generationStartTime: Long = 0L
    
    // Loading message for long operations
    var loadingMessage by mutableStateOf("")
        private set

    // HTTP client with extended timeout
    private val client = OkHttpClient.Builder()
        .connectTimeout(600, TimeUnit.SECONDS)
        .readTimeout(600, TimeUnit.SECONDS)
        .writeTimeout(600, TimeUnit.SECONDS)
        .build()

    // Available models
    val availableModels = listOf(
        // Standard Image-to-Image Models
        "flux-img2img" to "Flux Image-to-Image",
        "stable-diffusion-img2img" to "Stable Diffusion Img2Img",
        "sdxl-img2img" to "SDXL Image-to-Image",
        
        // Style Transfer Models
        "ghibli-style" to "Ghibli Studio Style",
        "anime-style" to "Anime Style Transfer",
        "oil-painting" to "Oil Painting Style",
        "watercolor" to "Watercolor Style",
        "sketch-style" to "Sketch/Drawing Style",
        "cyberpunk-style" to "Cyberpunk Style",
        "fantasy-art" to "Fantasy Art Style",
        
        // Specialized Models
        "photo-enhance" to "Photo Enhancement",
        "colorize" to "Black & White Colorization",
        "super-resolution" to "Super Resolution Upscale"
    )

    fun updateSelectedImage(bitmap: Bitmap?) {
        selectedImage = bitmap
        errorMessage = null
        // Reset generated images when new input is selected
        generatedImageBitmap = null
        generatedImageUrl = null
    }

    fun updateSelectedModel(model: String) {
        selectedModel = model
        // Clear previous results when switching models
        generatedImageBitmap = null
        generatedImageUrl = null
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
            while (isLoading) {
                _elapsedTimeInSeconds.value = (System.currentTimeMillis() - generationStartTime) / 1000
                delay(1000)
            }
        }
    }

    fun generateImage() {
        if (selectedImage == null) {
            errorMessage = "Please select an image first"
            return
        }

        // Validate prompt for models that need it
        val promptRequiredModels = listOf("flux-img2img", "stable-diffusion-img2img", "sdxl-img2img")
        if (selectedModel in promptRequiredModels && prompt.isBlank()) {
            errorMessage = "Please enter a prompt for this model"
            return
        }

        isLoading = true
        generatedImageBitmap = null
        generatedImageUrl = null
        errorMessage = null
        loadingMessage = "Initializing..."
        startTimer()

        viewModelScope.launch {
            try {
                Log.d("UnifiedImg2Img", "Starting generation with model: $selectedModel")
                
                // Convert image to base64
                val base64Image = withContext(Dispatchers.IO) {
                    val resizedBitmap = resizeBitmapIfNeeded(selectedImage!!)
                    bitmapToBase64(resizedBitmap)
                }

                when (selectedModel) {
                    // Standard Image-to-Image Models
                    "flux-img2img" -> {
                        if (MODELSLAB_API_KEY == "YOUR_MODELSLAB_API_KEY_HERE" || MODELSLAB_API_KEY.isBlank()) {
                            errorMessage = "Please set your ModelsLab API Key"
                            isLoading = false
                            return@launch
                        }
                        performFluxImg2Img(base64Image)
                    }
                    
                    "stable-diffusion-img2img" -> {
                        if (MODELSLAB_API_KEY == "YOUR_MODELSLAB_API_KEY_HERE" || MODELSLAB_API_KEY.isBlank()) {
                            errorMessage = "Please set your ModelsLab API Key"
                            isLoading = false
                            return@launch
                        }
                        performSDImg2Img(base64Image)
                    }
                    
                    "sdxl-img2img" -> {
                        if (MODELSLAB_API_KEY == "YOUR_MODELSLAB_API_KEY_HERE" || MODELSLAB_API_KEY.isBlank()) {
                            errorMessage = "Please set your ModelsLab API Key"
                            isLoading = false
                            return@launch
                        }
                        performSDXLImg2Img(base64Image)
                    }
                    
                    // Style Transfer Models
                    "ghibli-style" -> {
                        if (MODELSLAB_API_KEY == "YOUR_MODELSLAB_API_KEY_HERE" || MODELSLAB_API_KEY.isBlank()) {
                            errorMessage = "Please set your ModelsLab API Key"
                            isLoading = false
                            return@launch
                        }
                        performGhibliStyle(base64Image)
                    }
                    
                    "anime-style" -> {
                        if (A4F_API_KEY == "YOUR_A4F_API_KEY_HERE" || A4F_API_KEY.isBlank()) {
                            errorMessage = "Please set your A4F API Key"
                            isLoading = false
                            return@launch
                        }
                        performAnimeStyle(base64Image)
                    }
                    
                    "oil-painting" -> {
                        if (A4F_API_KEY == "YOUR_A4F_API_KEY_HERE" || A4F_API_KEY.isBlank()) {
                            errorMessage = "Please set your A4F API Key"
                            isLoading = false
                            return@launch
                        }
                        performOilPaintingStyle(base64Image)
                    }
                    
                    "watercolor" -> {
                        if (A4F_API_KEY == "YOUR_A4F_API_KEY_HERE" || A4F_API_KEY.isBlank()) {
                            errorMessage = "Please set your A4F API Key"
                            isLoading = false
                            return@launch
                        }
                        performWatercolorStyle(base64Image)
                    }
                    
                    "sketch-style" -> {
                        if (A4F_API_KEY == "YOUR_A4F_API_KEY_HERE" || A4F_API_KEY.isBlank()) {
                            errorMessage = "Please set your A4F API Key"
                            isLoading = false
                            return@launch
                        }
                        performSketchStyle(base64Image)
                    }
                    
                    "cyberpunk-style" -> {
                        if (A4F_API_KEY == "YOUR_A4F_API_KEY_HERE" || A4F_API_KEY.isBlank()) {
                            errorMessage = "Please set your A4F API Key"
                            isLoading = false
                            return@launch
                        }
                        performCyberpunkStyle(base64Image)
                    }
                    
                    "fantasy-art" -> {
                        if (A4F_API_KEY == "YOUR_A4F_API_KEY_HERE" || A4F_API_KEY.isBlank()) {
                            errorMessage = "Please set your A4F API Key"
                            isLoading = false
                            return@launch
                        }
                        performFantasyArtStyle(base64Image)
                    }
                    
                    // Specialized Models
                    "photo-enhance" -> {
                        if (A4F_API_KEY == "YOUR_A4F_API_KEY_HERE" || A4F_API_KEY.isBlank()) {
                            errorMessage = "Please set your A4F API Key"
                            isLoading = false
                            return@launch
                        }
                        performPhotoEnhancement(base64Image)
                    }
                    
                    "colorize" -> {
                        if (A4F_API_KEY == "YOUR_A4F_API_KEY_HERE" || A4F_API_KEY.isBlank()) {
                            errorMessage = "Please set your A4F API Key"
                            isLoading = false
                            return@launch
                        }
                        performColorization(base64Image)
                    }
                    
                    "super-resolution" -> {
                        if (A4F_API_KEY == "YOUR_A4F_API_KEY_HERE" || A4F_API_KEY.isBlank()) {
                            errorMessage = "Please set your A4F API Key"
                            isLoading = false
                            return@launch
                        }
                        performSuperResolution(base64Image)
                    }
                    
                    else -> {
                        errorMessage = "Invalid model selected: $selectedModel"
                        isLoading = false
                    }
                }
                
            } catch (e: Exception) {
                errorMessage = "Error: ${e.message}"
                e.printStackTrace()
            } finally {
                isLoading = false
                if (generationStartTime > 0) {
                    _totalGenerationTimeInSeconds.value = (System.currentTimeMillis() - generationStartTime) / 1000
                }
                loadingMessage = ""
            }
        }
    }

    // Standard Image-to-Image implementations
    private suspend fun performFluxImg2Img(base64Image: String) = withContext(Dispatchers.IO) {
        loadingMessage = "Processing with Flux..."
        
        val jsonBody = JSONObject().apply {
            put("key", MODELSLAB_API_KEY)
            put("model_id", "flux")
            put("prompt", prompt)
            put("negative_prompt", negativePrompt)
            put("init_image", base64Image)
            put("samples", "1")
            put("safety_checker", false)
            put("strength", strength)
            put("scheduler", "DPMSolverMultistepScheduler")
            put("base64", true)
            put("seed", null)
            put("webhook", null)
            put("track_id", null)
        }

        val result = makeApiCall(
            url = "https://modelslab.com/api/v4/dreambooth/img2img",
            jsonBody = jsonBody,
            modelName = "Flux Img2Img"
        )
        
        processApiResult(result)
    }

    private suspend fun performSDImg2Img(base64Image: String) = withContext(Dispatchers.IO) {
        loadingMessage = "Processing with Stable Diffusion..."
        
        val jsonBody = JSONObject().apply {
            put("key", MODELSLAB_API_KEY)
            put("model_id", "sdxl")
            put("prompt", prompt)
            put("negative_prompt", negativePrompt)
            put("init_image", base64Image)
            put("samples", "1")
            put("num_inference_steps", steps)
            put("guidance_scale", guidanceScale)
            put("strength", strength)
            put("scheduler", "DDPMScheduler")
            put("base64", true)
            put("seed", null)
            put("webhook", null)
            put("track_id", null)
        }

        val result = makeApiCall(
            url = "https://modelslab.com/api/v6/realtime/img2img",
            jsonBody = jsonBody,
            modelName = "Stable Diffusion Img2Img"
        )
        
        processApiResult(result)
    }

    private suspend fun performSDXLImg2Img(base64Image: String) = withContext(Dispatchers.IO) {
        loadingMessage = "Processing with SDXL..."
        
        val jsonBody = JSONObject().apply {
            put("key", MODELSLAB_API_KEY)
            put("model_id", "sdxl")
            put("prompt", prompt)
            put("negative_prompt", negativePrompt)
            put("init_image", base64Image)
            put("samples", "1")
            put("num_inference_steps", steps)
            put("guidance_scale", guidanceScale)
            put("strength", strength)
            put("width", "1024")
            put("height", "1024")
            put("scheduler", "DDPMScheduler")
            put("base64", true)
            put("seed", null)
            put("webhook", null)
            put("track_id", null)
        }

        val result = makeApiCall(
            url = "https://modelslab.com/api/v6/realtime/img2img",
            jsonBody = jsonBody,
            modelName = "SDXL Img2Img"
        )
        
        processApiResult(result)
    }

    // Style Transfer implementations
    private suspend fun performGhibliStyle(base64Image: String) = withContext(Dispatchers.IO) {
        loadingMessage = "Applying Ghibli Studio style..."
        
        val dimensions = calculateDimensions(selectedImage!!)
        
        val jsonBody = JSONObject().apply {
            put("key", MODELSLAB_API_KEY)
            put("model_id", "fluxdev")
            put("init_image", base64Image)
            put("prompt", "Ghibli Studio style, Charming hand-drawn anime-style illustration")
            put("controlnet_type", "ghibli")
            put("controlnet_model", "ghibli")
            put("height", dimensions.second.toString())
            put("width", dimensions.first.toString())
            put("base64", true)
            put("temp", "no")
            put("webhook", null)
            put("track_id", null)
        }

        val result = makeApiCallWithPolling(
            url = "https://modelslab.com/api/v5/controlnet",
            jsonBody = jsonBody,
            modelName = "Ghibli Style"
        )
        
        processApiResult(result)
    }

    private suspend fun performAnimeStyle(base64Image: String) = withContext(Dispatchers.IO) {
        loadingMessage = "Applying anime style..."
        
        val jsonBody = JSONObject().apply {
            put("key", A4F_API_KEY)
            put("model", "anime-style-transfer")
            put("init_image", base64Image)
            put("prompt", prompt.ifBlank { "anime style, vibrant colors, cel shading" })
            put("strength", strength)
            put("guidance_scale", guidanceScale)
        }

        val result = makeApiCall(
            url = "https://api.a4f.com/v1/style-transfer",
            jsonBody = jsonBody,
            modelName = "Anime Style"
        )
        
        processApiResult(result)
    }

    private suspend fun performOilPaintingStyle(base64Image: String) = withContext(Dispatchers.IO) {
        loadingMessage = "Applying oil painting style..."
        
        val jsonBody = JSONObject().apply {
            put("key", A4F_API_KEY)
            put("model", "oil-painting-style")
            put("init_image", base64Image)
            put("prompt", prompt.ifBlank { "oil painting style, thick brushstrokes, impressionist" })
            put("strength", strength)
        }

        val result = makeApiCall(
            url = "https://api.a4f.com/v1/style-transfer",
            jsonBody = jsonBody,
            modelName = "Oil Painting Style"
        )
        
        processApiResult(result)
    }

    private suspend fun performWatercolorStyle(base64Image: String) = withContext(Dispatchers.IO) {
        loadingMessage = "Applying watercolor style..."
        
        val jsonBody = JSONObject().apply {
            put("key", A4F_API_KEY)
            put("model", "watercolor-style")
            put("init_image", base64Image)
            put("prompt", prompt.ifBlank { "watercolor painting, soft edges, translucent layers" })
            put("strength", strength)
        }

        val result = makeApiCall(
            url = "https://api.a4f.com/v1/style-transfer",
            jsonBody = jsonBody,
            modelName = "Watercolor Style"
        )
        
        processApiResult(result)
    }

    private suspend fun performSketchStyle(base64Image: String) = withContext(Dispatchers.IO) {
        loadingMessage = "Applying sketch style..."
        
        val jsonBody = JSONObject().apply {
            put("key", A4F_API_KEY)
            put("model", "sketch-style")
            put("init_image", base64Image)
            put("prompt", prompt.ifBlank { "pencil sketch, hand-drawn, artistic lines" })
            put("strength", strength)
        }

        val result = makeApiCall(
            url = "https://api.a4f.com/v1/style-transfer",
            jsonBody = jsonBody,
            modelName = "Sketch Style"
        )
        
        processApiResult(result)
    }

    private suspend fun performCyberpunkStyle(base64Image: String) = withContext(Dispatchers.IO) {
        loadingMessage = "Applying cyberpunk style..."
        
        val jsonBody = JSONObject().apply {
            put("key", A4F_API_KEY)
            put("model", "cyberpunk-style")
            put("init_image", base64Image)
            put("prompt", prompt.ifBlank { "cyberpunk style, neon lights, futuristic, high tech" })
            put("strength", strength)
            put("guidance_scale", guidanceScale)
        }

        val result = makeApiCall(
            url = "https://api.a4f.com/v1/style-transfer",
            jsonBody = jsonBody,
            modelName = "Cyberpunk Style"
        )
        
        processApiResult(result)
    }

    private suspend fun performFantasyArtStyle(base64Image: String) = withContext(Dispatchers.IO) {
        loadingMessage = "Applying fantasy art style..."
        
        val jsonBody = JSONObject().apply {
            put("key", A4F_API_KEY)
            put("model", "fantasy-art-style")
            put("init_image", base64Image)
            put("prompt", prompt.ifBlank { "fantasy art style, magical, ethereal, mystical atmosphere" })
            put("strength", strength)
            put("guidance_scale", guidanceScale)
        }

        val result = makeApiCall(
            url = "https://api.a4f.com/v1/style-transfer",
            jsonBody = jsonBody,
            modelName = "Fantasy Art Style"
        )
        
        processApiResult(result)
    }

    // Specialized Model implementations
    private suspend fun performPhotoEnhancement(base64Image: String) = withContext(Dispatchers.IO) {
        loadingMessage = "Enhancing photo..."
        
        val jsonBody = JSONObject().apply {
            put("key", A4F_API_KEY)
            put("model", "photo-enhance")
            put("init_image", base64Image)
            put("enhancement_type", "auto")
        }

        val result = makeApiCall(
            url = "https://api.a4f.com/v1/enhance",
            jsonBody = jsonBody,
            modelName = "Photo Enhancement"
        )
        
        processApiResult(result)
    }

    private suspend fun performColorization(base64Image: String) = withContext(Dispatchers.IO) {
        loadingMessage = "Colorizing image..."
        
        val jsonBody = JSONObject().apply {
            put("key", A4F_API_KEY)
            put("model", "colorization")
            put("init_image", base64Image)
        }

        val result = makeApiCall(
            url = "https://api.a4f.com/v1/colorize",
            jsonBody = jsonBody,
            modelName = "Colorization"
        )
        
        processApiResult(result)
    }

    private suspend fun performSuperResolution(base64Image: String) = withContext(Dispatchers.IO) {
        loadingMessage = "Upscaling image..."
        
        val jsonBody = JSONObject().apply {
            put("key", A4F_API_KEY)
            put("model", "super-resolution")
            put("init_image", base64Image)
            put("scale", "4x")
        }

        val result = makeApiCall(
            url = "https://api.a4f.com/v1/upscale",
            jsonBody = jsonBody,
            modelName = "Super Resolution"
        )
        
        processApiResult(result)
    }

    // Helper methods
    private suspend fun makeApiCall(
        url: String,
        jsonBody: JSONObject,
        modelName: String
    ): String? = withContext(Dispatchers.IO) {
        try {
            val requestBody = jsonBody.toString()
                .toRequestBody("application/json".toMediaType())

            val request = Request.Builder()
                .url(url)
                .post(requestBody)
                .build()

            val response = client.newCall(request).execute()
            val responseBody = response.body?.string()

            Log.d("UnifiedImg2Img", "$modelName Response code: ${response.code}")
            Log.d("UnifiedImg2Img", "$modelName Response body: $responseBody")

            if (response.isSuccessful && responseBody != null) {
                val jsonResponse = JSONObject(responseBody)
                
                // Check for direct output
                if (jsonResponse.has("output")) {
                    val outputValue = jsonResponse.get("output")
                    if (outputValue is String && outputValue.isNotEmpty()) {
                        return@withContext outputValue
                    } else if (outputValue is org.json.JSONArray && outputValue.length() > 0) {
                        return@withContext outputValue.getString(0)
                    }
                }
                
                // Check for data array (A4F format)
                if (jsonResponse.has("data")) {
                    val dataArray = jsonResponse.getJSONArray("data")
                    if (dataArray.length() > 0) {
                        val firstItem = dataArray.getJSONObject(0)
                        if (firstItem.has("url")) {
                            return@withContext firstItem.getString("url")
                        }
                    }
                }
                
                // Check status
                val status = jsonResponse.optString("status", "")
                if (status == "success") {
                    // Already checked output above
                    errorMessage = "Success but no image URL found"
                } else {
                    val errorMsg = jsonResponse.optString("message",
                        jsonResponse.optString("error", "Unknown error"))
                    errorMessage = "$modelName Error: $errorMsg"
                }
            } else {
                errorMessage = "$modelName Error: ${response.code} - ${response.message}"
            }
            
            null
        } catch (e: Exception) {
            Log.e("UnifiedImg2Img", "Error in $modelName API call", e)
            errorMessage = "$modelName Error: ${e.message}"
            null
        }
    }

    private suspend fun makeApiCallWithPolling(
        url: String,
        jsonBody: JSONObject,
        modelName: String
    ): String? = withContext(Dispatchers.IO) {
        try {
            // Initial API call
            val requestBody = jsonBody.toString()
                .toRequestBody("application/json".toMediaType())

            val request = Request.Builder()
                .url(url)
                .post(requestBody)
                .build()

            val response = client.newCall(request).execute()
            val responseBody = response.body?.string()

            if (response.isSuccessful && responseBody != null) {
                val jsonResponse = JSONObject(responseBody)
                val status = jsonResponse.getString("status")
                
                // Check if we already have output
                if (jsonResponse.has("output")) {
                    val outputValue = jsonResponse.get("output")
                    if (outputValue is String && outputValue.isNotEmpty()) {
                        return@withContext outputValue
                    } else if (outputValue is org.json.JSONArray && outputValue.length() > 0) {
                        val imageUrl = outputValue.getString(0)
                        if (imageUrl.isNotEmpty() && !imageUrl.equals("null", ignoreCase = true)) {
                            return@withContext imageUrl
                        }
                    }
                }
                
                when (status) {
                    "success" -> {
                        // Already checked output above
                        errorMessage = "Success but no image found"
                        return@withContext null
                    }
                    "processing" -> {
                        val estimatedTime = jsonResponse.optDouble("eta", 30.0)
                        val fetchUrl = jsonResponse.optString("fetch_result", "")
                        
                        if (fetchUrl.isNotEmpty()) {
                            // Wait based on ETA
                            val initialWaitTime = (estimatedTime * 1000).toLong().coerceAtLeast(1000L)
                            delay(initialWaitTime)
                            
                            // Poll for result
                            val maxRetries = 60 // 5 minutes with 5 second intervals
                            val retryDelay = 5000L
                            
                            for (attempt in 1..maxRetries) {
                                withContext(Dispatchers.Main) {
                                    loadingMessage = "$modelName processing... ($attempt/$maxRetries)"
                                }
                                
                                val result = fetchProcessingResult(fetchUrl)
                                if (result != null) {
                                    return@withContext result
                                }
                                
                                if (attempt < maxRetries) {
                                    delay(retryDelay)
                                }
                            }
                            
                            errorMessage = "$modelName generation timed out"
                        } else {
                            errorMessage = "No fetch URL provided"
                        }
                    }
                    else -> {
                        val errorMsg = jsonResponse.optString("message", "Unknown error")
                        errorMessage = "$modelName Error: $errorMsg"
                    }
                }
            } else {
                errorMessage = "$modelName HTTP Error: ${response.code}"
            }
            
            null
        } catch (e: Exception) {
            Log.e("UnifiedImg2Img", "Error in $modelName API call", e)
            errorMessage = "$modelName Error: ${e.message}"
            null
        }
    }

    private suspend fun fetchProcessingResult(fetchUrl: String): String? = withContext(Dispatchers.IO) {
        try {
            val jsonBody = JSONObject().apply {
                put("key", MODELSLAB_API_KEY)
            }
            
            val requestBody = jsonBody.toString()
                .toRequestBody("application/json".toMediaType())
            
            val request = Request.Builder()
                .url(fetchUrl)
                .post(requestBody)
                .build()
            
            val response = client.newCall(request).execute()
            val responseBody = response.body?.string()
            
            if (response.isSuccessful && responseBody != null) {
                val jsonResponse = JSONObject(responseBody)
                val status = jsonResponse.optString("status", "")
                
                when (status) {
                    "success" -> {
                        if (jsonResponse.has("output")) {
                            val outputValue = jsonResponse.get("output")
                            if (outputValue is String && outputValue.isNotEmpty()) {
                                return@withContext outputValue
                            } else if (outputValue is org.json.JSONArray && outputValue.length() > 0) {
                                return@withContext outputValue.getString(0)
                            }
                        }
                    }
                    "processing" -> {
                        // Still processing
                        return@withContext null
                    }
                    else -> {
                        val errorMsg = jsonResponse.optString("message", "Generation failed")
                        errorMessage = errorMsg
                        return@withContext null
                    }
                }
            }
            
            null
        } catch (e: Exception) {
            Log.e("UnifiedImg2Img", "Error fetching result", e)
            null
        }
    }

    private suspend fun processApiResult(result: String?) {
        if (result != null) {
            when {
                result.endsWith(".base64") -> {
                    // Fetch and decode base64 from URL
                    val base64Data = fetchBase64FromUrl(result)
                    if (base64Data != null) {
                        try {
                            val imageBytes = Base64.decode(base64Data, Base64.DEFAULT)
                            generatedImageBitmap = BitmapFactory.decodeByteArray(imageBytes, 0, imageBytes.size)
                            Log.d("UnifiedImg2Img", "Successfully decoded base64 image")
                        } catch (e: Exception) {
                            Log.e("UnifiedImg2Img", "Failed to decode base64", e)
                            errorMessage = "Failed to decode generated image"
                        }
                    } else {
                        errorMessage = "Failed to fetch base64 data"
                    }
                }
                result.startsWith("data:image") -> {
                    // Direct base64 data URL
                    try {
                        val base64Data = result.substring(result.indexOf(",") + 1)
                        val imageBytes = Base64.decode(base64Data, Base64.DEFAULT)
                        generatedImageBitmap = BitmapFactory.decodeByteArray(imageBytes, 0, imageBytes.size)
                        Log.d("UnifiedImg2Img", "Successfully decoded data URL")
                    } catch (e: Exception) {
                        Log.e("UnifiedImg2Img", "Failed to decode data URL", e)
                        errorMessage = "Failed to decode generated image"
                    }
                }
                else -> {
                    // Regular image URL
                    generatedImageUrl = result
                    Log.d("UnifiedImg2Img", "Successfully received image URL: $result")
                }
            }
        } else if (errorMessage == null) {
            errorMessage = "Failed to generate image"
        }
    }

    private suspend fun fetchBase64FromUrl(url: String): String? = withContext(Dispatchers.IO) {
        try {
            val request = Request.Builder()
                .url(url)
                .build()
            
            val response = client.newCall(request).execute()
            if (response.isSuccessful) {
                return@withContext response.body?.string()
            }
            null
        } catch (e: Exception) {
            Log.e("UnifiedImg2Img", "Error fetching base64", e)
            null
        }
    }

    private fun resizeBitmapIfNeeded(bitmap: Bitmap, maxDimension: Int = 1024): Bitmap {
        val width = bitmap.width
        val height = bitmap.height
        
        if (width <= maxDimension && height <= maxDimension) {
            return bitmap
        }
        
        val aspectRatio = width.toFloat() / height.toFloat()
        val newWidth: Int
        val newHeight: Int
        
        if (width > height) {
            newWidth = maxDimension
            newHeight = (maxDimension / aspectRatio).toInt()
        } else {
            newHeight = maxDimension
            newWidth = (maxDimension * aspectRatio).toInt()
        }
        
        Log.d("UnifiedImg2Img", "Resizing from ${width}x${height} to ${newWidth}x${newHeight}")
        return Bitmap.createScaledBitmap(bitmap, newWidth, newHeight, true)
    }

    private fun bitmapToBase64(bitmap: Bitmap): String {
        val outputStream = ByteArrayOutputStream()
        bitmap.compress(Bitmap.CompressFormat.JPEG, 90, outputStream)
        val imageBytes = outputStream.toByteArray()
        return Base64.encodeToString(imageBytes, Base64.NO_WRAP)
    }

    private fun calculateDimensions(bitmap: Bitmap): Pair<Int, Int> {
        val originalWidth = bitmap.width
        val originalHeight = bitmap.height
        val aspectRatio = originalWidth.toFloat() / originalHeight.toFloat()
        
        val maxDimension = 1024
        
        return if (aspectRatio > 1) {
            val width = maxDimension
            val height = (maxDimension / aspectRatio).toInt()
            Pair(width - (width % 8), height - (height % 8))
        } else {
            val height = maxDimension
            val width = (maxDimension * aspectRatio).toInt()
            Pair(width - (width % 8), height - (height % 8))
        }
    }

    fun reset() {
        selectedImage = null
        generatedImageBitmap = null
        generatedImageUrl = null
        prompt = ""
        negativePrompt = ""
        strength = 0.7f
        guidanceScale = 7.5f
        steps = 20
        errorMessage = null
        loadingMessage = ""
        _elapsedTimeInSeconds.value = 0L
        _totalGenerationTimeInSeconds.value = null
        timerJob?.cancel()
    }
}
