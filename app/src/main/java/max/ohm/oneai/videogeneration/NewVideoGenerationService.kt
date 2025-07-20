package max.ohm.oneai.videogeneration

import max.ohm.oneai.a4f.A4FClient
import okhttp3.MediaType.Companion.toMediaTypeOrNull
import okhttp3.OkHttpClient
import okhttp3.Request
import okhttp3.RequestBody.Companion.toRequestBody
import org.json.JSONObject

object NewVideoGenerationService {

    private val client = OkHttpClient()

    fun generateVideo(prompt: String, onVideoGenerated: (String) -> Unit) {
        val json = JSONObject()
        json.put("model", "provider-6/wan-2.1")
        json.put("prompt", prompt)
        json.put("ratio", "16:9")
        json.put("quality", "480p")
        json.put("duration", 4)

        val body = json.toString().toRequestBody("application/json; charset=utf-8".toMediaTypeOrNull())

        val request = Request.Builder()
            .url(A4FClient.A4F_BASE_URL + "video/generations")
            .addHeader("Authorization", "Bearer " + A4FClient.A4F_API_KEY)
            .post(body)
            .build()

        client.newCall(request).execute().use { response ->
            if (response.isSuccessful) {
                val videoUrl = response.body?.string() ?: ""
                onVideoGenerated(videoUrl)
            } else {
                // handle error
            }
        }
    }
}
