package max.ohm.oneai.utils

import android.util.Log
import com.google.ai.client.generativeai.GenerativeModel
import com.google.ai.client.generativeai.type.GenerateContentResponse
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import max.ohm.oneai.chatbot.GEMINI_API_KEY

/**
 * Utility class for Gemini AI operations
 */
object GeminiUtils {
    private const val TAG = "GeminiUtils"
    
    /**
     * Test if the Gemini API key is valid and working
     * 
     * @return Result containing a boolean indicating success or failure
     */
    suspend fun testGeminiApiKey(): Result<Boolean> = withContext(Dispatchers.IO) {
        try {
            if (GEMINI_API_KEY.isBlank() || GEMINI_API_KEY == "YOUR_GEMINI_API_KEY_HERE") {
                Log.e(TAG, "Gemini API key is not configured")
                return@withContext Result.failure(Exception("Gemini API key is not configured"))
            }
            
            val model = GenerativeModel(
                modelName = "models/gemini-2.0-flash",
                apiKey = GEMINI_API_KEY
            )
            
            val response = model.generateContent("Hello, this is a test message to verify the API key.")
            
            if (response.text != null) {
                Log.d(TAG, "Gemini API key test successful")
                return@withContext Result.success(true)
            } else {
                Log.w(TAG, "Gemini API key test failed - empty response")
                return@withContext Result.failure(Exception("Empty response from Gemini API"))
            }
        } catch (e: Exception) {
            Log.e(TAG, "Error testing Gemini API key", e)
            return@withContext Result.failure(e)
        }
    }
    
    /**
     * Get detailed information about the Gemini API key status
     * 
     * @return A diagnostic string with information about the API key
     */
    suspend fun getGeminiApiKeyDiagnostics(): String = withContext(Dispatchers.IO) {
        val report = StringBuilder()
        
        try {
            report.append("API Key configured: ${GEMINI_API_KEY.isNotBlank() && GEMINI_API_KEY != "YOUR_GEMINI_API_KEY_HERE"}\n")
            report.append("API Key length: ${GEMINI_API_KEY.length}\n")
            
            if (GEMINI_API_KEY.isNotBlank() && GEMINI_API_KEY != "YOUR_GEMINI_API_KEY_HERE") {
                try {
                    val model = GenerativeModel(
                        modelName = "models/gemini-2.0-flash",
                        apiKey = GEMINI_API_KEY
                    )
                    
                    report.append("Model initialization: Success\n")
                    
                    try {
                        val response = model.generateContent("Test")
                        report.append("Test API call: Success\n")
                        report.append("Response received: ${response.text != null}\n")
                    } catch (e: Exception) {
                        report.append("Test API call: Failed\n")
                        report.append("Error: ${e.message}\n")
                    }
                } catch (e: Exception) {
                    report.append("Model initialization: Failed\n")
                    report.append("Error: ${e.message}\n")
                }
            }
        } catch (e: Exception) {
            report.append("Diagnostics error: ${e.message}\n")
        }
        
        report.toString()
    }
} 