package max.ohm.noai.fluxproimagegen.network

import max.ohm.noai.a4f.A4FClient.A4F_API_KEY
import max.ohm.noai.a4f.A4FClient.A4F_BASE_URL
import okhttp3.Interceptor
import okhttp3.OkHttpClient
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import java.util.concurrent.TimeUnit

object FluxApiClient {

    private val authInterceptor = Interceptor { chain ->
        val original = chain.request()
        val requestBuilder = original.newBuilder()
            .header("Authorization", "Bearer $A4F_API_KEY") // Corrected API_KEY reference
            .header("Content-Type", "application/json")
        val request = requestBuilder.build()
        chain.proceed(request)
    }

    private val okHttpClient = OkHttpClient.Builder()
        .addInterceptor(authInterceptor)
        .connectTimeout(60, TimeUnit.SECONDS)
        .readTimeout(60, TimeUnit.SECONDS)
        .writeTimeout(60, TimeUnit.SECONDS)
        .build()

    val apiService: FluxApiService by lazy {
        Retrofit.Builder()
            .baseUrl(A4F_BASE_URL)
            .client(okHttpClient)
            .addConverterFactory(GsonConverterFactory.create())
            .build()
            .create(FluxApiService::class.java)
    }
}
