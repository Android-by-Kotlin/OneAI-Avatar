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
import androidx.compose.foundation.layout.fillMaxSize
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
import androidx.compose.material3.Icon
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
import androidx.compose.ui.draw.shadow
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.platform.LocalConfiguration
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import coil.compose.AsyncImage
import coil.request.ImageRequest
import max.ohm.oneai.R
import com.google.firebase.auth.FirebaseAuth
import kotlinx.coroutines.delay

// Define the color scheme to match ChatBotScreen
private val DarkGreen = Color(0xFF10231c)
private val MediumGreen = Color(0xFF214a3c)
private val LightGreen = Color(0xFF8ecdb7)
private val AccentGreen = Color(0xFF019863)
private val AccentRed = Color(0xFF023788)
private val Purple = Color(0xFF2F0BB0)
private val Red = Color(0xFFB70F46)

// Keep track of messages that have already been animated
private val animatedMessages = mutableSetOf<Long>()

@Composable
fun MessageBubble(
    message: Message,
    isNewMessage: Boolean = false
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
    var isTyping by remember { mutableStateOf(shouldAnimate) }

    // For typing animation - only run if this message hasn't been animated yet
    LaunchedEffect(messageId) {
        if (shouldAnimate) {
            isTyping = true
            displayedText = ""

            // Simulate ultra-fast typing effect
            for (i in message.text.indices) {
                displayedText = message.text.substring(0, i + 1)
                delay(1) // Ultra-fast typing speed (1ms per character)

                // Very minimal pauses for ultra-fast typing
                if (i % 50 == 0 && i > 0) {
                    delay(2) // Minimal pause of 2ms every 50 characters
                }
            }

            // Mark this message as animated so it won't animate again
if (isTyping) {
    animatedMessages.add(messageId)
}
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
                        .size(36.dp) // Slightly smaller for top position
                        .shadow(
                            elevation = 3.dp,
                            shape = CircleShape,
                            ambientColor = Color(0xFFE91E63),
                            spotColor = Color(0xFF9C27B0)
                        )
                        .clip(CircleShape)
                        .background(
                            brush = Brush.radialGradient(
                                colors = listOf(
                                    Color(0xFFFF4081), // Brighter pink gradient start
                                    Color(0xFFAB47BC)  // Brighter purple gradient end
                                )
                            )
                        )
                        .padding(2.dp), // Thinner border for smaller size
                    contentAlignment = Alignment.Center
                ) {
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
                        Icon(
                            painter = painterResource(id = R.drawable.brain_logo),
                            contentDescription = "OneAI Brain Logo",
                            tint = Color.White,
                            modifier = Modifier.size(20.dp)
                        )
                    }
                }
                
                Spacer(modifier = Modifier.width(8.dp))
                
                // Bot name label
                Text(
                    text = "OneAI",
                    color = Color.White.copy(alpha = 0.7f),
                    fontSize = 12.sp,
                    fontWeight = FontWeight.Medium
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

        // Message bubble
        Box(
            modifier = Modifier
                .widthIn(max = maxBubbleWidth)
                .clip(
                    RoundedCornerShape(
                        topStart = if (message.isUser) 16.dp else 4.dp, // Smaller radius for bot message top-left
                        topEnd = if (message.isUser) 4.dp else 16.dp,  // Smaller radius for user message top-right
                        bottomStart = 16.dp,
                        bottomEnd = 16.dp
                    )
                )
                .background(if (message.isUser) AccentGreen else AccentRed)
                .padding(12.dp)
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
                        if (isBot && !isTyping) {
                            // Parse and display formatted response for bot messages
                            val sections = ResponseParser.parseResponse(displayedText)
                            if (sections.isNotEmpty() && sections.any { it.type != SectionType.PARAGRAPH }) {
                                // Use formatted response
                                FormattedBotResponse(sections = sections)
                            } else {
                                // Fallback to plain text for simple messages
                                Text(
                                    text = displayedText,
                                    color = Color.White,
                                    style = TextStyle(fontSize = 16.sp, lineHeight = 22.sp)
                                )
                            }
                        } else {
                            // User messages and typing animation
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
    }
}
