package max.ohm.oneai.videogeneration.network

import android.util.Log
import okhttp3.OkHttpClient
import okhttp3.logging.HttpLoggingInterceptor
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import java.util.concurrent.TimeUnit

object VideoApiClient {
    private const val BASE_URL = "https://api.minimaxi.chat/"
    private const val TAG = "VideoApiClient"

    private val loggingInterceptor = HttpLoggingInterceptor().apply {
        level = HttpLoggingInterceptor.Level.BODY
    }

    private val okHttpClient = OkHttpClient.Builder()
        .addInterceptor(loggingInterceptor)
        .addInterceptor { chain ->
            val request = chain.request()
            // Add additional headers
            val newRequest = request.newBuilder()
                .header("Accept", "application/json")
                .header("Connection", "keep-alive")
                .build()
                
            Log.d(TAG, "Sending request to: ${newRequest.url}")
            try {
                val response = chain.proceed(newRequest)
                if (!response.isSuccessful) {
                    Log.e(TAG, "Error response: ${response.code} - ${response.message}")
                } else {
                    Log.d(TAG, "Successful response: ${response.code}")
                }
                response
            } catch (e: Exception) {
                Log.e(TAG, "Error during API call: ${e.message}", e)
                throw e
            }
        }
        .connectTimeout(60, TimeUnit.SECONDS)  // Increased from 30 to 60 seconds
        .readTimeout(60, TimeUnit.SECONDS)     // Increased from 30 to 60 seconds
        .writeTimeout(60, TimeUnit.SECONDS)    // Increased from 30 to 60 seconds
        .retryOnConnectionFailure(true)        // Enable retry on connection failure
        .build()

    val apiService: VideoApiService by lazy {
        Retrofit.Builder()
            .baseUrl(BASE_URL)
            .client(okHttpClient)
            .addConverterFactory(GsonConverterFactory.create())
            .build()
            .create(VideoApiService::class.java)
    }
}

