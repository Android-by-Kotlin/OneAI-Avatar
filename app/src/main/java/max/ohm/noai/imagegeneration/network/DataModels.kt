
package max.ohm.noai.network

import com.google.gson.annotations.SerializedName

// Request Body Structure task requirements
data class ImageGenerationRequest(
    val model: String = "black-forest-labs/flux-schnell",
    val prompt: String,
    @SerializedName("response_format")
    val responseFormat: String = "b64_json", // Assuming base64 encoded image data
    val n: Int = 1, // Generate 1 image
    val size: String = "1024x1024",
    // Extra body parameters specific to the model/API
    @SerializedName("extra_body")
    val extraBody: Map<String, Any> = mapOf(
        "width" to 1024,
        "height" to 1024,
        "num_inference_steps" to 4,
        "negative_prompt" to "",
        "seed" to -1
    )
)

// Response Structure (assuming response with base64 image data)
data class ImageGenerationResponse(
    val created: Long,
    val data: List<ImageData>
)

data class ImageData(
    @SerializedName("b64_json")
    val base64Json: String // Base64 encoded image string
)