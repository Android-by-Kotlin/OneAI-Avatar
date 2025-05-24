package max.ohm.noai.chatbot

import android.graphics.Bitmap

data class Message(val text: String, val isUser: Boolean, val image: Bitmap? = null)