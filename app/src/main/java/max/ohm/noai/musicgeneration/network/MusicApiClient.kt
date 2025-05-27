package max.ohm.noai.musicgeneration.network

import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory

object MusicApiClient {
    private const val BASE_URL = "https://api-inference.huggingface.co/models/riffusion/riffusion/"
//private const val BASE_URL = "https://huggingface.co/riffusion/riffusion-model-v1"
    
    val instance: RiffusionApiService by lazy {
        Retrofit.Builder()
            .baseUrl(BASE_URL)
            .addConverterFactory(GsonConverterFactory.create())
            .build()
            .create(RiffusionApiService::class.java)
    }
}