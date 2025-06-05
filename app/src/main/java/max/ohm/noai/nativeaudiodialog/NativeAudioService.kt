package max.ohm.noai.nativeaudiodialog

import android.util.Base64
import android.util.Log
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import okhttp3.MediaType.Companion.toMediaType
import okhttp3.OkHttpClient
import okhttp3.Request
import okhttp3.RequestBody.Companion.toRequestBody
import org.json.JSONArray
import org.json.JSONObject
import java.util.concurrent.TimeUnit

/**
 * Service class for interacting with Gemini 2.5 Flash Native Audio Dialog API
 */
class NativeAudioService {
    private val client: OkHttpClient
    private val TAG = "NativeAudioService"
    
    // Available voice options for the Native Audio Dialog
    val availableVoices = listOf(
        "Zephyr", "Breeze", "Ember", "Cove", "Tide", "Ridge", "Nova", "Lumen"
    )
    
    init {
        // Create custom OkHttpClient with longer timeouts
        client = OkHttpClient.Builder()
            .connectTimeout(60, TimeUnit.SECONDS)
            .readTimeout(60, TimeUnit.SECONDS)
            .writeTimeout(60, TimeUnit.SECONDS)
            .build()
    }
    
    /**
     * Generate audio response from text using Gemini 2.5 Flash Native Audio Dialog API
     * 
     * @param text The text to convert to speech
     * @param voiceName Voice name to use (default is "Zephyr")
     * @return Base64-encoded WAV audio data
     */
    suspend fun generateAudioResponse(text: String, voiceName: String = "Zephyr"): ByteArray? {
        return withContext(Dispatchers.IO) {
            try {
                val requestJson = JSONObject().apply {
                    put("contents", JSONArray().apply {
                        put(JSONObject().apply {
                            put("turns", JSONArray().apply {
                                put(text)
                            })
                        })
                    })
                    
                    put("generationConfig", JSONObject().apply {
                        put("responseModalities", JSONArray().apply {
                            put("AUDIO")
                        })
                        put("speechConfig", JSONObject().apply {
                            put("voiceConfig", JSONObject().apply {
                                put("prebuiltVoiceConfig", JSONObject().apply {
                                    put("voiceName", voiceName)
                                })
                            })
                        })
                        put("mediaResolution", "MEDIA_RESOLUTION_MEDIUM")
                        put("contextWindowCompression", JSONObject().apply {
                            put("triggerTokens", "25600")
                            put("slidingWindow", JSONObject().apply {
                                put("targetTokens", "12800")
                            })
                        })
                    })
                }
                
                val requestBody = requestJson.toString()
                    .toRequestBody("application/json".toMediaType())
                
                val request = Request.Builder()
                    .url("https://generativelanguage.googleapis.com/v1/models/gemini-2.5-flash-preview-native-audio-dialog:generateContent?key=$NATIVE_AUDIO_API_KEY")
                    .post(requestBody)
                    .build()
                
                Log.d(TAG, "Sending request to Gemini Native Audio Dialog API")
                
                val response = client.newCall(request).execute()
                val responseBody = response.body?.string() ?: return@withContext null
                
                if (!response.isSuccessful) {
                    Log.e(TAG, "API Error: ${response.code} - $responseBody")
                    return@withContext null
                }
                
                // Parse the response to get the audio data
                val jsonResponse = JSONObject(responseBody)
                Log.d(TAG, "Received response from Native Audio Dialog API")
                
                val candidates = jsonResponse.getJSONArray("candidates")
                if (candidates.length() > 0) {
                    val content = candidates.getJSONObject(0).getJSONObject("content")
                    val parts = content.getJSONArray("parts")
                    
                    // Extract audio data
                    for (i in 0 until parts.length()) {
                        val part = parts.getJSONObject(i)
                        if (part.has("inlineData")) {
                            val inlineData = part.getJSONObject("inlineData")
                            val base64Data = inlineData.getString("data")
                            val mimeType = inlineData.getString("mimeType")
                            
                            Log.d(TAG, "Successfully extracted audio data (base64 length: ${base64Data.length}, mimeType: $mimeType)")
                            
                            // Convert base64 to byte array
                            val audioData = Base64.decode(base64Data, Base64.DEFAULT)
                            
                            // If it's not WAV format, we need to convert it
                            if (!mimeType.contains("audio/wav")) {
                                Log.d(TAG, "Converting audio from $mimeType to WAV format")
                                return@withContext convertToWav(audioData, mimeType)
                            }
                            
                            return@withContext audioData
                        }
                    }
                    
                    // Extract text response if available
                    for (i in 0 until parts.length()) {
                        val part = parts.getJSONObject(i)
                        if (part.has("text")) {
                            val text = part.getString("text")
                            Log.d(TAG, "Text response: $text")
                        }
                    }
                }
                
                Log.e(TAG, "Failed to extract audio data from response")
                return@withContext null
            } catch (e: Exception) {
                Log.e(TAG, "Exception in generateAudioResponse: ${e.message}", e)
                e.printStackTrace()
                return@withContext null
            }
        }
    }
    
    /**
     * Convert audio data to WAV format
     * 
     * @param audioData The raw audio data
     * @param mimeType The MIME type of the audio data
     * @return WAV-formatted audio data
     */
    private fun convertToWav(audioData: ByteArray, mimeType: String): ByteArray {
        // Parse the MIME type to get audio format details
        val options = parseMimeType(mimeType)
        
        // Create WAV header
        val wavHeader = createWavHeader(audioData.size, options)
        
        // Combine header and audio data
        return wavHeader + audioData
    }
    
    /**
     * Parse MIME type to extract audio format details
     * 
     * @param mimeType The MIME type string
     * @return Audio format options
     */
    private fun parseMimeType(mimeType: String): WavConversionOptions {
        val parts = mimeType.split(";").map { it.trim() }
        val format = parts[0].split("/")[1]
        
        val options = WavConversionOptions(
            numChannels = 1,
            sampleRate = 24000,
            bitsPerSample = 16
        )
        
        // Parse format for bit depth
        if (format.startsWith("L")) {
            val bits = format.substring(1).toIntOrNull()
            if (bits != null) {
                options.bitsPerSample = bits
            }
        }
        
        // Parse parameters
        for (i in 1 until parts.size) {
            val param = parts[i].split("=")
            if (param.size == 2) {
                val key = param[0].trim()
                val value = param[1].trim()
                
                if (key == "rate") {
                    options.sampleRate = value.toIntOrNull() ?: options.sampleRate
                }
            }
        }
        
        return options
    }
    
    /**
     * Create a WAV header for the audio data
     * 
     * @param dataLength Length of the audio data
     * @param options Audio format options
     * @return WAV header as a byte array
     */
    private fun createWavHeader(dataLength: Int, options: WavConversionOptions): ByteArray {
        val byteRate = options.sampleRate * options.numChannels * options.bitsPerSample / 8
        val blockAlign = options.numChannels * options.bitsPerSample / 8
        
        val header = ByteArray(44)
        
        // RIFF header
        System.arraycopy("RIFF".toByteArray(), 0, header, 0, 4)
        writeInt(header, 4, 36 + dataLength) // ChunkSize
        System.arraycopy("WAVE".toByteArray(), 0, header, 8, 4)
        
        // fmt subchunk
        System.arraycopy("fmt ".toByteArray(), 0, header, 12, 4)
        writeInt(header, 16, 16) // Subchunk1Size (PCM)
        writeShort(header, 20, 1) // AudioFormat (1 = PCM)
        writeShort(header, 22, options.numChannels) // NumChannels
        writeInt(header, 24, options.sampleRate) // SampleRate
        writeInt(header, 28, byteRate) // ByteRate
        writeShort(header, 32, blockAlign) // BlockAlign
        writeShort(header, 34, options.bitsPerSample) // BitsPerSample
        
        // data subchunk
        System.arraycopy("data".toByteArray(), 0, header, 36, 4)
        writeInt(header, 40, dataLength) // Subchunk2Size
        
        return header
    }
    
    /**
     * Write a 32-bit integer to a byte array in little-endian format
     */
    private fun writeInt(array: ByteArray, offset: Int, value: Int) {
        array[offset] = (value and 0xFF).toByte()
        array[offset + 1] = ((value shr 8) and 0xFF).toByte()
        array[offset + 2] = ((value shr 16) and 0xFF).toByte()
        array[offset + 3] = ((value shr 24) and 0xFF).toByte()
    }
    
    /**
     * Write a 16-bit integer to a byte array in little-endian format
     */
    private fun writeShort(array: ByteArray, offset: Int, value: Int) {
        array[offset] = (value and 0xFF).toByte()
        array[offset + 1] = ((value shr 8) and 0xFF).toByte()
    }
    
    /**
     * Data class for WAV conversion options
     */
    data class WavConversionOptions(
        var numChannels: Int,
        var sampleRate: Int,
        var bitsPerSample: Int
    )
    
    /**
     * Operator to combine byte arrays
     */
    private operator fun ByteArray.plus(other: ByteArray): ByteArray {
        val result = ByteArray(this.size + other.size)
        System.arraycopy(this, 0, result, 0, this.size)
        System.arraycopy(other, 0, result, this.size, other.size)
        return result
    }
} 