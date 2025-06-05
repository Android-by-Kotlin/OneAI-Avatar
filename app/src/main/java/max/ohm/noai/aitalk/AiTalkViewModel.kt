package max.ohm.noai.aitalk

import android.app.Activity
import android.content.Context
import android.content.Intent
import android.os.Bundle
import android.speech.RecognitionListener
import android.speech.RecognizerIntent
import android.speech.SpeechRecognizer
import android.util.Log
import androidx.activity.result.ActivityResultLauncher
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.setValue
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.launch
import max.ohm.noai.aiconversation.llm.OPENROUTER_API_KEY
import max.ohm.noai.aiconversation.llm.OpenRouterLLMService
import max.ohm.noai.aiconversation.llm.OpenRouterLLMService.ChatMessage
import max.ohm.noai.aiconversation.tts.GEMINI_TTS_API_KEY
import max.ohm.noai.aiconversation.tts.TtsService
import max.ohm.noai.chatbot.Message
import java.util.Locale

/**
 * ViewModel for AI Talk feature that integrates speech recognition, LLM, and TTS
 */
class AiTalkViewModel : ViewModel() {
    private val llmService = OpenRouterLLMService()
    private val ttsService = TtsService()
    private val TAG = "AiTalkViewModel"
    
    // Speech recognition
    private var speechRecognizer: SpeechRecognizer? = null
    private var appContext: Context? = null
    
    // UI state
    var messages by mutableStateOf(listOf<Message>())
        private set
    
    var isListening by mutableStateOf(false)
        private set
    
    var isProcessing by mutableStateOf(false)
        private set
    
    var isGeneratingSpeech by mutableStateOf(false)
        private set
    
    var errorMessage by mutableStateOf<String?>(null)
        private set
    
    var recognizedText by mutableStateOf("")
        private set
    
    var selectedLlmModel by mutableStateOf("deepseek/deepseek-r1-0528:free") // Default LLM model
        private set
    
    var selectedVoice by mutableStateOf("Kore") // Default TTS voice
        private set
    
    // Flag to indicate if direct speech recognition is available
    var useDirectSpeechRecognition by mutableStateOf(true)
        private set
    
    // Available LLM models
    val availableLlmModels = listOf(
        "deepseek/deepseek-r1-0528:free",
        "meta-llama/llama-3-70b-instruct:free",
        "google/gemini-1.5-pro:free",
        "anthropic/claude-3-sonnet:free"
    )
    
    // Available TTS voices
    val availableVoices = listOf(
        "Kore", "Puck", "Sage", "Fable", "Nova", "Echo", "Ember", "Atlas", "Breeze"
    )
    
    // Check API keys on initialization
    init {
        validateApiKeys()
    }
    
    /**
     * Validate API keys to ensure they are properly configured
     */
    private fun validateApiKeys() {
        if (OPENROUTER_API_KEY.isBlank() || (OPENROUTER_API_KEY.startsWith("sk-or-v1-") && OPENROUTER_API_KEY.contains("123"))) {
            Log.e(TAG, "Invalid OpenRouter API key. Please update your API key in OpenRouterApiKey.kt")
            errorMessage = "OpenRouter API key is not configured correctly. Please update it."
        }
        
        if (GEMINI_TTS_API_KEY.isBlank() || GEMINI_TTS_API_KEY == "YOUR_GEMINI_API_KEY_HERE") {
            Log.e(TAG, "Invalid Gemini TTS API key. Please update your API key in TtsApiKey.kt")
            errorMessage = "Gemini TTS API key is not configured correctly. Please update it."
        }
    }
    
    fun updateSelectedLlmModel(model: String) {
        selectedLlmModel = model
    }
    
    fun updateSelectedVoice(voice: String) {
        selectedVoice = voice
    }
    
    fun clearErrorMessage() {
        errorMessage = null
    }
    
    /**
     * Initialize the speech recognizer
     */
    fun initSpeechRecognizer(context: Context) {
        try {
            if (SpeechRecognizer.isRecognitionAvailable(context)) {
                speechRecognizer = SpeechRecognizer.createSpeechRecognizer(context)
                speechRecognizer?.setRecognitionListener(createRecognitionListener())
                appContext = context.applicationContext // Store the application context
                useDirectSpeechRecognition = true
                Log.d(TAG, "Speech recognition initialized successfully")
            } else {
                Log.w(TAG, "Direct speech recognition not available, will use activity-based recognition")
                useDirectSpeechRecognition = false
                appContext = context.applicationContext
            }
        } catch (e: Exception) {
            Log.e(TAG, "Error initializing speech recognizer: ${e.message}", e)
            useDirectSpeechRecognition = false
            appContext = context.applicationContext
        }
    }
    
    /**
     * Start listening for speech input
     */
    fun startListening(context: Context) {
        if (speechRecognizer == null) {
            initSpeechRecognizer(context)
        }
        
        if (useDirectSpeechRecognition && speechRecognizer != null) {
            val intent = Intent(RecognizerIntent.ACTION_RECOGNIZE_SPEECH)
            intent.putExtra(RecognizerIntent.EXTRA_LANGUAGE_MODEL, RecognizerIntent.LANGUAGE_MODEL_FREE_FORM)
            intent.putExtra(RecognizerIntent.EXTRA_LANGUAGE, Locale.getDefault())
            intent.putExtra(RecognizerIntent.EXTRA_MAX_RESULTS, 1)
            intent.putExtra(RecognizerIntent.EXTRA_PARTIAL_RESULTS, true)
            
            try {
                recognizedText = ""
                isListening = true
                speechRecognizer?.startListening(intent)
            } catch (e: Exception) {
                Log.e(TAG, "Error starting speech recognition: ${e.message}", e)
                errorMessage = "Error starting speech recognition: ${e.message}"
                isListening = false
                useDirectSpeechRecognition = false // Fall back to activity-based recognition
            }
        } else {
            // We'll use the activity launcher from the UI
            isListening = true
            recognizedText = "Launching speech recognition..."
        }
    }
    
    /**
     * Launch the system speech recognition activity
     */
    fun launchSystemSpeechRecognition(activityLauncher: ActivityResultLauncher<Intent>) {
        val intent = Intent(RecognizerIntent.ACTION_RECOGNIZE_SPEECH).apply {
            putExtra(RecognizerIntent.EXTRA_LANGUAGE_MODEL, RecognizerIntent.LANGUAGE_MODEL_FREE_FORM)
            putExtra(RecognizerIntent.EXTRA_LANGUAGE, Locale.getDefault())
            putExtra(RecognizerIntent.EXTRA_PROMPT, "Speak now...")
            putExtra(RecognizerIntent.EXTRA_MAX_RESULTS, 1)
        }
        
        try {
            recognizedText = ""
            isListening = true
            activityLauncher.launch(intent)
        } catch (e: Exception) {
            Log.e(TAG, "Error launching speech recognition: ${e.message}", e)
            errorMessage = "Error launching speech recognition: ${e.message}"
            isListening = false
        }
    }
    
    /**
     * Handle the result from system speech recognition activity
     */
    fun handleSpeechResult(resultCode: Int, data: Intent?) {
        isListening = false
        
        if (resultCode == Activity.RESULT_OK && data != null) {
            val results = data.getStringArrayListExtra(RecognizerIntent.EXTRA_RESULTS)
            if (!results.isNullOrEmpty()) {
                val text = results[0]
                recognizedText = text
                processRecognizedText(text)
            }
        } else {
            Log.d(TAG, "Speech recognition cancelled or failed")
        }
    }
    
    /**
     * Stop listening for speech input
     */
    fun stopListening() {
        speechRecognizer?.stopListening()
        isListening = false
    }
    
    /**
     * Create a recognition listener for speech recognition
     */
    private fun createRecognitionListener(): RecognitionListener {
        return object : RecognitionListener {
            override fun onReadyForSpeech(params: Bundle?) {
                Log.d(TAG, "Ready for speech")
            }
            
            override fun onBeginningOfSpeech() {
                Log.d(TAG, "Beginning of speech")
            }
            
            override fun onRmsChanged(rmsdB: Float) {
                // Update UI with sound level if needed
            }
            
            override fun onBufferReceived(buffer: ByteArray?) {
                // Buffer received
            }
            
            override fun onEndOfSpeech() {
                Log.d(TAG, "End of speech")
                isListening = false
            }
            
            override fun onError(error: Int) {
                val errorMsg = when (error) {
                    SpeechRecognizer.ERROR_AUDIO -> "Audio recording error"
                    SpeechRecognizer.ERROR_CLIENT -> "Client side error"
                    SpeechRecognizer.ERROR_INSUFFICIENT_PERMISSIONS -> "Insufficient permissions"
                    SpeechRecognizer.ERROR_NETWORK -> "Network error"
                    SpeechRecognizer.ERROR_NETWORK_TIMEOUT -> "Network timeout"
                    SpeechRecognizer.ERROR_NO_MATCH -> "No match found"
                    SpeechRecognizer.ERROR_RECOGNIZER_BUSY -> "RecognitionService busy"
                    SpeechRecognizer.ERROR_SERVER -> "Server error"
                    SpeechRecognizer.ERROR_SPEECH_TIMEOUT -> "No speech input"
                    else -> "Unknown error"
                }
                
                Log.e(TAG, "Error in speech recognition: $errorMsg")
                errorMessage = errorMsg
                isListening = false
                
                if (error == SpeechRecognizer.ERROR_INSUFFICIENT_PERMISSIONS || 
                    error == SpeechRecognizer.ERROR_CLIENT || 
                    error == SpeechRecognizer.ERROR_SERVER) {
                    useDirectSpeechRecognition = false // Fall back to activity-based recognition
                }
            }
            
            override fun onResults(results: Bundle?) {
                val matches = results?.getStringArrayList(SpeechRecognizer.RESULTS_RECOGNITION)
                if (!matches.isNullOrEmpty()) {
                    val recognizedText = matches[0]
                    this@AiTalkViewModel.recognizedText = recognizedText
                    Log.d(TAG, "Speech recognized: $recognizedText")
                    
                    // Process the recognized text
                    processRecognizedText(recognizedText)
                }
            }
            
            override fun onPartialResults(partialResults: Bundle?) {
                val matches = partialResults?.getStringArrayList(SpeechRecognizer.RESULTS_RECOGNITION)
                if (!matches.isNullOrEmpty()) {
                    val partialText = matches[0]
                    this@AiTalkViewModel.recognizedText = partialText
                }
            }
            
            override fun onEvent(eventType: Int, params: Bundle?) {
                // Event handling
            }
        }
    }
    
    /**
     * Process the recognized text and get a response from the LLM
     */
    private fun processRecognizedText(text: String) {
        if (text.isBlank()) {
            return
        }
        
        // Check API key before making request
        if (OPENROUTER_API_KEY.isBlank() || (OPENROUTER_API_KEY.startsWith("sk-or-v1-") && OPENROUTER_API_KEY.contains("123"))) {
            errorMessage = "OpenRouter API key is not configured correctly. Please update it."
            return
        }
        
        val userMessage = Message(text, true)
        messages = messages + userMessage
        isProcessing = true
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
                
                // Check if the response contains an error message
                if (response.startsWith("Error:") || response.startsWith("Authentication error:")) {
                    errorMessage = response
                    return@launch
                }
                
                // Create bot message
                val botMessage = Message(response, false)
                messages = messages + botMessage
                
                // Generate speech for the response
                appContext?.let { context ->
                    generateSpeechForText(context, response)
                }
            } catch (e: Exception) {
                Log.e(TAG, "Error processing speech: ${e.message}", e)
                errorMessage = "Error: ${e.message ?: "Unknown error"}"
            } finally {
                isProcessing = false
            }
        }
    }
    
    /**
     * Generate speech for text
     * 
     * @param context Android context for audio playback
     * @param text The text to convert to speech
     */
    private fun generateSpeechForText(context: Context, text: String) {
        // Check API key before making request
        if (GEMINI_TTS_API_KEY.isBlank() || GEMINI_TTS_API_KEY == "YOUR_GEMINI_API_KEY_HERE") {
            errorMessage = "Gemini TTS API key is not configured correctly. Please update it."
            return
        }
        
        isGeneratingSpeech = true
        
        viewModelScope.launch {
            try {
                val audioData = ttsService.generateSpeech(text, selectedVoice)
                
                if (audioData != null && audioData.isNotEmpty()) {
                    Log.d(TAG, "Received audio data of size: ${audioData.size} bytes")
                    
                    // Calculate estimated duration for logging
                    val sampleRate = 24000 // Default sample rate for Gemini TTS
                    val durationInSeconds = audioData.size / (sampleRate * 2.0)
                    Log.d(TAG, "Estimated audio duration: $durationInSeconds seconds")
                    
                    // Play the audio - this will block until playback is complete
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
     * Clean up resources when the ViewModel is no longer used
     */
    override fun onCleared() {
        super.onCleared()
        speechRecognizer?.destroy()
        speechRecognizer = null
        appContext = null
    }
    
    /**
     * Clear all messages
     */
    fun clearMessages() {
        messages = emptyList()
    }
} 