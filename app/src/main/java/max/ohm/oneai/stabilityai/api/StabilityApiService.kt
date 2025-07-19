package max.ohm.oneai.stabilityai.api

import okhttp3.MultipartBody
import okhttp3.RequestBody
import okhttp3.RequestBody.Companion.toRequestBody
import okhttp3.ResponseBody
import retrofit2.Response
import retrofit2.http.*

interface StabilityApiService {
    @Multipart
    @POST("v1/generation/stable-diffusion-v1-6/image-to-image")
    suspend fun generateImageToImage(
        @Header("Authorization") authorization: String,
        @Header("Accept") accept: String = "image/png",
        @Part initImage: MultipartBody.Part,
        @Part("init_image_mode") initImageMode: RequestBody,
        @Part("image_strength") imageStrength: RequestBody,
        @Part("text_prompts[0][text]") textPrompt: RequestBody,
        @Part("cfg_scale") cfgScale: RequestBody,
        @Part("samples") samples: RequestBody,
        @Part("steps") steps: RequestBody
    ): Response<ResponseBody>

    @Multipart
    @POST("v2beta/stable-image/edit/search-and-replace")
    suspend fun searchAndReplace(
        @Header("Authorization") authorization: String,
        @Header("Accept") accept: String = "image/*",
        @Part image: MultipartBody.Part,
        @Part("prompt") prompt: RequestBody,
        @Part("search_prompt") searchPrompt: RequestBody,
        @Part("output_format") outputFormat: RequestBody = "webp".toRequestBody()
    ): Response<ResponseBody>

    @Multipart
    @POST("v2beta/stable-image/edit/search-and-recolor")
    suspend fun searchAndRecolor(
        @Header("Authorization") authorization: String,
        @Header("Accept") accept: String = "image/*",
        @Part image: MultipartBody.Part,
        @Part("prompt") prompt: RequestBody,
        @Part("select_prompt") selectPrompt: RequestBody,
        @Part("output_format") outputFormat: RequestBody = "webp".toRequestBody()
    ): Response<ResponseBody>

    @Multipart
    @POST("v2beta/stable-image/edit/remove-background")
    suspend fun removeBackground(
        @Header("Authorization") authorization: String,
        @Header("Accept") accept: String = "image/*",
        @Part image: MultipartBody.Part,
        @Part("output_format") outputFormat: RequestBody = "webp".toRequestBody()
    ): Response<ResponseBody>

    @Multipart
    @POST("v2beta/stable-image/edit/replace-background-and-relight")
    suspend fun replaceBackgroundAndRelight(
        @Header("Authorization") authorization: String,
        @Header("Accept") accept: String,
        @Part subjectImage: MultipartBody.Part,
        @Part backgroundPrompt: MultipartBody.Part?,
        @Part backgroundReference: MultipartBody.Part?,
        @Part outputFormat: MultipartBody.Part
    ): Response<ResponseBody>

    @Multipart
    @POST("v2beta/stable-image/control/sketch")
    suspend fun sketchToImage(
        @Header("Authorization") authorization: String,
        @Header("Accept") accept: String = "image/*",
        @Part image: MultipartBody.Part,
        @Part("prompt") prompt: RequestBody,
        @Part("control_strength") controlStrength: RequestBody = "0.7".toRequestBody(),
        @Part("output_format") outputFormat: RequestBody = "webp".toRequestBody()
    ): Response<ResponseBody>
}
