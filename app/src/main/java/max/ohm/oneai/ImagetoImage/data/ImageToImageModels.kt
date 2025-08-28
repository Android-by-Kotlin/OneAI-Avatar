package max.ohm.oneai.imagetoimage.data

import com.google.gson.annotations.SerializedName

data class ImageToImageRequest(
    @SerializedName("key")
    val key: String,
    
    @SerializedName("init_image")
    val initImage: String,
    
    @SerializedName("init_image_2")
    val initImage2: String? = null, // Second image for dual image functionality
    
    @SerializedName("prompt")
    val prompt: String,
    
    @SerializedName("negative_prompt")
    val negativePrompt: String = "",
    
    @SerializedName("model_id")
    val modelId: String,
    
    @SerializedName("num_inference_steps")
    val numInferenceSteps: String = "31",
    
    @SerializedName("strength")
    val strength: String = "0.8",
    
    @SerializedName("scheduler")
    val scheduler: String = "DPMSolverSinglestepScheduler",
    
    @SerializedName("guidance_scale")
    val guidanceScale: String = "7.5",
    
    @SerializedName("width")
    val width: String = "768",
    
    @SerializedName("height")
    val height: String = "1024",
    
    @SerializedName("samples")
    val samples: String = "1",
    
    @SerializedName("seed")
    val seed: String = "0",
    
    @SerializedName("safety_checker")
    val safetyChecker: String = "yes",
    
    @SerializedName("enhance_prompt")
    val enhancePrompt: Boolean = false,
    
    @SerializedName("use_karras_sigmas")
    val useKarrasSigmas: String = "yes",
    
    @SerializedName("clip_skip")
    val clipSkip: String = "1",
    
    @SerializedName("tomesd")
    val tomesd: String = "yes",
    
    @SerializedName("base64")
    val base64: Boolean = false
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
