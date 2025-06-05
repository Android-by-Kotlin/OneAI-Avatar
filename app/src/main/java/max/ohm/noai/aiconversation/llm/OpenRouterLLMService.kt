package max.ohm.noai.aiconversation.llm

import android.util.Log
import com.google.gson.Gson
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import max.ohm.noai.chatbot.GEMINI_API_KEY
import okhttp3.MediaType.Companion.toMediaType
import okhttp3.OkHttpClient
import okhttp3.Request
import okhttp3.RequestBody.Companion.toRequestBody
import org.json.JSONObject
import java.util.concurrent.TimeUnit

/**
 * Service class for interacting with OpenRouter API
 */
class OpenRouterLLMService {
    private val TAG = "OpenRouterLLMService"
    private val client: OkHttpClient
    private val gson = Gson()
    
    init {
        // Create custom OkHttpClient with longer timeouts
        client = OkHttpClient.Builder()
            .connectTimeout(60, TimeUnit.SECONDS)
            .readTimeout(60, TimeUnit.SECONDS)
            .writeTimeout(60, TimeUnit.SECONDS)
            .build()
    }
    
    /**
     * Send a prompt to the OpenRouter API and get a response
     * 
     * @param prompt The user's prompt text
     * @param modelId The model ID to use (default is google/gemini-2.0-flash)
     * @return The generated response text
     */
    suspend fun getCompletion(prompt: String, modelId: String = "google/gemini-2.0-flash"): String {
        // Handle Gemini 2.0 Flash model which is not available via OpenRouter
        if (modelId == "google/gemini-2.0-flash") {
            return getGeminiCompletion(prompt)
        }
        
        return withContext(Dispatchers.IO) {
            try {
                val requestBody = """
                    {
                        "model": "$modelId",
                        "messages": [
                            {
                                "role": "user",
                                "content": "$prompt"
                            }
                        ],
                        "temperature": 0.7,
                        "max_tokens": 1000
                    }
                """.trimIndent()
                
                val request = Request.Builder()
                    .url("https://openrouter.ai/api/v1/chat/completions")
                    .addHeader("Content-Type", "application/json")
                    .addHeader("Authorization", "Bearer $OPENROUTER_API_KEY")
                    .addHeader("HTTP-Referer", SITE_URL)
                    .addHeader("X-Title", SITE_NAME)
                    .post(requestBody.toRequestBody("application/json".toMediaType()))
                    .build()
                
                Log.d(TAG, "Sending request to OpenRouter API with model: $modelId")
                
                val response = client.newCall(request).execute()
                val responseBody = response.body?.string() ?: return@withContext "No response from API"
                
                if (!response.isSuccessful) {
                    Log.e(TAG, "API Error: ${response.code} - $responseBody")
                    
                    // Try to parse error message for more specific feedback
                    return@withContext try {
                        val errorJson = JSONObject(responseBody)
                        val errorObj = errorJson.optJSONObject("error")
                        if (errorObj != null) {
                            val errorMessage = errorObj.optString("message", "Unknown error")
                            val errorCode = errorObj.optInt("code", 0)
                            
                            when (errorCode) {
                                401 -> "Authentication error: Please check your OpenRouter API key"
                                429 -> "Rate limit exceeded: Please try again later"
                                500 -> "OpenRouter server error: Please try again later"
                                else -> "Error $errorCode: $errorMessage"
                            }
                        } else {
                            "Error: ${response.code} - $responseBody"
                        }
                    } catch (e: Exception) {
                        "Error: ${response.code} - $responseBody"
                    }
                }
                
                // Parse the response
                val jsonResponse = gson.fromJson(responseBody, Map::class.java)
                val choices = jsonResponse["choices"] as? List<*>
                val firstChoice = choices?.firstOrNull() as? Map<*, *>
                val message = firstChoice?.get("message") as? Map<*, *>
                val content = message?.get("content") as? String
                
                content ?: "No response content"
            } catch (e: Exception) {
                Log.e(TAG, "Exception in getCompletion: ${e.message}", e)
                "Error: ${e.message ?: "Unknown error"}"
            }
        }
    }
    
    /**
     * Simple data class to represent a chat message
     */
    data class ChatMessage(val role: String, val content: String)
    
    /**
     * Get completion from Gemini API
     * 
     * @param prompt The user's prompt text
     * @return The generated response text
     */
    private suspend fun getGeminiCompletion(prompt: String): String {
        return withContext(Dispatchers.IO) {
            try {
                val requestBody = """
                    {
                        "contents": [
                            {
                                "parts": [
                                    {
                                        "text": "$prompt"
                                    }
                                ]
                            }
                        ],
                        "generationConfig": {
                            "temperature": 0.7,
                            "maxOutputTokens": 1000
                        }
                    }
                """.trimIndent()
                
                val request = Request.Builder()
                    .url("https://generativelanguage.googleapis.com/v1/models/gemini-2.0-flash:generateContent?key=$GEMINI_API_KEY")
                    .addHeader("Content-Type", "application/json")
                    .post(requestBody.toRequestBody("application/json".toMediaType()))
                    .build()
                
                Log.d(TAG, "Sending request to Gemini API")
                
                val response = client.newCall(request).execute()
                val responseBody = response.body?.string() ?: return@withContext "No response from API"
                
                if (!response.isSuccessful) {
                    Log.e(TAG, "API Error: ${response.code} - $responseBody")
                    return@withContext "Error: ${response.code} - $responseBody"
                }
                
                // Parse the response
                val jsonResponse = JSONObject(responseBody)
                val candidates = jsonResponse.getJSONArray("candidates")
                if (candidates.length() > 0) {
                    val content = candidates.getJSONObject(0).getJSONObject("content")
                    val parts = content.getJSONArray("parts")
                    if (parts.length() > 0) {
                        val text = parts.getJSONObject(0).getString("text")
                        return@withContext text
                    }
                }
                
                return@withContext "No response content from Gemini"
            } catch (e: Exception) {
                Log.e(TAG, "Exception in getGeminiCompletion: ${e.message}", e)
                return@withContext "Error: ${e.message ?: "Unknown error"}"
            }
        }
    }
    
    /**
     * Get chat completion from Gemini API
     * 
     * @param messages List of chat messages
     * @return The generated response text
     */
    private suspend fun getGeminiChatCompletion(messages: List<Any>): String {
        return withContext(Dispatchers.IO) {
            try {
                // Convert messages to Gemini format
                val geminiMessages = messages.map { msg ->
                    when (msg) {
                        is ChatMessage -> {
                            val role = if (msg.role == "user") "user" else "model"
                            """
                                {
                                    "role": "$role",
                                    "parts": [
                                        {
                                            "text": "${msg.content}"
                                        }
                                    ]
                                }
                            """.trimIndent()
                        }
                        else -> {
                            // Try to extract role and content
                            val role = try {
                                val roleMethod = msg.javaClass.getMethod("getRole")
                                val roleObj = roleMethod.invoke(msg)
                                if (roleObj.toString().contains("User", ignoreCase = true)) "user" else "model"
                            } catch (e: Exception) {
                                "user" // Default to user
                            }
                            
                            val content = try {
                                val contentMethod = msg.javaClass.getMethod("getContent")
                                contentMethod.invoke(msg).toString()
                            } catch (e: Exception) {
                                msg.toString()
                            }
                            
                            """
                                {
                                    "role": "$role",
                                    "parts": [
                                        {
                                            "text": "$content"
                                        }
                                    ]
                                }
                            """.trimIndent()
                        }
                    }
                }
                
                val requestBody = """
                    {
                        "contents": [
                            ${geminiMessages.joinToString(",\n")}
                        ],
                        "generationConfig": {
                            "temperature": 0.7,
                            "maxOutputTokens": 1000
                        }
                    }
                """.trimIndent()
                
                val request = Request.Builder()
                    .url("https://generativelanguage.googleapis.com/v1/models/gemini-2.0-flash:generateContent?key=$GEMINI_API_KEY")
                    .addHeader("Content-Type", "application/json")
                    .post(requestBody.toRequestBody("application/json".toMediaType()))
                    .build()
                
                Log.d(TAG, "Sending chat request to Gemini API")
                
                val response = client.newCall(request).execute()
                val responseBody = response.body?.string() ?: return@withContext "No response from API"
                
                if (!response.isSuccessful) {
                    Log.e(TAG, "API Error: ${response.code} - $responseBody")
                    return@withContext "Error: ${response.code} - $responseBody"
                }
                
                // Parse the response
                val jsonResponse = JSONObject(responseBody)
                val candidates = jsonResponse.getJSONArray("candidates")
                if (candidates.length() > 0) {
                    val content = candidates.getJSONObject(0).getJSONObject("content")
                    val parts = content.getJSONArray("parts")
                    if (parts.length() > 0) {
                        val text = parts.getJSONObject(0).getString("text")
                        return@withContext text
                    }
                }
                
                return@withContext "No response content from Gemini"
            } catch (e: Exception) {
                Log.e(TAG, "Exception in getGeminiChatCompletion: ${e.message}", e)
                return@withContext "Error: ${e.message ?: "Unknown error"}"
            }
        }
    }
    
    /**
     * Send a conversation history to the OpenRouter API and get a response
     * 
     * @param messages List of chat messages with roles and content
     * @param modelId The model ID to use (default is google/gemini-2.0-flash)
     * @return The generated response text
     */
    suspend fun getChatCompletion(
        messages: List<Any>,
        modelId: String = "google/gemini-2.0-flash"
    ): String {
        // Handle Gemini 2.0 Flash model which is not available via OpenRouter
        if (modelId == "google/gemini-2.0-flash") {
            return getGeminiChatCompletion(messages)
        }
        
        return withContext(Dispatchers.IO) {
            try {
                // Convert messages to the format expected by the API
                val messagesList = messages.map { msg ->
                    when (msg) {
                        is ChatMessage -> mapOf(
                            "role" to msg.role,
                            "content" to msg.content
                        )
                        else -> {
                            // Try to extract role and content from any object
                            val role = try {
                                val roleMethod = msg.javaClass.getMethod("getRole")
                                val roleObj = roleMethod.invoke(msg)
                                if (roleObj.toString().contains("User", ignoreCase = true)) "user" else "assistant"
                            } catch (e: Exception) {
                                "user" // Default to user if can't determine
                            }
                            
                            val content = try {
                                val contentMethod = msg.javaClass.getMethod("getContent")
                                contentMethod.invoke(msg).toString()
                            } catch (e: Exception) {
                                msg.toString() // Use toString as fallback
                            }
                            
                            mapOf(
                                "role" to role,
                                "content" to content
                            )
                        }
                    }
                }
                
                val requestMap = mapOf(
                    "model" to modelId,
                    "messages" to messagesList,
                    "temperature" to 0.7,
                    "max_tokens" to 1000
                )
                
                val requestBody = gson.toJson(requestMap)
                
                val request = Request.Builder()
                    .url("https://openrouter.ai/api/v1/chat/completions")
                    .addHeader("Content-Type", "application/json")
                    .addHeader("Authorization", "Bearer $OPENROUTER_API_KEY")
                    .addHeader("HTTP-Referer", SITE_URL)
                    .addHeader("X-Title", SITE_NAME)
                    .post(requestBody.toRequestBody("application/json".toMediaType()))
                    .build()
                
                Log.d(TAG, "Sending chat completion request to OpenRouter API with model: $modelId")
                
                val response = client.newCall(request).execute()
                val responseBody = response.body?.string() ?: return@withContext "No response from API"
                
                if (!response.isSuccessful) {
                    Log.e(TAG, "API Error: ${response.code} - $responseBody")
                    
                    // Try to parse error message for more specific feedback
                    return@withContext try {
                        val errorJson = JSONObject(responseBody)
                        val errorObj = errorJson.optJSONObject("error")
                        if (errorObj != null) {
                            val errorMessage = errorObj.optString("message", "Unknown error")
                            val errorCode = errorObj.optInt("code", 0)
                            
                            when (errorCode) {
                                401 -> "Authentication error: Please check your OpenRouter API key"
                                429 -> "Rate limit exceeded: Please try again later"
                                500 -> "OpenRouter server error: Please try again later"
                                else -> "Error $errorCode: $errorMessage"
                            }
                        } else {
                            "Error: ${response.code} - $responseBody"
                        }
                    } catch (e: Exception) {
                        "Error: ${response.code} - $responseBody"
                    }
                }
                
                // Parse the response
                val jsonResponse = gson.fromJson(responseBody, Map::class.java)
                val choices = jsonResponse["choices"] as? List<*>
                val firstChoice = choices?.firstOrNull() as? Map<*, *>
                val message = firstChoice?.get("message") as? Map<*, *>
                val content = message?.get("content") as? String
                
                content ?: "No response content"
            } catch (e: Exception) {
                Log.e(TAG, "Exception in getChatCompletion: ${e.message}", e)
                "Error: ${e.message ?: "Unknown error"}"
            }
        }
    }
} 