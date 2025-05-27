package max.ohm.noai.musicgeneration.network

import com.google.gson.annotations.SerializedName

// Request Body Structure for Riffusion API
data class MusicGenerationRequest(
    val inputs: String // The text prompt for music generation
)

// Response Structure for Riffusion API
// The Riffusion API returns audio data as base64 encoded string
data class MusicGenerationResponse(
    @SerializedName("audio")
    val audioData: String? = null, // Base64 encoded audio data
    val error: String? = null // Error message if any
)

// Alternative response structure if API returns different format
data class RiffusionApiResponse(
    val generated_audio: String? = null, // Base64 encoded audio
    val message: String? = null,
    val error: String? = null
)