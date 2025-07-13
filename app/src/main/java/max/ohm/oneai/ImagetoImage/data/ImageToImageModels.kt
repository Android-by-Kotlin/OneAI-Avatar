package max.ohm.oneai.ImagetoImage.data

import com.google.gson.annotations.SerializedName

data class ImageToImageRequest(
    @SerializedName("init_image")
    val initImage: String,
    
    @SerializedName("prompt")
    val prompt: String,
    
    @SerializedName("negative_prompt")
    val negativePrompt: String,
    
    @SerializedName("model_id")
    val modelId: String,
    
    @SerializedName("num_inference_steps")
    val numInferenceSteps: String,
    
    @SerializedName("strength")
    val strength: String,
    
    @SerializedName("scheduler")
    val scheduler: String,
    
    @SerializedName("guidance")
    val guidance: String
)

data class ImageToImageResponse(
    @SerializedName("status")
    val status: String? = null,
    
    @SerializedName("output")
    val output: List<String>? = null,
    
    @SerializedName("message")
    val message: String? = null,
    
    @SerializedName("error")
    val error: String? = null,
    
    @SerializedName("eta")
    val eta: Double? = null,
    
    @SerializedName("messege")  // Note: API might have typo
    val messege: String? = null
)
