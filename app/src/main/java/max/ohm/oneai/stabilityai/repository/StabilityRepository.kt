package max.ohm.oneai.stabilityai.repository

import android.content.Context
import android.net.Uri
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import max.ohm.oneai.stabilityai.api.StabilityApiService
import max.ohm.oneai.stabilityai.data.StabilityImageResponse
import max.ohm.oneai.stabilityai.data.SearchAndReplaceResponse
import max.ohm.oneai.stabilityai.STABILITY_API_KEY
import okhttp3.MediaType.Companion.toMediaTypeOrNull
import okhttp3.MultipartBody
import okhttp3.OkHttpClient
import okhttp3.RequestBody.Companion.asRequestBody
import okhttp3.RequestBody.Companion.toRequestBody
import okhttp3.ResponseBody
import retrofit2.Response
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import java.io.File
import java.util.concurrent.TimeUnit

object StabilityRepository {
    private val okhttpClient = OkHttpClient.Builder()
        .connectTimeout(120, TimeUnit.SECONDS)  // 2 minutes for connection
        .readTimeout(180, TimeUnit.SECONDS)     // 3 minutes for reading response
        .writeTimeout(120, TimeUnit.SECONDS)    // 2 minutes for writing request
        .build()

    private val retrofit = Retrofit.Builder()
        .baseUrl("https://api.stability.ai")
        .client(okhttpClient)
        .addConverterFactory(GsonConverterFactory.create())
        .build()

    private val stabilityApiService = retrofit.create(StabilityApiService::class.java)

    suspend fun generateImageToImage(context: Context, imageUri: Uri, prompt: String): StabilityImageResponse? {
        return withContext(Dispatchers.IO) {
            try {
                val inputStream = context.contentResolver.openInputStream(imageUri)
                val file = File.createTempFile("init_image", ".png", context.cacheDir)
                inputStream?.use { input -> file.outputStream().use { output -> input.copyTo(output) } }

                val initImage = MultipartBody.Part.createFormData(
                    "init_image",
                    file.name,
                    file.asRequestBody("image/png".toMediaTypeOrNull())
                )

                val response: Response<ResponseBody> = stabilityApiService.generateImageToImage(
                    authorization = "Bearer $STABILITY_API_KEY",
                    initImage = initImage,
                    initImageMode = "IMAGE_STRENGTH".toRequestBody(),
                    imageStrength = "0.35".toRequestBody(),
                    textPrompt = prompt.toRequestBody(),
                    cfgScale = "7".toRequestBody(),
                    samples = "1".toRequestBody(),
                    steps = "30".toRequestBody()
                )

                if (response.isSuccessful) {
                    StabilityImageResponse(imageData = response.body()?.bytes(), status = "success")
                } else {
                    StabilityImageResponse(error = "Failed: ${response.code()} ${response.message()}")
                }
            } catch (e: Exception) {
                StabilityImageResponse(error = "Exception: ${e.localizedMessage}")
            }
        }
    }

    suspend fun searchAndReplace(
        context: Context, 
        imageUri: Uri, 
        prompt: String, 
        searchPrompt: String, 
        outputFormat: String = "webp"
    ): SearchAndReplaceResponse? {
        return withContext(Dispatchers.IO) {
            try {
                val inputStream = context.contentResolver.openInputStream(imageUri)
                val file = File.createTempFile("search_replace_image", ".png", context.cacheDir)
                inputStream?.use { input -> file.outputStream().use { output -> input.copyTo(output) } }

                val image = MultipartBody.Part.createFormData(
                    "image",
                    file.name,
                    file.asRequestBody("image/png".toMediaTypeOrNull())
                )

                val response: Response<ResponseBody> = stabilityApiService.searchAndReplace(
                    authorization = "Bearer $STABILITY_API_KEY",
                    accept = "image/*",
                    image = image,
                    prompt = prompt.toRequestBody(),
                    searchPrompt = searchPrompt.toRequestBody(),
                    outputFormat = outputFormat.toRequestBody()
                )

                // Clean up temporary file
                file.delete()

                if (response.isSuccessful) {
                    SearchAndReplaceResponse(
                        imageData = response.body()?.bytes(), 
                        status = "success"
                    )
                } else {
                    SearchAndReplaceResponse(
                        error = "Failed: ${response.code()} ${response.message()}"
                    )
                }
            } catch (e: Exception) {
                SearchAndReplaceResponse(
                    error = "Exception: ${e.localizedMessage}"
                )
            }
        }
    }
    
}
