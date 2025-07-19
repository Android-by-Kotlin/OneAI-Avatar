package max.ohm.oneai.stabilityai.repository

import android.content.Context
import android.net.Uri
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import max.ohm.oneai.stabilityai.api.StabilityApiService
import max.ohm.oneai.stabilityai.data.StabilityImageResponse
import max.ohm.oneai.stabilityai.data.SearchAndReplaceResponse
import max.ohm.oneai.stabilityai.data.SearchAndRecolorResponse
import max.ohm.oneai.stabilityai.data.RemoveBackgroundResponse
import max.ohm.oneai.stabilityai.data.ReplaceBackgroundAndRelightResponse
import max.ohm.oneai.stabilityai.data.SketchToImageResponse
import max.ohm.oneai.stabilityai.data.StructureControlResponse
import max.ohm.oneai.stabilityai.data.StyleControlResponse
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

    suspend fun searchAndRecolor(
        context: Context, 
        imageUri: Uri, 
        prompt: String, 
        selectPrompt: String, 
        outputFormat: String = "webp"
    ): SearchAndRecolorResponse? {
        return withContext(Dispatchers.IO) {
            try {
                val inputStream = context.contentResolver.openInputStream(imageUri)
                val file = File.createTempFile("search_recolor_image", ".png", context.cacheDir)
                inputStream?.use { input -> file.outputStream().use { output -> input.copyTo(output) } }

                val image = MultipartBody.Part.createFormData(
                    "image",
                    file.name,
                    file.asRequestBody("image/png".toMediaTypeOrNull())
                )

                val response: Response<ResponseBody> = stabilityApiService.searchAndRecolor(
                    authorization = "Bearer $STABILITY_API_KEY",
                    accept = "image/*",
                    image = image,
                    prompt = prompt.toRequestBody(),
                    selectPrompt = selectPrompt.toRequestBody(),
                    outputFormat = outputFormat.toRequestBody()
                )

                // Clean up temporary file
                file.delete()

                if (response.isSuccessful) {
                    SearchAndRecolorResponse(
                        imageData = response.body()?.bytes(), 
                        status = "success"
                    )
                } else {
                    SearchAndRecolorResponse(
                        error = "Failed: ${response.code()} ${response.message()}"
                    )
                }
            } catch (e: Exception) {
                SearchAndRecolorResponse(
                    error = "Exception: ${e.localizedMessage}"
                )
            }
        }
    }

    suspend fun removeBackground(
        context: Context, 
        imageUri: Uri, 
        outputFormat: String = "webp"
    ): RemoveBackgroundResponse? {
        return withContext(Dispatchers.IO) {
            try {
                val inputStream = context.contentResolver.openInputStream(imageUri)
                val file = File.createTempFile("remove_bg_image", ".png", context.cacheDir)
                inputStream?.use { input -> file.outputStream().use { output -> input.copyTo(output) } }

                val image = MultipartBody.Part.createFormData(
                    "image",
                    file.name,
                    file.asRequestBody("image/png".toMediaTypeOrNull())
                )

                val response: Response<ResponseBody> = stabilityApiService.removeBackground(
                    authorization = "Bearer $STABILITY_API_KEY",
                    accept = "image/*",
                    image = image,
                    outputFormat = outputFormat.toRequestBody()
                )

                // Clean up temporary file
                file.delete()

                if (response.isSuccessful) {
                    RemoveBackgroundResponse(
                        imageData = response.body()?.bytes(), 
                        status = "success"
                    )
                } else {
                    RemoveBackgroundResponse(
                        error = "Failed: ${response.code()} ${response.message()}"
                    )
                }
            } catch (e: Exception) {
                RemoveBackgroundResponse(
                    error = "Exception: ${e.localizedMessage}"
                )
            }
        }
    }

    suspend fun replaceBackgroundAndRelight(
        context: Context, 
        imageUri: Uri, 
        backgroundPrompt: String? = null,
        backgroundReferenceUri: Uri? = null,
        outputFormat: String = "webp"
    ): ReplaceBackgroundAndRelightResponse? {
        return withContext(Dispatchers.IO) {
            var file: File? = null
            var backgroundFile: File? = null
            try {
                val inputStream = context.contentResolver.openInputStream(imageUri)
                file = File.createTempFile("replace_bg_relight_image", ".png", context.cacheDir)
                inputStream?.use { input -> file!!.outputStream().use { output -> input.copyTo(output) } }

                val subjectImage = MultipartBody.Part.createFormData(
                    "subject_image",
                    file!!.name,
                    file!!.asRequestBody("image/png".toMediaTypeOrNull())
                )

                // Handle background reference image if provided
                val backgroundReference = backgroundReferenceUri?.let { uri ->
                    val backgroundInputStream = context.contentResolver.openInputStream(uri)
                    backgroundFile = File.createTempFile("background_ref", ".png", context.cacheDir)
                    backgroundInputStream?.use { input -> backgroundFile!!.outputStream().use { output -> input.copyTo(output) } }
                    
                    MultipartBody.Part.createFormData(
                        "background_reference",
                        backgroundFile!!.name,
                        backgroundFile!!.asRequestBody("image/png".toMediaTypeOrNull())
                    )
                }

                // Create background prompt part only if no background reference image is provided
                val backgroundPromptPart = if (backgroundReferenceUri == null && backgroundPrompt != null) {
                    MultipartBody.Part.createFormData("background_prompt", backgroundPrompt)
                } else null

                val outputFormatPart = MultipartBody.Part.createFormData("output_format", outputFormat)

                val response: Response<ResponseBody> = stabilityApiService.replaceBackgroundAndRelight(
                    authorization = "Bearer $STABILITY_API_KEY",
                    accept = "image/*",
                    subjectImage = subjectImage,
                    backgroundPrompt = backgroundPromptPart,
                    backgroundReference = backgroundReference,
                    outputFormat = outputFormatPart
                )

                // Clean up temporary files
                file?.delete()
                backgroundFile?.delete()

                if (response.isSuccessful) {
                    ReplaceBackgroundAndRelightResponse(
                        imageData = response.body()?.bytes(), 
                        status = "success"
                    )
                } else {
                    ReplaceBackgroundAndRelightResponse(
                        error = "Failed: ${response.code()} ${response.message()}"
                    )
                }
            } catch (e: Exception) {
                // Clean up temporary files in case of exception
                file?.delete()
                backgroundFile?.delete()
                
                ReplaceBackgroundAndRelightResponse(
                    error = "Exception: ${e.localizedMessage}"
                )
            }
        }
    }

    suspend fun sketchToImage(
        context: Context,
        imageUri: Uri,
        prompt: String
    ): SketchToImageResponse? {
        return withContext(Dispatchers.IO) {
            try {
                val inputStream = context.contentResolver.openInputStream(imageUri)
                val file = File.createTempFile("sketch_image", ".png", context.cacheDir)
                inputStream?.use { input -> file.outputStream().use { output -> input.copyTo(output) } }

                val imagePart = MultipartBody.Part.createFormData(
                    "image",
                    file.name,
                    file.asRequestBody("image/png".toMediaTypeOrNull())
                )

                val response: Response<ResponseBody> = stabilityApiService.sketchToImage(
                    authorization = "Bearer $STABILITY_API_KEY",
                    image = imagePart,
                    prompt = prompt.toRequestBody(),
                    controlStrength = "0.7".toRequestBody(),
                    outputFormat = "webp".toRequestBody()
                )

                // Clean up temporary file
                file.delete()

                if (response.isSuccessful) {
                    SketchToImageResponse(
                        imageData = response.body()?.bytes(),
                        status = "success"
                    )
                } else {
                    SketchToImageResponse(
                        error = "Failed: ${response.code()} ${response.message()}"
                    )
                }
            } catch (e: Exception) {
                SketchToImageResponse(
                    error = "Exception: ${e.localizedMessage}"
                )
            }
        }
    }

    suspend fun structureControl(
        context: Context,
        imageUri: Uri,
        prompt: String
    ): StructureControlResponse? {
        return withContext(Dispatchers.IO) {
            try {
                val inputStream = context.contentResolver.openInputStream(imageUri)
                val file = File.createTempFile("structure_image", ".png", context.cacheDir)
                inputStream?.use { input -> file.outputStream().use { output -> input.copyTo(output) } }

                val imagePart = MultipartBody.Part.createFormData(
                    "image",
                    file.name,
                    file.asRequestBody("image/png".toMediaTypeOrNull())
                )

                val response: Response<ResponseBody> = stabilityApiService.structureControl(
                    authorization = "Bearer $STABILITY_API_KEY",
                    image = imagePart,
                    prompt = prompt.toRequestBody(),
                    controlStrength = "0.7".toRequestBody(),
                    outputFormat = "webp".toRequestBody()
                )

                // Clean up temporary file
                file.delete()

                if (response.isSuccessful) {
                    StructureControlResponse(
                        imageData = response.body()?.bytes(),
                        status = "success"
                    )
                } else {
                    StructureControlResponse(
                        error = "Failed: ${response.code()} ${response.message()}"
                    )
                }
            } catch (e: Exception) {
                StructureControlResponse(
                    error = "Exception: ${e.localizedMessage}"
                )
            }
        }
    }

    suspend fun styleControl(
        context: Context,
        imageUri: Uri,
        prompt: String,
        outputFormat: String = "webp"
    ): StyleControlResponse? {
        return withContext(Dispatchers.IO) {
            try {
                val inputStream = context.contentResolver.openInputStream(imageUri)
                val file = File.createTempFile("style_image", ".png", context.cacheDir)
                inputStream?.use { input -> file.outputStream().use { output -> input.copyTo(output) } }

                val imagePart = MultipartBody.Part.createFormData(
                    "image",
                    file.name,
                    file.asRequestBody("image/png".toMediaTypeOrNull())
                )

                val response: Response<ResponseBody> = stabilityApiService.styleControl(
                    authorization = "Bearer $STABILITY_API_KEY",
                    image = imagePart,
                    prompt = prompt.toRequestBody(),
                    outputFormat = outputFormat.toRequestBody()
                )

                // Clean up temporary file
                file.delete()

                if (response.isSuccessful) {
                    StyleControlResponse(
                        imageData = response.body()?.bytes(),
                        status = "success"
                    )
                } else {
                    StyleControlResponse(
                        error = "Failed: ${response.code()} ${response.message()}"
                    )
                }
            } catch (e: Exception) {
                StyleControlResponse(
                    error = "Exception: ${e.localizedMessage}"
                )
            }
        }
    }

    suspend fun styleTransfer(
        context: Context,
        initImageUri: Uri,
        styleImageUri: Uri,
        outputFormat: String = "webp"
    ): StyleControlResponse? {
        return withContext(Dispatchers.IO) {
            var initFile: File? = null
            var styleFile: File? = null
            try {
                // Process init image
                val initInputStream = context.contentResolver.openInputStream(initImageUri)
                initFile = File.createTempFile("init_image", ".png", context.cacheDir)
                initInputStream?.use { input -> initFile!!.outputStream().use { output -> input.copyTo(output) } }

                val initImagePart = MultipartBody.Part.createFormData(
                    "init_image",
                    initFile!!.name,
                    initFile!!.asRequestBody("image/png".toMediaTypeOrNull())
                )

                // Process style image
                val styleInputStream = context.contentResolver.openInputStream(styleImageUri)
                styleFile = File.createTempFile("style_image", ".png", context.cacheDir)
                styleInputStream?.use { input -> styleFile!!.outputStream().use { output -> input.copyTo(output) } }

                val styleImagePart = MultipartBody.Part.createFormData(
                    "style_image",
                    styleFile!!.name,
                    styleFile!!.asRequestBody("image/png".toMediaTypeOrNull())
                )

                val response: Response<ResponseBody> = stabilityApiService.styleTransfer(
                    authorization = "Bearer $STABILITY_API_KEY",
                    accept = "image/*",
                    init_image = initImagePart,
                    style_image = styleImagePart,
                    outputFormat = outputFormat.toRequestBody()
                )

                // Clean up temporary files
                initFile?.delete()
                styleFile?.delete()

                if (response.isSuccessful) {
                    StyleControlResponse(
                        imageData = response.body()?.bytes(),
                        status = "success"
                    )
                } else {
                    StyleControlResponse(
                        error = "Failed: ${response.code()} ${response.message()}"
                    )
                }
            } catch (e: Exception) {
                // Clean up temporary files in case of exception
                initFile?.delete()
                styleFile?.delete()
                
                StyleControlResponse(
                    error = "Exception: ${e.localizedMessage}"
                )
            }
        }
    }
}
