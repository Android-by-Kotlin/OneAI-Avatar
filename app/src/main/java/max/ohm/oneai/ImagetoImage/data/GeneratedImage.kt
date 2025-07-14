package max.ohm.oneai.imagetoimage.data

import android.graphics.Bitmap

data class GeneratedImage(
    val id: String = System.currentTimeMillis().toString(),
    val originalBitmap: Bitmap? = null,
    val generatedBitmap: Bitmap? = null,
    val generatedUrl: String? = null,
    val prompt: String,
    val negativePrompt: String = "",
    val timestamp: Long = System.currentTimeMillis(),
    val strength: Float = 0.7f,
    val guidanceScale: Float = 7.5f,
    val steps: Int = 20
)
