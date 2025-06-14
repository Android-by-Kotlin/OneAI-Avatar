package max.ohm.oneai.aiconversation.tts

import android.content.Context
import android.media.AudioAttributes
import android.media.AudioFormat
import android.media.AudioManager
import android.media.AudioTrack
import android.os.Build
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
import java.io.File
import java.io.FileOutputStream
import java.util.concurrent.CountDownLatch
import java.util.concurrent.TimeUnit

/**
 * Service class for interacting with Gemini TTS API
 */
class TtsService {
    
    private val client: OkHttpClient
    private val TAG = "TtsService"
    
    init {
        // Create custom OkHttpClient with longer timeouts
        client = OkHttpClient.Builder()
            .connectTimeout(60, TimeUnit.SECONDS)
            .readTimeout(60, TimeUnit.SECONDS)
            .writeTimeout(60, TimeUnit.SECONDS)
            .build()
    }
    
    /**
     * Generate speech from text using Gemini TTS API
     * 
     * @param text The text to convert to speech
     * @param voiceName Optional voice name (default is "Kore")
     * @return Base64-encoded PCM audio data
     */
    suspend fun generateSpeech(text: String, voiceName: String = "Kore"): ByteArray? {
        return withContext(Dispatchers.IO) {
            try {
                val requestJson = JSONObject().apply {
                    put("contents", JSONArray().apply {
                        put(JSONObject().apply {
                            put("parts", JSONArray().apply {
                                put(JSONObject().apply {
                                    put("text", text)
                                })
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
                    })
                    
                    put("model", "gemini-2.5-flash-preview-tts")
                }
                
                val requestBody = requestJson.toString()
                    .toRequestBody("application/json".toMediaType())
                
                val request = Request.Builder()
                    .url("https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash-preview-tts:generateContent?key=$GEMINI_TTS_API_KEY")
                    .post(requestBody)
                    .build()
                
                Log.d(TAG, "Sending request to Gemini TTS API: ${requestJson.toString()}")
                
                val response = client.newCall(request).execute()
                val responseBody = response.body?.string() ?: return@withContext null
                
                if (!response.isSuccessful) {
                    Log.e(TAG, "Error: ${response.code} - $responseBody")
                    return@withContext null
                }
                
                // Parse the response to get the base64-encoded audio data
                val jsonResponse = JSONObject(responseBody)
                Log.d(TAG, "Received response: $jsonResponse")
                
                val candidates = jsonResponse.getJSONArray("candidates")
                if (candidates.length() > 0) {
                    val content = candidates.getJSONObject(0).getJSONObject("content")
                    val parts = content.getJSONArray("parts")
                    if (parts.length() > 0) {
                        val inlineData = parts.getJSONObject(0).getJSONObject("inlineData")
                        val base64Data = inlineData.getString("data")
                        
                        Log.d(TAG, "Successfully extracted audio data (base64 length: ${base64Data.length})")
                        return@withContext Base64.decode(base64Data, Base64.DEFAULT)
                    }
                }
                
                Log.e(TAG, "Failed to extract audio data from response")
                return@withContext null
            } catch (e: Exception) {
                Log.e(TAG, "Exception in generateSpeech: ${e.message}", e)
                e.printStackTrace()
                return@withContext null
            }
        }
    }
    
    /**
     * Generate speech for a conversation with multiple speakers
     * 
     * @param conversation Map of speaker names to their lines
     * @param speakerVoices Map of speaker names to voice names
     * @return Base64-encoded PCM audio data
     */
    suspend fun generateConversation(
        conversation: Map<String, String>,
        speakerVoices: Map<String, String> = mapOf("Speaker1" to "Kore", "Speaker2" to "Puck")
    ): ByteArray? {
        return withContext(Dispatchers.IO) {
            try {
                // Format the conversation text
                val conversationText = StringBuilder()
                conversation.forEach { (speaker, line) ->
                    conversationText.append("$speaker: $line\n")
                }
                
                // Create speaker voice configs
                val speakerVoiceConfigs = JSONArray()
                speakerVoices.forEach { (speaker, voice) ->
                    speakerVoiceConfigs.put(JSONObject().apply {
                        put("speaker", speaker)
                        put("voiceConfig", JSONObject().apply {
                            put("prebuiltVoiceConfig", JSONObject().apply {
                                put("voiceName", voice)
                            })
                        })
                    })
                }
                
                val requestJson = JSONObject().apply {
                    put("contents", JSONArray().apply {
                        put(JSONObject().apply {
                            put("parts", JSONArray().apply {
                                put(JSONObject().apply {
                                    put("text", "TTS the following conversation:\n$conversationText")
                                })
                            })
                        })
                    })
                    
                    put("generationConfig", JSONObject().apply {
                        put("responseModalities", JSONArray().apply {
                            put("AUDIO")
                        })
                        put("speechConfig", JSONObject().apply {
                            put("multiSpeakerVoiceConfig", JSONObject().apply {
                                put("speakerVoiceConfigs", speakerVoiceConfigs)
                            })
                        })
                    })
                    
                    put("model", "gemini-2.5-flash-preview-tts")
                }
                
                val requestBody = requestJson.toString()
                    .toRequestBody("application/json".toMediaType())
                
                val request = Request.Builder()
                    .url("https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash-preview-tts:generateContent?key=$GEMINI_TTS_API_KEY")
                    .post(requestBody)
                    .build()
                
                Log.d(TAG, "Sending conversation request to Gemini TTS API")
                
                val response = client.newCall(request).execute()
                val responseBody = response.body?.string() ?: return@withContext null
                
                if (!response.isSuccessful) {
                    Log.e(TAG, "Error: ${response.code} - $responseBody")
                    return@withContext null
                }
                
                // Parse the response to get the base64-encoded audio data
                val jsonResponse = JSONObject(responseBody)
                val candidates = jsonResponse.getJSONArray("candidates")
                if (candidates.length() > 0) {
                    val content = candidates.getJSONObject(0).getJSONObject("content")
                    val parts = content.getJSONArray("parts")
                    if (parts.length() > 0) {
                        val inlineData = parts.getJSONObject(0).getJSONObject("inlineData")
                        val base64Data = inlineData.getString("data")
                        return@withContext Base64.decode(base64Data, Base64.DEFAULT)
                    }
                }
                
                return@withContext null
            } catch (e: Exception) {
                Log.e(TAG, "Exception in generateConversation: ${e.message}", e)
                e.printStackTrace()
                return@withContext null
            }
        }
    }
    
    /**
     * Play PCM audio data through the device speaker
     * 
     * @param context Android context
     * @param pcmData PCM audio data
     * @param sampleRate Sample rate (default is 24000 Hz for Gemini TTS)
     */
    fun playAudio(context: Context, pcmData: ByteArray, sampleRate: Int = 24000) {
        try {
            Log.d(TAG, "Playing audio, data size: ${pcmData.size} bytes")
            
            // Get the audio service
            val audioManager = context.getSystemService(Context.AUDIO_SERVICE) as AudioManager
            
            // Ensure media volume is not zero
            val currentVolume = audioManager.getStreamVolume(AudioManager.STREAM_MUSIC)
            if (currentVolume == 0) {
                Log.w(TAG, "Media volume is zero, setting to 50%")
                val maxVolume = audioManager.getStreamMaxVolume(AudioManager.STREAM_MUSIC)
                audioManager.setStreamVolume(AudioManager.STREAM_MUSIC, maxVolume / 2, 0)
            }
            
            val minBufferSize = AudioTrack.getMinBufferSize(
                sampleRate,
                AudioFormat.CHANNEL_OUT_MONO,
                AudioFormat.ENCODING_PCM_16BIT
            )
            
            Log.d(TAG, "Minimum buffer size: $minBufferSize bytes")
            
            // Use a buffer size that's at least as large as the PCM data
            val bufferSize = Math.max(minBufferSize, pcmData.size)
            
            val audioAttributes = AudioAttributes.Builder()
                .setUsage(AudioAttributes.USAGE_MEDIA)
                .setContentType(AudioAttributes.CONTENT_TYPE_SPEECH)
                .build()
            
            val audioFormat = AudioFormat.Builder()
                .setSampleRate(sampleRate)
                .setEncoding(AudioFormat.ENCODING_PCM_16BIT)
                .setChannelMask(AudioFormat.CHANNEL_OUT_MONO)
                .build()
            
            // Create and configure the AudioTrack
            val audioTrack = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                AudioTrack.Builder()
                    .setAudioAttributes(audioAttributes)
                    .setAudioFormat(audioFormat)
                    .setBufferSizeInBytes(bufferSize)
                    .setTransferMode(AudioTrack.MODE_STATIC)
                    .build()
            } else {
                @Suppress("DEPRECATION")
                AudioTrack(
                    AudioAttributes.USAGE_MEDIA,
                    sampleRate,
                    AudioFormat.CHANNEL_OUT_MONO,
                    AudioFormat.ENCODING_PCM_16BIT,
                    bufferSize,
                    AudioTrack.MODE_STATIC
                )
            }
            
            // Write the PCM data to the AudioTrack
            val result = audioTrack.write(pcmData, 0, pcmData.size)
            Log.d(TAG, "AudioTrack.write result: $result")
            
            if (result > 0) {
                // Calculate the total playback duration
                val durationInSeconds = pcmData.size / (sampleRate * 2.0)
                Log.d(TAG, "Expected audio duration: $durationInSeconds seconds")
                
                // Create a latch to wait for playback completion
                val playbackCompleteLatch = CountDownLatch(1)
                
                // Set the notification marker position at the end of the audio
                audioTrack.setNotificationMarkerPosition(pcmData.size)
                
                // Set up a listener to know when playback is complete
                audioTrack.setPlaybackPositionUpdateListener(object : AudioTrack.OnPlaybackPositionUpdateListener {
                    override fun onMarkerReached(track: AudioTrack) {
                        Log.d(TAG, "AudioTrack marker reached, playback complete")
                        playbackCompleteLatch.countDown()
                    }
                    
                    override fun onPeriodicNotification(track: AudioTrack) {
                        // Not used
                    }
                })
                
                // Start playback
                audioTrack.play()
                Log.d(TAG, "AudioTrack playback started")
                
                // Calculate a reasonable timeout in case the marker is never reached
                // Add 3 seconds to the expected duration as a safety margin
                val timeoutSeconds = durationInSeconds.toLong() + 3
                
                try {
                    // Wait for playback to complete or timeout
                    val completed = playbackCompleteLatch.await(timeoutSeconds, TimeUnit.SECONDS)
                    if (!completed) {
                        Log.w(TAG, "Playback timeout after $timeoutSeconds seconds")
                    }
                } catch (e: InterruptedException) {
                    Log.e(TAG, "Playback wait interrupted", e)
                } finally {
                    // Release resources
                    if (audioTrack.playState == AudioTrack.PLAYSTATE_PLAYING) {
                        audioTrack.stop()
                    }
                    audioTrack.release()
                    Log.d(TAG, "AudioTrack playback completed and resources released")
                }
            } else {
                Log.e(TAG, "Failed to write audio data to AudioTrack")
            }
        } catch (e: Exception) {
            Log.e(TAG, "Exception in playAudio: ${e.message}", e)
            e.printStackTrace()
        }
    }
    
    /**
     * Save PCM audio data to a WAV file
     * 
     * @param context Android context
     * @param pcmData PCM audio data
     * @param fileName Name of the file to save
     * @return The file object if successful, null otherwise
     */
    fun saveAudioToFile(context: Context, pcmData: ByteArray, fileName: String): File? {
        return try {
            val file = File(context.filesDir, fileName)
            FileOutputStream(file).use { output ->
                // Write PCM data
                output.write(pcmData)
            }
            
            Log.d(TAG, "Audio saved to file: ${file.absolutePath}")
            file
        } catch (e: Exception) {
            Log.e(TAG, "Exception in saveAudioToFile: ${e.message}", e)
            e.printStackTrace()
            null
        }
    }
} 
