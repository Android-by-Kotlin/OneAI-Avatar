package max.ohm.oneai.stabilityai.data

import com.google.gson.annotations.SerializedName

data class StabilityImageRequest(
    @SerializedName("init_image")
    val initImage: String,
    
    @SerializedName("init_image_mode")
    val initImageMode: String = "IMAGE_STRENGTH",
    
    @SerializedName("image_strength")
    val imageStrength: Float = 0.35f,
    
    @SerializedName("text_prompts")
    val textPrompts: List<TextPrompt>,
    
    @SerializedName("cfg_scale")
    val cfgScale: Int = 7,
    
    @SerializedName("samples")
    val samples: Int = 1,
    
    @SerializedName("steps")
    val steps: Int = 30
)

data class TextPrompt(
    @SerializedName("text")
    val text: String,
    
    @SerializedName("weight")
    val weight: Float = 1.0f
)

data class StabilityImageResponse(
    @SerializedName("status")
    val status: String? = null,
    
    @SerializedName("output")
    val output: List<String>? = null,
    
    @SerializedName("message")
    val message: String? = null,
    
    @SerializedName("error")
    val error: String? = null,
    
    // For direct binary response
    val imageData: ByteArray? = null
)

data class GeneratedImage(
    val id: String,
    val imageUrl: String,
    val prompt: String,
    val timestamp: Long = System.currentTimeMillis()
)

data class SearchAndReplaceRequest(
    val image: String, // Base64 encoded image or file path
    val prompt: String,
    val searchPrompt: String,
    val outputFormat: String = "webp"
)

data class SearchAndReplaceResponse(
    val status: String? = null,
    val imageData: ByteArray? = null,
    val error: String? = null,
    val message: String? = null
) 

data class SearchAndRecolorRequest(
    val image: String, // Base64 encoded or file path
    val prompt: String,
    val selectPrompt: String,
    val outputFormat: String = "webp"
)

data class SearchAndRecolorResponse(
    val status: String? = null,
    val imageData: ByteArray? = null,
    val error: String? = null,
    val message: String? = null
) {
    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (javaClass != other?.javaClass) return false

        other as SearchAndRecolorResponse

        if (status != other.status) return false
        if (imageData != null) {
            if (other.imageData == null) return false
            if (!imageData.contentEquals(other.imageData)) return false
        } else if (other.imageData != null) return false
        if (error != other.error) return false
        if (message != other.message) return false

        return true
    }

    override fun hashCode(): Int {
        var result = status?.hashCode() ?: 0
        result = 31 * result + (imageData?.contentHashCode() ?: 0)
        result = 31 * result + (error?.hashCode() ?: 0)
        result = 31 * result + (message?.hashCode() ?: 0)
        return result
    }
}

data class RemoveBackgroundRequest(
    val image: String, // Base64 encoded or file path
    val outputFormat: String = "webp"
)

data class RemoveBackgroundResponse(
    val status: String? = null,
    val imageData: ByteArray? = null,
    val error: String? = null,
    val message: String? = null
) {
    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (javaClass != other?.javaClass) return false

        other as RemoveBackgroundResponse

        if (status != other.status) return false
        if (imageData != null) {
            if (other.imageData == null) return false
            if (!imageData.contentEquals(other.imageData)) return false
        } else if (other.imageData != null) return false
        if (error != other.error) return false
        if (message != other.message) return false

        return true
    }

    override fun hashCode(): Int {
        var result = status?.hashCode() ?: 0
        result = 31 * result + (imageData?.contentHashCode() ?: 0)
        result = 31 * result + (error?.hashCode() ?: 0)
        result = 31 * result + (message?.hashCode() ?: 0)
        return result
    }
}

