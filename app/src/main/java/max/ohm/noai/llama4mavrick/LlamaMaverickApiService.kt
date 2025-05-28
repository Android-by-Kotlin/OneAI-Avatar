package max.ohm.noai.llama4mavrick

import retrofit2.Response
import retrofit2.http.Body
import retrofit2.http.Headers
import retrofit2.http.POST

interface LlamaMaverickApiService {

    @Headers(
        "Content-Type: application/json",
        "Authorization: Bearer ${LlamaMaverickApiKey.API_KEY}"
        // Optional headers can be added here if needed, e.g., HTTP-Referer, X-Title
    )
    @POST("chat/completions")

    suspend fun createChatCompletion(@Body request: ChatCompletionRequest): Response<ChatCompletionResponse>
}