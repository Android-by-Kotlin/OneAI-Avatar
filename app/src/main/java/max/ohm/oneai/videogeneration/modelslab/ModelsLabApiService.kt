package max.ohm.oneai.videogeneration.modelslab

import retrofit2.Response
import retrofit2.http.Body
import retrofit2.http.GET
import retrofit2.http.Headers
import retrofit2.http.POST
import retrofit2.http.Path
import retrofit2.http.Query

interface ModelsLabApiService {
    
    @Headers("Content-Type: application/json")
    @POST("api/v6/video/text2video")
    suspend fun generateVideo(
        @Body request: ModelsLabVideoRequest
    ): Response<ModelsLabVideoResponse>
    
    @GET("api/v6/video/fetch")
    suspend fun checkGenerationStatus(
        @Query("key") apiKey: String,
        @Query("request_id") requestId: Long
    ): Response<ModelsLabStatusResponse>
    
    @Headers("Content-Type: application/json")
    @POST("api/v7/video-fusion/image-to-video")
    suspend fun generateImageToVideo(
        @Body request: ModelsLabImageToVideoRequest
    ): Response<ModelsLabVideoResponse>
    
    @Headers("Content-Type: application/json")
    @POST("api/v7/video-fusion/text-to-video")
    suspend fun generateTextToVideo(
        @Body request: ModelsLabTextToVideoRequest
    ): Response<ModelsLabVideoResponse>
    
    // Polling endpoint for Seedance models - uses POST with ID in path
    @Headers("Content-Type: application/json")
    @POST("api/v7/video-fusion/fetch/{requestId}")
    suspend fun checkSeedanceGenerationStatus(
        @Path("requestId") requestId: Long,
        @Body body: SeedanceFetchRequest
    ): Response<ModelsLabStatusResponse>
}
