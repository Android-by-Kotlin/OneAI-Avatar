package max.ohm.oneai.chatbot

import android.graphics.Bitmap

data class Message(
    val text: String, 
    val isUser: Boolean, 
    val image: Bitmap? = null,
    val id: Long = System.currentTimeMillis(), // Add unique ID with default value as timestamp
    val isSystemMessage: Boolean = false,
    val isError: Boolean = false
)
