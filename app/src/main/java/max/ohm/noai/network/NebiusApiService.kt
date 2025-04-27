package max.ohm.noai.network

import retrofit2.Response
import retrofit2.http.Body
import retrofit2.http.Header
import retrofit2.http.POST


interface NebiusApiService {


    // The base URL will be set in the Retrofit client
    @POST("images/generations") // Endpoint path relative to base URL
    suspend fun generateImage(
        @Header("Authorization") apiKey: String,
        @Body request: ImageGenerationRequest
    ): Response<ImageGenerationResponse> // Use Response<> for detailed error handling
}
