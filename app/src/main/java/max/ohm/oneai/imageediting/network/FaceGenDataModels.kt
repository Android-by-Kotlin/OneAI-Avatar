package max.ohm.oneai.imageediting.network

import com.google.gson.annotations.SerializedName

// Request model for Face Gen API
data class FaceGenRequest(
    @SerializedName("key") val key: String,
    @SerializedName("prompt") val prompt: String,
    @SerializedName("negative_prompt") val negativePrompt: String,
    @SerializedName("face_image") val faceImage: String,
    @SerializedName("width") val width: String = "512",
    @SerializedName("height") val height: String = "512",
    @SerializedName("samples") val samples: String = "1",
    @SerializedName("num_inference_steps") val numInferenceSteps: String = "21",
    @SerializedName("safety_checker") val safetyChecker: Boolean = false,
    @SerializedName("base64") val base64: Boolean = false,
    @SerializedName("seed") val seed: Long? = null,
    @SerializedName("guidance_scale") val guidanceScale: Double = 7.5,
    @SerializedName("webhook") val webhook: String? = null,
    @SerializedName("track_id") val trackId: String? = null
)

// Response model for Face Gen API
data class FaceGenResponse(
    @SerializedName("status") val status: String,
    @SerializedName("generationTime") val generationTime: Double? = null,
    @SerializedName("id") val id: Int? = null,
    @SerializedName("output") val output: List<String>? = null,
    @SerializedName("proxy_links") val proxyLinks: List<String>? = null,
    @SerializedName("meta") val meta: FaceGenMeta? = null,
    @SerializedName("message") val message: String? = null,
    @SerializedName("messege") val messege: String? = null // API has typo
)

data class FaceGenMeta(
    @SerializedName("base64") val base64: String,
    @SerializedName("face_image") val faceImage: String,
    @SerializedName("file_prefix") val filePrefix: String,
    @SerializedName("guidance_scale") val guidanceScale: Double,
    @SerializedName("height") val height: Int,
    @SerializedName("negative_prompt") val negativePrompt: String,
    @SerializedName("num_inference_steps") val numInferenceSteps: Int,
    @SerializedName("outdir") val outdir: String,
    @SerializedName("prompt") val prompt: String,
    @SerializedName("safety_checker") val safetyChecker: String,
    @SerializedName("safety_checker_type") val safetyCheckerType: String,
    @SerializedName("samples") val samples: Int,
    @SerializedName("seed") val seed: Long,
    @SerializedName("temp") val temp: String,
    @SerializedName("width") val width: Int
)
