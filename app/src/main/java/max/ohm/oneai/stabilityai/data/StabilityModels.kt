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
