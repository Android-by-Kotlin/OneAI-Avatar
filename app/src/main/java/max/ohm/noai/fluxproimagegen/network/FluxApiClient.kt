package max.ohm.noai.fluxproimagegen.network

//import max.ohm.noai.fluxproimagegen.FluxImageGenApiKey // Uncomment and use the correct import
import max.ohm.noai.fluxproimagegen.FLUXPRO_API_KEY
import okhttp3.Interceptor
import okhttp3.OkHttpClient
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory

object FluxApiClient {

    private const val BASE_URL = "https://api.a4f.co/"

    private val authInterceptor = Interceptor { chain ->
        val original = chain.request()
        val requestBuilder = original.newBuilder()
            .header("Authorization", "Bearer ${FLUXPRO_API_KEY}") // Corrected API_KEY reference
            .header("Content-Type", "application/json")
        val request = requestBuilder.build()
        chain.proceed(request)
    }

    private val okHttpClient = OkHttpClient.Builder()
        .addInterceptor(authInterceptor)
        .build()

    val apiService: FluxApiService by lazy {
        Retrofit.Builder()
            .baseUrl(BASE_URL)
            .client(okHttpClient)
            .addConverterFactory(GsonConverterFactory.create())
            .build()
            .create(FluxApiService::class.java)
    }
}
