package max.ohm.oneai.liveavatar

import kotlinx.coroutines.runBlocking
import max.ohm.oneai.liveavatar.api.ApiClient
import retrofit2.HttpException

fun main() {
    runBlocking {
        val apiKey = "Yjc2MzUyZDgzM2M4NGEwM2E1MDM3MzcwOTI0NzQ1MGUtMTc0OTQxMTg0MA=="
        
        println("Testing HeyGen API connection...")
        println("API Key: ${apiKey.take(20)}...")
        
        try {
            val response = ApiClient.apiService.createSessionToken(apiKey)
            println("Success! Token: ${response.data.token}")
        } catch (e: HttpException) {
            println("HTTP Error ${e.code()}: ${e.message()}")
            val errorBody = e.response()?.errorBody()?.string()
            println("Error body: $errorBody")
        } catch (e: Exception) {
            println("Error: ${e.message}")
            e.printStackTrace()
        }
    }
}
