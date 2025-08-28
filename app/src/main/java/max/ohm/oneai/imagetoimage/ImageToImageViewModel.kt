package max.ohm.oneai.imagetoimage

import android.graphics.Bitmap
import android.util.Base64
import android.util.Log
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.setValue
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import kotlinx.coroutines.delay
import kotlinx.coroutines.Job
import okhttp3.MediaType.Companion.toMediaType
import okhttp3.OkHttpClient
import okhttp3.Request
import okhttp3.RequestBody.Companion.toRequestBody
import org.json.JSONObject
import java.io.ByteArrayOutputStream
import max.ohm.oneai.imagetoimage.data.GeneratedImage
import java.util.concurrent.TimeUnit
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import max.ohm.oneai.imagetoimage.modelslabapikey.MODELSLAB_API_KEY
import max.ohm.oneai.imagetoimage.modelslab.ModelsLabDualImageService

class ImageToImageViewModel : ViewModel() {
    
    // Helper function to format time
    fun formatTime(milliseconds: Long): String {
        val totalSeconds = milliseconds / 1000
        return if (totalSeconds < 60) {
            String.format("%.1fs", milliseconds / 1000f)
        } else {
            val minutes = totalSeconds / 60
            val seconds = totalSeconds % 60
            String.format("%d:%02d", minutes, seconds)
        }
    }
    
    // Gallery State
    private val _galleryImages = MutableStateFlow<List<GeneratedImage>>(emptyList())
    val galleryImages: StateFlow<List<GeneratedImage>> = _galleryImages.asStateFlow()
    
    // UI States
    var selectedImage by mutableStateOf<Bitmap?>(null)
        private set
    
    var selectedImage2 by mutableStateOf<Bitmap?>(null)
        private set
    
    var isDualImageMode by mutableStateOf(false)
        private set
    
    var selectedModel by mutableStateOf("epic-realism")
        private set
    
    var generatedImageUrl by mutableStateOf<String?>(null)
        private set
    
    var generatedImageBitmap by mutableStateOf<Bitmap?>(null)
        private set
    
    var generatedImageBase64 by mutableStateOf<String?>(null)
        private set
    
    var isLoading by mutableStateOf(false)
        private set
    
    var errorMessage by mutableStateOf<String?>(null)
    
    var prompt by mutableStateOf("")
    
    var negativePrompt by mutableStateOf("")
    
    var strength by mutableStateOf(0.7f)
    
    var guidanceScale by mutableStateOf(7.5f)
    
    var steps by mutableStateOf(20)
    
    var isGhibliStyle by mutableStateOf(false)
        private set
    
    var isGeneratingGhibli by mutableStateOf(false)
        private set
    
    var loadingMessage by mutableStateOf("")
        private set
    
    // Time tracking
    var generationTime by mutableStateOf(0L)
        private set
    
    var elapsedTime by mutableStateOf(0L)
        private set
    
    var isTimerRunning by mutableStateOf(false)
        private set
    
    // ModelsLab API configuration
    private val API_KEY = MODELSLAB_API_KEY
    private val IMG2IMG_URL = "https://modelslab.com/api/v4/dreambooth/img2img"
    
    private val client = OkHttpClient.Builder()
        .connectTimeout(600, TimeUnit.SECONDS)  // 10 minutes
        .readTimeout(600, TimeUnit.SECONDS)     // 10 minutes
        .writeTimeout(600, TimeUnit.SECONDS)    // 10 minutes
        .build()
    
    // ModelsLab dual image service
    private val dualImageService = ModelsLabDualImageService()
    
    fun updateSelectedImage(bitmap: Bitmap?) {
        Log.d("ImageToImage", "updateSelectedImage called with bitmap: ${bitmap?.let { "${it.width}x${it.height}" } ?: "null"}")
        selectedImage = bitmap
        errorMessage = null
        // Reset any previous generation when new image is selected
        generatedImageUrl = null
        generatedImageBitmap = null
        generatedImageBase64 = null
    }
    
    fun generateImage() {
        Log.d("ImageToImage", "generateImage called")
        if (selectedImage == null) {
            Log.e("ImageToImage", "No selected image")
            errorMessage = "Please select an image first"
            return
        }
        Log.d("ImageToImage", "Selected image: ${selectedImage!!.width}x${selectedImage!!.height}")
        
        if (prompt.isEmpty()) {
            Log.e("ImageToImage", "Empty prompt")
            errorMessage = "Please enter a prompt"
            return
        }
        Log.d("ImageToImage", "Prompt: $prompt")
        
        viewModelScope.launch {
            isLoading = true
            isTimerRunning = true
            elapsedTime = 0L
            generationTime = 0L
            val startTime = System.currentTimeMillis()
            errorMessage = null
            isGhibliStyle = false
            
            // Start timer coroutine
            val timerJob = launch {
                while (isTimerRunning) {
                    elapsedTime = System.currentTimeMillis() - startTime
                    delay(100) // Update every 100ms
                }
            }
            
            try {
                // Resize and convert image to base64
                val base64Image = withContext(Dispatchers.IO) {
                    val resizedBitmap = resizeBitmapIfNeeded(selectedImage!!)
                    bitmapToBase64(resizedBitmap)
                }
                
                // Call img2img API
                val result = performImg2ImgWithBase64(base64Image)
                if (result != null) {
                    // Check if the URL ends with .base64
                    if (result.endsWith(".base64")) {
                        // Fetch and decode the base64 data from the URL
                        val base64Data = fetchBase64FromUrl(result)
                        if (base64Data != null) {
                            try {
                                val imageBytes = Base64.decode(base64Data, Base64.DEFAULT)
                                generatedImageBitmap = android.graphics.BitmapFactory.decodeByteArray(imageBytes, 0, imageBytes.size)
                                Log.d("ImageToImage", "Successfully decoded base64 image from URL")
                            } catch (e: Exception) {
                                Log.e("ImageToImage", "Failed to decode base64 image", e)
                                errorMessage = "Failed to decode generated image"
                            }
                        } else {
                            errorMessage = "Failed to fetch base64 data from URL"
                        }
                    } else {
                        // Regular image URL
                        generatedImageUrl = result
                        Log.d("ImageToImage", "Successfully received image URL: $result")
                    }
                } else if (errorMessage == null) {
                    errorMessage = "Failed to generate image"
                }
                
            } catch (e: Exception) {
                Log.e("ImageToImage", "Error generating image", e)
                errorMessage = "Error: ${e.message}"
            } finally {
                isLoading = false
                isTimerRunning = false
                timerJob.cancel()
                generationTime = System.currentTimeMillis() - startTime
                elapsedTime = generationTime
                Log.d("ImageToImage", "Total image generation time: ${generationTime}ms")
            }
        }
    }
    
    private suspend fun performGhibliStyleGeneration(base64Image: String): String? = withContext(Dispatchers.IO) {
        try {
            // Calculate dimensions preserving aspect ratio (using resized bitmap)
            val resizedBitmap = resizeBitmapIfNeeded(selectedImage!!)
            val dimensions = calculateDimensions(resizedBitmap)
            
            val jsonBody = JSONObject().apply {
put("key", API_KEY)
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

            val requestBody = jsonBody.toString()
                .toRequestBody("application/json".toMediaType())

            val request = Request.Builder()
                .url("https://modelslab.com/api/v5/controlnet")
                .post(requestBody)
                .build()

            val response = client.newCall(request).execute()
            val responseBody = response.body?.string()

            Log.d("ImageToImage", "Ghibli Response code: ${response.code}")
            Log.d("ImageToImage", "Ghibli Response body: $responseBody")

            if (response.isSuccessful && responseBody != null) {
                val jsonResponse = JSONObject(responseBody)
                val status = jsonResponse.getString("status")
                
                // Check if we already have the output in the initial response
                if (jsonResponse.has("output")) {
                    val outputValue = jsonResponse.get("output")
                    // Check if output is a non-empty string or array
                    if (outputValue is String && outputValue.isNotEmpty()) {
                        Log.d("ImageToImage", "Ghibli image URL from initial response: $outputValue")
                        return@withContext outputValue
                    } else if (outputValue is org.json.JSONArray && outputValue.length() > 0) {
                        val imageUrl = outputValue.getString(0)
                        if (imageUrl.isNotEmpty() && !imageUrl.equals("null", ignoreCase = true)) {
                            Log.d("ImageToImage", "Ghibli image URL from initial response: $imageUrl")
                            return@withContext imageUrl
                        }
                    }
                }
                
                when (status) {
                    "success" -> {
                        if (jsonResponse.has("output")) {
                            val outputValue = jsonResponse.get("output")
                            if (outputValue is String && outputValue.isNotEmpty()) {
                                Log.d("ImageToImage", "Ghibli image URL: $outputValue")
                                return@withContext outputValue
                            } else if (outputValue is org.json.JSONArray && outputValue.length() > 0) {
                                val imageUrl = outputValue.getString(0)
                                Log.d("ImageToImage", "Ghibli image URL: $imageUrl")
                                return@withContext imageUrl
                            }
                        }
                    }
                    "processing" -> {
                        // Get estimated time if available (can be fractional)
                        val estimatedTime = jsonResponse.optDouble("eta", 30.0) // Default 30 seconds
                        val fetchUrl = jsonResponse.optString("fetch_result", "")
                        
                        Log.d("ImageToImage", "Ghibli processing, ETA: $estimatedTime seconds")
                        Log.d("ImageToImage", "Fetch URL: $fetchUrl")
                        
                        if (fetchUrl.isNotEmpty()) {
                            // Initial wait based on ETA
                            val initialWaitTime = (estimatedTime * 1000).toLong().coerceAtLeast(1000L)
                            Log.d("ImageToImage", "Initial wait: ${initialWaitTime / 1000} seconds")
                            delay(initialWaitTime)
                            
                            // Try to fetch the result with retries
                            val maxRetries = 120  // Increased to 120 retries for 10-minute timeout
                            val retryDelay = 5000L // 5 seconds between retries
                            
                            for (attempt in 1..maxRetries) {
                                Log.d("ImageToImage", "Fetch attempt $attempt of $maxRetries")
                                
                                // Update loading message on main thread
                                withContext(Dispatchers.Main) {
                                    loadingMessage = "Processing Ghibli style... (${attempt}/${maxRetries})"
                                }
                                
                                val fetchResult = fetchGhibliResultWithRetry(fetchUrl, attempt == maxRetries)
                                
                                if (fetchResult != null) {
                                    return@withContext fetchResult
                                }
                                
                                // If still processing and not the last attempt, wait and retry
                                if (attempt < maxRetries) {
                                    Log.d("ImageToImage", "Image still processing, waiting ${retryDelay/1000}s before retry...")
                                    delay(retryDelay)
                                } else {
                                    // Only set error on the last attempt if we don't have one
                                    if (errorMessage == null) {
                                        errorMessage = "Image generation exceeded the 10-minute timeout. Please try with a smaller image or try again later."
                                    }
                                }
                            }
                        } else {
                            errorMessage = "Server did not provide a fetch URL"
                        }
                    }
                    else -> {
                        // Handle error message from API
                        val errorMsg = jsonResponse.optString("message", 
                            jsonResponse.optString("messege", "Unknown error"))
                        Log.e("ImageToImage", "Ghibli API Error: $errorMsg")
                        errorMessage = errorMsg
                    }
                }
            } else {
                Log.e("ImageToImage", "Ghibli HTTP Error: ${response.code} - $responseBody")
                errorMessage = "Server error: ${response.code}"
            }
            
            null
        } catch (e: Exception) {
            Log.e("ImageToImage", "Error in Ghibli generation", e)
            null
        }
    }
    
    private suspend fun fetchGhibliResultWithRetry(fetchUrl: String, isLastAttempt: Boolean): String? = fetchGhibliResult(fetchUrl, isLastAttempt)
    
    private suspend fun fetchGhibliResult(fetchUrl: String, isLastAttempt: Boolean): String? = withContext(Dispatchers.IO) {
        try {
            // Create request body with API key
            val jsonBody = JSONObject().apply {
put("key", API_KEY)
            }
            
            val requestBody = jsonBody.toString()
                .toRequestBody("application/json".toMediaType())
            
            // Build POST request with proper headers
            val request = Request.Builder()
                .url(fetchUrl)
                .post(requestBody)
                .addHeader("Content-Type", "application/json")
                .build()
            
            val response = client.newCall(request).execute()
            val responseBody = response.body?.string()
            
            Log.d("ImageToImage", "Fetch response code: ${response.code}")
            Log.d("ImageToImage", "Fetch response body: $responseBody")
            
            if (response.isSuccessful && responseBody != null) {
                // Try to parse as JSON first
                try {
                    val jsonResponse = JSONObject(responseBody)
                    val status = jsonResponse.optString("status", "")
                    
                    when (status) {
                        "success" -> {
                            if (jsonResponse.has("output")) {
                                val outputValue = jsonResponse.get("output")
                                if (outputValue is String && outputValue.isNotEmpty()) {
                                    Log.d("ImageToImage", "Successfully fetched Ghibli image URL: $outputValue")
                                    return@withContext outputValue
                                } else if (outputValue is org.json.JSONArray && outputValue.length() > 0) {
                                    val imageUrl = outputValue.getString(0)
                                    Log.d("ImageToImage", "Successfully fetched Ghibli image URL: $imageUrl")
                                    return@withContext imageUrl
                                }
                            }
                        }
                        "processing" -> {
                            Log.d("ImageToImage", "Image still processing")
                            // Only set error message on the last attempt
                            if (isLastAttempt) {
                                errorMessage = "Image is still being processed. The generation is taking longer than expected. Maximum timeout is 10 minutes."
                            }
                            return@withContext null
                        }
                        "failed", "error" -> {
                            val errorMsg = jsonResponse.optString("message", 
                                jsonResponse.optString("messege", "Generation failed"))
                            Log.e("ImageToImage", "Ghibli generation failed: $errorMsg")
                            errorMessage = errorMsg
                            return@withContext null
                        }
                        else -> {
                            Log.e("ImageToImage", "Unknown status: $status")
                            errorMessage = "Unexpected response status: $status"
                            return@withContext null
                        }
                    }
                } catch (e: Exception) {
                    // Response might be a direct URL or base64
                    if (responseBody.startsWith("http")) {
                        Log.d("ImageToImage", "Received direct image URL: $responseBody")
                        return@withContext responseBody
                    } else if (responseBody.startsWith("data:image") || responseBody.length > 1000) {
                        // Might be base64 data
                        Log.d("ImageToImage", "Received possible base64 data")
                        return@withContext responseBody
                    }
                }
            } else {
                Log.e("ImageToImage", "HTTP error: ${response.code} - ${response.message}")
                errorMessage = "Server error: ${response.code}"
            }
            
            null
        } catch (e: Exception) {
            Log.e("ImageToImage", "Error fetching Ghibli result", e)
            errorMessage = "Network error: ${e.message}"
            null
        }
    }
    
    fun generateGhibliStyle() {
        Log.d("ImageToImage", "generateGhibliStyle called")
        if (selectedImage == null) {
            Log.e("ImageToImage", "No selected image for Ghibli style")
            errorMessage = "Please select an image first"
            return
        }
        Log.d("ImageToImage", "Selected image for Ghibli: ${selectedImage!!.width}x${selectedImage!!.height}")
        
        viewModelScope.launch {
            isLoading = true
            isTimerRunning = true
            elapsedTime = 0L
            generationTime = 0L
            val startTime = System.currentTimeMillis()
            errorMessage = null
            isGhibliStyle = true
            isGeneratingGhibli = true
            loadingMessage = "Initializing Ghibli style generation..."
            
            // Start timer coroutine
            val timerJob = launch {
                while (isTimerRunning) {
                    elapsedTime = System.currentTimeMillis() - startTime
                    delay(100) // Update every 100ms
                }
            }
            
            try {
                // Resize and convert image to base64
                val base64Image = withContext(Dispatchers.IO) {
                    val resizedBitmap = resizeBitmapIfNeeded(selectedImage!!)
                    bitmapToBase64(resizedBitmap)
                }
                
                // Call Ghibli style API
                val result = performGhibliStyleGeneration(base64Image)
                if (result != null) {
                    // Check if the URL ends with .base64
                    if (result.endsWith(".base64")) {
                        // Fetch and decode the base64 data from the URL
                        val base64Data = fetchBase64FromUrl(result)
                        if (base64Data != null) {
                            try {
                                val imageBytes = Base64.decode(base64Data, Base64.DEFAULT)
                                generatedImageBitmap = android.graphics.BitmapFactory.decodeByteArray(imageBytes, 0, imageBytes.size)
                                Log.d("ImageToImage", "Successfully decoded Ghibli style base64 image from URL")
                            } catch (e: Exception) {
                                Log.e("ImageToImage", "Failed to decode Ghibli style base64 image", e)
                                errorMessage = "Failed to decode generated image"
                            }
                        } else {
                            errorMessage = "Failed to fetch base64 data from URL"
                        }
                    } else {
                        // Regular image URL
                        generatedImageUrl = result
                        Log.d("ImageToImage", "Successfully received Ghibli style image URL: $result")
                    }
                } else if (errorMessage == null) {
                    errorMessage = "Failed to generate Ghibli style image"
                }
                
            } catch (e: Exception) {
                Log.e("ImageToImage", "Error generating Ghibli style image", e)
                errorMessage = "Error: ${e.message}"
            } finally {
                isLoading = false
                isGeneratingGhibli = false
                isTimerRunning = false
                timerJob.cancel()
                generationTime = System.currentTimeMillis() - startTime
                elapsedTime = generationTime
                Log.d("ImageToImage", "Total Ghibli generation time: ${generationTime}ms")
                loadingMessage = ""
            }
        }
    }
    
    private fun resizeBitmapIfNeeded(bitmap: Bitmap, maxDimension: Int = 1024): Bitmap {
        val width = bitmap.width
        val height = bitmap.height
        
        // Check if resizing is needed
        if (width <= maxDimension && height <= maxDimension) {
            return bitmap
        }
        
        // Calculate new dimensions maintaining aspect ratio
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
        
        Log.d("ImageToImage", "Resizing bitmap from ${width}x${height} to ${newWidth}x${newHeight}")
        return Bitmap.createScaledBitmap(bitmap, newWidth, newHeight, true)
    }
    
    private fun bitmapToBase64(bitmap: Bitmap): String {
        Log.d("ImageToImage", "Converting bitmap to base64: ${bitmap.width}x${bitmap.height}")
        val outputStream = ByteArrayOutputStream()
        
        // Use JPEG compression for better file size (especially for photos)
        val compressResult = bitmap.compress(Bitmap.CompressFormat.JPEG, 90, outputStream)
        Log.d("ImageToImage", "Bitmap compress result: $compressResult (JPEG 90%)")
        
        val imageBytes = outputStream.toByteArray()
        Log.d("ImageToImage", "Image byte array size: ${imageBytes.size} bytes (${imageBytes.size / 1024}KB)")
        val base64String = Base64.encodeToString(imageBytes, Base64.NO_WRAP)
        Log.d("ImageToImage", "Base64 string length: ${base64String.length}")
        return base64String
    }
    
    private suspend fun fetchBase64FromUrl(url: String): String? = withContext(Dispatchers.IO) {
        try {
            val request = Request.Builder()
                .url(url)
                .build()
            
            val response = client.newCall(request).execute()
            if (response.isSuccessful) {
                val base64Data = response.body?.string()
                Log.d("ImageToImage", "Fetched base64 data from URL, length: ${base64Data?.length ?: 0}")
                return@withContext base64Data
            } else {
                Log.e("ImageToImage", "Failed to fetch base64 from URL: ${response.code}")
                return@withContext null
            }
        } catch (e: Exception) {
            Log.e("ImageToImage", "Error fetching base64 from URL", e)
            return@withContext null
        }
    }
    
    
    private suspend fun performImg2ImgWithBase64(base64Image: String): String? = withContext(Dispatchers.IO) {
        try {
            val jsonBody = JSONObject().apply {
put("key", API_KEY)
                put("model_id", "flux")
                put("prompt", prompt)
                put("negative_prompt", negativePrompt)
                put("init_image", base64Image)
//                put("width", "512")
//                put("height", "512")
                put("samples", "1")
               // put("num_inference_steps", steps)
                put("safety_checker", false)
              //  put("enhance_prompt", false)
               // put("guidance_scale", guidanceScale)
              //  put("strength", strength) // default
                put("strength", 0.6)
                put("temp", false)
//                put("scheduler", "DDPMScheduler")   //default
                put("scheduler", "DPMSolverMultistepScheduler")
//                put("base64", false)  //default
                put("base64", true)
                put("seed", null)
                put("webhook", null)
                put("track_id", null)
            }
            
            val requestBody = jsonBody.toString()
                .toRequestBody("application/json".toMediaType())
            
            val request = Request.Builder()
                .url(IMG2IMG_URL)
                .post(requestBody)
                .build()
            
            val response = client.newCall(request).execute()
            val responseBody = response.body?.string()
            
            Log.d("ImageToImage", "Response code: ${response.code}")
            Log.d("ImageToImage", "Response body: $responseBody")
            
            if (response.isSuccessful && responseBody != null) {
                val jsonResponse = JSONObject(responseBody)
                if (jsonResponse.getString("status") == "success") {
                    val outputArray = jsonResponse.getJSONArray("output")
                    if (outputArray.length() > 0) {
                        val imageUrl = outputArray.getString(0)
                        Log.d("ImageToImage", "Received image URL: $imageUrl")
                        return@withContext imageUrl
                    }
                } else {
                    // Handle error message from API (ModelsLab API has typo "messege")
                    val errorMsg = jsonResponse.optString("message", 
                        jsonResponse.optString("messege", "Unknown error"))
                    Log.e("ImageToImage", "API Error: $errorMsg")
                    errorMessage = errorMsg
                }
            } else {
                Log.e("ImageToImage", "HTTP Error: ${response.code} - $responseBody")
                errorMessage = "Server error: ${response.code}"
            }
            
            null
        } catch (e: Exception) {
            Log.e("ImageToImage", "Error in img2img", e)
            null
        }
    }

    fun saveImageToGallery() {
        val image = GeneratedImage(
            originalBitmap = selectedImage,
            generatedBitmap = generatedImageBitmap,
            generatedUrl = generatedImageUrl,
            prompt = prompt,
            negativePrompt = negativePrompt,
            strength = strength,
            guidanceScale = guidanceScale,
            steps = steps
        )
        viewModelScope.launch {
            // Persist to local storage or database (not implemented here)
            Log.d("ImageToImageViewModel", "Image saved to gallery: $image")
        }
    }

    fun shareImage() {
        // Implement share functionality (not implemented here)
        Log.d("ImageToImageViewModel", "Sharing image")
    }
    
    fun clearError() {
        errorMessage = null
    }
    
    fun addToGallery() {
        if (generatedImageBitmap != null || generatedImageUrl != null) {
            val finalPrompt = if (isGhibliStyle) {
                "Ghibli Studio style transformation"
            } else {
                prompt
            }
            
            val newImage = GeneratedImage(
                originalBitmap = selectedImage,
                generatedBitmap = generatedImageBitmap,
                generatedUrl = generatedImageUrl,
                prompt = finalPrompt,
                negativePrompt = negativePrompt,
                strength = strength,
                guidanceScale = guidanceScale,
                steps = steps
            )
            _galleryImages.value = _galleryImages.value + newImage
            Log.d("ImageToImageViewModel", "Added image to gallery. Total: ${_galleryImages.value.size}")
            Log.d("ImageToImageViewModel", "Gallery contents: ${_galleryImages.value.map { it.id }}")
        } else {
            Log.e("ImageToImageViewModel", "Cannot add to gallery - no generated image available")
        }
    }
    
    fun removeFromGallery(imageId: String) {
        _galleryImages.value = _galleryImages.value.filter { it.id != imageId }
    }
    
    private fun calculateDimensions(bitmap: Bitmap): Pair<Int, Int> {
        val originalWidth = bitmap.width
        val originalHeight = bitmap.height
        val aspectRatio = originalWidth.toFloat() / originalHeight.toFloat()
        
        // Target size - we'll use 1024 as max dimension
        val maxDimension = 1024
        
        return if (aspectRatio > 1) {
            // Landscape image
            val width = maxDimension
            val height = (maxDimension / aspectRatio).toInt()
            // Ensure dimensions are multiples of 8
            Pair(width - (width % 8), height - (height % 8))
        } else {
            // Portrait or square image
            val height = maxDimension
            val width = (maxDimension * aspectRatio).toInt()
            // Ensure dimensions are multiples of 8
            Pair(width - (width % 8), height - (height % 8))
        }
    }
    
    fun reset() {
        selectedImage = null
        selectedImage2 = null
        generatedImageUrl = null
        generatedImageBitmap = null
        generatedImageBase64 = null
        prompt = ""
        negativePrompt = ""
        strength = 0.7f
        guidanceScale = 7.5f
        steps = 20
        errorMessage = null
        isGhibliStyle = false
        isDualImageMode = false
        generationTime = 0L
        elapsedTime = 0L
        isTimerRunning = false
    }
    
    // Dual image functionality
    fun updateSelectedImage2(bitmap: Bitmap?) {
        Log.d("ImageToImage", "updateSelectedImage2 called with bitmap: ${bitmap?.let { "${it.width}x${it.height}" } ?: "null"}")
        selectedImage2 = bitmap
        errorMessage = null
    }
    
    fun toggleDualImageMode() {
        isDualImageMode = !isDualImageMode
        if (!isDualImageMode) {
            selectedImage2 = null
        }
        errorMessage = null
        Log.d("ImageToImage", "Dual image mode: $isDualImageMode")
    }
    
    fun updateSelectedModel(model: String) {
        selectedModel = model
        Log.d("ImageToImage", "Model updated to: $model")
    }
    
    fun generateDualImage() {
        Log.d("ImageToImage", "generateDualImage called")
        
        if (selectedImage == null) {
            errorMessage = "Please select the first image"
            return
        }
        
        if (selectedImage2 == null) {
            errorMessage = "Please select the second image"
            return
        }
        
        if (prompt.isEmpty()) {
            errorMessage = "Please enter a prompt describing how to combine the images"
            return
        }
        
        viewModelScope.launch {
            isLoading = true
            isTimerRunning = true
            elapsedTime = 0L
            generationTime = 0L
            val startTime = System.currentTimeMillis()
            errorMessage = null
            loadingMessage = "Combining images with nano-banana model..."
            
            // Start timer coroutine
            val timerJob = launch {
                while (isTimerRunning) {
                    elapsedTime = System.currentTimeMillis() - startTime
                    delay(100)
                }
            }
            
            try {
                // Convert both images to base64
                val base64Image1 = withContext(Dispatchers.IO) {
                    val resizedBitmap = resizeBitmapIfNeeded(selectedImage!!)
                    bitmapToBase64(resizedBitmap)
                }
                
                val base64Image2 = withContext(Dispatchers.IO) {
                    val resizedBitmap = resizeBitmapIfNeeded(selectedImage2!!)
                    bitmapToBase64(resizedBitmap)
                }
                
                // Create request for dual image generation
                val request = ModelsLabDualImageService.DualImageToImageRequest(
                    prompt = prompt,
                    initImage = base64Image1,
                    initImage2 = base64Image2,
                    modelId = ModelsLabDualImageService.MODEL_NANO_BANANA,
                    negativePrompt = negativePrompt.ifEmpty { "low quality, blurry, distorted" },
                    strength = strength.toDouble(),
                    guidanceScale = guidanceScale.toDouble(),
                    numInferenceSteps = steps.coerceIn(10, 50),
                    width = 768,
                    height = 1024,
                    safetyChecker = true,
                    enhancePrompt = false,
                    base64 = false // Get URL response
                )
                
                Log.d("ImageToImage", "Calling dual image service with prompt: $prompt")
                val response = dualImageService.generateDualImage(request)
                
                if (response.status == "success") {
                    if (response.nsfwContentDetected) {
                        errorMessage = "Content detected as inappropriate. Please use family-friendly images and prompts."
                        generatedImageUrl = null
                        generatedImageBitmap = null
                    } else if (!response.output.isNullOrEmpty()) {
                        val imageOutput = response.output[0]
                        Log.d("ImageToImage", "Received dual image output: ${imageOutput.take(100)}...")
                        
                        // Handle different output formats
                        if (imageOutput.startsWith("http://") || imageOutput.startsWith("https://")) {
                            generatedImageUrl = imageOutput
                            generatedImageBitmap = null
                        } else if (imageOutput.startsWith("data:image")) {
                            // Extract base64 data from data URL
                            val base64Data = imageOutput.substringAfter(",")
                            try {
                                val imageBytes = Base64.decode(base64Data, Base64.DEFAULT)
                                generatedImageBitmap = android.graphics.BitmapFactory.decodeByteArray(imageBytes, 0, imageBytes.size)
                                generatedImageUrl = null
                            } catch (e: Exception) {
                                Log.e("ImageToImage", "Failed to decode base64 data URL", e)
                                errorMessage = "Failed to decode generated image"
                            }
                        } else {
                            // Try direct base64 decode
                            try {
                                val imageBytes = Base64.decode(imageOutput, Base64.DEFAULT)
                                generatedImageBitmap = android.graphics.BitmapFactory.decodeByteArray(imageBytes, 0, imageBytes.size)
                                generatedImageUrl = null
                            } catch (e: Exception) {
                                // If base64 fails, treat as URL
                                generatedImageUrl = imageOutput
                                generatedImageBitmap = null
                            }
                        }
                    } else {
                        errorMessage = "Image generation completed but no image was returned"
                    }
                } else {
                    val error = response.error ?: "Failed to generate dual image"
                    Log.e("ImageToImage", "Dual image API error: $error")
                    errorMessage = error
                }
                
            } catch (e: Exception) {
                Log.e("ImageToImage", "Error in dual image generation", e)
                errorMessage = "Error: ${e.message}"
            } finally {
                isLoading = false
                isTimerRunning = false
                timerJob.cancel()
                generationTime = System.currentTimeMillis() - startTime
                elapsedTime = generationTime
                loadingMessage = ""
                Log.d("ImageToImage", "Total dual image generation time: ${generationTime}ms")
            }
        }
    }
}
