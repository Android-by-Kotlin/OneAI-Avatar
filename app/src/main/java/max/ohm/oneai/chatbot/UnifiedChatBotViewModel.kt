package max.ohm.oneai.chatbot

import android.graphics.Bitmap
import android.util.Log
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.setValue
import androidx.compose.ui.text.input.TextFieldValue
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.google.ai.client.generativeai.GenerativeModel
import com.google.ai.client.generativeai.type.content
import com.google.firebase.auth.FirebaseAuth
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.launch
import kotlinx.coroutines.delay
import max.ohm.oneai.data.model.Chat
import max.ohm.oneai.data.repository.ChatRepository
import max.ohm.oneai.a4f.A4FChatService
import org.json.JSONObject

class UnifiedChatBotViewModel : ViewModel() {
    private val TAG = "UnifiedChatBotViewModel"
    private var geminiProGenerativeModel: GenerativeModel? = null
    private val chatRepository = ChatRepository()
    private val auth = FirebaseAuth.getInstance()
    private val errorHandler = ChatBotErrorHandler()

    var messages by mutableStateOf(listOf<Message>())
        private set

    var inputText by mutableStateOf(TextFieldValue(""))
        private set

    var selectedImageBitmap by mutableStateOf<Bitmap?>(null)
        private set

    var isLoading by mutableStateOf(false)
        private set
        
    var isLoadingFromHistory by mutableStateOf(false)
        private set

    var errorMessage by mutableStateOf<String?>(null)
        internal set

    var selectedModel by mutableStateOf("gemini-2.0-flash") // Default model
    
    // Track if we're in auto-retry mode with a different model
    var isAutoRetrying by mutableStateOf(false)
        private set
    
    // Track the original failed model for display purposes
    var failedModel by mutableStateOf<String?>(null)
        private set

    // Current chat ID
    var currentChatId by mutableStateOf<String?>(null)
        private set
        
    // Current chat title
    var currentChatTitle by mutableStateOf<String?>(null)
        private set

    // List of available chats
    private val _chats = MutableStateFlow<List<Chat>>(emptyList())
    val chats: StateFlow<List<Chat>> = _chats

    // Typing sound enabled state
    var isTypingSoundEnabled by mutableStateOf(true)
        private set

    // Loading state for chats
    var isLoadingChats by mutableStateOf(false)
        private set
        
    // State for showing chat drawer
    var showChatDrawer by mutableStateOf(false)
        private set

    // Add a4f service instance
    private val a4fChatService = A4FChatService()

    init {
        initializeGeminiProModel()
        createInitialChatIfNeeded()
    }

    private fun initializeGeminiProModel() {
        try {
            if (GEMINI_API_KEY.isNotBlank() && GEMINI_API_KEY != "YOUR_GEMINI_API_KEY_HERE") {
                geminiProGenerativeModel = GenerativeModel(
                    modelName = "models/gemini-2.0-flash",
                    apiKey = GEMINI_API_KEY
                )
                Log.d(TAG, "Gemini Pro model initialized successfully")
            } else {
                Log.w(TAG, "Gemini API Key is not configured correctly")
                errorMessage = "AI model API key is not configured correctly."
            }
        } catch (e: Exception) {
            Log.e(TAG, "Error initializing Gemini Pro model", e)
            errorMessage = "Failed to initialize AI model: ${e.message}"
        }
    }
    
    private fun createInitialChatIfNeeded() {
        if (auth.currentUser == null) {
            Log.w(TAG, "User not authenticated, skipping initial chat creation")
            return
        }
        
        viewModelScope.launch {
            try {
                // Load existing chats
                loadChats()
                
                // If there are existing chats, load the most recent one
                if (_chats.value.isNotEmpty() && currentChatId == null) {
                    // Load the most recent chat if one exists
                    val mostRecentChat = _chats.value.firstOrNull()
                    mostRecentChat?.let {
                        Log.d(TAG, "Loading most recent chat: ${it.id}")
                        loadChat(it.id)
                    }
                }
                // Don't automatically create a new chat if none exist
                // Let the user create one manually by clicking the plus icon
            } catch (e: Exception) {
                Log.e(TAG, "Error loading chats", e)
                errorMessage = "Failed to load chats: ${e.message}"
            }
        }
    }

    fun updateInputText(newText: TextFieldValue) {
        inputText = newText
    }

    fun updateSelectedImage(bitmap: Bitmap?) {
        selectedImageBitmap = bitmap
    }

    fun updateSelectedModel(model: String) {
        selectedModel = model
        // Clear messages and input when switching models
        messages = emptyList()
        inputText = TextFieldValue("")
        selectedImageBitmap = null
        errorMessage = null
    }

    fun clearErrorMessage() {
        errorMessage = null
    }
    
    fun toggleChatDrawer() {
        showChatDrawer = !showChatDrawer
    }

    fun toggleTypingSound() {
        isTypingSoundEnabled = !isTypingSoundEnabled
    }

    fun loadChats() {
        if (auth.currentUser == null) {
            errorMessage = "You need to be logged in to load chats."
            return
        }
        
        isLoadingChats = true
        errorMessage = null
        
        viewModelScope.launch {
            try {
                val result = chatRepository.getAllChats()
                result.fold(
                    onSuccess = { chatList ->
                        _chats.value = chatList
                        Log.d(TAG, "Successfully loaded ${chatList.size} chats")
                    },
                    onFailure = { error ->
                        Log.e(TAG, "Failed to load chats", error)
                        errorMessage = "Failed to load chats: ${error.message}"
                    }
                )
            } catch (e: Exception) {
                Log.e(TAG, "Error loading chats", e)
                errorMessage = "Error loading chats: ${e.message}"
            } finally {
                isLoadingChats = false
            }
        }
    }

    fun createNewChat(title: String? = null) {
        if (auth.currentUser == null) {
            errorMessage = "You need to be logged in to create a chat."
            return
        }
        
        isLoading = true
        errorMessage = null
        
        viewModelScope.launch {
            try {
                val chatTitle = title ?: "Chat ${System.currentTimeMillis()}"
                Log.d(TAG, "Creating new chat with title: $chatTitle")
                val result = chatRepository.createChat(chatTitle)
                result.fold(
                    onSuccess = { chatId ->
                        Log.d(TAG, "Successfully created chat with ID: $chatId")
                        currentChatId = chatId
                        currentChatTitle = null // Don't show title until user sends first message
                        messages = emptyList()
                        loadChats() // Refresh the chat list
                    },
                    onFailure = { error ->
                        Log.e(TAG, "Failed to create chat", error)
                        errorMessage = "Failed to create chat: ${error.message}"
                    }
                )
            } catch (e: Exception) {
                Log.e(TAG, "Error creating chat", e)
                errorMessage = "Error creating chat: ${e.message}"
            } finally {
                isLoading = false
            }
        }
    }

    fun loadChat(chatId: String) {
        if (auth.currentUser == null) {
            errorMessage = "You need to be logged in to load a chat."
            return
        }
        
        currentChatId = chatId
        isLoading = true
        isLoadingFromHistory = true
        errorMessage = null
        messages = emptyList()
        
        viewModelScope.launch {
            try {
                // Load chat metadata
                val chatResult = chatRepository.getChat(chatId)
                chatResult.fold(
                    onSuccess = { chat ->
                        currentChatTitle = chat.title // Keep title for sidebar, but won't show in top bar
                    },
                    onFailure = { error ->
                        Log.e(TAG, "Failed to load chat metadata", error)
                    }
                )
                
                // Load messages
                Log.d(TAG, "Loading chat with ID: $chatId")
                val result = chatRepository.getMessages(chatId)
                result.fold(
                    onSuccess = { messageList ->
                        Log.d(TAG, "Successfully loaded ${messageList.size} messages")
                        messages = messageList
                    },
                    onFailure = { error ->
                        Log.e(TAG, "Failed to load messages", error)
                        errorMessage = "Failed to load messages: ${error.message}"
                    }
                )
            } catch (e: Exception) {
                Log.e(TAG, "Error loading messages", e)
                errorMessage = "Error loading messages: ${e.message}"
            } finally {
                isLoading = false
                isLoadingFromHistory = false
            }
        }
    }
    
    fun deleteChat(chatId: String) {
        if (auth.currentUser == null) {
            errorMessage = "You need to be logged in to delete a chat."
            return
        }
        
        viewModelScope.launch {
            try {
                val result = chatRepository.deleteChat(chatId)
                result.fold(
                    onSuccess = {
                        Log.d(TAG, "Successfully deleted chat with ID: $chatId")
                        
                        // If we deleted the current chat, clear the current chat
                        if (currentChatId == chatId) {
                            currentChatId = null
                            currentChatTitle = null
                            messages = emptyList()
                        }
                        
                        loadChats() // Refresh the chat list
                    },
                    onFailure = { error ->
                        Log.e(TAG, "Failed to delete chat", error)
                        errorMessage = "Failed to delete chat: ${error.message}"
                    }
                )
            } catch (e: Exception) {
                Log.e(TAG, "Error deleting chat", e)
                errorMessage = "Error deleting chat: ${e.message}"
            }
        }
    }
    
    private fun generateChatTitle(userMessage: String) {
        if (currentChatTitle != null) {
            return // Only auto-generate title for new conversations
        }
        
        viewModelScope.launch {
            try {
                if (geminiProGenerativeModel == null) {
                    Log.w(TAG, "Cannot generate title: Gemini model not initialized")
                    return@launch
                }
                
                // Extract a meaningful title from the user's message
                val titleText = when {
                    userMessage.length <= 20 -> userMessage // Use the entire message if it's short
                    else -> {
                        // Try to extract the main topic from longer messages
                        val prompt = "Generate a very short title (3-5 words) that summarizes this message: \"$userMessage\". " +
                                     "Return ONLY the title, nothing else. The title should be descriptive of the task or problem."
                        
                        try {
                            val response = geminiProGenerativeModel!!.generateContent(prompt)
                            response.text?.trim() ?: userMessage.take(20) + "..."
                        } catch (e: Exception) {
                            // Fallback if AI title generation fails
                            Log.e(TAG, "Error in AI title generation", e)
                            userMessage.take(20) + "..."
                        }
                    }
                }
                
                // Update the chat title in Firestore
                currentChatId?.let { chatId ->
                    val result = chatRepository.updateChatTitle(chatId, titleText)
                    result.fold(
                        onSuccess = {
                            Log.d(TAG, "Successfully updated chat title to: $titleText")
                            currentChatTitle = titleText
                            loadChats() // Refresh the chat list
                        },
                        onFailure = { error ->
                            Log.e(TAG, "Failed to update chat title", error)
                        }
                    )
                }
            } catch (e: Exception) {
                Log.e(TAG, "Error generating chat title", e)
            }
        }
    }

    fun sendMessage() {
        if (auth.currentUser == null) {
            errorMessage = "You need to be logged in to send messages."
            return
        }
        
        val messageText = inputText.text.trim()
        if (messageText.isBlank() && selectedImageBitmap == null) {
            return // Don't send empty messages
        }

        // Create a new chat if none exists when sending a message
        if (currentChatId == null) {
            Log.d(TAG, "No current chat, creating new one before sending message")
            createNewChat(null)
            // Store the message to send after chat creation
            val pendingMessage = Message(messageText, true, selectedImageBitmap)
            viewModelScope.launch {
                // Wait for chat creation with a timeout
                var attempts = 0
                while (currentChatId == null && attempts < 10) {
                    kotlinx.coroutines.delay(300)
                    attempts++
                }
                
                if (currentChatId != null) {
                    // Now send the pending message
                    directSendMessage(pendingMessage)
                    
                    // Generate title for sidebar display (won't show in top bar)
                    if (messageText.isNotBlank()) {
                        generateChatTitle(messageText)
                    }
                } else {
                    errorMessage = "Failed to create chat. Please try again."
                }
            }
            return
        }

        val userMessage = Message(messageText, true, selectedImageBitmap)
        directSendMessage(userMessage)
        
        // Generate title for sidebar display (won't show in top bar due to UI logic)
        if (messages.count { it.isUser } <= 1 && messageText.isNotBlank() && currentChatTitle == null) {
            generateChatTitle(messageText)
        }
    }
    
    // Simplified direct message sending without permission checks
    private fun directSendMessage(userMessage: Message) {
        // Add message to UI immediately
        messages = messages + userMessage
        
        // Clear input
        inputText = TextFieldValue("")
        selectedImageBitmap = null
        isLoading = true
        errorMessage = null
        
        // Save the user message to Firebase
        viewModelScope.launch {
            try {
                Log.d(TAG, "Saving user message to chat: $currentChatId")
                val saveResult = chatRepository.saveMessage(currentChatId!!, userMessage)
                if (saveResult.isFailure) {
                    val exception = saveResult.exceptionOrNull()
                    Log.e(TAG, "Failed to save user message", exception)
                    errorMessage = "Failed to save message: ${exception?.message}"
                    isLoading = false
                    return@launch
                }
                
                // Generate AI response
                generateAIResponse()
            } catch (e: Exception) {
                Log.e(TAG, "Error saving message", e)
                errorMessage = "Failed to save message: ${e.message}"
                isLoading = false
            }
        }
    }
    
    private suspend fun generateAIResponse() {
        try {
            when (selectedModel) {
                "gemini-2.0-flash" -> {
                    if (geminiProGenerativeModel == null) {
                        try {
                            // Try to reinitialize the model
                            initializeGeminiProModel()
                        } catch (e: Exception) {
                            Log.e(TAG, "Failed to reinitialize Gemini model", e)
                        }
                        
                        if (geminiProGenerativeModel == null) {
                            errorMessage = "AI model not initialized. Check API Key."
                            isLoading = false
                            return
                        }
                    }
                    
                    Log.d(TAG, "Generating response with Gemini model")
                    val chatHistory = messages.map { msg ->
                        content(if (msg.isUser) "user" else "model") {
                            msg.image?.let { img -> image(img) }
                            if (msg.text.isNotBlank()) {
                                text(msg.text)
                            }
                        }
                    }
                    
                    try {
                        val response = geminiProGenerativeModel!!.generateContent(*chatHistory.toTypedArray())
                        val responseText = response.text ?: "No response from bot"
                        Log.d(TAG, "Received AI response: ${responseText.take(50)}...")
                        
                        val botMessage = Message(
                            text = responseText, 
                            isUser = false,
                            image = null,
                            id = System.currentTimeMillis() // Add unique timestamp as ID
                        )
                        
                        // Add message to UI
                        messages = messages + botMessage
                        
                        // Save the bot response to Firebase
                        val saveResult = chatRepository.saveMessage(currentChatId!!, botMessage)
                        if (saveResult.isFailure) {
                            Log.e(TAG, "Failed to save bot message", saveResult.exceptionOrNull())
                            errorMessage = "Failed to save AI response: ${saveResult.exceptionOrNull()?.message}"
                        }
                        
                        // Reset error handler on successful response
                        errorHandler.resetFailedModels()
                    } catch (e: Exception) {
                        Log.e(TAG, "Error generating AI response with Gemini", e)
                        
                        // Get the last user message for retry
                        val lastUserMessage = messages.lastOrNull { it.isUser } ?: Message("", true)
                        
                        // Handle the error with automatic model switching
                        handleApiError(
                            exception = e,
                            responseCode = when {
                                e.message?.contains("429") == true -> 429
                                e.message?.contains("quota", true) == true -> 402
                                e.message?.contains("503") == true -> 503
                                else -> null
                            },
                            responseBody = e.message,
                            currentModel = "gemini-2.0-flash",
                            originalUserMessage = lastUserMessage
                        )
                    }
                }
                "a4f-gpt-4.1-nano",
                "provider-3/kimi-k2",
                "provider-1/deepseek-r1-0528",
                "provider-6/r1-1776",
                "provider-2/qwen-3-235b",
                "provider-6/horizon-beta",
                "provider-3/gpt-5-nano",
                "provider-6/gpt-4o",
                "provider-6/gemini-2.5-flash" -> {
                    Log.d(TAG, "Generating response with A4F model: $selectedModel")
                    val userPrompt = messages.lastOrNull { it.isUser }?.text ?: ""
                    try {
                        val responseText = a4fChatService.getCompletion(userPrompt, selectedModel)
                        // Check if responseText is a function_call JSON
                        if (responseText.trim().startsWith("{") && responseText.contains("function_call")) {
                            val messageJson = JSONObject(responseText)
                            val functionCall = messageJson.getJSONObject("function_call")
                            val functionName = functionCall.getString("name")
                            if (functionName == "get_current_weather") {
                                val arguments = functionCall.getString("arguments")
                                val argsJson = JSONObject(arguments)
                                val location = argsJson.optString("location", "Unknown")
                                val units = argsJson.optString("units", "metric")
                                val language = argsJson.optString("language", "en")
                                // Simulate weather result as JSON
                                val weatherResultJson = JSONObject()
                                weatherResultJson.put("location", location)
                                weatherResultJson.put("temperature", if (units == "imperial") 77 else 25)
                                weatherResultJson.put("humidity", 60)
                                weatherResultJson.put("description", "Partly cloudy")
                                weatherResultJson.put("wind_speed", 10)
                                weatherResultJson.put("units", units)
                                weatherResultJson.put("language", language)
                                val weatherResult = weatherResultJson.toString()
                                // Add function response as a 'function' message
                                val functionMessage = Message(
                                    text = weatherResult,
                                    isUser = false,
                                    image = null,
                                    id = System.currentTimeMillis()
                                )
                                messages = messages + functionMessage
                                // Save the function response to Firebase
                                val saveResult = chatRepository.saveMessage(currentChatId!!, functionMessage)
                                if (saveResult.isFailure) {
                                    Log.e(TAG, "Failed to save function message", saveResult.exceptionOrNull())
                                    errorMessage = "Failed to save function response: ${saveResult.exceptionOrNull()?.message}"
                                }
                                // Build the full message history for the next model call
                                val systemMessage = JSONObject()
                                systemMessage.put("role", "system")
                                systemMessage.put("content", "If the user asks about the weather, always use the get_current_weather function.")
                                val userMessage = JSONObject()
                                userMessage.put("role", "user")
                                userMessage.put("content", userPrompt)
                                val functionResponseMessage = JSONObject()
                                functionResponseMessage.put("role", "function")
                                functionResponseMessage.put("name", "get_current_weather")
                                functionResponseMessage.put("content", weatherResult)
                                val messagesArray = org.json.JSONArray()
                                messagesArray.put(systemMessage)
                                messagesArray.put(userMessage)
                                messagesArray.put(functionResponseMessage)
                                // Call the model again with the full history (no manual assistant message)
                                val followupResponse = a4fChatService.getCompletionWithMessages(messagesArray, "provider-3/gpt-4.1-nano")
                                val botMessage = Message(
                                    text = followupResponse,
                                    isUser = false,
                                    image = null,
                                    id = System.currentTimeMillis()
                                )
                                messages = messages + botMessage
                                val saveResult2 = chatRepository.saveMessage(currentChatId!!, botMessage)
                                if (saveResult2.isFailure) {
                                    Log.e(TAG, "Failed to save bot message", saveResult2.exceptionOrNull())
                                    errorMessage = "Failed to save AI response: ${saveResult2.exceptionOrNull()?.message}"
                                }
                                return
                            }
                        }
                        // Normal text response
                        val botMessage = Message(
                            text = responseText,
                            isUser = false,
                            image = null,
                            id = System.currentTimeMillis()
                        )
                        messages = messages + botMessage
                        val saveResult = chatRepository.saveMessage(currentChatId!!, botMessage)
                        if (saveResult.isFailure) {
                            Log.e(TAG, "Failed to save bot message", saveResult.exceptionOrNull())
                            errorMessage = "Failed to save AI response: ${saveResult.exceptionOrNull()?.message}"
                        }
                    } catch (e: Exception) {
                        Log.e(TAG, "Error with A4F model", e)
                        val lastUserMessage = messages.lastOrNull { it.isUser } ?: Message("", true)
                        handleApiError(e, null, null, selectedModel, lastUserMessage)
                    }
                }
                else -> {
                    errorMessage = "Invalid model selected."
                }
            }
        } catch (e: Exception) {
            Log.e(TAG, "Network or other error", e)
            errorMessage = "Network or other error: ${e.message}"
            e.printStackTrace()
        } finally {
            isLoading = false
        }
    }
    
    /**
     * Handle API errors with automatic model switching
     */
    private fun handleApiError(
        exception: Exception?, 
        responseCode: Int? = null, 
        responseBody: String? = null,
        currentModel: String,
        originalUserMessage: Message
    ) {
        viewModelScope.launch {
            try {
                // Parse the error and get recovery suggestions
                val apiError = errorHandler.parseError(
                    exception = exception,
                    responseCode = responseCode,
                    responseBody = responseBody,
                    currentModel = currentModel
                )
                
                // Display user-friendly error message
                val errorMessage = errorHandler.generateRecoveryMessage(apiError)
                
                // Check if we should retry with a different model
                if (apiError.suggestedModel != null && apiError.retryable && !isAutoRetrying) {
                    // Show intermediate message about switching models
                    val switchingMessage = Message(
                        text = errorMessage,
                        isUser = false,
                        id = System.currentTimeMillis(),
                        isSystemMessage = true
                    )
                    messages = messages + switchingMessage
                    
                    // Track that we're auto-retrying
                    isAutoRetrying = true
                    failedModel = currentModel
                    
                    // Wait a bit if there's a retry-after value
                    apiError.retryAfterSeconds?.let { seconds ->
                        delay(seconds * 1000L)
                    }
                    
                    // Switch to the suggested model and retry
                    selectedModel = apiError.suggestedModel
                    Log.d(TAG, "Switching from $currentModel to ${apiError.suggestedModel}")
                    
                    // Retry the message with the new model
                    generateAIResponse()
                    
                    // Reset auto-retry flag after successful retry
                    isAutoRetrying = false
                    failedModel = null
                    errorHandler.resetFailedModels()
                } else {
                    // No more models to try or not retryable
                    val finalErrorMessage = Message(
                        text = if (isAutoRetrying) {
                            "😔 All available AI models are currently unavailable. Please try again later."
                        } else {
                            errorMessage
                        },
                        isUser = false,
                        id = System.currentTimeMillis(),
                        isError = true
                    )
                    messages = messages + finalErrorMessage
                    
                    // Reset flags
                    isAutoRetrying = false
                    failedModel = null
                }
            } catch (e: Exception) {
                Log.e(TAG, "Error in handleApiError", e)
                val criticalErrorMessage = Message(
                    text = "⚠️ A critical error occurred. Please restart the chat.",
                    isUser = false,
                    id = System.currentTimeMillis(),
                    isError = true
                )
                messages = messages + criticalErrorMessage
            }
        }
    }
    
    /**
     * Get available models for display in UI
     */
    fun getAvailableModels(): List<Pair<String, String>> {
        return errorHandler.getAvailableModelsForDisplay()
    }
    
    /**
     * Check if a specific model is available
     */
    fun isModelAvailable(modelId: String): Boolean {
        return errorHandler.isModelAvailable(modelId)
    }
}

