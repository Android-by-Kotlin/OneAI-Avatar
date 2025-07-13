package max.ohm.oneai.ImagetoImage.api

import max.ohm.oneai.ImagetoImage.data.ImageToImageRequest
import max.ohm.oneai.ImagetoImage.data.ImageToImageResponse
import retrofit2.http.Body
import retrofit2.http.Header
import retrofit2.http.POST

interface ImageToImageApiService {
    @POST("api/v6/images/img2img")
    suspend fun generateImage(
        @Header("key") apiKey: String,
        @Body request: ImageToImageRequest
    ): ImageToImageResponse
}
