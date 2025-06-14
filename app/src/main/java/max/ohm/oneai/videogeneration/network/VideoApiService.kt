package max.ohm.oneai.videogeneration.network

import retrofit2.Response
import retrofit2.http.Body
import retrofit2.http.GET
import retrofit2.http.Header
import retrofit2.http.Headers
import retrofit2.http.POST
import retrofit2.http.Query

interface VideoApiService {

    @Headers("Content-Type: application/json")
    @POST("v1/video_generation")
    suspend fun generateVideo(
        @Header("Authorization") authorization: String,
        @Body request: VideoGenerationRequest
    ): Response<VideoGenerationTaskResponse>

    @GET("v1/query/video_generation")
    suspend fun queryVideoGenerationStatus(
        @Header("Authorization") authorization: String,
        @Query("task_id") taskId: String
    ): Response<VideoGenerationTaskResponse>

    @GET("v1/files/retrieve")
    suspend fun retrieveVideoFile(
        @Header("Authorization") authorization: String,
        @Query("groupId") groupId: String,
        @Query("file_id") fileId: String
    ): Response<VideoFileResponse>
}

