package max.ohm.noai.musicgeneration.network

import retrofit2.Response
import retrofit2.http.Body
import retrofit2.http.Header
import retrofit2.http.POST

interface RiffusionApiService {
    
    @POST(".")
    suspend fun generateMusic(
        @Header("Authorization") apiKey: String,
        @Body request: MusicGenerationRequest
    ): Response<ByteArray> // Riffusion returns raw audio data
}