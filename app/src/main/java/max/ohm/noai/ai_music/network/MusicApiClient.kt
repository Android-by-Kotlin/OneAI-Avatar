package max.ohm.noai.ai_music.network

import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory

object MusicApiClient {
    private const val BASE_URL = "https://api-inference.huggingface.co/"

    val riffusionApiService: RiffusionApi by lazy {
        Retrofit.Builder()
            .baseUrl(BASE_URL)
            .addConverterFactory(GsonConverterFactory.create())
            .build()
            .create(RiffusionApi::class.java)
    }
}
