package max.ohm.noai.geminiflash.network


data class GeminiFlashRequest(
    val model: String,
    val messages: List<Message>
)

data class Message(
    val role: String,
    val content: List<Part> // Change content to a list of parts
)

sealed class Part // Use sealed class for different types of content
data class TextPart(val text: String) : Part()
data class InlineDataPart(
    val inline_data: InlineData // Use inline_data for image
) : Part()

data class InlineData(
    val mime_type: String,
    val data: String // Base64 encoded image data
)

data class GeminiFlashResponse(
    val choices: List<Choice>
)

data class Choice(
    val message: MessageContent
)

data class MessageContent(
    val content: String
)
