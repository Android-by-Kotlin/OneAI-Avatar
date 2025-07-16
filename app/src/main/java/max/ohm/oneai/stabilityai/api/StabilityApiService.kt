package max.ohm.oneai.stabilityai.api

import okhttp3.MultipartBody
import okhttp3.RequestBody
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
}
