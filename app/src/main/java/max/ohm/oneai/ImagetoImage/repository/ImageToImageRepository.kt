package max.ohm.oneai.ImagetoImage.repository

import android.util.Log
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import max.ohm.oneai.ImagetoImage.api.ImageToImageApiService
import max.ohm.oneai.ImagetoImage.data.ImageToImageRequest
import max.ohm.oneai.ImagetoImage.data.ImageToImageResponse
import okhttp3.OkHttpClient
import okhttp3.logging.HttpLoggingInterceptor
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import java.util.concurrent.TimeUnit

object ImageToImageRepository {
    private const val TAG = "ImageToImageRepo"

    private val loggingInterceptor = HttpLoggingInterceptor().apply {
        level = HttpLoggingInterceptor.Level.BODY
    }

    private val okHttpClient = OkHttpClient.Builder()
        .connectTimeout(600, TimeUnit.SECONDS)  // Increased to 10 minutes
        .readTimeout(600, TimeUnit.SECONDS)     // Increased to 10 minutes
        .writeTimeout(600, TimeUnit.SECONDS)    // Increased to 10 minutes
        .addInterceptor(loggingInterceptor)
        .build()

    private val retrofit = Retrofit.Builder()
        .baseUrl("https://modelslab.com/")
        .client(okHttpClient)
        .addConverterFactory(GsonConverterFactory.create())
        .build()

    private val apiService = retrofit.create(ImageToImageApiService::class.java)

    suspend fun generateImage(initImageUrl: String, prompt: String): ImageToImageResponse {
        return withContext(Dispatchers.IO) {
            apiService.generateImage(
                apiKey = "qVVcoYnOc0uGhiotcMmYzVBR6GhaJbRkqQOYko21dshwf6cMEGM97axKTIB8",
                request = ImageToImageRequest(
                    initImage = initImageUrl,
                    prompt = prompt,
                    negativePrompt = "(worst quality:2), (low quality:2), (normal quality:2), (jpeg artifacts), (blurry), (duplicate), (morbid), (mutilated), (out of frame), (extra limbs), (bad anatomy), (disfigured), (deformed), (cross-eye), (glitch), (oversaturated), (overexposed), (underexposed), (bad proportions), (bad hands), (bad feet), (cloned face), (long neck), (missing arms), (missing legs), (extra fingers), (fused fingers), (poorly drawn hands), (poorly drawn face), (mutation), (deformed eyes), watermark, text, logo, signature, grainy, tiling, censored, nsfw, ugly, blurry eyes, noisy image, bad lighting, unnatural skin, asymmetry",
                    modelId = "flux-kontext-dev",
                    numInferenceSteps = "28",
                    strength = "0.5",
                    scheduler = "DPMSolverMultistepScheduler",
                    guidance = "2.5"
                )
            )
        }
    }
}
