package max.ohm.oneai.audio

import android.content.Context
import android.media.AudioAttributes
import android.media.MediaPlayer
import android.util.Log
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext

/**
 * Singleton manager for handling background music across the app
 */
object BackgroundMusicManager {
    private const val TAG = "BackgroundMusicManager"
    
    private var mediaPlayer: MediaPlayer? = null
    private var currentMusicUrl: String? = null
    
    // Music state flows
    private val _isMusicEnabled = MutableStateFlow(true)
    val isMusicEnabled: StateFlow<Boolean> = _isMusicEnabled
    
    private val _isPlaying = MutableStateFlow(false)
    val isPlaying: StateFlow<Boolean> = _isPlaying
    
    // Online music URLs for generation screens
    // Using royalty-free music from various sources
    private val onlineMusicTracks = listOf(

     "https://courageous-green-amwnyqz1nm.edgeone.app/Lovely-Long-Version-chosic.com_.mp3",
     "https://courageous-green-amwnyqz1nm.edgeone.app/Luke-Bergs-Waesto-Follow-The-Sun(chosic.com).mp3",
     "https://courageous-green-amwnyqz1nm.edgeone.app/Powerful-Trap-(chosic.com).mp3",
     "https://courageous-green-amwnyqz1nm.edgeone.app/acoustic-light-161985.mp3",
     "https://courageous-green-amwnyqz1nm.edgeone.app/bensound-creativeminds.mp3",
     "https://courageous-green-amwnyqz1nm.edgeone.app/country-acoustic-folk-travel-vlog-music-254543.mp3",
     "https://courageous-green-amwnyqz1nm.edgeone.app/growing-up-123251.mp3",
     "https://courageous-green-amwnyqz1nm.edgeone.app/inspired-acoustic-morning-252333.mp3",
     "https://courageous-green-amwnyqz1nm.edgeone.app/instrumental-acoustic-guitar-music-380085.mp3",
     "https://courageous-green-amwnyqz1nm.edgeone.app/peacable-milieu-297513.mp3",
     "https://personal-yellow-tsxplwzuql.edgeone.app/HEROICCC(chosic.com).mp3",
     "https://personal-yellow-tsxplwzuql.edgeone.app/Hotham-Easy-Love-chosic.com_.mp3",
     "https://personal-yellow-tsxplwzuql.edgeone.app/Luke-Bergs-Waesto-Take-Me-Back(chosic.com).mp3",
     "https://personal-yellow-tsxplwzuql.edgeone.app/WinterWaltz-chosic.com_.mp3",
     "https://personal-yellow-tsxplwzuql.edgeone.app/alex-productions-epic-cinematic-saga-trailer-myths(chosic.com).mp3",
     "https://personal-yellow-tsxplwzuql.edgeone.app/maxkomusic-christmas-is-coming(chosic.com).mp3",
     "https://personal-yellow-tsxplwzuql.edgeone.app/roa-music-summer-madness(chosic.com).mp3"







        // Calm ambient music for generation
       

      //  "https://jumpshare.com/s/qkNRZG5W6nHEhfj9ekUH"
      //  "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3",
       // "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3",
     //   "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3",
      //  "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-4.mp3",
      //  "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-5.mp3",
      //  "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-6.mp3",
      //  "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-7.mp3",
      //  "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-8.mp3",
        // Alternative: Free music from Bensound (if needed, replace with your preferred URLs)
        // "https://www.bensound.com/bensound-music/bensound-slowmotion.mp3",
        // "https://www.bensound.com/bensound-music/bensound-onceagain.mp3"
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
     * Start playing random background music from online sources
     */
    fun startRandomMusic(context: Context) {
        if (!_isMusicEnabled.value) {
            Log.d(TAG, "Music is disabled, not starting")
            return
        }
        
        if (onlineMusicTracks.isEmpty()) {
            Log.d(TAG, "No online music tracks available.")
            return
        }
        
        CoroutineScope(Dispatchers.IO).launch {
            try {
                // Stop any currently playing music
                stopMusic()
                
                // Select a random track URL
                val randomTrackUrl = onlineMusicTracks.random()
                Log.d(TAG, "Selected music URL: $randomTrackUrl")
                
                // Create and configure MediaPlayer for streaming
                withContext(Dispatchers.Main) {
                    mediaPlayer = MediaPlayer().apply {
                        try {
                            // Set audio attributes for music streaming
                            val audioAttributes = AudioAttributes.Builder()
                                .setUsage(AudioAttributes.USAGE_MEDIA)
                                .setContentType(AudioAttributes.CONTENT_TYPE_MUSIC)
                                .build()
                            setAudioAttributes(audioAttributes)
                            
                            // Set the data source to the online URL
                            setDataSource(randomTrackUrl)
                            
                            // Set volume for background music
                            setVolume(0.3f, 0.3f)
                            
                            // Enable looping
                            isLooping = true
                            
                            setOnPreparedListener {
                                start()
                                _isPlaying.value = true
                                Log.d(TAG, "Started playing online music: $randomTrackUrl")
                            }
                            
                            setOnErrorListener { _, what, extra ->
                                Log.e(TAG, "MediaPlayer error: what=$what, extra=$extra")
                                // Try another track if this one fails
                                if (onlineMusicTracks.size > 1) {
                                    val alternativeUrl = onlineMusicTracks.filter { it != randomTrackUrl }.random()
                                    Log.d(TAG, "Trying alternative URL: $alternativeUrl")
                                    CoroutineScope(Dispatchers.IO).launch {
                                        stopMusic()
                                        // Small delay before trying again
                                        kotlinx.coroutines.delay(500)
                                        startRandomMusic(context)
                                    }
                                } else {
                                    stopMusic()
                                }
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
                            
                            setOnBufferingUpdateListener { _, percent ->
                                Log.d(TAG, "Buffering: $percent%")
                            }
                            
                            // Prepare async to not block the UI thread
                            prepareAsync()
                            
                        } catch (e: Exception) {
                            Log.e(TAG, "Error setting up MediaPlayer", e)
                            release()
                            mediaPlayer = null
                        }
                    }
                }
                
                if (mediaPlayer == null) {
                    Log.e(TAG, "Failed to create MediaPlayer for URL: $randomTrackUrl")
                }
                
            } catch (e: Exception) {
                Log.e(TAG, "Error starting online music", e)
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
            currentMusicUrl = null
            _isPlaying.value = false
            Log.d(TAG, "Stopped background music")
        } catch (e: Exception) {
            Log.e(TAG, "Error stopping music", e)
            // Force cleanup
            mediaPlayer = null
            currentMusicUrl = null
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
