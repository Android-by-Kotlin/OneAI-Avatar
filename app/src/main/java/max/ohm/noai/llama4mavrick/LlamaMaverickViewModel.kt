package max.ohm.noai.llama4mavrick

import androidx.compose.runtime.mutableStateListOf
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.launch

class LlamaMaverickViewModel : ViewModel() {

    val messages = mutableStateListOf<Message>()

    fun sendMessage(content: String) {
        val userMessage = Message("user", content)
        messages.add(userMessage)

        viewModelScope.launch {
            try {
                val request = ChatCompletionRequest(messages = messages.toList())
                val response = LlamaMaverickApiClient.apiService.createChatCompletion(request)

                if (response.isSuccessful && response.body() != null) {
                    val assistantMessage = response.body()!!.choices.first().message
                    messages.add(assistantMessage)
                } else {
                    // Handle API error
                    val errorMessage = Message("system", "Error: ${response.code()} - ${response.message()}")
                    messages.add(errorMessage)
                }
            } catch (e: Exception) {
                // Handle network or other exceptions
                val errorMessage = Message("system", "Error: ${e.message}")
                messages.add(errorMessage)
            }
        }
    }
}