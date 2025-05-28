package max.ohm.noai.llama4mavrick

import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory

object LlamaMaverickApiClient {

    private const val BASE_URL = "https://openrouter.ai/api/v1/"

    val apiService: LlamaMaverickApiService by lazy {
        Retrofit.Builder()
            .baseUrl(BASE_URL)
            .addConverterFactory(GsonConverterFactory.create())
            .build()
            .create(LlamaMaverickApiService::class.java)
    }
}