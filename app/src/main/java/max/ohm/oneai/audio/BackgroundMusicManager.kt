package max.ohm.oneai.audio

import android.content.Context
import android.media.MediaPlayer
import android.util.Log
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.launch
import max.ohm.oneai.R
import kotlin.random.Random

/**
 * Singleton manager for handling background music across the app
 */
object BackgroundMusicManager {
    private const val TAG = "BackgroundMusicManager"
    
    private var mediaPlayer: MediaPlayer? = null
    private var currentMusicResource: Int? = null
    
    // Music state flows
    private val _isMusicEnabled = MutableStateFlow(true)
    val isMusicEnabled: StateFlow<Boolean> = _isMusicEnabled
    
    private val _isPlaying = MutableStateFlow(false)
    val isPlaying: StateFlow<Boolean> = _isPlaying
    
    // Available music tracks for generation screens
    // Currently using empty list - add music files to res/raw folder when available
    private val musicTracks = listOf<Int>(
         R.raw.generation_music_1,
        // R.raw.generation_music_2,
        // R.raw.generation_music_3,
        // R.raw.generation_music_4,
        // R.raw.generation_music_5
    )
    
    /**
     * Initialize the music manager with context
     */
    fun initialize(context: Context) {
        loadMusicPreference(context)
    }
    
    /**
     * Load music preference from SharedPreferences
     */
    private fun loadMusicPreference(context: Context) {
        val prefs = context.getSharedPreferences("app_preferences", Context.MODE_PRIVATE)
        _isMusicEnabled.value = prefs.getBoolean("background_music_enabled", true)
    }
    
    /**
     * Save music preference to SharedPreferences
     */
    fun saveMusicPreference(context: Context, enabled: Boolean) {
        val prefs = context.getSharedPreferences("app_preferences", Context.MODE_PRIVATE)
        prefs.edit().putBoolean("background_music_enabled", enabled).apply()
        _isMusicEnabled.value = enabled
        
        // Stop music if disabled
        if (!enabled) {
            stopMusic()
        }
    }
    
    /**
     * Toggle music enabled state
     */
    fun toggleMusic(context: Context) {
        saveMusicPreference(context, !_isMusicEnabled.value)
    }
    
    /**
     * Start playing random background music
     */
    fun startRandomMusic(context: Context) {
        if (!_isMusicEnabled.value) {
            Log.d(TAG, "Music is disabled, not starting")
            return
        }
        
        if (musicTracks.isEmpty()) {
            Log.d(TAG, "No music tracks available. Add music files to res/raw folder.")
            return
        }
        
        CoroutineScope(Dispatchers.IO).launch {
            try {
                // Stop any currently playing music
                stopMusic()
                
                // Select a random track
                val randomTrack = musicTracks.random()
                currentMusicResource = randomTrack
                
                // Create and configure MediaPlayer
                mediaPlayer = MediaPlayer.create(context, randomTrack)?.apply {
                    isLooping = true
                    setVolume(0.3f, 0.3f) // Set to 30% volume for background music
                    
                    setOnPreparedListener {
                        start()
                        _isPlaying.value = true
                        Log.d(TAG, "Started playing background music: $randomTrack")
                    }
                    
                    setOnErrorListener { _, what, extra ->
                        Log.e(TAG, "MediaPlayer error: what=$what, extra=$extra")
                        stopMusic()
                        true // Return true to indicate we handled the error
                    }
                    
                    setOnCompletionListener {
                        // Even though we're looping, handle completion just in case
                        if (_isMusicEnabled.value) {
                            // Start a new random track
                            startRandomMusic(context)
                        } else {
                            stopMusic()
                        }
                    }
                }
                
                if (mediaPlayer == null) {
                    Log.e(TAG, "Failed to create MediaPlayer for resource: $randomTrack")
                }
                
            } catch (e: Exception) {
                Log.e(TAG, "Error starting music", e)
                stopMusic()
            }
        }
    }
    
    /**
     * Stop playing background music
     */
    fun stopMusic() {
        try {
            mediaPlayer?.apply {
                try {
                    if (isPlaying) {
                        stop()
                    }
                } catch (e: IllegalStateException) {
                    Log.e(TAG, "MediaPlayer in illegal state when stopping", e)
                }
                try {
                    reset()
                } catch (e: Exception) {
                    Log.e(TAG, "Error resetting MediaPlayer", e)
                }
                release()
            }
            mediaPlayer = null
            currentMusicResource = null
            _isPlaying.value = false
            Log.d(TAG, "Stopped background music")
        } catch (e: Exception) {
            Log.e(TAG, "Error stopping music", e)
            // Force cleanup
            mediaPlayer = null
            currentMusicResource = null
            _isPlaying.value = false
        }
    }
    
    /**
     * Pause background music
     */
    fun pauseMusic() {
        try {
            mediaPlayer?.apply {
                if (isPlaying) {
                    pause()
                    _isPlaying.value = false
                    Log.d(TAG, "Paused background music")
                }
            }
        } catch (e: Exception) {
            Log.e(TAG, "Error pausing music", e)
            // If there's an error, try to stop the music completely
            stopMusic()
        }
    }
    
    /**
     * Resume background music
     */
    fun resumeMusic() {
        if (!_isMusicEnabled.value) {
            return
        }
        
        try {
            mediaPlayer?.apply {
                if (!isPlaying) {
                    start()
                    _isPlaying.value = true
                    Log.d(TAG, "Resumed background music")
                }
            }
        } catch (e: Exception) {
            Log.e(TAG, "Error resuming music", e)
        }
    }
    
    /**
     * Set music volume (0.0 to 1.0)
     */
    fun setVolume(volume: Float) {
        val clampedVolume = volume.coerceIn(0f, 1f)
        mediaPlayer?.setVolume(clampedVolume, clampedVolume)
    }
    
    /**
     * Fade in music volume
     */
    fun fadeIn(duration: Long = 1000L) {
        CoroutineScope(Dispatchers.IO).launch {
            val steps = 20
            val stepDuration = duration / steps
            val volumeStep = 0.3f / steps
            
            for (i in 0..steps) {
                val volume = (i * volumeStep).coerceIn(0f, 0.3f)
                setVolume(volume)
                kotlinx.coroutines.delay(stepDuration)
            }
        }
    }
    
    /**
     * Fade out music volume
     */
    fun fadeOut(duration: Long = 1000L, stopAfter: Boolean = true) {
        CoroutineScope(Dispatchers.IO).launch {
            val steps = 20
            val stepDuration = duration / steps
            val volumeStep = 0.3f / steps
            
            for (i in steps downTo 0) {
                val volume = (i * volumeStep).coerceIn(0f, 0.3f)
                setVolume(volume)
                kotlinx.coroutines.delay(stepDuration)
            }
            
            if (stopAfter) {
                stopMusic()
            }
        }
    }
}
