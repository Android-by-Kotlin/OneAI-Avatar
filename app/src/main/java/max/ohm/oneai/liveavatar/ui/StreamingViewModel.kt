package max.ohm.oneai.liveavatar.ui

import android.app.Application
import android.speech.SpeechRecognizer
import android.util.Log
import android.widget.Toast
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.setValue
import androidx.lifecycle.AndroidViewModel
import androidx.lifecycle.viewModelScope
import com.google.gson.Gson
import io.livekit.android.LiveKit
import io.livekit.android.RoomOptions
import io.livekit.android.events.RoomEvent
import io.livekit.android.events.collect
import io.livekit.android.room.Room
import io.livekit.android.room.participant.RemoteParticipant
import io.livekit.android.room.track.RemoteVideoTrack
import io.livekit.android.room.track.VideoTrack
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.delay
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import max.ohm.oneai.liveavatar.api.ApiClient
import max.ohm.oneai.liveavatar.data.ErrorResponse
import max.ohm.oneai.liveavatar.data.StreamingNewRequest
import max.ohm.oneai.liveavatar.data.StreamingNewResponse
import max.ohm.oneai.liveavatar.data.StreamingStartRequest
import max.ohm.oneai.liveavatar.data.TaskRequest
import max.ohm.oneai.liveavatar.data.VoiceConfig
import max.ohm.oneai.liveavatar.data.WebSocketMessage
import max.ohm.oneai.liveavatar.services.AudioService
import max.ohm.oneai.liveavatar.services.SpeechRecognitionService
import okhttp3.OkHttpClient
import okhttp3.Request
import okhttp3.Response
import okhttp3.WebSocket
import okhttp3.WebSocketListener
import retrofit2.HttpException

class StreamingViewModel(application: Application) : AndroidViewModel(application) {

    private val apiService = ApiClient.apiService
    private val appContext = application.applicationContext
    
    // Speech Recognition Service
    private val speechRecognitionService = SpeechRecognitionService(appContext)
    private val audioService = AudioService(appContext)
    val isListening = speechRecognitionService.isListening
    val voicePartialResult = speechRecognitionService.partialResult
    val voiceError = speechRecognitionService.error
    val isContinuousMode = speechRecognitionService.isContinuousMode
    
    // Alternative: Intent-based speech recognition
    private val _showSpeechDialog = MutableStateFlow(false)
    val showSpeechDialog: StateFlow<Boolean> = _showSpeechDialog
    
    // LiveKit Room
    private val _room = MutableStateFlow<Room?>(null)
    val room: StateFlow<Room?> = _room
    
    // WebSocket for chat
    private var webSocket: WebSocket? = null
    private val okHttpClient = OkHttpClient.Builder().build()

    var sessionToken by mutableStateOf("")
    var sessionId by mutableStateOf("")
    var wsUrl by mutableStateOf("")
    var token by mutableStateOf("")
    var loading by mutableStateOf(false)
    var connected by mutableStateOf(false)
    var text by mutableStateOf("")
    var speaking by mutableStateOf(false)
    var currentVideoTrack by mutableStateOf<VideoTrack?>(null)
    var currentApiKeyState by mutableStateOf("")

    companion object {
        private const val TAG = "StreamingViewModel"
        
        // List of avatar/voice combinations to try
        private val AVATAR_VOICE_COMBOS = listOf(
            // Official HeyGen avatar and voice from website

           // "bdb96423218c4a3fa458c785bc7bf8bd" to "b2ddcef2b1594794aa7f3a436d8cf8f2",
            "Elenora_FitnessCoach_public" to "0c418eab508d4030879c0c3381433806",

            // Fallback options
            //"Wayne_20240711" to "2d5b0e6cf36f460aa7fc47e3eee4ba54",
            "josh_lite3_20230714" to "077ab11b14f04ce0b49b5f6e5cc20979",
            "anna_public_20240108" to "1bd001e7e50f421d891986aad5158bc8"
        )
    }

    private var currentApiKeyIndex = 0
    
    private fun updateApiKeys(apiKeys: List<String>, exhaustedIndex: Int) {
        val exhaustedKey = apiKeys[exhaustedIndex]
        Log.d(TAG, "Marking API key ${exhaustedIndex + 1} as exhausted")
        
        // Update the current API key state display
        if (exhaustedIndex + 1 < apiKeys.size) {
            currentApiKeyState = "API Key ${exhaustedIndex + 2} of ${apiKeys.size} (Key ${exhaustedIndex + 1} exhausted)"
        }
    }

    // Store selected avatar for session creation
    var selectedAvatarId: String? by mutableStateOf(null)
    var selectedVoiceId: String? by mutableStateOf(null)
    var selectedAvatarName: String? by mutableStateOf(null)
    
    fun selectAvatar(avatarId: String, voiceId: String, avatarName: String) {
        selectedAvatarId = avatarId
        selectedVoiceId = voiceId
        selectedAvatarName = avatarName
    }
    
    fun createSessionWithAvatar(apiKeys: List<String>, avatarId: String, voiceId: String) {
        selectedAvatarId = avatarId
        selectedVoiceId = voiceId
        createSession(apiKeys)
    }
    
    fun createSession(apiKeys: List<String>) {
        viewModelScope.launch {
            try {
                loading = true
                var sessionCreated = false

                while (currentApiKeyIndex < apiKeys.size && !sessionCreated) {
                    val apiKey = apiKeys[currentApiKeyIndex]
                    Log.d(TAG, "Trying API key ${currentApiKeyIndex + 1} of ${apiKeys.size}")

                    try {
                        // Validate API key
                        if (apiKey.isBlank()) {
                            throw IllegalArgumentException("API key is required")
                        }

                        Log.d(TAG, "Starting session creation with API key: ${apiKey.take(10)}...")

                        // Step 1: Get session token
                        Log.d(TAG, "Getting session token...")
                        val tokenResponse = try {
                            withContext(Dispatchers.IO) {
                                apiService.createSessionToken(apiKey)
                            }
                        } catch (e: HttpException) {
                            val errorBody = e.response()?.errorBody()?.string()
                            Log.e(TAG, "HTTP ${e.code()} error: $errorBody")

                            // Check if it's a quota/credits error
                            if (errorBody?.contains("quota", ignoreCase = true) == true || 
                                errorBody?.contains("credit", ignoreCase = true) == true ||
                                errorBody?.contains("limit", ignoreCase = true) == true ||
                                e.code() == 402) { // Payment Required
                                Log.w(TAG, "API key ${currentApiKeyIndex + 1} appears to have exhausted credits")
                                updateApiKeys(apiKeys, currentApiKeyIndex)
                                currentApiKeyIndex++
                                continue // Try next API key
                            }
                            
                            // Parse error response
                            try {
                                val gson = Gson()
                                val errorResponse = gson.fromJson(errorBody, ErrorResponse::class.java)
                                throw Exception("API Error: ${errorResponse.error?.message ?: "Unknown error"}")
                            } catch (parseException: Exception) {
                                throw Exception("HTTP ${e.code()}: ${e.message()}")
                            }
                        }
                        sessionToken = tokenResponse.data.token
                        Log.d(TAG, "Session token obtained: $sessionToken")
                        sessionCreated = true
                        
                        // Update current API key state
                        currentApiKeyState = "Using API Key ${currentApiKeyIndex + 1} of ${apiKeys.size}"

                        // Now proceed with the rest of the session creation
                        proceedWithSessionCreation()

                    } catch (e: Exception) {
                        Log.e(TAG, "Failed with API key ${currentApiKeyIndex + 1}: ${e.message}")
                        currentApiKeyIndex++
                    }
                }

                if (!sessionCreated) {
                    throw Exception("All API keys failed. Please check your API keys or credits.")
                }

            } catch (e: Exception) {
                Log.e(TAG, "Failed to create session", e)
                withContext(Dispatchers.Main) {
                    Toast.makeText(appContext, "Failed to create session: ${e.message}", Toast.LENGTH_LONG).show()
                }
            } finally {
                loading = false
            }
        }
    }

    private suspend fun proceedWithSessionCreation() {
        // Step 2: Create new streaming session
        Log.d(TAG, "Creating new session...")
        
        var sessionResponse: StreamingNewResponse? = null
        var lastError: Exception? = null
        
        // Use selected avatar if available, otherwise fall back to default list
        if (selectedAvatarId != null && selectedVoiceId != null) {
            try {
                Log.d(TAG, "Using selected avatar: $selectedAvatarId with voice: $selectedVoiceId")
                
                val sessionRequest = StreamingNewRequest(
                    avatarName = selectedAvatarId!!,
                    voice = VoiceConfig(voiceId = selectedVoiceId!!)
                )
                
                sessionResponse = withContext(Dispatchers.IO) {
                    apiService.createNewSession(
                        bearerToken = "Bearer $sessionToken",
                        request = sessionRequest
                    )
                }
                
                Log.d(TAG, "Successfully created session with selected avatar: $selectedAvatarId")
            } catch (e: Exception) {
                Log.e(TAG, "Failed with selected avatar, falling back to defaults: ${e.message}")
                lastError = e
                // Clear selection to allow fallback
                selectedAvatarId = null
                selectedVoiceId = null
            }
        }
        
        // If no selection or selection failed, try fallback combinations
        if (sessionResponse == null) {
            for ((avatarName, voiceId) in AVATAR_VOICE_COMBOS) {
                try {
                    Log.d(TAG, "Trying avatar: $avatarName with voice: $voiceId")
                    
                    val sessionRequest = StreamingNewRequest(
                        avatarName = avatarName,
                        voice = VoiceConfig(voiceId = voiceId)
                    )
                    
                    sessionResponse = withContext(Dispatchers.IO) {
                        apiService.createNewSession(
                            bearerToken = "Bearer $sessionToken",
                            request = sessionRequest
                        )
                    }
                    
                    Log.d(TAG, "Successfully created session with avatar: $avatarName")
                    break // Success, exit loop
                    
                } catch (e: HttpException) {
                    val errorBody = e.response()?.errorBody()?.string()
                    Log.e(TAG, "Failed with avatar $avatarName: $errorBody")
                    lastError = Exception("HTTP ${e.code()}: $errorBody")
                    continue // Try next combination
                } catch (e: Exception) {
                    Log.e(TAG, "Failed with avatar $avatarName: ${e.message}")
                    lastError = e
                    continue // Try next combination
                }
            }
        }
        
        if (sessionResponse == null) {
            throw lastError ?: Exception("Failed to create session with all avatar/voice combinations")
        }
        
        sessionId = sessionResponse.data.sessionId
        wsUrl = sessionResponse.data.url
        token = sessionResponse.data.accessToken
        Log.d(TAG, "Session created - ID: $sessionId")
        
        // Step 3: Connect to WebSocket for chat
        connectChatWebSocket()
        
        // Step 4: Start streaming first (this creates the room)
        startStreamingSession()
        
        // Step 5: Wait for room to be ready (increased delay)
        Log.d(TAG, "Waiting for streaming session to be fully established...")
        Log.d(TAG, "Session Details:")
        Log.d(TAG, "- Session ID: $sessionId")
        Log.d(TAG, "- WebSocket URL: $wsUrl")
        Log.d(TAG, "- API Token: $token")
        delay(3000)
        
        // Step 6: Connect to LiveKit room after streaming has started
        connectToLiveKitRoom()
        
        // Step 7: Additional delay to ensure connection is stable
        delay(2000)
        
        // Step 8: Manually trigger a check for video tracks
        _room.value?.let { room ->
            Log.d(TAG, "Manually checking for video tracks after connection...")
            room.remoteParticipants.forEach { (sid, participant) ->
                Log.d(TAG, "Found participant after connection: ${participant.identity}")
            }
        }
        
        // Step 9: Start real-time voice agent automatically
        delay(1000) // Give everything time to stabilize
        Log.d(TAG, "Starting real-time voice agent...")
        startRealTimeVoiceAgent()
    }

    private fun connectChatWebSocket() {
        val params = mapOf(
            "session_id" to sessionId,
            "session_token" to sessionToken,
            "silence_response" to "false",
            "stt_language" to "en"
        ).map { "${it.key}=${it.value}" }.joinToString("&")
        
        val wsUrl = "wss://api.heygen.com/v1/ws/streaming.chat?$params"
        Log.d(TAG, "Connecting to WebSocket: $wsUrl")
        
        val request = Request.Builder()
            .url(wsUrl)
            .build()
            
        webSocket = okHttpClient.newWebSocket(request, object : WebSocketListener() {
            override fun onOpen(webSocket: WebSocket, response: Response) {
                Log.d(TAG, "WebSocket connected")
            }
            
            override fun onMessage(webSocket: WebSocket, text: String) {
                Log.d(TAG, "WebSocket message received. Message: $text")
                try {
                    // Parse the message if it's JSON
                    val gson = Gson()
                    val message = gson.fromJson(text, WebSocketMessage::class.java)
                    
                    when (message.type) {
                        "avatar_start_talking" -> {
                            Log.d(TAG, "Avatar started talking")
                            viewModelScope.launch {
                                speaking = true
                            }
                        }
                        "avatar_stop_talking" -> {
                            Log.d(TAG, "Avatar stopped talking")
                            viewModelScope.launch {
                                speaking = false
                            }
                        }
                        "user_speech_detected" -> {
                            Log.d(TAG, "User speech detected")
                        }
                        else -> {
                            Log.d(TAG, "Unknown message type: ${message.type}")
                        }
                    }
                } catch (e: Exception) {
                    Log.e(TAG, "Error parsing WebSocket message", e)
                }
            }
            
            override fun onFailure(webSocket: WebSocket, t: Throwable, response: Response?) {
                Log.e(TAG, "WebSocket error", t)
            }
            
            override fun onClosed(webSocket: WebSocket, code: Int, reason: String) {
                Log.d(TAG, "WebSocket closed: $reason")
            }
        })
    }
    
    private suspend fun connectToLiveKitRoom() {
        withContext(Dispatchers.Main) {
            try {
                val roomOptions = RoomOptions(
                    adaptiveStream = true,
                    dynacast = true
                )
                
                val room = LiveKit.create(
                    appContext = appContext,
                    options = roomOptions
                )
                
                // Log the full connection details for debugging
                Log.d(TAG, "LiveKit connection details:")
                Log.d(TAG, "- Room URL: $wsUrl")
                Log.d(TAG, "- Access Token (first 50 chars): ${token.take(50)}...")
                Log.d(TAG, "- Session ID: $sessionId")
                
                // Set up event listeners in a coroutine
                viewModelScope.launch {
                    room.events.collect { event ->
                        when (event) {
                            is RoomEvent.ParticipantConnected -> {
                                Log.d(TAG, "Participant connected: ${event.participant.identity}")
                                checkParticipantTracks(event.participant)
                            }
                            is RoomEvent.TrackPublished -> {
                                Log.d(TAG, "Track published: ${event.publication.track?.name}, participant: ${event.participant.identity}")
                                event.publication.track?.let { track ->
                                    if (track is RemoteVideoTrack && currentVideoTrack == null) {
                                        Log.d(TAG, "New video track available, assigning it")
                                        currentVideoTrack = track
                                    }
                                }
                            }
                            is RoomEvent.TrackSubscribed -> {
                                Log.d(TAG, "Track subscribed: ${event.track.name}, type: ${event.track.kind}")
                                if (event.track is RemoteVideoTrack && currentVideoTrack == null) {
                                    Log.d(TAG, "Subscribed to video track, assigning it")
                                    currentVideoTrack = event.track as RemoteVideoTrack
                                }
                            }
                            is RoomEvent.Connected -> {
                                Log.d(TAG, "Room connected successfully")
                            }
                            is RoomEvent.Disconnected -> {
                                Log.d(TAG, "Room disconnected: ${event.error}")
                            }
                            else -> {
                                Log.d(TAG, "Room event: $event")
                            }
                        }
                    }
                }
                
                // Connect to room
                Log.d(TAG, "Connecting to LiveKit room...")
                room.connect(wsUrl, token)
                _room.value = room
                
                // Start observing room state for video tracks after setting room value
                viewModelScope.launch {
                    Log.d(TAG, "Launching coroutine to observe room for video tracks")
                    observeRoomForVideoTracks(room)
                }
                
                Log.d(TAG, "LiveKit room connection initiated, state: ${room.state}")
                
                // Wait a bit to check connection state
                delay(2000)
                Log.d(TAG, "LiveKit room state after 2s: ${room.state}")
                
            } catch (e: Exception) {
                Log.e(TAG, "Failed to connect to LiveKit room: ${e.message}", e)
                Log.e(TAG, "Stack trace:", e)
                withContext(Dispatchers.Main) {
                    Toast.makeText(appContext, "Failed to connect to room: ${e.message}", Toast.LENGTH_LONG).show()
                }
            }
        }
    }
    
    private suspend fun observeRoomForVideoTracks(room: Room) {
        Log.d(TAG, "Room observation started - entering polling loop")
        
        // Poll for video tracks periodically
        var loopCount = 0
        while (_room.value != null) {
            try {
                loopCount++
                Log.d(TAG, "Observation loop iteration: $loopCount")
                // Check room state
                val roomState = room.state
                val participantCount = room.remoteParticipants.size
                Log.d(TAG, "Room state: $roomState, Remote participants: $participantCount")
                
                // If connected but no participants yet, wait
                if (roomState == Room.State.CONNECTED && participantCount == 0) {
                    Log.d(TAG, "Room connected but waiting for avatar participant to join...")
                } else if (participantCount > 0) {
                    Log.d(TAG, "Found $participantCount remote participants")
                }
                
                // Check for remote participants and their video tracks
                room.remoteParticipants.forEach { (sid, participant) ->
                    Log.d(TAG, "Checking participant: ${participant.identity} (SID: $sid)")
                    Log.d(TAG, "  - Track publications: ${participant.trackPublications.size}")
                    
                    participant.trackPublications.values.forEach { publication ->
                        Log.d(TAG, "  - Publication: ${publication.sid}, subscribed: ${publication.subscribed}")
                        
                        // Check if we need to subscribe to this track
                        if (!publication.subscribed) {
                            Log.d(TAG, "  - Track not subscribed, checking if it's a video track")
                            // LiveKit automatically subscribes to tracks, but log for debugging
                        }
                        
                        publication.track?.let { track ->
                            Log.d(TAG, "  - Track found: ${track.name}, type: ${track.kind}")
                            if (track is RemoteVideoTrack) {
                                if (currentVideoTrack == null) {
                                    Log.d(TAG, "Assigning remote video track: ${track.name}")
                                    withContext(Dispatchers.Main) {
                                        currentVideoTrack = track
                                        Log.d(TAG, "Video track assigned successfully")
                                    }
                                } else {
                                    Log.d(TAG, "  - Video track already assigned")
                                }
                            }
                        } ?: Log.d(TAG, "  - Track is null for publication ${publication.sid}")
                    }
                }
                
                // Also check local participant for debugging
                room.localParticipant?.let { local ->
                    Log.d(TAG, "Local participant: ${local.identity}")
                    Log.d(TAG, "  - Track publications: ${local.trackPublications.size}")
                }
                
                // Wait before checking again
                delay(1000)
            } catch (e: Exception) {
Log.e(TAG, "Error observing room: ${e.message}", e)
                Log.d(TAG, "Current Video Track: ${currentVideoTrack?.name ?: "None"}")
                break
            }
        }
    }

    private suspend fun startStreamingSession() {
try {
    Log.d(TAG, "Starting the startStreamingSession function...")
            Log.d(TAG, "Starting streaming session...")
            val response = withContext(Dispatchers.IO) {
                apiService.startStreaming(
                    bearerToken = "Bearer $sessionToken",
                    request = StreamingStartRequest(sessionId)
                )
            }
            Log.d(TAG, "Streaming start response: code=${response.code}, message=${response.message}")
            connected = true
            Log.d(TAG, "Streaming session started successfully")
        } catch (e: HttpException) {
            val errorBody = e.response()?.errorBody()?.string()
            Log.e(TAG, "Failed to start streaming - HTTP ${e.code()}: $errorBody")
            throw Exception("Failed to start streaming: $errorBody")
        } catch (e: Exception) {
            Log.e(TAG, "Failed to start streaming", e)
            throw e
        }
    }

    fun sendText() {
        viewModelScope.launch {
            if (text.isBlank()) return@launch
            sendTextToAvatar(text)
            text = ""
        }
    }
    
    private suspend fun sendTextToAvatar(textToSend: String) {
        try {
            // Don't set speaking to true here to avoid blocking real-time input
            Log.d(TAG, "Sending text to avatar: $textToSend")
            Log.d(TAG, "Current session ID: $sessionId")
            Log.d(TAG, "Session token exists: ${sessionToken.isNotEmpty()}")
            
            val response = withContext(Dispatchers.IO) {
                try {
                    apiService.sendTask(
                        bearerToken = "Bearer $sessionToken",
                        request = TaskRequest(sessionId, textToSend, "talk")
                    )
                } catch (e: HttpException) {
                    val errorBody = e.response()?.errorBody()?.string()
                    Log.e(TAG, "HTTP ${e.code()} error sending text: $errorBody")
                    throw Exception("Error ${e.code()}: ${errorBody ?: e.message()}")
                }
            }
            
            Log.d(TAG, "Text sent successfully, response: code=${response.code}, message=${response.message}")
        } catch (e: Exception) {
            Log.e(TAG, "Failed to send text: ${e.message}", e)
            withContext(Dispatchers.Main) {
                Toast.makeText(appContext, "Failed to send text: ${e.message}", Toast.LENGTH_LONG).show()
            }
        }
    }
    
fun startVoiceInput() {
        viewModelScope.launch {
            Log.d(TAG, "Starting continuous voice input")
            
            // Check if speech recognition is available
            if (!SpeechRecognizer.isRecognitionAvailable(appContext)) {
                Log.w(TAG, "Speech recognition not available, using dialog method")
                _showSpeechDialog.value = true
                return@launch
            }
            
            // Start continuous listening
            speechRecognitionService.startContinuousListening()
            
            // Observe recognized text
            launch {
                speechRecognitionService.recognizedText.collect { recognizedText ->
                    if (recognizedText.isNotEmpty() && isContinuousMode.value) {
                        Log.d(TAG, "Recognized text from voice: $recognizedText")
                        text = recognizedText
                        // Automatically send the recognized text
                        sendText()
                    }
                }
            }
        }
    }
    
    fun startRealTimeVoiceAgent() {
        viewModelScope.launch {
            Log.d(TAG, "Starting real-time voice agent")
            
            // Enable speaker for avatar voice
            audioService.enableSpeaker()
            
            // Check if speech recognition is available
            if (!SpeechRecognizer.isRecognitionAvailable(appContext)) {
                Log.w(TAG, "Speech recognition not available, using dialog method")
                _showSpeechDialog.value = true
                return@launch
            }
            
            // Start continuous listening
            Log.d(TAG, "Starting continuous listening...")
            speechRecognitionService.startContinuousListening()
            
            // Observe recognized text with a dedicated coroutine
            viewModelScope.launch {
                Log.d(TAG, "Starting to observe recognized text...")
                speechRecognitionService.recognizedText.collect { recognizedText ->
                    Log.d(TAG, "Recognized text collected: '$recognizedText', continuous mode: ${isContinuousMode.value}")
                    if (recognizedText.isNotEmpty() && isContinuousMode.value && !speaking) {
                        Log.d(TAG, "Sending recognized text to avatar: $recognizedText")
                        // Don't wait for user to be completely finished speaking
                        // Send the text immediately for real-time interaction
                        sendTextToAvatar(recognizedText)
                    }
                }
            }
            
            Log.d(TAG, "Real-time voice agent setup complete")
        }
    }
    
    fun startVoiceInputDialog() {
        _showSpeechDialog.value = true
    }
    
    fun onSpeechResult(result: String) {
        Log.d(TAG, "Speech dialog result: $result")
        text = result
        _showSpeechDialog.value = false
        sendText()
    }
    
    fun dismissSpeechDialog() {
        _showSpeechDialog.value = false
    }
    
    fun stopVoiceInput() {
        Log.d(TAG, "Stopping continuous voice input")
        speechRecognitionService.stopContinuousListening()
    }

    fun closeSession() {
        viewModelScope.launch {
            try {
                loading = true
                Log.d(TAG, "Closing session...")
                
                // Stop voice input if active
                if (isContinuousMode.value) {
                    stopVoiceInput()
                }
                
                // Disable speaker
                audioService.disableSpeaker()
                
                // Stop streaming
                if (sessionId.isNotEmpty() && sessionToken.isNotEmpty()) {
                    withContext(Dispatchers.IO) {
                        apiService.stopStreaming(
                            bearerToken = "Bearer $sessionToken",
                            request = StreamingStartRequest(sessionId)
                        )
                    }
                }
                
                // Disconnect from LiveKit
                _room.value?.let { room ->
                    room.disconnect()
                }
                _room.value = null
                
                // Close WebSocket
                webSocket?.close(1000, "Session closed")
                webSocket = null
                
                // Reset all states
                connected = false
                sessionId = ""
                sessionToken = ""
                wsUrl = ""
                token = ""
                text = ""
                speaking = false
                currentVideoTrack = null
                
                Log.d(TAG, "Session closed successfully")
            } catch (e: Exception) {
                Log.e(TAG, "Failed to close session", e)
                withContext(Dispatchers.Main) {
                    Toast.makeText(appContext, "Failed to close session: ${e.message}", Toast.LENGTH_LONG).show()
                }
            } finally {
                loading = false
            }
        }
    }
    
    private fun checkParticipantTracks(participant: RemoteParticipant) {
        Log.d(TAG, "Checking tracks for participant: ${participant.identity}")
        participant.trackPublications.forEach { (_, publication) ->
            publication.track?.let { track ->
                Log.d(TAG, "Found track: ${track.name}, type: ${track.kind}")
                if (track is RemoteVideoTrack && currentVideoTrack == null) {
                    Log.d(TAG, "Found video track, assigning it")
                    currentVideoTrack = track
                }
            }
        }
    }
    
    override fun onCleared() {
        super.onCleared()
        webSocket?.close(1000, "ViewModel cleared")
        _room.value?.let { room ->
            room.disconnect()
        }
        speechRecognitionService.destroy()
    }
}
