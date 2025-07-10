package max.ohm.oneai.imageediting.network

import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import okhttp3.OkHttpClient
import okhttp3.logging.HttpLoggingInterceptor
import java.util.concurrent.TimeUnit

object FaceGenApiClient {
    private const val BASE_URL = "https://modelslab.com/"
    
    private val loggingInterceptor = HttpLoggingInterceptor().apply {
        level = HttpLoggingInterceptor.Level.BODY
    }
    
    private val okHttpClient = OkHttpClient.Builder()
        .addInterceptor(loggingInterceptor)
        .connectTimeout(120, TimeUnit.SECONDS)  // Increased from 60 to 120 seconds
        .readTimeout(120, TimeUnit.SECONDS)     // Increased from 60 to 120 seconds
        .writeTimeout(120, TimeUnit.SECONDS)    // Increased from 60 to 120 seconds
        .build()
    
    private val retrofit = Retrofit.Builder()
        .baseUrl(BASE_URL)
        .client(okHttpClient)
        .addConverterFactory(GsonConverterFactory.create())
        .build()
    
    val apiService: FaceGenApiService = retrofit.create(FaceGenApiService::class.java)
}
