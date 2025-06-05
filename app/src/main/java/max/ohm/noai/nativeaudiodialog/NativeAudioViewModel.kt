package max.ohm.noai.nativeaudiodialog

import android.content.Context
import android.media.AudioTrack
import android.util.Log
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.setValue
import androidx.compose.ui.text.input.TextFieldValue
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.launch
import max.ohm.noai.aiconversation.tts.TtsService
import max.ohm.noai.chatbot.Message

/**
 * ViewModel for Native Audio Dialog feature
 */
class NativeAudioViewModel : ViewModel() {
    private val nativeAudioService = NativeAudioService()
    private val ttsService = TtsService() // For audio playback
    private val TAG = "NativeAudioViewModel"
    
    // UI state
    var messages by mutableStateOf(listOf<Message>())
        private set
    
    var inputText by mutableStateOf(TextFieldValue(""))
        private set
    
    var isLoading by mutableStateOf(false)
        private set
    
    var isGeneratingSpeech by mutableStateOf(false)
        private set
    
    var errorMessage by mutableStateOf<String?>(null)
        private set
    
    var selectedVoice by mutableStateOf("Zephyr") // Default voice
        private set
    
    // Available voices from the NativeAudioService
    val availableVoices = nativeAudioService.availableVoices
    
    fun updateInputText(newText: TextFieldValue) {
        inputText = newText
    }
    
    fun updateSelectedVoice(voice: String) {
        selectedVoice = voice
    }
    
    fun clearErrorMessage() {
        errorMessage = null
    }
    
    /**
     * Send a message and get an audio response
     * 
     * @param context Android context for audio playback
     */
    fun sendMessage(context: Context) {
        if (inputText.text.isBlank()) {
            errorMessage = "Please enter a message"
            return
        }
        
        val userMessage = Message(inputText.text, true)
        messages = messages + userMessage
        val userInput = inputText.text
        inputText = TextFieldValue("")
        isLoading = true
        errorMessage = null
        
        viewModelScope.launch {
            try {
                Log.d(TAG, "Generating audio response for: $userInput")
                isGeneratingSpeech = true
                
                // Generate audio response
                val audioData = nativeAudioService.generateAudioResponse(userInput, selectedVoice)
                
                if (audioData != null && audioData.isNotEmpty()) {
                    Log.d(TAG, "Received audio data of size: ${audioData.size} bytes")
                    
                    // Play the audio using TtsService's playAudio method
                    ttsService.playAudio(context, audioData)
                    
                    // Add a placeholder bot message (since we don't have the text)
                    val botMessage = Message("Audio response generated", false)
                    messages = messages + botMessage
                } else {
                    Log.e(TAG, "Failed to generate audio data")
                    errorMessage = "Failed to generate audio response"
                }
            } catch (e: Exception) {
                Log.e(TAG, "Error generating audio response: ${e.message}", e)
                errorMessage = "Error: ${e.message ?: "Unknown error"}"
            } finally {
                isLoading = false
                isGeneratingSpeech = false
            }
        }
    }
    
    /**
     * Clear all messages
     */
    fun clearMessages() {
        messages = emptyList()
    }
} 