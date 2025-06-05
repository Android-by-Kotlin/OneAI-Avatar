package max.ohm.noai.aiconversation.conversation

import android.content.Context
import android.util.Log
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.setValue
import androidx.compose.ui.text.input.TextFieldValue
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.launch
import max.ohm.noai.aiconversation.llm.OpenRouterLLMService
import max.ohm.noai.aiconversation.llm.OpenRouterLLMService.ChatMessage
import max.ohm.noai.aiconversation.tts.TtsService
import max.ohm.noai.chatbot.Message

/**
 * ViewModel that integrates LLM and TTS functionality
 */
class AiConversationViewModel : ViewModel() {
    private val llmService = OpenRouterLLMService()
    private val ttsService = TtsService()
    private val TAG = "AiConversationViewModel"
    
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
    
    var selectedLlmModel by mutableStateOf("meta-llama/llama-3-70b-instruct:free") // Default LLM model
        private set
    
    var selectedVoice by mutableStateOf("Kore") // Default TTS voice
        private set
    
    var autoTts by mutableStateOf(true) // Automatically generate speech for AI responses
        private set
    
    // Available LLM models
    val availableLlmModels = listOf(
        "meta-llama/llama-3-70b-instruct:free",
        "google/gemini-1.5-pro:free",
        "anthropic/claude-3-sonnet:free",
        "deepseek/deepseek-r1-0528:free"
    )
    
    // Available TTS voices
    val availableVoices = listOf(
        "Kore", "Puck", "Sage", "Fable", "Nova", "Echo", "Ember", "Atlas", "Breeze"
    )
    
    fun updateInputText(newText: TextFieldValue) {
        inputText = newText
    }
    
    fun updateSelectedLlmModel(model: String) {
        selectedLlmModel = model
    }
    
    fun updateSelectedVoice(voice: String) {
        selectedVoice = voice
    }
    
    fun updateAutoTts(enabled: Boolean) {
        autoTts = enabled
    }
    
    fun clearErrorMessage() {
        errorMessage = null
    }
    
    /**
     * Send a message to the LLM and optionally generate speech for the response
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
        inputText = TextFieldValue("")
        isLoading = true
        errorMessage = null
        
        viewModelScope.launch {
            try {
                // Convert messages to the format expected by the LLM service
                val chatMessages = messages.map { msg ->
                    ChatMessage(
                        role = if (msg.isUser) "user" else "assistant",
                        content = msg.text
                    )
                }
                
                // Get response from LLM
                val response = llmService.getChatCompletion(chatMessages, selectedLlmModel)
                
                // Create bot message
                val botMessage = Message(response, false)
                messages = messages + botMessage
                
                // Generate speech for the response if auto-TTS is enabled
                if (autoTts) {
                    generateSpeechForText(context, response)
                }
            } catch (e: Exception) {
                Log.e(TAG, "Error sending message: ${e.message}", e)
                errorMessage = "Error: ${e.message ?: "Unknown error"}"
            } finally {
                isLoading = false
            }
        }
    }
    
    /**
     * Generate speech for a specific message
     * 
     * @param context Android context for audio playback
     * @param messageIndex Index of the message in the messages list
     */
    fun generateSpeechForMessage(context: Context, messageIndex: Int) {
        if (messageIndex < 0 || messageIndex >= messages.size) {
            errorMessage = "Invalid message index"
            return
        }
        
        val message = messages[messageIndex]
        generateSpeechForText(context, message.text)
    }
    
    /**
     * Generate speech for text
     * 
     * @param context Android context for audio playback
     * @param text The text to convert to speech
     */
    private fun generateSpeechForText(context: Context, text: String) {
        isGeneratingSpeech = true
        
        viewModelScope.launch {
            try {
                val audioData = ttsService.generateSpeech(text, selectedVoice)
                
                if (audioData != null && audioData.isNotEmpty()) {
                    Log.d(TAG, "Received audio data of size: ${audioData.size} bytes")
                    
                    // Play the audio
                    ttsService.playAudio(context, audioData)
                } else {
                    Log.e(TAG, "Failed to generate audio data")
                    errorMessage = "Failed to generate speech"
                }
            } catch (e: Exception) {
                Log.e(TAG, "Error generating speech: ${e.message}", e)
                errorMessage = "Error generating speech: ${e.message ?: "Unknown error"}"
            } finally {
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