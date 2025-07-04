package max.ohm.oneai.a4f

import android.util.Log
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import max.ohm.oneai.a4f.A4FClient.A4F_API_KEY
import max.ohm.oneai.a4f.A4FClient.A4F_BASE_URL
import okhttp3.MediaType.Companion.toMediaType
import okhttp3.OkHttpClient
import okhttp3.Request
import okhttp3.RequestBody.Companion.toRequestBody
import org.json.JSONObject
import java.util.concurrent.TimeUnit

class A4FChatService {
    private val TAG = "A4FChatService"
    private val client: OkHttpClient = OkHttpClient.Builder()
        .connectTimeout(60, TimeUnit.SECONDS)
        .readTimeout(60, TimeUnit.SECONDS)
        .writeTimeout(60, TimeUnit.SECONDS)
        .build()

    suspend fun getCompletion(prompt: String, modelId: String = "provider-3/gpt-4.1-nano"): String {
        return withContext(Dispatchers.IO) {
            try {
                // Build JSON body properly
                val messageObj = JSONObject()
                messageObj.put("role", "user")
                messageObj.put("content", prompt)

                val messagesArray = org.json.JSONArray()
                messagesArray.put(messageObj)

                val bodyObj = JSONObject()
                bodyObj.put("model", modelId)
                bodyObj.put("messages", messagesArray)

                val requestBody = bodyObj.toString()

                val request = Request.Builder()
                    .url(A4F_BASE_URL + "chat/completions")
                    .addHeader("Content-Type", "application/json")
                    .addHeader("Authorization", "Bearer $A4F_API_KEY")
                    .post(requestBody.toRequestBody("application/json".toMediaType()))
                    .build()

                Log.d(TAG, "Sending request to A4F API with model: $modelId and body: $requestBody")

                val response = client.newCall(request).execute()
                val responseBody = response.body?.string() ?: return@withContext "No response from API"

                if (!response.isSuccessful) {
                    Log.e(TAG, "API Error: ${response.code} - $responseBody")
                    return@withContext "Error: ${response.code} - $responseBody"
                }

                // Parse the response
                val jsonResponse = JSONObject(responseBody)
                val choices = jsonResponse.optJSONArray("choices")
                if (choices != null && choices.length() > 0) {
                    val choice = choices.getJSONObject(0)
                    val message = choice.optJSONObject("message")
                    val content = message?.optString("content")
                    return@withContext content ?: "No response content"
                }
                "No response content"
            } catch (e: Exception) {
                Log.e(TAG, "Exception in getCompletion: ${e.message}", e)
                "Error: ${e.message ?: "Unknown error"}"
            }
        }
    }

    suspend fun getCompletionWithMessages(messagesArray: org.json.JSONArray, modelId: String = "provider-3/gpt-4.1-nano"): String {
        return withContext(Dispatchers.IO) {
            try {
                val bodyObj = JSONObject()
                bodyObj.put("model", modelId)
                bodyObj.put("messages", messagesArray)
                val requestBody = bodyObj.toString()
                val request = okhttp3.Request.Builder()
                    .url(A4F_BASE_URL + "chat/completions")
                    .addHeader("Content-Type", "application/json")
                    .addHeader("Authorization", "Bearer $A4F_API_KEY")
                    .post(requestBody.toRequestBody("application/json".toMediaType()))
                    .build()
                Log.d(TAG, "Sending follow-up request to A4F API with body: $requestBody")
                val response = client.newCall(request).execute()
                val responseBody = response.body?.string() ?: return@withContext "No response from API"
                if (!response.isSuccessful) {
                    Log.e(TAG, "API Error: ${response.code} - $responseBody")
                    return@withContext "Error: ${response.code} - $responseBody"
                }
                // Parse the response
                val jsonResponse = JSONObject(responseBody)
                val choices = jsonResponse.optJSONArray("choices")
                if (choices != null && choices.length() > 0) {
                    val choice = choices.getJSONObject(0)
                    val message = choice.optJSONObject("message")
                    val content = message?.optString("content")
                    return@withContext content ?: "No response content"
                }
                "No response content"
            } catch (e: Exception) {
                Log.e(TAG, "Exception in getCompletionWithMessages: ${e.message}", e)
                "Error: ${e.message ?: "Unknown error"}"
            }
        }
    }
}
