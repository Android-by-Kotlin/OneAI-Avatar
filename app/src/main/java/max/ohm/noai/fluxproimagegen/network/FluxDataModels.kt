package max.ohm.noai.fluxproimagegen.network

import com.google.gson.annotations.SerializedName

data class FluxImageGenerationRequest(
    val model: String,
    val prompt: String,
    val n: Int,
    val size: String
)

data class FluxImageGenerationResponse(
    val data: List<FluxImageData>
)

data class FluxImageData(
    val url: String
)
