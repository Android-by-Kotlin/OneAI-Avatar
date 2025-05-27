package max.ohm.noai.ai_music.network

import com.google.gson.annotations.SerializedName

data class RiffusionRequest(
    val inputs: String
)

data class RiffusionResponse(
    @SerializedName("audio_url")
    val audioUrl: String
)
