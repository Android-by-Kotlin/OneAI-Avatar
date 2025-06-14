package max.ohm.oneai.chatbot

import android.graphics.Bitmap
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.setValue
import androidx.compose.ui.text.input.TextFieldValue
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.google.ai.client.generativeai.GenerativeModel
import com.google.ai.client.generativeai.type.content
import kotlinx.coroutines.launch

class UnifiedChatBotViewModel : ViewModel() {

    private var geminiProGenerativeModel: GenerativeModel? = null

    var messages by mutableStateOf(listOf<Message>())
        private set

    var inputText by mutableStateOf(TextFieldValue(""))
        private set

    var selectedImageBitmap by mutableStateOf<Bitmap?>(null)
        private set

    var isLoading by mutableStateOf(false)
        private set

    var errorMessage by mutableStateOf<String?>(null)
        private set

    var selectedModel by mutableStateOf("gemini-2.0-flash") // Default model

    init {
        initializeGeminiProModel()
    }

    private fun initializeGeminiProModel() {
        if (GEMINI_API_KEY != "YOUR_GEMINI_API_KEY_HERE" && GEMINI_API_KEY.isNotBlank()) {
            geminiProGenerativeModel = GenerativeModel(
                modelName = "models/gemini-2.0-flash", // Use the Pro model
                //modelName = "gemini-2.5-flash",
                apiKey = GEMINI_API_KEY
            )
        } else {
            println("Error: Gemini API Key for gemini-2.0-flash is not configured correctly.")
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

    fun sendMessage() {
        if (inputText.text.isBlank() && selectedImageBitmap == null) {
            return // Don't send empty messages
        }

        val userMessage = Message(inputText.text, true, selectedImageBitmap)
        messages = messages + userMessage
        inputText = TextFieldValue("")
        selectedImageBitmap = null
        isLoading = true
        errorMessage = null

        viewModelScope.launch {
            try {
                when (selectedModel) {
                    "gemini-2.0-flash" -> {
                        if (geminiProGenerativeModel == null) {
                            errorMessage = "gemini-2.0-flash model not initialized. Check API Key."
                            isLoading = false
                            return@launch
                        }
                        val chatHistory = messages.map { msg ->
                            content(if (msg.isUser) "user" else "model") {
                                msg.image?.let { img -> image(img) }
                                if (msg.text.isNotBlank()) {
                                    text(msg.text)
                                }
                            }
                        }
                        val response = geminiProGenerativeModel!!.generateContent(*chatHistory.toTypedArray())
                        val botMessage = Message(
                            text = response.text ?: "No response from bot", 
                            isUser = false,
                            image = null,
                            id = System.currentTimeMillis() // Add unique timestamp as ID
                        )
                        messages = messages + botMessage
                    }

                    else -> {
                        errorMessage = "Invalid model selected."
                    }
                }
            } catch (e: Exception) {
                errorMessage = "Network or other error: ${e.message}"
                e.printStackTrace()
            } finally {
                isLoading = false
            }
        }
    }
}

