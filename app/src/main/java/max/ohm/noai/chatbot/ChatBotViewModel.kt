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
import kotlin.collections.plus


class ChatBotViewModel : ViewModel() {


    private var generativeModel: GenerativeModel? = null // Make nullable to handle init failure

    init {
        // Basic check, consider more robust validation
        if (GEMINI_API_KEY != "YOUR_GEMINI_API_KEY_HERE" && GEMINI_API_KEY.isNotBlank()) {
            generativeModel = GenerativeModel(
                // stable model name- "gemini-1.5-flash"
                modelName = "gemini-1.5-flash", // Updated model name
                apiKey = GEMINI_API_KEY
            )
        } else {
            // Handle the case where the API key is missing or invalid during init
            // Maybe log an error or set a state to indicate the issue
            println("Error: Gemini API Key is not configured correctly.") // Simple log
        }
    }


    var messages by mutableStateOf(listOf<Message>())
        private set

    var inputText by mutableStateOf(TextFieldValue(""))
        private set

    // State to hold the image selected by the user before sending
    var selectedImageBitmap by mutableStateOf<Bitmap?>(null)
        private set

    var isLoading by mutableStateOf(false)
        private set

    var errorMessage by mutableStateOf<String?>(null)
        private set

    fun onInputTextChange(newText: TextFieldValue) {
        inputText = newText
    }

    // Function to update the selected image state
    fun onImageSelected(bitmap: Bitmap?) {
        selectedImageBitmap = bitmap
    }

    fun sendMessage() { // Removed imageBitmap parameter
        if (generativeModel == null) {
            errorMessage = "Chatbot is not initialized. Check API Key."
            return
        }
        // Use the state variable selectedImageBitmap
        val imageToSend = selectedImageBitmap
        // Allow sending if there's text OR an image selected
        if (inputText.text.isBlank() && imageToSend == null) {
            return // Don't send empty messages
        }

        val userMessage = Message(inputText.text, true, imageToSend)
        messages = messages + userMessage // Add user message immediately
        inputText = TextFieldValue("") // Clear input field
        selectedImageBitmap = null // Clear selected image after adding to message list
        isLoading = true
        errorMessage = null

        // Capture the current messages list *before* launching the coroutine
        val historyToSend = messages // Includes the latest user message

        viewModelScope.launch {
            try {
                // Build the chat history for the API
                val chatHistory = historyToSend.map { msg ->
                    content(if (msg.isUser) "user" else "model") {
                        // Add image if present
                        msg.image?.let { img -> image(img) }
                        // Add text if present
                        if (msg.text.isNotBlank()) {
                            text(msg.text)
                        }
                    }
                }

                // Ensure generativeModel is not null before using (already checked, but good practice)
                val response = generativeModel!!.generateContent(*chatHistory.toTypedArray()) // Pass history as varargs
                val botMessage = Message(response.text ?: "No response from bot", false)
                // Update messages list on the main thread
                messages = messages + botMessage // Add bot response

            } catch (e: Exception) {
                errorMessage = "Error: ${e.localizedMessage}"
                // Consider more specific error handling based on exception type
                e.printStackTrace() // Keep logging for debugging
            } finally {
                isLoading = false
            }
        }
    }

    fun clearErrorMessage() {
        errorMessage = null
    }
}