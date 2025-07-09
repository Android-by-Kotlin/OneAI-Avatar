package max.ohm.oneai.liveavatar.data

import com.google.gson.annotations.SerializedName

// Session Token Response
data class SessionTokenResponse(
    val data: SessionTokenData
)

data class SessionTokenData(
    val token: String
)

// Streaming New Response
data class StreamingNewResponse(
    val data: StreamingSessionData
)

data class StreamingSessionData(
    @SerializedName("session_id")
    val sessionId: String,
    val url: String,
    @SerializedName("access_token")
    val accessToken: String
)

// Streaming Start Request
data class StreamingStartRequest(
    @SerializedName("session_id")
    val sessionId: String
)

// Streaming New Request
data class StreamingNewRequest(
    val quality: String = "high",
    @SerializedName("avatar_name")
   // val avatarName: String = "Wayne_20240711",  // Updated default avatar
    val avatarName: String = "Wayne_20240711",
    val voice: VoiceConfig? = null,  // Made optional
    val version: String = "v2",
    @SerializedName("video_encoding")
    val videoEncoding: String = "H264"
)

data class VoiceConfig(
    @SerializedName("voice_id")
    val voiceId: String = "2d5b0e6cf36f460aa7fc47e3eee4ba54"  // Wayne's default voice ID
)

// Task Request
data class TaskRequest(
    @SerializedName("session_id")
    val sessionId: String,
    val text: String,
    @SerializedName("task_type")
    val taskType: String = "talk"
)

// Common Response
data class CommonResponse(
    val code: Int,
    val message: String?
)

// Error Response
data class ErrorResponse(
    val error: ErrorDetail?
)

data class ErrorDetail(
    val code: String?,
    val message: String?,
    val details: String?
)

// WebSocket Message
data class WebSocketMessage(
    val type: String,
    val data: Any?
)
