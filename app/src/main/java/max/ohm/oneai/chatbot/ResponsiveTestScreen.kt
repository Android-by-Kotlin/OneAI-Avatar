package max.ohm.oneai.chatbot

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.LocalConfiguration
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp

// Define the color scheme
private val DarkGreen = Color(0xFF10231c)

@Composable
fun ResponsiveTestScreen() {
    val configuration = LocalConfiguration.current
    val screenWidth = configuration.screenWidthDp
    val screenHeight = configuration.screenHeightDp
    
    // Sample test messages to test avatar visibility and responsiveness
    val testMessages = listOf(
        Message("Hello! This is a test message from the user. My avatar should appear above this message with 'You' label!", true),
        Message("Hi there! This is a bot response. The OneAI avatar should appear above this message with the brain logo and proper gradient.", false),
        Message("Testing the new avatar positioning - both user and bot avatars are now positioned above their respective messages.", true),
        Message("This is a longer bot response to test the new layout. The avatar appears above with proper spacing and the message bubble has adjusted corner radius to connect with the avatar position. On tablets, bubbles still maintain the 600dp width cap.", false),
        Message("Short message test", true),
        Message("The new layout provides better visual hierarchy with avatars positioned above messages instead of beside them.", false),
        Message("Perfect! The avatar positioning looks much cleaner now.", true)
    )
    
    Column(
        modifier = Modifier
            .fillMaxSize()
            .background(DarkGreen)
    ) {
        // Screen info header
        Card(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            colors = CardDefaults.cardColors(containerColor = Color.White.copy(alpha = 0.1f))
        ) {
            Column(
                modifier = Modifier.padding(16.dp)
            ) {
                Text(
                    text = "Screen Test Info",
                    color = Color.White,
                    fontSize = 18.sp,
                    fontWeight = FontWeight.Bold
                )
                Spacer(modifier = Modifier.height(8.dp))
                Text(
                    text = "Width: ${screenWidth}dp, Height: ${screenHeight}dp",
                    color = Color.White,
                    fontSize = 14.sp
                )
                Text(
                    text = "Category: ${getScreenCategory(screenWidth)}",
                    color = Color.White,
                    fontSize = 14.sp
                )
                Text(
                    text = "Bubble Width: ${getBubbleWidthInfo(screenWidth)}",
                    color = Color.White,
                    fontSize = 14.sp
                )
            }
        }
        
        // Test messages
        LazyColumn(
            modifier = Modifier
                .fillMaxSize()
                .padding(8.dp),
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            items(testMessages) { message ->
                MessageBubble(
                    message = message,
                    isNewMessage = false // Test messages are not new
                )
            }
        }
    }
}

private fun getScreenCategory(screenWidth: Int): String {
    return when {
        screenWidth >= 600 -> "Tablet (>=600dp)"
        screenWidth >= 411 -> "Large Phone (>=411dp)"
        screenWidth <= 360 -> "Small Phone (<=360dp)"
        else -> "Medium Phone (361-410dp)"
    }
}

private fun getBubbleWidthInfo(screenWidth: Int): String {
    val isTablet = screenWidth >= 600
    val isLargePhone = screenWidth >= 411
    val isSmallPhone = screenWidth <= 360
    
    val percentage = when {
        isTablet -> 0.85f
        isLargePhone -> 0.88f
        isSmallPhone -> 0.9f
        else -> 0.88f
    }
    
    val calculatedWidth = (screenWidth * percentage).toInt()
    val actualWidth = if (isTablet) {
        minOf(calculatedWidth, 600)
    } else {
        calculatedWidth
    }
    
    return "${(percentage * 100).toInt()}% = ${actualWidth}dp${if (isTablet && calculatedWidth > 600) " (capped)" else ""}"
}
