package max.ohm.noai.aiconversation.tts

import android.content.Context
import android.util.Log
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.setValue
import androidx.compose.ui.text.input.TextFieldValue
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.launch

class TtsViewModel : ViewModel() {
    private val ttsService = TtsService()
    private val TAG = "TtsViewModel"
    
    var inputText by mutableStateOf(TextFieldValue(""))
        private set
    
    var isLoading by mutableStateOf(false)
        private set
    
    var errorMessage by mutableStateOf<String?>(null)
        private set
    
    var selectedVoice by mutableStateOf("Kore")
        private set
    
    var isMultiSpeaker by mutableStateOf(false)
        private set
    
    var speaker1Name by mutableStateOf("Speaker1")
        private set
    
    var speaker2Name by mutableStateOf("Speaker2")
        private set
    
    var speaker1Voice by mutableStateOf("Kore")
        private set
    
    var speaker2Voice by mutableStateOf("Puck")
        private set
    
    // List of available voices from Gemini TTS
    val availableVoices = listOf(
        "Kore", "Puck", "Sage", "Fable", "Nova", "Echo", "Ember", "Atlas", "Breeze"
    )
    
    fun updateInputText(newText: TextFieldValue) {
        inputText = newText
    }
    
    fun updateSelectedVoice(voice: String) {
        selectedVoice = voice
    }
    
    fun updateMultiSpeakerMode(enabled: Boolean) {
        isMultiSpeaker = enabled
    }
    
    fun updateSpeaker1Name(name: String) {
        speaker1Name = name
    }
    
    fun updateSpeaker2Name(name: String) {
        speaker2Name = name
    }
    
    fun updateSpeaker1Voice(voice: String) {
        speaker1Voice = voice
    }
    
    fun updateSpeaker2Voice(voice: String) {
        speaker2Voice = voice
    }
    
    fun clearErrorMessage() {
        errorMessage = null
    }
    
    /**
     * Generate speech from the input text and play it
     * 
     * @param context Android context for audio playback
     */
    fun generateAndPlaySpeech(context: Context) {
        if (inputText.text.isBlank()) {
            errorMessage = "Please enter some text"
            return
        }
        
        isLoading = true
        errorMessage = null
        
        viewModelScope.launch {
            try {
                Log.d(TAG, "Generating speech for text: ${inputText.text.take(50)}${if (inputText.text.length > 50) "..." else ""}")
                
                val audioData = if (isMultiSpeaker) {
                    // Parse the input text to extract conversation
                    val conversation = parseConversation(inputText.text)
                    Log.d(TAG, "Parsed conversation with ${conversation.size} speakers: $conversation")
                    
                    // Set up speaker voices
                    val speakerVoices = mapOf(
                        speaker1Name to speaker1Voice,
                        speaker2Name to speaker2Voice
                    )
                    
                    ttsService.generateConversation(conversation, speakerVoices)
                } else {
                    // Simple single-voice TTS
                    ttsService.generateSpeech(inputText.text, selectedVoice)
                }
                
                if (audioData != null && audioData.isNotEmpty()) {
                    Log.d(TAG, "Received audio data of size: ${audioData.size} bytes")
                    
                    // Calculate estimated duration for logging
                    val sampleRate = 24000 // Default sample rate for Gemini TTS
                    val durationInSeconds = audioData.size / (sampleRate * 2.0)
                    Log.d(TAG, "Estimated audio duration: $durationInSeconds seconds")
                    
                    // Save the audio file first
                    val fileName = "tts_output_${System.currentTimeMillis()}.pcm"
                    val savedFile = ttsService.saveAudioToFile(context, audioData, fileName)
                    
                    if (savedFile != null) {
                        Log.d(TAG, "Audio saved to file: ${savedFile.absolutePath}")
                    }
                    
                    // Play the audio - this will block until playback is complete
                    ttsService.playAudio(context, audioData)
                } else {
                    Log.e(TAG, "Failed to generate audio data")
                    errorMessage = "Failed to generate speech. Please try again."
                }
            } catch (e: Exception) {
                Log.e(TAG, "Error generating speech: ${e.message}", e)
                errorMessage = "Error: ${e.message ?: "Unknown error"}"
                e.printStackTrace()
            } finally {
                isLoading = false
            }
        }
    }
    
    /**
     * Parse conversation text in the format "Speaker: Text"
     * 
     * @param text The conversation text
     * @return Map of speaker names to their lines
     */
    private fun parseConversation(text: String): Map<String, String> {
        val conversation = mutableMapOf<String, String>()
        
        // Default to the configured speaker names if parsing fails
        if (!text.contains(":")) {
            conversation[speaker1Name] = text
            return conversation
        }
        
        // Try to parse the conversation format
        val lines = text.split("\n")
        for (line in lines) {
            val parts = line.split(":", limit = 2)
            if (parts.size == 2) {
                val speaker = parts[0].trim()
                val speech = parts[1].trim()
                if (speaker.isNotEmpty() && speech.isNotEmpty()) {
                    conversation[speaker] = speech
                }
            }
        }
        
        // If parsing failed, use default speakers
        if (conversation.isEmpty()) {
            conversation[speaker1Name] = text
        }
        
        return conversation
    }
} 