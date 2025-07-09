package max.ohm.oneai.liveavatar.api

import max.ohm.oneai.liveavatar.data.CommonResponse
import max.ohm.oneai.liveavatar.data.SessionTokenResponse
import max.ohm.oneai.liveavatar.data.StreamingNewRequest
import max.ohm.oneai.liveavatar.data.StreamingNewResponse
import max.ohm.oneai.liveavatar.data.StreamingStartRequest
import max.ohm.oneai.liveavatar.data.TaskRequest
import retrofit2.http.*

interface HeyGenApiService {
    
    @POST("v1/streaming.create_token")
    suspend fun createSessionToken(
        @Header("x-api-key") apiKey: String
    ): SessionTokenResponse
    
    @POST("v1/streaming.new")
    suspend fun createNewSession(
        @Header("Authorization") bearerToken: String,
        @Body request: StreamingNewRequest
    ): StreamingNewResponse
    
    @POST("v1/streaming.start")
    suspend fun startStreaming(
        @Header("Authorization") bearerToken: String,
        @Body request: StreamingStartRequest
    ): CommonResponse
    
    @POST("v1/streaming.task")
    suspend fun sendTask(
        @Header("Authorization") bearerToken: String,
        @Body request: TaskRequest
    ): CommonResponse
    
    @POST("v1/streaming.stop")
    suspend fun stopStreaming(
        @Header("Authorization") bearerToken: String,
        @Body request: StreamingStartRequest
    ): CommonResponse
}
