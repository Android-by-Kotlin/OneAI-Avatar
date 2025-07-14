package max.ohm.oneai.imagetoimage.ghibli

import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.util.Base64
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
import java.sql.Types.NULL
import java.util.concurrent.TimeUnit

class GhibliStyleImageGeneratorViewModel : ViewModel() {

    private val client = OkHttpClient.Builder()
        .connectTimeout(600, TimeUnit.SECONDS)  // Increased to 600 seconds (10 minutes)
        .readTimeout(600, TimeUnit.SECONDS)     // Increased to 600 seconds (10 minutes)
        .writeTimeout(600, TimeUnit.SECONDS)    // Increased to 600 seconds (10 minutes)
        .build()

    private val MODELSLAB_API_KEY = "NXwTLvT5B3Zvrc0KhjYaqiSSarqk2lCMGsiDfVQHCQjGWw6owEe36MWr2HSV"

    fun generateGhibliStyleImage(selectedImage: Bitmap, onSuccess: (Bitmap) -> Unit, onError: (String) -> Unit) {
        viewModelScope.launch {
            try {
                val base64Image = withContext(Dispatchers.IO) {
                    bitmapToBase64(selectedImage)
                }

                val result = performGhibliStyleImageGeneration(base64Image)

                if (result != null) {
                    val decodedBitmap = decodeBase64ToBitmap(result)
                    onSuccess(decodedBitmap)
                } else {
                    onError("Failed to generate Ghibli style image")
                }
            } catch (e: Exception) {
                onError("Error: ${e.message}")
            }
        }
    }

    private suspend fun performGhibliStyleImageGeneration(base64Image: String): String? = withContext(Dispatchers.IO) {
        try {
            // Note: This file is not currently being used. The main implementation is in ImageToImageViewModel.kt
            val jsonBody = JSONObject().apply {
                put("key", MODELSLAB_API_KEY)
                put("model_id", "fluxdev")
                put("init_image", base64Image)
                put("prompt", "Ghibli Studio style, Charming hand-drawn anime-style illustration")
                put("controlnet_type", "ghibli")
                put("controlnet_model", "ghibli")
                put("height", "1024")  // Reduced from 1024 to speed up processing
                put("width", "1024")   // Reduced from 1024 to speed up processing
                put("base64", true)
                put("temp", "no")
//                put("webhook", JSONObject.NULL)
//                put("track_id", JSONObject.NULL)
                put("webhook", NULL)
                put("track_id", NULL)
            }

            val requestBody = jsonBody.toString()
                .toRequestBody("application/json".toMediaType())

            val request = Request.Builder()
                .url("https://modelslab.com/api/v5/controlnet")
                .post(requestBody)
                .build()

            val response = client.newCall(request).execute()
            val responseBody = response.body?.string()

            if (response.isSuccessful && responseBody != null) {
                val jsonResponse = JSONObject(responseBody)
                if (jsonResponse.has("output")) {
                    jsonResponse.getJSONArray("output").getString(0)
                } else if (jsonResponse.has("status") && jsonResponse.getString("status") == "processing") {
                    // The API might be processing, we should handle this case
                    throw Exception("Image is still processing. Please try again in a few moments.")
                } else {
                    throw Exception("Unexpected response format: ${jsonResponse.toString(2)}")
                }
            } else {
                val errorMessage = when (response.code) {
                    524 -> "Server timeout error (524): The image generation exceeded the server limit. Please try with a smaller image."
                    500 -> "Server error (500): The server encountered an error. Please try again later."
                    503 -> "Service unavailable (503): The service is temporarily unavailable. Please try again later."
                    429 -> "Rate limit exceeded (429): Too many requests. Please wait a moment before trying again."
                    else -> "Error ${response.code}: ${responseBody ?: "No error message"}"
                }
                throw Exception(errorMessage)
            }
        } catch (e: Exception) {
            e.printStackTrace()
            throw e  // Re-throw to provide detailed error message to the caller
        }
    }

    private fun bitmapToBase64(bitmap: Bitmap): String {
        val outputStream = ByteArrayOutputStream()
        bitmap.compress(Bitmap.CompressFormat.PNG, 100, outputStream)
        val imageBytes = outputStream.toByteArray()
        return Base64.encodeToString(imageBytes, Base64.NO_WRAP)
    }

    private fun decodeBase64ToBitmap(base64Str: String): Bitmap {
        val bytes = Base64.decode(base64Str, Base64.DEFAULT)
        return BitmapFactory.decodeByteArray(bytes, 0, bytes.size)
    }

}
