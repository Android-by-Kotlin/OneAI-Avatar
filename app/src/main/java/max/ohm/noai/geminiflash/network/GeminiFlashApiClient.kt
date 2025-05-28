package max.ohm.noai.geminiflash.network

import max.ohm.noai.a4f.A4FClient.A4F_BASE_URL
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory

object GeminiFlashApiClient {
    val apiService: GeminiFlashApiService by lazy {
        Retrofit.Builder()
            .baseUrl(A4F_BASE_URL)
            .addConverterFactory(GsonConverterFactory.create())
            .build()
            .create(GeminiFlashApiService::class.java)
    }
}
