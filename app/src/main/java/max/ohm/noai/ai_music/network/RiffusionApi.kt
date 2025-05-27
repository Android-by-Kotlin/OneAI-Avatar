package max.ohm.noai.ai_music.network

import max.ohm.noai.ai_music.MusicGenApiKey
import retrofit2.http.Body
import retrofit2.http.Headers
import retrofit2.http.POST

interface RiffusionApi {
    @Headers("Authorization: Bearer ${MusicGenApiKey.API_KEY}")
    @POST("models/riffusion/riffusion")
    suspend fun generateMusic(@Body request: RiffusionRequest): RiffusionResponse
}
