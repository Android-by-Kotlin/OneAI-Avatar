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
import max.ohm.oneai.stabilityai.STABILITY_API_KEY
import max.ohm.oneai.stabilityai.repository.StabilityRepository
import okhttp3.MediaType.Companion.toMediaType
import okhttp3.MediaType.Companion.toMediaTypeOrNull
import okhttp3.MultipartBody
import okhttp3.OkHttpClient
import okhttp3.Request
import okhttp3.RequestBody.Companion.asRequestBody
import okhttp3.RequestBody.Companion.toRequestBody
import okhttp3.ResponseBody
import org.json.JSONObject
import java.io.ByteArrayOutputStream
import java.io.File
import java.util.concurrent.TimeUnit
import android.content.Context

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

    var selectedModel by mutableStateOf("flux-img2img") // Default model
        private set

    // Prompt and parameters
    var prompt by mutableStateOf("")
    var negativePrompt by mutableStateOf("")
    var strength by mutableStateOf(0.7f)
    var guidanceScale by mutableStateOf(7.5f)
    var steps by mutableStateOf(20)
    
    // Stability AI specific parameters
    var imageStrength by mutableStateOf(0.35f)
    var cfgScale by mutableStateOf(7)
    
    // Context for Stability AI
    private var context: Context? = null

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

    // Masking state variables
    var maskBitmap by mutableStateOf<Bitmap?>(null)
        private set
    var showMaskingInterface by mutableStateOf(false)
        private set
    
    // Available models
    val availableModels = listOf(
        // Stability AI Models (Premium)
        "stability-ai-img2img" to "🚀 Stability AI Image-to-Image",
        "stability-ai-mask-erase" to "🚀 Stability AI Mask Erase",
        "stability-ai-inpaint" to "🚀 Stability AI Inpaint",
        
        // Standard Image-to-Image Models
        "flux-img2img" to "Flux Image-to-Image",
        "stable-diffusion-img2img" to "Stable Diffusion Img2Img",
        "sdxl-img2img" to "SDXL Image-to-Image",
        
        // Style Transfer Models
        "ghibli-style" to "Ghibli Studio Style",
        "headshot-img2img" to "Headshot",
        "Enhance-img2img" to "Enhance",
        "Remove-img2img" to "Remove Background",
        "Sketch Img2Img" to "Sketch to Realistic",
        "anime-style" to "Anime Style Transfer",
        "oil-painting" to "Oil Painting Style",
        "watercolor" to "Watercolor Style",

        "cyberpunk-style" to "Cyberpunk Style",
        "fantasy-art" to "Fantasy Art Style",
        
        // Specialized Models
        "photo-enhance" to "Photo Enhancement",
        "colorize" to "Black & White Colorization",
        "super-resolution" to "Super Resolution Upscale"
    )

    fun setContext(context: Context) {
        this.context = context
    }
    
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
    
    fun updateImageStrength(strength: Float) {
        imageStrength = strength
    }
    
    fun updateCfgScale(scale: Int) {
        cfgScale = scale
    }
    
    fun updateMaskBitmap(bitmap: Bitmap?) {
        maskBitmap = bitmap
    }
    
    fun toggleMaskingInterface() {
        showMaskingInterface = !showMaskingInterface
    }
    
    fun clearMask() {
        maskBitmap = null
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
        val promptRequiredModels = listOf("flux-img2img", "stable-diffusion-img2img", "sdxl-img2img", "stability-ai-img2img", "stability-ai-inpaint")
        if (selectedModel in promptRequiredModels && prompt.isBlank()) {
            errorMessage = "Please enter a prompt for this model"
            return
        }
        
        // Validate Stability AI requirements
        if (selectedModel == "stability-ai-img2img" || selectedModel == "stability-ai-mask-erase" || selectedModel == "stability-ai-inpaint") {
            if (STABILITY_API_KEY == "YOUR_STABILITY_API_KEY_HERE" || STABILITY_API_KEY.isBlank()) {
                errorMessage = "Please set your Stability AI API Key"
                return
            }
            if (context == null) {
                errorMessage = "Context not available. Please restart the app."
                return
            }
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
                    // Stability AI Models (Premium)
                    "stability-ai-img2img" -> {
                        performStabilityAIImg2Img()
                    }
                    
                    "stability-ai-mask-erase" -> {
                        if (maskBitmap == null) {
                            errorMessage = "Please create a mask first by using the brush tool"
                            isLoading = false
                            return@launch
                        }
                        performStabilityAIMaskErase()
                    }
                    
                    "stability-ai-inpaint" -> {
                        if (maskBitmap == null) {
                            errorMessage = "Please create a mask first by using the brush tool"
                            isLoading = false
                            return@launch
                        }
                        if (prompt.isBlank()) {
                            errorMessage = "Please enter a prompt for inpainting"
                            isLoading = false
                            return@launch
                        }
                        performStabilityAIInpaint()
                    }
                    
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


                    "headshot-img2img" -> {
                        if (MODELSLAB_API_KEY == "YOUR_MODELSLAB_API_KEY_HERE" || MODELSLAB_API_KEY.isBlank()) {
                            errorMessage = "Please set your ModelsLab API Key"
                            isLoading = false
                            return@launch
                        }
                        performHeadshotImg2Img(base64Image)
                    }


                    "Enhance-img2img" -> {
                        if (MODELSLAB_API_KEY == "YOUR_MODELSLAB_API_KEY_HERE" || MODELSLAB_API_KEY.isBlank()) {
                            errorMessage = "Please set your ModelsLab API Key"
                            isLoading = false
                            return@launch
                        }
                        performEnhanceImg2Img(base64Image)
                    }


                    "Remove-img2img" -> {
                        if (MODELSLAB_API_KEY == "YOUR_MODELSLAB_API_KEY_HERE" || MODELSLAB_API_KEY.isBlank()) {
                            errorMessage = "Please set your ModelsLab API Key"
                            isLoading = false
                            return@launch
                    }
                        performRemoveImg2Img(base64Image)
                    }


                    "Sketch Img2Img" -> {
                        if (A4F_API_KEY == "YOUR_A4F_API_KEY_HERE" || A4F_API_KEY.isBlank()) {
                            errorMessage = "Please set your A4F API Key"
                            isLoading = false
                            return@launch
                        }
                        performSketchImg2Img(base64Image)
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

    // Stability AI Implementation
    private suspend fun performStabilityAIImg2Img() = withContext(Dispatchers.IO) {
        loadingMessage = "Processing with Stability AI..."
        
        try {
            // Create a temporary URI for the selected image
            val tempFile = File.createTempFile("temp_image", ".png", context!!.cacheDir)
            val outputStream = tempFile.outputStream()
            selectedImage!!.compress(Bitmap.CompressFormat.PNG, 100, outputStream)
            outputStream.close()
            
            val imageUri = android.net.Uri.fromFile(tempFile)
            
            // Call Stability AI repository
            val response = StabilityRepository.generateImageToImage(
                context = context!!,
                imageUri = imageUri,
                prompt = prompt
            )
            
            if (response?.status == "success" && response.imageData != null) {
                // Convert bytes to bitmap
                val bitmap = BitmapFactory.decodeByteArray(response.imageData, 0, response.imageData.size)
                if (bitmap != null) {
                    generatedImageBitmap = bitmap
                    Log.d("UnifiedImg2Img", "Successfully generated Stability AI image: ${bitmap.width}x${bitmap.height}")
                } else {
                    // Create temporary file for URL display
                    val generatedFile = File.createTempFile("stability_generated", ".png", context!!.cacheDir)
                    generatedFile.writeBytes(response.imageData)
                    generatedImageUrl = generatedFile.toURI().toString()
                    Log.d("UnifiedImg2Img", "Created temporary file for Stability AI image")
                }
            } else {
                val error = response?.error ?: "Failed to generate image with Stability AI"
                errorMessage = "Stability AI Error: $error"
                Log.e("UnifiedImg2Img", "Stability AI generation failed: $error")
            }
            
            // Clean up temp file
            tempFile.delete()
            
        } catch (e: Exception) {
            Log.e("UnifiedImg2Img", "Error in Stability AI generation", e)
            errorMessage = "Stability AI Error: ${e.localizedMessage}"
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


    private suspend fun performHeadshotImg2Img(base64Image: String) = withContext(Dispatchers.IO) {
        loadingMessage = "Processing with Headshot..."



        val jsonBody = JSONObject().apply {
            put("key", MODELSLAB_API_KEY)
            put("prompt", prompt)
            put("negative_prompt", negativePrompt)
            put("face_image", base64Image)
            put("width", "512")
            put("height", "768")
            put("samples", "1")
            put("num_inference_steps","31")
            put("safety_checker", false)
            put("base64", true)
            put("seed", "")
            put("guidance_scale", guidanceScale)
            put("s_scale", "2.0")
            put("webhook", null)
            put("track_id", null)
        }

        val result = makeApiCallWithPolling(
            url = "https://modelslab.com/api/v6/image_editing/head_shot",
            jsonBody = jsonBody,
            modelName = "Headshot Img2Img"
        )

        processApiResult(result)
    }


    private suspend fun performEnhanceImg2Img(base64Image: String) = withContext(Dispatchers.IO) {
        loadingMessage = "Processing with Enhance..."

        val jsonBody = JSONObject().apply {
            put("key", MODELSLAB_API_KEY)
            put("init_image", base64Image)
            put("face_enhance", true)  // default its off
            put("scale", 3)   // default scale 2
            put("model_id", "ultra_resolution")
            put("webhook", null)
            put("track_id", null)
            put("base64", true)

        }

        val result = makeApiCallWithPolling(
            url = "https://modelslab.com/api/v6/image_editing/super_resolution",
            jsonBody = jsonBody,
            modelName = "Enhance Img2Img"
        )

        processApiResult(result)
    }

    private suspend fun performStabilityAIMaskErase() = withContext(Dispatchers.IO) {
        loadingMessage = "Processing with Stability AI Mask Erase..."
        
        try {
            // Create temporary files for image and mask
            val imageFile = File.createTempFile("temp_image", ".png", context!!.cacheDir)
            val maskFile = File.createTempFile("temp_mask", ".png", context!!.cacheDir)
            
            // Save selected image to temp file
            val imageOutputStream = imageFile.outputStream()
            selectedImage!!.compress(Bitmap.CompressFormat.PNG, 100, imageOutputStream)
            imageOutputStream.close()
            
            // Save mask to temp file
            val maskOutputStream = maskFile.outputStream()
            maskBitmap!!.compress(Bitmap.CompressFormat.PNG, 100, maskOutputStream)
            maskOutputStream.close()
            
            // Debug: Log mask bitmap info
            Log.d("UnifiedImg2Img", "Mask bitmap created: ${maskBitmap!!.width}x${maskBitmap!!.height}")
            Log.d("UnifiedImg2Img", "Original image: ${selectedImage!!.width}x${selectedImage!!.height}")
            Log.d("UnifiedImg2Img", "Mask file size: ${maskFile.length()} bytes")
            
            // Call the erase API
            eraseImageWithMask(imageFile, maskFile)
            
            // Clean up temp files
            imageFile.delete()
            maskFile.delete()
            
        } catch (e: Exception) {
            Log.e("UnifiedImg2Img", "Error in Stability AI mask erase", e)
            errorMessage = "Stability AI Mask Error: ${e.localizedMessage}"
        }
    }

    private suspend fun eraseImageWithMask(imageFile: File, maskFile: File) = withContext(Dispatchers.IO) {
        loadingMessage = "Erasing image area..."

        try {
            val requestBody = MultipartBody.Builder().setType(MultipartBody.FORM)
                .addFormDataPart("image", imageFile.name, imageFile.asRequestBody("image/png".toMediaTypeOrNull()))
                .addFormDataPart("mask", maskFile.name, maskFile.asRequestBody("image/png".toMediaTypeOrNull()))
                .addFormDataPart("output_format", "webp")
                .build()

            val request = Request.Builder()
                .url("https://api.stability.ai/v2beta/stable-image/edit/erase")
                .post(requestBody)
                .addHeader("Authorization", "Bearer $STABILITY_API_KEY")
                .addHeader("accept", "image/*")
                .build()

            val response = client.newCall(request).execute()
            Log.d("UnifiedImg2Img", "Stability AI API response code: ${response.code}")
            Log.d("UnifiedImg2Img", "Stability AI API response message: ${response.message}")
            
            if (response.isSuccessful) {
                val responseBody = response.body?.bytes()
                if (responseBody != null) {
                    Log.d("UnifiedImg2Img", "Response body size: ${responseBody.size} bytes")
                    val bitmap = BitmapFactory.decodeByteArray(responseBody, 0, responseBody.size)
                    if (bitmap != null) {
                        generatedImageBitmap = bitmap
                        Log.d("UnifiedImg2Img", "Generated bitmap: ${bitmap.width}x${bitmap.height}")
                    } else {
                        Log.e("UnifiedImg2Img", "Failed to decode bitmap from response")
                        errorMessage = "Failed to decode generated image"
                    }
                } else {
                    Log.e("UnifiedImg2Img", "Empty response body")
                    errorMessage = "Error: Empty response from server."
                }
            } else {
                val errorBody = response.body?.string()
                Log.e("UnifiedImg2Img", "API Error: ${response.code} ${response.message}")
                Log.e("UnifiedImg2Img", "Error body: $errorBody")
                errorMessage = "Error: ${response.code} ${response.message}"
            }
        } catch (e: Exception) {
            Log.e("UnifiedImg2Img", "Error in mask API call", e)
            errorMessage = "Error: ${e.localizedMessage}"
        }
    }

    private suspend fun performRemoveImg2Img(base64Image: String) = withContext(Dispatchers.IO) {


        val jsonBody = JSONObject().apply {
            put("key", MODELSLAB_API_KEY)
            put("image", base64Image)
            put("seed", null)
            put("post_process_mask", false)
            put("only_mask", false)
            put("alpha_matting", false)
            put("base64", true)
            put("webhook", null)
            put("track_id", null)

        }

        val result = makeApiCallWithPolling(
            url = "https://modelslab.com/api/v6/image_editing/removebg_mask",
            jsonBody = jsonBody,
            modelName = "Remove Img2Img"
        )

        processApiResult(result)
    }




    private suspend fun performSketchImg2Img(base64Image: String) = withContext(Dispatchers.IO) {
        loadingMessage = "Processing with Sketch..."


//
//        {
//            "key":"<your-key>",
//            "model_id": "boziorealvisxlv4",
//            "init_image":"<base64-image>",
//            "prompt": "hyper realistic, beautiful girl, wearing blue dress, blue eyes, black hair, looking at camera, pose like model",
//            "negative_prompt": "(normal quality), (low quality), (worst quality), Living Room paintings, sketches, fog, signature, soft, blurry, drawing, sketch, poor quality, ugly text, type, word, logo, pixelated, low resolution, saturated, high contrast, over sharpened, dirt",
//            "auto_hint": "no",
//            "guess_mode": "no",
//            "strength": 0.8,
//            "controlnet_conditioning_scale": "0.9",
//            "guidance_scale": 5,
//            "tomesd": "yes",
//            "seed": null,
//            "samples": 1,
//            "num_inference_steps": 21,
//            "scheduler": "DPMSolverMultistepScheduler",
//            "use_karras_sigmas": "yes",
//            "base64": true,
//            "clip_skip": 2,
//            "controlnet_type": "lineart",
//            "controlnet_model": "lineart",
//            "lora_model": "more_details_XL",
//            "lora_strength": "0.9",
//            "webhook": null,
//            "track_id": null
//        }


        val jsonBody = JSONObject().apply {
            put("key", MODELSLAB_API_KEY)
            put("model_id", "boziorealvisxlv4")
            put("init_image", base64Image)
            put("prompt", prompt)
            put("negative_prompt", negativePrompt)
            put("auto_hint", "no")
            put("guess_mode", "no")
            put("strength", 0.8)
            put("controlnet_conditioning_scale", "0.9")
            put("guidance_scale", 5)
            put("tomesd", "yes")
            put("seed", null)
            put("samples", 1)
            put("num_inference_steps", 21)
            put("scheduler", "DPMSolverMultistepScheduler")
            put("use_karras_sigmas", "yes")
            put("base64", true)
            put("clip_skip", 2)
            put("controlnet_type", "lineart")
            put("controlnet_model", "lineart")
            put("lora_model", "more_details")
            put("lora_strength", "0.9")
            put("webhook", null)
            put("track_id", null)
        }

        val result = makeApiCallWithPolling(
            url = "https://modelslab.com/api/v5/controlnet",
            jsonBody = jsonBody,
            modelName = "Sketch Img2Img"
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
                when (status) {
                    "success" -> {
                        // Already checked output above
                        errorMessage = "Success but no image URL found"
                    }
                    "processing" -> {
                        // Some APIs return processing status in regular calls
                        val errorMsg = jsonResponse.optString("message", "Image is being processed")
                        
                        // Check if this indicates we need to poll
                        if (errorMsg.contains("Try to fetch request after") || 
                            errorMsg.contains("seconds estimated") ||
                            errorMsg.contains("processing")) {
                            errorMessage = "$modelName is processing. This model requires polling which is not implemented for this endpoint. Please try a different model."
                        } else {
                            errorMessage = "$modelName is processing: $errorMsg"
                        }
                    }
                    else -> {
                        val errorMsg = jsonResponse.optString("message",
                            jsonResponse.optString("error", "Unknown error"))
                        
                        // Check if this is actually a processing message
                        if (errorMsg.contains("Try to fetch request after") || 
                            errorMsg.contains("seconds estimated") ||
                            errorMsg.contains("processing")) {
                            errorMessage = "$modelName is processing. This model requires polling which is not implemented for this endpoint. Please try a different model."
                        } else {
                            errorMessage = "$modelName Error: $errorMsg"
                        }
                    }
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
                        
                        // Check if this is a processing message that needs polling
                        if (errorMsg.contains("Try to fetch request after") || 
                            errorMsg.contains("seconds estimated") ||
                            errorMsg.contains("processing")) {
                            // This is actually a processing response, not an error
                            val fetchUrl = jsonResponse.optString("fetch_result", "")
                            if (fetchUrl.isNotEmpty()) {
                                // Wait a bit and start polling
                                delay(5000L) // Wait 5 seconds before first poll
                                
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
                                
                                errorMessage = "$modelName generation timed out after 5 minutes"
                            } else {
                                errorMessage = "Processing response received but no fetch URL provided"
                            }
                        } else {
                            errorMessage = "$modelName Error: $errorMsg"
                        }
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
        Log.d("UnifiedImg2Img", "processApiResult called with: $result")
        if (result != null) {
            when {
                result.endsWith(".base64") -> {
                    Log.d("UnifiedImg2Img", "Processing base64 URL: $result")
                    // Fetch and decode base64 from URL
                    val base64Data = fetchBase64FromUrl(result)
                    if (base64Data != null) {
                        try {
                            Log.d("UnifiedImg2Img", "Base64 data length: ${base64Data.length}")
                            Log.d("UnifiedImg2Img", "Base64 data preview: ${base64Data.take(100)}...")
                            
                            // Check if this is a data URL (data:image/jpeg;base64,/9j/4AA...)
                            val actualBase64Data = if (base64Data.startsWith("data:image")) {
                                Log.d("UnifiedImg2Img", "Detected data URL format")
                                base64Data.substring(base64Data.indexOf(",") + 1)
                            } else {
                                base64Data
                            }
                            
                            Log.d("UnifiedImg2Img", "Actual base64 data length: ${actualBase64Data.length}")
                            Log.d("UnifiedImg2Img", "Actual base64 preview: ${actualBase64Data.take(50)}...")
                            
                            // Try different base64 decoding approaches
                            val imageBytes = try {
                                Base64.decode(actualBase64Data, Base64.DEFAULT)
                            } catch (e: Exception) {
                                Log.e("UnifiedImg2Img", "Failed to decode base64 with DEFAULT flag", e)
                                try {
                                    Base64.decode(actualBase64Data, Base64.NO_WRAP)
                                } catch (e2: Exception) {
                                    Log.e("UnifiedImg2Img", "Failed to decode base64 with NO_WRAP flag", e2)
                                    throw e2
                                }
                            }
                            
                            Log.d("UnifiedImg2Img", "Decoded bytes length: ${imageBytes.size}")
                            
                            // Try to decode with options for better memory management
                            val options = BitmapFactory.Options().apply {
                                inJustDecodeBounds = false
                                inSampleSize = 1
                                inPreferredConfig = Bitmap.Config.RGB_565 // Use less memory
                            }
                            
                            val bitmap = BitmapFactory.decodeByteArray(imageBytes, 0, imageBytes.size, options)
                            if (bitmap != null) {
                                generatedImageBitmap = bitmap
                                Log.d("UnifiedImg2Img", "Successfully decoded base64 image: ${bitmap.width}x${bitmap.height}")
                            } else {
                                Log.e("UnifiedImg2Img", "BitmapFactory.decodeByteArray returned null")
                                Log.e("UnifiedImg2Img", "First few bytes: ${imageBytes.take(20).joinToString { "%02x".format(it) }}")
                                
                                // If we have a data URL, use it directly
                                if (base64Data.startsWith("data:image")) {
                                    Log.d("UnifiedImg2Img", "Using data URL directly")
                                    generatedImageUrl = base64Data
                                    errorMessage = null
                                } else {
                                    Log.d("UnifiedImg2Img", "Fallback: Using original URL as image source")
                                    generatedImageUrl = result
                                    errorMessage = null
                                }
                            }
                        } catch (e: Exception) {
                            Log.e("UnifiedImg2Img", "Failed to decode base64", e)
                            // If we have a data URL, use it as fallback
                            if (base64Data.startsWith("data:image")) {
                                Log.d("UnifiedImg2Img", "Exception fallback: Using data URL")
                                generatedImageUrl = base64Data
                                errorMessage = null
                            } else {
                                errorMessage = "Failed to decode generated image: ${e.message}"
                            }
                        }
                    } else {
                        errorMessage = "Failed to fetch base64 data from URL"
                    }
                }
                result.startsWith("data:image") -> {
                    Log.d("UnifiedImg2Img", "Processing data URL: ${result.take(50)}...")
                    // Direct base64 data URL
                    try {
                        val base64Data = result.substring(result.indexOf(",") + 1)
                        val imageBytes = Base64.decode(base64Data, Base64.DEFAULT)
                        generatedImageBitmap = BitmapFactory.decodeByteArray(imageBytes, 0, imageBytes.size)
                        Log.d("UnifiedImg2Img", "Successfully decoded data URL: ${generatedImageBitmap?.width}x${generatedImageBitmap?.height}")
                    } catch (e: Exception) {
                        Log.e("UnifiedImg2Img", "Failed to decode data URL", e)
                        errorMessage = "Failed to decode generated image"
                    }
                }
                else -> {
                    Log.d("UnifiedImg2Img", "Processing regular URL: $result")
                    // Regular image URL
                    generatedImageUrl = result
                    Log.d("UnifiedImg2Img", "Successfully set image URL: $result")
                }
            }
        } else {
            Log.d("UnifiedImg2Img", "processApiResult called with null result")
            if (errorMessage == null) {
                errorMessage = "Failed to generate image"
            }
        }
        
        // Debug the final state
        Log.d("UnifiedImg2Img", "Final state - URL: ${generatedImageUrl}, Bitmap: ${generatedImageBitmap?.let { "${it.width}x${it.height}" } ?: "null"}")
    }

    private suspend fun fetchBase64FromUrl(url: String): String? = withContext(Dispatchers.IO) {
        try {
            Log.d("UnifiedImg2Img", "Fetching base64 from URL: $url")
            val request = Request.Builder()
                .url(url)
                .build()
            
            val response = client.newCall(request).execute()
            Log.d("UnifiedImg2Img", "Response code: ${response.code}")
            
            if (response.isSuccessful) {
                val responseBody = response.body?.string()
                Log.d("UnifiedImg2Img", "Response body length: ${responseBody?.length ?: 0}")
                Log.d("UnifiedImg2Img", "Response body preview: ${responseBody?.take(100) ?: "null"}...")
                return@withContext responseBody
            } else {
                Log.e("UnifiedImg2Img", "Failed to fetch base64. Response code: ${response.code}, message: ${response.message}")
            }
            null
        } catch (e: Exception) {
            Log.e("UnifiedImg2Img", "Error fetching base64 from URL: $url", e)
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

    private suspend fun performStabilityAIInpaint() = withContext(Dispatchers.IO) {
        loadingMessage = "Processing with Stability AI Inpaint..."

        try {
            // Create temporary files for image and mask
            val imageFile = File.createTempFile("temp_image", ".png", context!!.cacheDir)
            val maskFile = File.createTempFile("temp_mask", ".png", context!!.cacheDir)

            // Save selected image to temp file
            val imageOutputStream = imageFile.outputStream()
            selectedImage!!.compress(Bitmap.CompressFormat.PNG, 100, imageOutputStream)
            imageOutputStream.close()

            // Save mask to temp file
            val maskOutputStream = maskFile.outputStream()
            maskBitmap!!.compress(Bitmap.CompressFormat.PNG, 100, maskOutputStream)
            maskOutputStream.close()

            // Call the inpaint API
            inpaintImageWithMask(imageFile, maskFile)

            // Clean up temp files
            imageFile.delete()
            maskFile.delete()

        } catch (e: Exception) {
            Log.e("UnifiedImg2Img", "Error in Stability AI inpaint", e)
            errorMessage = "Stability AI Inpaint Error: ${e.localizedMessage}"
        }
    }

    private suspend fun inpaintImageWithMask(imageFile: File, maskFile: File) = withContext(Dispatchers.IO) {
        loadingMessage = "Inpainting image..."

        try {
            val requestBody = MultipartBody.Builder().setType(MultipartBody.FORM)
                .addFormDataPart("image", imageFile.name, imageFile.asRequestBody("image/png".toMediaTypeOrNull()))
                .addFormDataPart("mask", maskFile.name, maskFile.asRequestBody("image/png".toMediaTypeOrNull()))
                .addFormDataPart("prompt", prompt)
                .addFormDataPart("output_format", "webp")
                .build()

            val request = Request.Builder()
                .url("https://api.stability.ai/v2beta/stable-image/edit/inpaint")
                .post(requestBody)
                .addHeader("Authorization", "Bearer $STABILITY_API_KEY")
                .addHeader("accept", "image/*")
                .build()

            val response = client.newCall(request).execute()
            Log.d("UnifiedImg2Img", "Stability AI Inpaint API response code: ${response.code}")
            Log.d("UnifiedImg2Img", "Stability AI Inpaint API response message: ${response.message}")

            if (response.isSuccessful) {
                val responseBody = response.body?.bytes()
                if (responseBody != null) {
                    Log.d("UnifiedImg2Img", "Response body size: ${responseBody.size} bytes")
                    val bitmap = BitmapFactory.decodeByteArray(responseBody, 0, responseBody.size)
                    if (bitmap != null) {
                        generatedImageBitmap = bitmap
                        Log.d("UnifiedImg2Img", "Generated inpainted bitmap: ${bitmap.width}x${bitmap.height}")
                    } else {
                        Log.e("UnifiedImg2Img", "Failed to decode bitmap from response")
                        errorMessage = "Failed to decode generated inpainted image"
                    }
                } else {
                    Log.e("UnifiedImg2Img", "Empty response body")
                    errorMessage = "Error: Empty response from server."
                }
            } else {
                val errorBody = response.body?.string()
                Log.e("UnifiedImg2Img", "Inpaint API Error: ${response.code} ${response.message}")
                Log.e("UnifiedImg2Img", "Error body: $errorBody")
                errorMessage = "Error: ${response.code} ${response.message}"
            }
        } catch (e: Exception) {
            Log.e("UnifiedImg2Img", "Error in inpaint API call", e)
            errorMessage = "Error: ${e.localizedMessage}"
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
        imageStrength = 0.35f
        cfgScale = 7
        errorMessage = null
        loadingMessage = ""
        _elapsedTimeInSeconds.value = 0L
        _totalGenerationTimeInSeconds.value = null
        timerJob?.cancel()
        maskBitmap = null
        showMaskingInterface = false
    }
}
