package max.ohm.oneai.liveavatar

import android.content.Context
import io.livekit.android.LiveKit
import max.ohm.oneai.liveavatar.services.AudioService

object LiveAvatarInit {
    private var isInitialized = false
    private var audioService: AudioService? = null
    
    fun initialize(context: Context) {
        if (!isInitialized) {
            // Initialize LiveKit
            LiveKit.init(context.applicationContext)
            
            // Initialize AudioService
            audioService = AudioService(context).apply {
                enableSpeaker()
            }
            
            isInitialized = true
        }
    }
    
    fun getAudioService(): AudioService? = audioService
    
    fun cleanup() {
        audioService = null
        isInitialized = false
    }
}
