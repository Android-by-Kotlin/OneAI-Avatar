package max.ohm.noai.llama4mavrick

import com.google.gson.annotations.SerializedName

data class Message(
    val role: String,
    val content: String
)

data class ChatCompletionRequest(
    val model: String = "meta-llama/llama-4-maverick:free", // Default model, can be changed
    val messages: List<Message>
)

data class ChatCompletionResponse(
    val id: String,
    val `object`: String,
    val created: Long,
    val model: String,
    val choices: List<Choice>,
    val usage: Usage
)

data class Choice(
    val index: Int,
    val message: Message,
    @SerializedName("finish_reason")
    val finishReason: String
)

data class Usage(
    @SerializedName("prompt_tokens")
    val promptTokens: Int,
    @SerializedName("completion_tokens")
    val completionTokens: Int,
    @SerializedName("total_tokens")
    val totalTokens: Int
)