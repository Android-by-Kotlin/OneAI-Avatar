package max.ohm.oneai.network

import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory

object ApiClient {

    private const val BASE_URL = "https://api.studio.nebius.com/v1/" // Base URL from task


    val instance: NebiusApiService by lazy {
        val retrofit = Retrofit.Builder()
            .baseUrl(BASE_URL)
            .addConverterFactory(GsonConverterFactory.create()) // Use Gson for JSON parsing
            .build()

        retrofit.create(NebiusApiService::class.java)
    }
}

