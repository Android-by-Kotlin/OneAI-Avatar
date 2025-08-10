package max.ohm.oneai.videogeneration.debug

import android.util.Log
import max.ohm.oneai.videogeneration.modelslab.ModelsLabApiClient
import max.ohm.oneai.videogeneration.modelslab.ModelsLabTextToVideoRequest
import max.ohm.oneai.videogeneration.modelslab.SeedanceFetchRequest
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import org.json.JSONObject

/**
 * Debug helper class for troubleshooting video generation issues
 */
object VideoGenerationDebugHelper {
    private const val TAG = "VideoGenDebug"
    
    /**
     * Test Seedance T2V API connectivity and response
     */
    suspend fun testSeedanceT2VConnection(): String {
        return withContext(Dispatchers.IO) {
            try {
                Log.d(TAG, "=== Starting Seedance T2V Connection Test ===")
                Log.d(TAG, "API Key: ${ModelsLabApiClient.API_KEY.take(10)}...")
                Log.d(TAG, "Base URL: https://modelslab.com/")
                
                // Create a minimal test request
                val testRequest = ModelsLabTextToVideoRequest(
                    key = ModelsLabApiClient.API_KEY,
                    prompt = "A beautiful sunset over mountains, test video"
                )
                
                Log.d(TAG, "Request Model: ${testRequest.modelId}")
                Log.d(TAG, "Request Resolution: ${testRequest.resolution}")
                Log.d(TAG, "Request FPS: ${testRequest.fps}")
                Log.d(TAG, "Request Frames: ${testRequest.numFrames}")
                
                // Send the request
                val response = ModelsLabApiClient.apiService.generateTextToVideo(testRequest)
                
                Log.d(TAG, "Response Code: ${response.code()}")
                Log.d(TAG, "Response Message: ${response.message()}")
                
                if (response.isSuccessful) {
                    val body = response.body()
                    Log.d(TAG, "Response Body Status: ${body?.status}")
                    Log.d(TAG, "Response Body ID: ${body?.id}")
                    Log.d(TAG, "Response Body Message: ${body?.message}")
                    Log.d(TAG, "Response Body Error: ${body?.error}")
                    Log.d(TAG, "Response Body Output URLs: ${body?.outputUrls}")
                    Log.d(TAG, "Response Body ETA: ${body?.eta}")
                    
                    "Success: Status=${body?.status}, ID=${body?.id}"
                } else {
                    val errorBody = response.errorBody()?.string()
                    Log.e(TAG, "Error Body: $errorBody")
                    
                    // Try to parse error as JSON
                    try {
                        val errorJson = JSONObject(errorBody ?: "{}")
                        Log.e(TAG, "Error JSON: $errorJson")
                    } catch (e: Exception) {
                        Log.e(TAG, "Could not parse error as JSON")
                    }
                    
                    "Error: Code=${response.code()}, Message=${response.message()}"
                }
            } catch (e: Exception) {
                Log.e(TAG, "Exception during test: ${e.message}", e)
                e.printStackTrace()
                "Exception: ${e.message}"
            } finally {
                Log.d(TAG, "=== Seedance T2V Connection Test Complete ===")
            }
        }
    }
    
    /**
     * Test polling status for a given request ID
     */
    suspend fun testPollingStatus(requestId: Long): String {
        return withContext(Dispatchers.IO) {
            try {
                Log.d(TAG, "=== Testing Polling Status for ID: $requestId ===")
                
                val fetchRequest = SeedanceFetchRequest(
                    key = ModelsLabApiClient.API_KEY
                )
                
                val response = ModelsLabApiClient.apiService.checkSeedanceGenerationStatus(
                    requestId = requestId,
                    body = fetchRequest
                )
                
                Log.d(TAG, "Poll Response Code: ${response.code()}")
                
                if (response.isSuccessful) {
                    val body = response.body()
                    Log.d(TAG, "Poll Status: ${body?.status}")
                    Log.d(TAG, "Poll Output URLs: ${body?.outputUrls}")
                    Log.d(TAG, "Poll ETA: ${body?.eta}")
                    Log.d(TAG, "Poll Generation Time: ${body?.generationTime}")
                    
                    "Poll Success: Status=${body?.status}"
                } else {
                    val errorBody = response.errorBody()?.string()
                    Log.e(TAG, "Poll Error Body: $errorBody")
                    "Poll Error: Code=${response.code()}"
                }
            } catch (e: Exception) {
                Log.e(TAG, "Poll Exception: ${e.message}", e)
                "Poll Exception: ${e.message}"
            } finally {
                Log.d(TAG, "=== Polling Status Test Complete ===")
            }
        }
    }
    
    /**
     * Analyze common issues and provide diagnostic information
     */
    fun diagnoseCommonIssues(): List<String> {
        val issues = mutableListOf<String>()
        
        // Check API key format
        if (ModelsLabApiClient.API_KEY.isEmpty()) {
            issues.add("API Key is empty")
        } else if (ModelsLabApiClient.API_KEY.length < 20) {
            issues.add("API Key seems too short")
        }
        
        // Log current configuration
        Log.d(TAG, "=== Current Configuration ===")
        Log.d(TAG, "API Key Length: ${ModelsLabApiClient.API_KEY.length}")
        Log.d(TAG, "API Key First 10 chars: ${ModelsLabApiClient.API_KEY.take(10)}")
        
        if (issues.isEmpty()) {
            issues.add("No obvious configuration issues found")
        }
        
        return issues
    }
}
