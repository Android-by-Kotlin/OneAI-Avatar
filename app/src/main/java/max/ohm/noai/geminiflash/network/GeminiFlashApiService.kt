package max.ohm.noai.geminiflash.network

import max.ohm.noai.a4f.A4FClient.A4F_API_KEY
import retrofit2.Response
import retrofit2.http.Body
import retrofit2.http.Headers
import retrofit2.http.POST

interface GeminiFlashApiService {
    @Headers(
        "Content-Type: application/json",
        "Authorization: Bearer $A4F_API_KEY"
    )
    @POST("chat/completions")
    suspend fun getChatCompletion(@Body request: GeminiFlashRequest): Response<GeminiFlashResponse>
}
