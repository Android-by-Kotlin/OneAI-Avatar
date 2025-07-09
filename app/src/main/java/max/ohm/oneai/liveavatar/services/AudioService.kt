package max.ohm.oneai.liveavatar.services

import android.content.Context
import android.media.AudioAttributes
import android.media.AudioFocusRequest
import android.media.AudioManager
import android.os.Build
import android.util.Log

class AudioService(private val context: Context) {
    
    companion object {
        private const val TAG = "AudioService"
    }
    
    private val audioManager = context.getSystemService(Context.AUDIO_SERVICE) as AudioManager
    private var audioFocusRequest: AudioFocusRequest? = null
    
    fun enableSpeaker() {
        try {
            Log.d(TAG, "Enabling speaker for avatar voice output")
            
            // Request audio focus
            requestAudioFocus()
            
            // Set the mode to MODE_IN_COMMUNICATION for VoIP-like behavior
            audioManager.mode = AudioManager.MODE_IN_COMMUNICATION
            
            // Enable speaker
            audioManager.isSpeakerphoneOn = true
            
            // Alternative approach: Set to music stream and max volume
            // audioManager.mode = AudioManager.MODE_NORMAL
            // audioManager.setStreamVolume(
            //     AudioManager.STREAM_MUSIC,
            //     audioManager.getStreamMaxVolume(AudioManager.STREAM_MUSIC),
            //     0
            // )
            
            Log.d(TAG, "Speaker enabled successfully")
            Log.d(TAG, "Audio mode: ${audioManager.mode}")
            Log.d(TAG, "Speaker on: ${audioManager.isSpeakerphoneOn}")
            
        } catch (e: Exception) {
            Log.e(TAG, "Failed to enable speaker", e)
        }
    }
    
    fun disableSpeaker() {
        try {
            Log.d(TAG, "Disabling speaker")
            
            // Restore normal audio mode
            audioManager.mode = AudioManager.MODE_NORMAL
            audioManager.isSpeakerphoneOn = false
            
            // Abandon audio focus
            abandonAudioFocus()
            
            Log.d(TAG, "Speaker disabled successfully")
            
        } catch (e: Exception) {
            Log.e(TAG, "Failed to disable speaker", e)
        }
    }
    
    private fun requestAudioFocus() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val audioAttributes = AudioAttributes.Builder()
                .setUsage(AudioAttributes.USAGE_VOICE_COMMUNICATION)
                .setContentType(AudioAttributes.CONTENT_TYPE_SPEECH)
                .build()
                
            audioFocusRequest = AudioFocusRequest.Builder(AudioManager.AUDIOFOCUS_GAIN_TRANSIENT)
                .setAudioAttributes(audioAttributes)
                .setAcceptsDelayedFocusGain(true)
                .setOnAudioFocusChangeListener { focusChange ->
                    when (focusChange) {
                        AudioManager.AUDIOFOCUS_LOSS -> {
                            Log.d(TAG, "Audio focus lost")
                        }
                        AudioManager.AUDIOFOCUS_GAIN -> {
                            Log.d(TAG, "Audio focus gained")
                        }
                    }
                }
                .build()
                
            audioManager.requestAudioFocus(audioFocusRequest!!)
        } else {
            // For older versions
            @Suppress("DEPRECATION")
            audioManager.requestAudioFocus(
                { focusChange ->
                    Log.d(TAG, "Audio focus change: $focusChange")
                },
                AudioManager.STREAM_VOICE_CALL,
                AudioManager.AUDIOFOCUS_GAIN_TRANSIENT
            )
        }
    }
    
    private fun abandonAudioFocus() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            audioFocusRequest?.let {
                audioManager.abandonAudioFocusRequest(it)
            }
        } else {
            @Suppress("DEPRECATION")
            audioManager.abandonAudioFocus(null)
        }
    }
    
    fun isBluetoothConnected(): Boolean {
        return audioManager.isBluetoothScoOn || audioManager.isBluetoothA2dpOn
    }
    
    fun routeToSpeaker() {
        // Force route to speaker even if bluetooth is connected
        audioManager.isBluetoothScoOn = false
        audioManager.isSpeakerphoneOn = true
    }
}
