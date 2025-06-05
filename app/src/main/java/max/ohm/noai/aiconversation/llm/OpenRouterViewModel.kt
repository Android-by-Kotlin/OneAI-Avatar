package max.ohm.noai.aiconversation.llm

import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.setValue
import androidx.compose.ui.text.input.TextFieldValue
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.launch
import max.ohm.noai.chatbot.Message

class OpenRouterViewModel : ViewModel() {
    private val openRouterService = OpenRouterLLMService()
    
    var messages by mutableStateOf(listOf<Message>())
        private set
    
    var inputText by mutableStateOf(TextFieldValue(""))
        private set
    
    var isLoading by mutableStateOf(false)
        private set
    
    var errorMessage by mutableStateOf<String?>(null)
        private set
    
    var selectedModel by mutableStateOf("deepseek/deepseek-r1-0528:free") // Default model set to Deepseek
    
    fun updateInputText(newText: TextFieldValue) {
        inputText = newText
    }
    
    fun updateSelectedModel(model: String) {
        selectedModel = model
        // Clear messages when switching models
        messages = emptyList()
        inputText = TextFieldValue("")
        errorMessage = null
    }
    
    fun clearErrorMessage() {
        errorMessage = null
    }
    
    fun sendMessage() {
        if (inputText.text.isBlank()) {
            return // Don't send empty messages
        }
        
        val userMessage = Message(inputText.text, true)
        messages = messages + userMessage
        inputText = TextFieldValue("")
        isLoading = true
        errorMessage = null
        
        viewModelScope.launch {
            try {
                // For single message, use getCompletion
                if (messages.size == 1) {
                    val response = openRouterService.getCompletion(userMessage.text, selectedModel)
                    val botMessage = Message(response, false)
                    messages = messages + botMessage
                } else {
                    // For conversation, create a simple format that matches what our service expects
                    val chatMessages = messages.map { msg ->
                        OpenRouterLLMService.ChatMessage(
                            role = if (msg.isUser) "user" else "assistant",
                            content = msg.text
                        )
                    }
                    
                    val response = openRouterService.getChatCompletion(chatMessages, selectedModel)
                    val botMessage = Message(response, false)
                    messages = messages + botMessage
                }
            } catch (e: Exception) {
                errorMessage = "Error: ${e.message}"
                e.printStackTrace()
            } finally {
                isLoading = false
            }
        }
    }
} 