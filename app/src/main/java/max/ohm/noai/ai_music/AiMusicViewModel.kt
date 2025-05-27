package max.ohm.noai.ai_music

import android.app.Application
import androidx.lifecycle.AndroidViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.launch
import max.ohm.noai.ai_music.network.MusicApiClient
import max.ohm.noai.ai_music.network.RiffusionRequest
import max.ohm.noai.ai_music.network.RiffusionResponse
import androidx.media3.exoplayer.ExoPlayer
import androidx.media3.common.MediaItem

class AiMusicViewModel(application: Application) : AndroidViewModel(application) {

    private val _prompt = MutableStateFlow("")
    val prompt: StateFlow<String> = _prompt

    private val _musicUrl = MutableStateFlow<String?>(null)
    val musicUrl: StateFlow<String?> = _musicUrl

    private val _isLoading = MutableStateFlow(false)
    val isLoading: StateFlow<Boolean> = _isLoading

    private val _error = MutableStateFlow<String?>(null)
    val error: StateFlow<String?> = _error

    private val _isPlaying = MutableStateFlow(false)
    val isPlaying: StateFlow<Boolean> = _isPlaying

    private var exoPlayer: ExoPlayer? = null

    init {
        exoPlayer = ExoPlayer.Builder(application).build()
    }

    fun updatePrompt(newPrompt: String) {
        _prompt.value = newPrompt
    }

    fun generateMusic() {
        _isLoading.value = true
        _error.value = null
        viewModelScope.launch {
            try {
                val response: RiffusionResponse = MusicApiClient.riffusionApiService.generateMusic(
                    RiffusionRequest(inputs = _prompt.value)
                )
                _musicUrl.value = response.audioUrl
                _isLoading.value = false
                _isPlaying.value = false // Reset playing state on new music generation
            } catch (e: Exception) {
                _error.value = "Error generating music: ${e.message}"
                _isLoading.value = false
            }
        }
    }

    fun playMusic(url: String) {
        exoPlayer?.release()
        exoPlayer = ExoPlayer.Builder(getApplication()).build()
        val mediaItem = MediaItem.fromUri(url)
        exoPlayer?.setMediaItem(mediaItem)
        exoPlayer?.prepare()
        exoPlayer?.playWhenReady = true
        _isPlaying.value = true
    }

    fun pauseMusic() {
        exoPlayer?.pause()
        _isPlaying.value = false
    }

    fun resumeMusic() {
        exoPlayer?.play()
        _isPlaying.value = true
    }

    fun stopMusic() {
        exoPlayer?.stop()
        exoPlayer?.clearMediaItems()
        _isPlaying.value = false
    }

    fun setPlaying(playing: Boolean) {
        _isPlaying.value = playing
    }

    override fun onCleared() {
        super.onCleared()
        exoPlayer?.release()
        exoPlayer = null
    }
}
