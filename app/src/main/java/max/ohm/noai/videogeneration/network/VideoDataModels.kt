package max.ohm.noai.videogeneration.network

import com.google.gson.annotations.SerializedName

data class VideoGenerationRequest(
    val model: String,
    val prompt: String
)

data class BaseResponse(
    @SerializedName("status_code") val statusCode: Int,
    @SerializedName("status_msg") val statusMsg: String
)

data class VideoGenerationTaskResponse(
    @SerializedName("task_id") val taskId: String,
    val status: String?,
    @SerializedName("file_id") val fileId: String?,
    @SerializedName("video_width") val videoWidth: Int?,
    @SerializedName("video_height") val videoHeight: Int?,
    @SerializedName("base_resp") val baseResp: BaseResponse
)

data class VideoFile(
    @SerializedName("file_id") val fileId: String?,
    @SerializedName("created_at") val createdAt: Long?,
    val filename: String?,
    val purpose: String?,
    val bytes: Long?,
    @SerializedName("download_url") val downloadUrl: String?,
    @SerializedName("backup_download_url") val backupDownloadUrl: String?
)

data class VideoFileResponse(
    val file: VideoFile?,
    @SerializedName("base_resp") val baseResp: BaseResponse
)
