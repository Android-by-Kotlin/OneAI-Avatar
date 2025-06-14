package max.ohm.oneai.chatbot

import androidx.compose.animation.core.LinearEasing
import androidx.compose.animation.core.RepeatMode
import androidx.compose.animation.core.animateFloat
import androidx.compose.animation.core.infiniteRepeatable
import androidx.compose.animation.core.rememberInfiniteTransition
import androidx.compose.animation.core.tween
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.aspectRatio
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.layout.widthIn
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.Card
import androidx.compose.material3.CardDefaults
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.derivedStateOf
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.alpha
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import coil.compose.AsyncImage
import coil.request.ImageRequest
import kotlinx.coroutines.delay

// Define the color scheme to match ChatBotScreen
private val DarkGreen = Color(0xFF10231c)
private val MediumGreen = Color(0xFF214a3c)
private val LightGreen = Color(0xFF8ecdb7)
private val AccentGreen = Color(0xFF019863)
private val AccentRed = Color(0xFF023788)

// Keep track of messages that have already been animated
private val animatedMessages = mutableSetOf<Long>()

@Composable
fun MessageBubble(message: Message) {
    val isBot = !message.isUser
    
    // Generate a unique identifier for this message
    val messageId = remember { message.id }
    
    // Check if this message has already been animated
    val shouldAnimate = remember { 
        isBot && !animatedMessages.contains(messageId) 
    }
    
    // State for typing animation
    var displayedText by remember { mutableStateOf(if (shouldAnimate) "" else message.text) }
    var isTyping by remember { mutableStateOf(shouldAnimate) }
    
    // For typing animation - only run if this message hasn't been animated yet
    LaunchedEffect(messageId) {
        if (shouldAnimate) {
            isTyping = true
            displayedText = ""
            
            // Simulate typing effect
            for (i in message.text.indices) {
                displayedText = message.text.substring(0, i + 1)
                delay(10) // Adjust typing speed
                
                // Add random pauses to make typing seem more natural
                if (i % 15 == 0 && i > 0) {
                    delay(50)
                }
            }
            
            // Mark this message as animated so it won't animate again
            animatedMessages.add(messageId)
            isTyping = false
        }
    }
    
    // Typing indicator animation
    val infiniteTransition = rememberInfiniteTransition(label = "typing_animation")
    val dotAlpha1 by infiniteTransition.animateFloat(
        initialValue = 0.2f,
        targetValue = 1f,
        animationSpec = infiniteRepeatable(
            animation = tween(400, easing = LinearEasing),
            repeatMode = RepeatMode.Reverse
        ),
        label = "dot1"
    )
    val dotAlpha2 by infiniteTransition.animateFloat(
        initialValue = 0.2f,
        targetValue = 1f,
        animationSpec = infiniteRepeatable(
            animation = tween(400, delayMillis = 150, easing = LinearEasing),
            repeatMode = RepeatMode.Reverse
        ),
        label = "dot2"
    )
    val dotAlpha3 by infiniteTransition.animateFloat(
        initialValue = 0.2f,
        targetValue = 1f,
        animationSpec = infiniteRepeatable(
            animation = tween(400, delayMillis = 300, easing = LinearEasing),
            repeatMode = RepeatMode.Reverse
        ),
        label = "dot3"
    )
    
    // Use Box instead of Row to match ChatBotScreen style
    Box(
        modifier = Modifier
            .clip(RoundedCornerShape(16.dp))
            .background(if (message.isUser) AccentGreen else AccentRed)
            .padding(16.dp)
            .widthIn(max = 280.dp)
    ) {
        Column {
            // Display image if present
            if (message.image != null) {
                AsyncImage(
                    model = ImageRequest.Builder(LocalContext.current)
                        .data(message.image)
                        .crossfade(true)
                        .build(),
                    contentDescription = if (message.isUser) "User Image" else "Bot Image",
                    contentScale = ContentScale.FillWidth,
                    modifier = Modifier
                        .fillMaxWidth()
                        .clip(RoundedCornerShape(8.dp))
                        .padding(bottom = if (message.text.isNotBlank()) 8.dp else 0.dp)
                )
            }
            
            // Show typing indicator or text
            if (isBot && isTyping && displayedText.isEmpty()) {
                Row(verticalAlignment = Alignment.CenterVertically) {
                    Box(
                        modifier = Modifier
                            .size(6.dp)
                            .alpha(dotAlpha1)
                            .background(Color.White, CircleShape)
                    )
                    Spacer(modifier = Modifier.width(4.dp))
                    Box(
                        modifier = Modifier
                            .size(6.dp)
                            .alpha(dotAlpha2)
                            .background(Color.White, CircleShape)
                    )
                    Spacer(modifier = Modifier.width(4.dp))
                    Box(
                        modifier = Modifier
                            .size(6.dp)
                            .alpha(dotAlpha3)
                            .background(Color.White, CircleShape)
                    )
                }
            } else if (message.text.isNotBlank()) {
                Text(
                    text = if (isBot) displayedText else message.text,
                    color = Color.White,
                    style = TextStyle(fontSize = 16.sp, lineHeight = 22.sp)
                )
                
                // Show blinking cursor at the end while typing
                if (isBot && isTyping) {
                    Box(
                        modifier = Modifier
                            .padding(top = 4.dp)
                            .height(14.dp)
                            .width(2.dp)
                            .alpha(dotAlpha1)
                            .background(Color.White)
                    )
                }
            }
        }
    }
}
