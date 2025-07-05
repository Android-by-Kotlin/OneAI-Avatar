package max.ohm.oneai.chatbot

import android.media.AudioAttributes
import android.media.MediaPlayer
import androidx.compose.animation.core.LinearEasing
import androidx.compose.animation.core.RepeatMode
import androidx.compose.animation.core.animateFloat
import androidx.compose.animation.core.infiniteRepeatable
import androidx.compose.animation.core.rememberInfiniteTransition
import androidx.compose.animation.core.tween
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.layout.widthIn
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.Icon
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.DisposableEffect
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.alpha
import androidx.compose.ui.draw.blur
import androidx.compose.ui.draw.clip
import androidx.compose.ui.draw.shadow
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.platform.LocalConfiguration
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.platform.LocalLifecycleOwner
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.lifecycle.Lifecycle
import androidx.lifecycle.LifecycleEventObserver
import coil.compose.AsyncImage
import coil.request.ImageRequest
import com.google.firebase.auth.FirebaseAuth
import kotlinx.coroutines.delay
import max.ohm.oneai.R

// Define the color scheme to match ChatBotScreen
private val DarkGreen = Color(0xFF10231c)
private val MediumGreen = Color(0xFF214a3c)
private val LightGreen = Color(0xFF8ecdb7)
private val AccentGreen = Color(0xFF019863)
private val AccentRed = Color(0xFF023788)
private val Purple = Color(0xFF2F0BB0)
private val Red = Color(0xFFB70F46)

// JARVIS-style colors
private val JarvisBlue = Color(0xFF00B4D8)
private val JarvisLightBlue = Color(0xFF48CAE4)
private val JarvisDarkBlue = Color(0xFF023E8A)
private val JarvisGold = Color(0xFFFFB700)
private val JarvisOrange = Color(0xFFFF6B35)

// Keep track of messages that have already been animated
private val animatedMessages = mutableSetOf<Long>()

@Composable
fun MessageBubble(
    message: Message,
    isNewMessage: Boolean = false,
    isTyping: Boolean = false
) {
    val isBot = !message.isUser
    val context = LocalContext.current
    val auth = FirebaseAuth.getInstance()

    // Calculate responsive bubble width based on screen size
    val configuration = LocalConfiguration.current
    val screenWidth = configuration.screenWidthDp
    val isTablet = screenWidth >= 600
    val isLargePhone = screenWidth >= 411
    val isSmallPhone = screenWidth <= 360

    // Adjust bubble width percentage based on screen size for optimal readability
    val bubbleWidthPercentage = when {
        isTablet -> 0.85f  // 85% for tablets (with 600dp hard cap)
        isLargePhone -> 0.88f  // 88% for large phones (411dp+)
        isSmallPhone -> 0.9f   // 90% for small phones (≤360dp) to maximize space
        else -> 0.88f  // default 88% for medium phones (361-410dp)
    }

    // Calculate bubble width with hard cap for tablets
    val calculatedWidth = (screenWidth * bubbleWidthPercentage).dp
    val maxBubbleWidth = if (isTablet) {
        minOf(calculatedWidth, 600.dp)  // Hard cap at 600dp for tablets
    } else {
        calculatedWidth
    }

    // Get user profile info
    val userPhotoUrl = remember { auth.currentUser?.photoUrl }
    val userDisplayName = remember { auth.currentUser?.displayName ?: "You" }
    val userInitial = remember { userDisplayName.firstOrNull()?.toString() ?: "Y" }

    // Generate a unique identifier for this message
    val messageId = remember { message.id }

    // Check if this message should be animated
    // Only animate bot messages that are new (freshly sent)
    val shouldAnimate = remember {
        isBot && isNewMessage && !animatedMessages.contains(messageId)
    }

    // State for typing animation
    var displayedText by remember { mutableStateOf(if (shouldAnimate) "" else message.text) }
    var isLocalTyping by remember { mutableStateOf(shouldAnimate) }
    
    // MediaPlayer for typing sound effects
    val mediaPlayer = remember {
        try {
            // First check if the resource exists
            val resourceId = R.raw.typing_sound
            android.util.Log.d("MessageBubble", "Attempting to load typing sound with resource ID: $resourceId")
            
            MediaPlayer.create(context, resourceId)?.apply {
                isLooping = true
                setVolume(0.7f, 0.7f)
                setAudioAttributes(
                    AudioAttributes.Builder()
                        .setContentType(AudioAttributes.CONTENT_TYPE_SONIFICATION)
                        .setUsage(AudioAttributes.USAGE_ASSISTANCE_SONIFICATION)
                        .build()
                )
                setOnPreparedListener {
                    android.util.Log.d("MessageBubble", "MediaPlayer prepared successfully")
                }
                setOnErrorListener { mp, what, extra ->
                    android.util.Log.e("MessageBubble", "MediaPlayer error: what=$what, extra=$extra")
                    false
                }
                setOnCompletionListener {
                    android.util.Log.d("MessageBubble", "Typing sound completed one loop")
                }
            } ?: run {
                android.util.Log.e("MessageBubble", "MediaPlayer.create returned null")
                null
            }
        } catch (e: Exception) {
            android.util.Log.e("MessageBubble", "Exception creating MediaPlayer: ${e.message}", e)
            null
        }
    }
    
    // Track if app is in foreground
    var isAppInForeground by remember { mutableStateOf(true) }
    
    // Observe lifecycle to pause/resume sound based on app state
    val lifecycleOwner = LocalLifecycleOwner.current
    DisposableEffect(lifecycleOwner) {
        val observer = LifecycleEventObserver { _, event ->
            when (event) {
                Lifecycle.Event.ON_PAUSE -> {
                    isAppInForeground = false
                    // Pause the sound when app goes to background
                    try {
                        mediaPlayer?.let { player ->
                            if (player.isPlaying) {
                                player.pause()
                                android.util.Log.d("MessageBubble", "Paused typing sound - app in background")
                            }
                        }
                    } catch (e: Exception) {
                        android.util.Log.e("MessageBubble", "Error pausing sound on background", e)
                    }
                }
                Lifecycle.Event.ON_STOP -> {
                    // Stop and reset the sound when app is stopped
                    try {
                        mediaPlayer?.let { player ->
                            if (player.isPlaying) {
                                player.stop()
                                player.prepare() // Prepare for next use
                                android.util.Log.d("MessageBubble", "Stopped typing sound - app stopped")
                            }
                        }
                    } catch (e: Exception) {
                        android.util.Log.e("MessageBubble", "Error stopping sound on stop", e)
                    }
                }
                Lifecycle.Event.ON_RESUME -> {
                    isAppInForeground = true
                    // Resume sound only if we were typing when app went to background
                    if (isLocalTyping || (isBot && isTyping && !shouldAnimate)) {
                        try {
                            mediaPlayer?.let { player ->
                                if (!player.isPlaying) {
                                    player.start()
                                    android.util.Log.d("MessageBubble", "Resumed typing sound - app in foreground")
                                }
                            }
                        } catch (e: Exception) {
                            android.util.Log.e("MessageBubble", "Error resuming sound on foreground", e)
                        }
                    }
                }
                else -> {}
            }
        }
        lifecycleOwner.lifecycle.addObserver(observer)
        onDispose {
            lifecycleOwner.lifecycle.removeObserver(observer)
        }
    }

    // For typing animation - only run if this message hasn't been animated yet
    LaunchedEffect(messageId) {
        if (shouldAnimate) {
            isLocalTyping = true
            displayedText = ""
            
            // Start the typing sound only if app is in foreground
            if (isAppInForeground) {
                try {
                    mediaPlayer?.let { player ->
                        if (!player.isPlaying) {
                            player.start()
                            android.util.Log.d("MessageBubble", "Started typing sound for animation")
                        }
                    }
                } catch (e: Exception) {
                    android.util.Log.e("MessageBubble", "Error starting typing sound", e)
                }
            }

            // Simulate typing effect
            for (i in message.text.indices) {
                displayedText = message.text.substring(0, i + 1)
                
                delay(15) // Adjust typing speed (15ms per character for smoother effect)

                // Natural pauses for punctuation
                when (message.text[i]) {
                    '.', '!', '?' -> delay(100) // Pause at sentence ends
                    ',' -> delay(50) // Small pause at commas
                    ';', ':' -> delay(40) // Medium pause
                    ' ' -> delay(10) // Tiny pause at spaces
                }
                
                // Additional pause every 50 characters for readability
                if (i % 50 == 0 && i > 0) {
                    delay(30)
                }
            }
            
            // Stop the looping sound when typing is complete
            try {
                mediaPlayer?.let { player ->
                    if (player.isPlaying) {
                        player.pause()
                        player.seekTo(0) // Reset to beginning
                        android.util.Log.d("MessageBubble", "Stopped typing sound after animation")
                    }
                }
            } catch (e: Exception) {
                android.util.Log.e("MessageBubble", "Error stopping typing sound", e)
            }

            // Mark this message as animated so it won't animate again
            if (isLocalTyping) {
                animatedMessages.add(messageId)
            }
            isLocalTyping = false
        }
    }
    
    // Handle streaming messages (when isTyping parameter is true)
    LaunchedEffect(isTyping, message.text) {
        if (isBot && isTyping && !shouldAnimate && !isLocalTyping) {
            // Update displayed text for streaming
            displayedText = message.text
            
            // Start sound if not already playing and app is in foreground
            if (isAppInForeground) {
                try {
                    mediaPlayer?.let { player ->
                        if (!player.isPlaying) {
                            player.start()
                            android.util.Log.d("MessageBubble", "Started typing sound for streaming")
                        }
                    }
                } catch (e: Exception) {
                    android.util.Log.e("MessageBubble", "Error starting typing sound for streaming", e)
                }
            }
        } else if (!isTyping && !isLocalTyping) {
            // Stop sound when streaming ends
            try {
                mediaPlayer?.let { player ->
                    if (player.isPlaying) {
                        player.pause()
                        player.seekTo(0)
                        android.util.Log.d("MessageBubble", "Stopped typing sound after streaming")
                    }
                }
            } catch (e: Exception) {
                android.util.Log.e("MessageBubble", "Error stopping typing sound", e)
            }
        }
    }
    
    // Stop sound if component is disposed while still typing
    DisposableEffect(isLocalTyping, isTyping) {
        onDispose {
            try {
                mediaPlayer?.let { player ->
                    if (player.isPlaying) {
                        player.pause()
                        android.util.Log.d("MessageBubble", "Paused typing sound on dispose")
                    }
                }
            } catch (e: Exception) {
                android.util.Log.e("MessageBubble", "Error pausing on dispose", e)
            }
        }
    }
    
    // Cleanup MediaPlayer
    DisposableEffect(Unit) {
        onDispose {
            try {
                mediaPlayer?.let { player ->
                    player.stop()
                    player.release()
                    android.util.Log.d("MessageBubble", "Released MediaPlayer")
                }
            } catch (e: Exception) {
                android.util.Log.e("MessageBubble", "Error releasing MediaPlayer", e)
            }
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

    Column(
        modifier = Modifier
            .fillMaxWidth()
            .padding(
                horizontal = 8.dp,
                vertical = 4.dp
            )
            .padding(
                start = if (message.isUser) 0.dp else 4.dp,
                end = if (message.isUser) 4.dp else 0.dp
            ),
        horizontalAlignment = if (message.isUser) Alignment.End else Alignment.Start
    ) {
        // Bot avatar and name (only shown for bot messages, positioned above the message)
        if (!message.isUser) {
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.Start,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Box(
                    modifier = Modifier
                        .size(40.dp) // Slightly larger for JARVIS
                        .shadow(
                            elevation = 8.dp,
                            shape = CircleShape,
                            ambientColor = JarvisBlue,
                            spotColor = JarvisLightBlue
                        )
                        .border(
                            width = 2.dp,
                            brush = Brush.sweepGradient(
                                colors = listOf(
                                    JarvisLightBlue,
                                    JarvisBlue,
                                    JarvisDarkBlue,
                                    JarvisBlue,
                                    JarvisLightBlue
                                )
                            ),
                            shape = CircleShape
                        )
                        .clip(CircleShape)
                        .background(
                            brush = Brush.radialGradient(
                                colors = listOf(
                                    JarvisDarkBlue.copy(alpha = 0.9f),
                                    Color.Black
                                )
                            )
                        ),
                    contentAlignment = Alignment.Center
                ) {
                    // Glowing effect behind icon
                    Box(
                        modifier = Modifier
                            .size(35.dp)
                            .blur(10.dp)
                            .background(
                                brush = Brush.radialGradient(
                                    colors = listOf(
                                        JarvisLightBlue.copy(alpha = 0.6f),
                                        Color.Transparent
                                    )
                                )
                            )
                    )
                    Icon(
                        painter = painterResource(id = R.drawable.brain_logo),
                        contentDescription = "JARVIS Logo",
                        tint = JarvisLightBlue,
                        modifier = Modifier.size(24.dp)
                    )
                }
                
                Spacer(modifier = Modifier.width(8.dp))
                
                // Bot name label
                Text(
                    text = "J.A.R.V.I.S",
                    color = JarvisLightBlue,
                    fontSize = 12.sp,
                    fontWeight = FontWeight.Bold,
                    fontFamily = FontFamily.Monospace
                )
            }
            
            Spacer(modifier = Modifier.height(6.dp))
        }
        
        // User avatar and name (only shown for user messages, positioned above the message)
        if (message.isUser) {
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.End,
                verticalAlignment = Alignment.CenterVertically
            ) {
                // User name label
                Text(
                    text = "You",
                    color = Color.White.copy(alpha = 0.7f),
                    fontSize = 12.sp,
                    fontWeight = FontWeight.Medium
                )
                
                Spacer(modifier = Modifier.width(8.dp))
                
                Box(
                    modifier = Modifier
                        .size(36.dp)
                        .shadow(
                            elevation = 3.dp,
                            shape = CircleShape,
                            ambientColor = Color(0xFF2196F3),
                            spotColor = Color(0xFF3F51B5)
                        )
                        .clip(CircleShape)
                        .background(
                            brush = Brush.radialGradient(
                                colors = listOf(
                                    Color(0xFF42A5F5), // Brighter blue gradient start
                                    Color(0xFF5C6BC0)  // Brighter indigo gradient end
                                )
                            )
                        )
                        .padding(2.dp),
                    contentAlignment = Alignment.Center
                ) {
                    if (userPhotoUrl != null) {
                        AsyncImage(
                            model = ImageRequest.Builder(context)
                                .data(userPhotoUrl)
                                .crossfade(true)
                                .build(),
                            contentDescription = "User Profile",
                            contentScale = ContentScale.Crop,
                            modifier = Modifier
                                .fillMaxSize()
                                .clip(CircleShape)
                        )
                    } else {
                        Box(
                            modifier = Modifier
                                .fillMaxSize()
                                .clip(CircleShape)
                                .background(
                                    brush = Brush.radialGradient(
                                        colors = listOf(
                                            Color(0xFF2A2A2A), // Lighter dark background
                                            Color(0xFF1A1A1A)  // Darker edge
                                        )
                                    )
                                ),
                            contentAlignment = Alignment.Center
                        ) {
                            Text(
                                text = userInitial,
                                color = Color.White,
                                fontSize = 11.sp,
                                fontWeight = FontWeight.ExtraBold
                            )
                        }
                    }
                }
            }
            
            Spacer(modifier = Modifier.height(6.dp))
        }

        // Message bubble with JARVIS styling
        Box(
            modifier = Modifier
                .widthIn(max = maxBubbleWidth)
                .then(
                    if (!message.isUser) {
                        // JARVIS bot message styling
                        Modifier
                            .shadow(
                                elevation = 8.dp,
                                shape = RoundedCornerShape(
                                    topStart = 4.dp,
                                    topEnd = 16.dp,
                                    bottomStart = 16.dp,
                                    bottomEnd = 16.dp
                                ),
                                ambientColor = JarvisBlue.copy(alpha = 0.5f),
                                spotColor = JarvisLightBlue.copy(alpha = 0.3f)
                            )
                            .border(
                                width = 1.dp,
                                brush = Brush.linearGradient(
                                    colors = listOf(
                                        JarvisLightBlue.copy(alpha = 0.8f),
                                        JarvisBlue.copy(alpha = 0.4f),
                                        JarvisDarkBlue.copy(alpha = 0.2f)
                                    )
                                ),
                                shape = RoundedCornerShape(
                                    topStart = 4.dp,
                                    topEnd = 16.dp,
                                    bottomStart = 16.dp,
                                    bottomEnd = 16.dp
                                )
                            )
                            .clip(
                                RoundedCornerShape(
                                    topStart = 4.dp,
                                    topEnd = 16.dp,
                                    bottomStart = 16.dp,
                                    bottomEnd = 16.dp
                                )
                            )
                            .background(
                                brush = Brush.linearGradient(
                                    colors = listOf(
                                        Color.Black.copy(alpha = 0.95f),
                                        JarvisDarkBlue.copy(alpha = 0.3f),
                                        Color.Black.copy(alpha = 0.95f)
                                    ),
                                    start = androidx.compose.ui.geometry.Offset(0f, 0f),
                                    end = androidx.compose.ui.geometry.Offset(1000f, 1000f)
                                )
                            )
                    } else {
                        // User message styling
                        Modifier
                            .clip(
                                RoundedCornerShape(
                                    topStart = 16.dp,
                                    topEnd = 4.dp,
                                    bottomStart = 16.dp,
                                    bottomEnd = 16.dp
                                )
                            )
                            .background(AccentGreen)
                    }
                )
                .padding(16.dp)
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
                                    .size(8.dp)
                                    .alpha(dotAlpha1)
                                    .background(JarvisLightBlue, CircleShape)
                                    .blur(2.dp)
                            )
                            Spacer(modifier = Modifier.width(4.dp))
                            Box(
                                modifier = Modifier
                                    .size(8.dp)
                                    .alpha(dotAlpha2)
                                    .background(JarvisLightBlue, CircleShape)
                                    .blur(2.dp)
                            )
                            Spacer(modifier = Modifier.width(4.dp))
                            Box(
                                modifier = Modifier
                                    .size(8.dp)
                                    .alpha(dotAlpha3)
                                    .background(JarvisLightBlue, CircleShape)
                                    .blur(2.dp)
                            )
                        }
                    } else if (message.text.isNotBlank()) {
                        if (isBot && !isTyping) {
                            // Parse and display formatted response for bot messages
                            val sections = ResponseParser.parseResponse(displayedText)
                            if (sections.isNotEmpty() && sections.any { it.type != SectionType.PARAGRAPH }) {
                                // Use formatted response
                                FormattedBotResponse(sections = sections)
                            } else {
                                // Fallback to plain text for simple messages with JARVIS styling
                                Text(
                                    text = displayedText,
                                    color = if (message.isUser) Color.White else JarvisLightBlue,
                                    style = TextStyle(
                                        fontSize = 16.sp, 
                                        lineHeight = 22.sp,
                                        fontFamily = if (!message.isUser) FontFamily.Monospace else FontFamily.Default,
                                        fontWeight = if (!message.isUser) FontWeight.Medium else FontWeight.Normal
                                    ),
                                    modifier = if (!message.isUser) {
                                        Modifier.shadow(
                                            elevation = 0.dp,
                                            shape = RoundedCornerShape(0.dp),
                                            ambientColor = JarvisLightBlue.copy(alpha = 0.3f),
                                            spotColor = JarvisLightBlue.copy(alpha = 0.3f)
                                        )
                                    } else Modifier
                                )
                            }
                        } else {
                            // User messages and typing animation
                            Text(
                                text = if (isBot) displayedText else message.text,
                                color = if (message.isUser) Color.White else JarvisLightBlue,
                                style = TextStyle(
                                    fontSize = 16.sp, 
                                    lineHeight = 22.sp,
                                    fontFamily = if (!message.isUser) FontFamily.Monospace else FontFamily.Default,
                                    fontWeight = if (!message.isUser) FontWeight.Medium else FontWeight.Normal
                                )
                            )

                            // Show blinking cursor at the end while typing
                            if (isBot && isTyping) {
                                Box(
                                    modifier = Modifier
                                        .padding(top = 4.dp)
                                        .height(16.dp)
                                        .width(3.dp)
                                        .alpha(dotAlpha1)
                                        .background(JarvisLightBlue)
                                        .blur(1.dp)
                                )
                            }
                        }
                    }
                }
        }
    }
}
