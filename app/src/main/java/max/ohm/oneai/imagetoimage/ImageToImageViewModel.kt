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

class ImageToImageViewModel : ViewModel() {
    
    // Gallery State
    private val _galleryImages = MutableStateFlow<List<GeneratedImage>>(emptyList())
    val galleryImages: StateFlow<List<GeneratedImage>> = _galleryImages.asStateFlow()
    
    // UI States
    var selectedImage by mutableStateOf<Bitmap?>(null)
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
    
    // ModelsLab API configuration
    private val MODELSLAB_API_KEY = "LPncDkDfVPSeOfVqrA9jPLGAOiMXobFgYVUVq81BUjatgcmR0wCOFOhgvWqr"
    private val IMG2IMG_URL = "https://modelslab.com/api/v4/dreambooth/img2img"
    
    private val client = OkHttpClient.Builder()
        .connectTimeout(120, TimeUnit.SECONDS)
        .readTimeout(120, TimeUnit.SECONDS)
        .writeTimeout(120, TimeUnit.SECONDS)
        .build()
    
    fun updateSelectedImage(bitmap: Bitmap?) {
        selectedImage = bitmap
        errorMessage = null
    }
    
    fun generateImage() {
        if (selectedImage == null) {
            errorMessage = "Please select an image first"
            return
        }
        
        if (prompt.isEmpty()) {
            errorMessage = "Please enter a prompt"
            return
        }
        
        viewModelScope.launch {
            isLoading = true
            errorMessage = null
            
            try {
                // Convert image to base64
                val base64Image = withContext(Dispatchers.IO) {
                    bitmapToBase64(selectedImage!!)
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
            }
        }
    }
    
    private fun bitmapToBase64(bitmap: Bitmap): String {
        val outputStream = ByteArrayOutputStream()
        bitmap.compress(Bitmap.CompressFormat.PNG, 100, outputStream)
        val imageBytes = outputStream.toByteArray()
        return Base64.encodeToString(imageBytes, Base64.NO_WRAP)
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
                put("key", MODELSLAB_API_KEY)
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
            val newImage = GeneratedImage(
                originalBitmap = selectedImage,
                generatedBitmap = generatedImageBitmap,
                generatedUrl = generatedImageUrl,
                prompt = prompt,
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
    
    fun reset() {
        selectedImage = null
        generatedImageUrl = null
        generatedImageBitmap = null
        generatedImageBase64 = null
        prompt = ""
        negativePrompt = ""
        strength = 0.7f
        guidanceScale = 7.5f
        steps = 20
        errorMessage = null
    }
}
