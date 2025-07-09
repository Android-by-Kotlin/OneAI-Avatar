package max.ohm.oneai.liveavatar.services

import android.content.Context
import android.content.Intent
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.speech.RecognitionListener
import android.speech.RecognizerIntent
import android.speech.SpeechRecognizer
import android.util.Log
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import java.util.Locale

class SpeechRecognitionService(private val context: Context) {
    
    companion object {
        private const val TAG = "SpeechRecognition"
    }
    
    private var speechRecognizer: SpeechRecognizer? = null
    private var recognitionIntent: Intent? = null
    
    private val _isListening = MutableStateFlow(false)
    val isListening: StateFlow<Boolean> = _isListening
    
    private val _recognizedText = MutableStateFlow("")
    val recognizedText: StateFlow<String> = _recognizedText
    
    private val _error = MutableStateFlow<String?>(null)
    val error: StateFlow<String?> = _error
    
    private val _partialResult = MutableStateFlow("")
    val partialResult: StateFlow<String> = _partialResult
    
    private val _isContinuousMode = MutableStateFlow(false)
    val isContinuousMode: StateFlow<Boolean> = _isContinuousMode
    
    init {
        setupSpeechRecognizer()
    }
    
    private fun setupSpeechRecognizer() {
        // Check if speech recognition is available
        if (!SpeechRecognizer.isRecognitionAvailable(context)) {
            _error.value = "Speech recognition is not available. Please ensure Google app is installed and updated."
            Log.e(TAG, "Speech recognition not available on this device")
            // Try to create recognizer anyway as some devices report false negative
        }
        
        speechRecognizer = SpeechRecognizer.createSpeechRecognizer(context)
        
        recognitionIntent = Intent(RecognizerIntent.ACTION_RECOGNIZE_SPEECH).apply {
            putExtra(RecognizerIntent.EXTRA_LANGUAGE_MODEL, RecognizerIntent.LANGUAGE_MODEL_FREE_FORM)
            putExtra(RecognizerIntent.EXTRA_LANGUAGE, Locale.getDefault())
            putExtra(RecognizerIntent.EXTRA_PARTIAL_RESULTS, true)
            putExtra(RecognizerIntent.EXTRA_MAX_RESULTS, 1)
putExtra(RecognizerIntent.EXTRA_PREFER_OFFLINE, false)
            putExtra(RecognizerIntent.EXTRA_SPEECH_INPUT_COMPLETE_SILENCE_LENGTH_MILLIS, 1000)
            putExtra(RecognizerIntent.EXTRA_SPEECH_INPUT_MINIMUM_LENGTH_MILLIS, 100)
        }
        
        speechRecognizer?.setRecognitionListener(object : RecognitionListener {
            override fun onReadyForSpeech(params: Bundle?) {
                Log.d(TAG, "Ready for speech")
                _error.value = null
            }
            
            override fun onBeginningOfSpeech() {
                Log.d(TAG, "Speech started")
                _partialResult.value = ""
            }
            
            override fun onRmsChanged(rmsdB: Float) {
                // Audio level changed
            }
            
            override fun onBufferReceived(buffer: ByteArray?) {
                // Buffer received
            }
            
            override fun onEndOfSpeech() {
                Log.d(TAG, "Speech ended")
            }
            
            override fun onError(error: Int) {
                val errorMessage = when (error) {
                    SpeechRecognizer.ERROR_AUDIO -> "Audio recording error"
                    SpeechRecognizer.ERROR_CLIENT -> "Client side error"
                    SpeechRecognizer.ERROR_INSUFFICIENT_PERMISSIONS -> "Insufficient permissions"
                    SpeechRecognizer.ERROR_NETWORK -> "Network error"
                    SpeechRecognizer.ERROR_NETWORK_TIMEOUT -> "Network timeout"
                    SpeechRecognizer.ERROR_NO_MATCH -> "No speech match"
                    SpeechRecognizer.ERROR_RECOGNIZER_BUSY -> "Recognition service busy"
                    SpeechRecognizer.ERROR_SERVER -> "Server error"
                    SpeechRecognizer.ERROR_SPEECH_TIMEOUT -> "No speech input"
                    else -> "Unknown error"
                }
                Log.e(TAG, "Recognition error: $errorMessage (code: $error)")
                _error.value = errorMessage
                
                // In continuous mode, restart listening after errors (except for critical ones)
                if (_isContinuousMode.value && error != SpeechRecognizer.ERROR_INSUFFICIENT_PERMISSIONS 
                    && error != SpeechRecognizer.ERROR_CLIENT) {
                    // Restart listening after a brief delay
                    Log.d(TAG, "Restarting listening due to error in continuous mode")
                    Handler(Looper.getMainLooper()).postDelayed({
                        if (_isContinuousMode.value) {
                            startListening()
                        }
                    }, 500)
                } else {
                    _isListening.value = false
                    _isContinuousMode.value = false
                }
            }
            
            override fun onResults(results: Bundle?) {
                val matches = results?.getStringArrayList(SpeechRecognizer.RESULTS_RECOGNITION)
                if (!matches.isNullOrEmpty()) {
                    val text = matches[0]
                    Log.d(TAG, "Final result: $text")
                    _recognizedText.value = text
                    _partialResult.value = ""
                }
                
                // In continuous mode, restart listening immediately
                if (_isContinuousMode.value) {
                    Log.d(TAG, "Restarting listening in continuous mode")
                    // Small delay to allow the system to process
                    Handler(Looper.getMainLooper()).postDelayed({
                        if (_isContinuousMode.value) {
                            startListening()
                        }
                    }, 100)
                } else {
                    _isListening.value = false
                }
            }
            
            override fun onPartialResults(partialResults: Bundle?) {
                val matches = partialResults?.getStringArrayList(SpeechRecognizer.RESULTS_RECOGNITION)
                if (!matches.isNullOrEmpty()) {
                    val text = matches[0]
                    Log.d(TAG, "Partial result: $text")
                    _partialResult.value = text
                }
            }
            
            override fun onEvent(eventType: Int, params: Bundle?) {
                Log.d(TAG, "Event: $eventType")
            }
        })
    }
    
    fun startListening() {
        if (_isListening.value) {
            Log.w(TAG, "Already listening")
            return
        }
        
        try {
            _recognizedText.value = ""
            _partialResult.value = ""
            _error.value = null
            speechRecognizer?.startListening(recognitionIntent)
            _isListening.value = true
            Log.d(TAG, "Started listening")
        } catch (e: Exception) {
            Log.e(TAG, "Failed to start listening", e)
            _error.value = "Failed to start listening: ${e.message}"
            _isListening.value = false
        }
    }
    
    fun startContinuousListening() {
        _isContinuousMode.value = true
        startListening()
    }
    
    fun stopContinuousListening() {
        _isContinuousMode.value = false
        stopListening()
    }
    
    fun stopListening() {
        if (!_isListening.value && !_isContinuousMode.value) {
            Log.w(TAG, "Not currently listening")
            return
        }
        
        try {
            _isContinuousMode.value = false
            speechRecognizer?.stopListening()
            _isListening.value = false
            Log.d(TAG, "Stopped listening")
        } catch (e: Exception) {
            Log.e(TAG, "Failed to stop listening", e)
            _error.value = "Failed to stop listening: ${e.message}"
        }
    }
    
    fun destroy() {
        _isContinuousMode.value = false
        stopListening()
        speechRecognizer?.destroy()
        speechRecognizer = null
    }
}
