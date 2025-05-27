package max.ohm.noai.musicgeneration

import android.content.Context
import android.media.MediaPlayer
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.setValue
import androidx.compose.ui.text.input.TextFieldValue
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.launch
import max.ohm.noai.musicgeneration.network.MusicApiClient
import max.ohm.noai.musicgeneration.network.MusicGenerationRequest
import retrofit2.Response
import java.io.File
import java.io.FileOutputStream
import java.io.IOException

class MusicViewModel : ViewModel() {
    var prompt by mutableStateOf(TextFieldValue(""))
        private set

    var isLoading by mutableStateOf(false)
        private set

    var errorMessage by mutableStateOf<String?>(null)
        private set

    var isPlaying by mutableStateOf(false)
        private set

    var isPaused by mutableStateOf(false)
        private set

    var generatedAudioFile by mutableStateOf<File?>(null)
        private set

    private var mediaPlayer: MediaPlayer? = null
    private var currentPosition = 0

    fun onPromptChange(newPrompt: TextFieldValue) {
        prompt = newPrompt
    }

    fun clearErrorMessage() {
        errorMessage = null
    }

    fun generateMusic(context: Context) {
        if (HUGGINGFACE_API_KEY == "YOUR_HUGGINGFACE_API_KEY_HERE") {
            errorMessage = "Please replace 'YOUR_HUGGINGFACE_API_KEY_HERE' in MusicGenApiKey.kt"
            return
        }
        if (prompt.text.isBlank()) {
            errorMessage = "Please enter a prompt"
            return
        }

        isLoading = true
        generatedAudioFile = null
        errorMessage = null
        stopMusic() // Stop any currently playing music

        viewModelScope.launch {
            try {
                val request = MusicGenerationRequest(inputs = prompt.text)
                val apiKeyHeader = "Bearer $HUGGINGFACE_API_KEY"
                val response: Response<ByteArray> = MusicApiClient.instance.generateMusic(apiKeyHeader, request)

                if (response.isSuccessful && response.body() != null) {
                    val audioData = response.body()!!
                    
                    // Save audio data to temporary file
                    val tempFile = File(context.cacheDir, "generated_music_${System.currentTimeMillis()}.wav")
                    try {
                        FileOutputStream(tempFile).use { fos ->
                            fos.write(audioData)
                        }
                        generatedAudioFile = tempFile
                    } catch (e: IOException) {
                        errorMessage = "Failed to save audio file: ${e.localizedMessage}"
                    }
                } else {
                    val errorBody = response.errorBody()?.string() ?: "Unknown API error"
                    errorMessage = "API Error: ${response.code()} - $errorBody"
                }
            } catch (e: Exception) {
                errorMessage = "Network or other error: ${e.localizedMessage}"
                e.printStackTrace()
            } finally {
                isLoading = false
            }
        }
    }

    fun playMusic() {
        generatedAudioFile?.let { file ->
            try {
                if (mediaPlayer == null) {
                    mediaPlayer = MediaPlayer().apply {
                        setDataSource(file.absolutePath)
                        prepare()
                        setOnCompletionListener {
                            this@MusicViewModel.isPlaying = false
                            isPaused = false
                            this@MusicViewModel.currentPosition = 0
                        }
                    }
                }
                
                if (isPaused) {
                    mediaPlayer?.seekTo(currentPosition)
                }
                
                mediaPlayer?.start()
                isPlaying = true
                isPaused = false
            } catch (e: Exception) {
                errorMessage = "Failed to play music: ${e.localizedMessage}"
            }
        }
    }

    fun pauseMusic() {
        mediaPlayer?.let {
            if (it.isPlaying) {
                currentPosition = it.currentPosition
                it.pause()
                isPlaying = false
                isPaused = true
            }
        }
    }

    fun stopMusic() {
        mediaPlayer?.let {
            if (it.isPlaying) {
                it.stop()
            }
            it.release()
        }
        mediaPlayer = null
        isPlaying = false
        isPaused = false
        currentPosition = 0
    }

    override fun onCleared() {
        super.onCleared()
        stopMusic()
    }
}