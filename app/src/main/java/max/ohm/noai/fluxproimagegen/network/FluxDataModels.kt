package max.ohm.noai.fluxproimagegen.network



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
