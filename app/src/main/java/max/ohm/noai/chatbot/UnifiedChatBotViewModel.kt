package max.ohm.noai.chatbot

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
import max.ohm.noai.a4f.A4FClient.A4F_API_KEY
import max.ohm.noai.geminiflash.network.GeminiFlashApiClient
import max.ohm.noai.geminiflash.network.GeminiFlashRequest
import max.ohm.noai.geminiflash.network.Message as GeminiFlashMessage
import max.ohm.noai.geminiflash.network.TextPart
import max.ohm.noai.geminiflash.network.InlineDataPart
import max.ohm.noai.geminiflash.network.InlineData
import android.util.Base64
import java.io.ByteArrayOutputStream

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

    var selectedModel by mutableStateOf("gemini-flash") // Default model

    init {
        initializeGeminiProModel()
    }

    private fun initializeGeminiProModel() {
        if (GEMINI_API_KEY != "YOUR_GEMINI_API_KEY_HERE" && GEMINI_API_KEY.isNotBlank()) {
            geminiProGenerativeModel = GenerativeModel(
                modelName = "gemini-1.5-pro", // Use the Pro model
                apiKey = GEMINI_API_KEY
            )
        } else {
            println("Error: Gemini API Key for Gemini 1.5 Pro is not configured correctly.")
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
                    "gemini-1.5-pro" -> {
                        if (geminiProGenerativeModel == null) {
                            errorMessage = "Gemini 1.5 Pro model not initialized. Check API Key."
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
                        val botMessage = Message(response.text ?: "No response from bot", false)
                        messages = messages + botMessage
                    }
                    "gemini-flash" -> {
//                       
                        if (A4F_API_KEY == "YOUR_GEMINI_FLASH_API_KEY_HERE" ||A4F_API_KEY.isBlank()) {
                            errorMessage = "Please set your Gemini Flash API Key in A4FClient"
                            isLoading = false
                            return@launch
                        }
                        val chatHistoryForFlash = messages.map { msg ->
                            val parts = mutableListOf<max.ohm.noai.geminiflash.network.Part>()
                            msg.image?.let { imgBitmap ->
                                val byteArrayOutputStream = ByteArrayOutputStream()
                                imgBitmap.compress(Bitmap.CompressFormat.JPEG, 80, byteArrayOutputStream)
                                val byteArray = byteArrayOutputStream.toByteArray()
                                val base64Image = Base64.encodeToString(byteArray, Base64.DEFAULT)
                                parts.add(InlineDataPart(InlineData("image/jpeg", base64Image)))
                            }
                            if (msg.text.isNotBlank()) {
                                parts.add(TextPart(msg.text))
                            }
                            GeminiFlashMessage(
                                role = if (msg.isUser) "user" else "assistant",
                                content = parts
                            )
                        }
                        val request = GeminiFlashRequest(
                            model = "provider-1/gemini-flash-2.0",
                            messages = chatHistoryForFlash // Pass the entire chat history
                        )
                        val response = GeminiFlashApiClient.apiService.getChatCompletion(request)
                        if (response.isSuccessful) {
                            val aiResponse = response.body()?.choices?.firstOrNull()?.message?.content
                            aiResponse?.let {
                                messages = messages + Message(text = it, isUser = false)
                            } ?: run {
                                messages = messages + Message(text = "No response from Gemini Flash", isUser = false)
                            }
                        } else {
                            val errorBody = response.errorBody()?.string() ?: "Unknown API error"
                            messages = messages + Message(text = "Gemini Flash API Error: ${response.code()} - ${errorBody}", isUser = false)
                        }
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
