package max.ohm.noai.geminiflash

import androidx.compose.runtime.mutableStateListOf
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.launch
import max.ohm.noai.geminiflash.network.GeminiFlashApiClient
import max.ohm.noai.geminiflash.network.GeminiFlashRequest
import max.ohm.noai.geminiflash.network.Message

class GeminiFlashViewModel : ViewModel() {
    val messages = mutableStateListOf<Message>()

    fun sendMessage(prompt: String) {
        messages.add(Message(role = "user", content = prompt))
        viewModelScope.launch {
            try {
                val request = GeminiFlashRequest(
                    model = "provider-1/gemini-flash-2.0",
                    messages = listOf(Message(role = "user", content = prompt))
                )
                val response = GeminiFlashApiClient.apiService.getChatCompletion(request)
                if (response.isSuccessful) {
                    val aiResponse = response.body()?.choices?.firstOrNull()?.message?.content
                    aiResponse?.let {
                        messages.add(Message(role = "assistant", content = it))
                    }
                } else {
                    messages.add(Message(role = "assistant", content = "Error: ${response.code()} - ${response.message()}"))
                }
            } catch (e: Exception) {
                messages.add(Message(role = "assistant", content = "Error: ${e.message}"))
            }
        }
    }
}
