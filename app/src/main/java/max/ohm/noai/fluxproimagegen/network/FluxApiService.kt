package max.ohm.noai.fluxproimagegen.network

import retrofit2.Response
import retrofit2.http.Body
import retrofit2.http.Headers
import retrofit2.http.POST

interface FluxApiService {
    @Headers("Content-Type: application/json")
    @POST("images/generations")
    suspend fun generateImage(
        @Body request: FluxImageGenerationRequest
    ): Response<FluxImageGenerationResponse>
}
