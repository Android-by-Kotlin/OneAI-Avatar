package max.ohm.oneai.imagetoimage.api

import max.ohm.oneai.imagetoimage.data.ImageToImageRequest
import max.ohm.oneai.imagetoimage.data.ImageToImageResponse
import retrofit2.http.Body
import retrofit2.http.Header
import retrofit2.http.POST

interface ImageToImageApiService {
    @POST("api/v7/images/img2img")
    suspend fun generateImage(
        @Header("key") apiKey: String,
        @Body request: ImageToImageRequest
    ): ImageToImageResponse
    
    @POST("api/v7/images/image-to-image")
    suspend fun generateDualImage(
        @Header("key") apiKey: String,
        @Body request: ImageToImageRequest
    ): ImageToImageResponse
}
