package max.ohm.oneai.videogeneration

data class GeneratedVideo(
    val id: String,
    val prompt: String,
    val videoUrl: String,
    val thumbnailPath: String? = null,
    val timestamp: Long,
    val model: String = "Wan 2.1",
    val width: Int = 1024,
    val height: Int = 576,
    val duration: Int? = null
)

data class VideoHistoryItem(
    val id: String,
    val prompt: String,
    val videoUrl: String,
    val thumbnailPath: String? = null,
    val timestamp: Long,
    val model: String
)
