package max.ohm.noai.chatbot

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.aspectRatio
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.Card
import androidx.compose.material3.CardDefaults
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.unit.dp
import coil.compose.AsyncImage
import coil.request.ImageRequest


@Composable
fun MessageBubble(message: Message) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .padding(vertical = 4.dp),
        horizontalArrangement = if (message.isUser) Arrangement.End else Arrangement.Start
    ) {
        Card(
            shape = RoundedCornerShape( // Consider different shapes for user/bot
                topStart = if (!message.isUser) 4.dp else 12.dp,
                topEnd = if (message.isUser) 4.dp else 12.dp,
                bottomStart = 12.dp,
                bottomEnd = 12.dp
            ),
            colors = CardDefaults.cardColors(
                containerColor = if (message.isUser) MaterialTheme.colorScheme.primaryContainer else MaterialTheme.colorScheme.secondaryContainer
            )
        ) {
            Column(modifier = Modifier.padding(10.dp)) {
                if (message.image != null) {
                    AsyncImage(
                        model = ImageRequest.Builder(LocalContext.current)
                            .data(message.image)
                            .crossfade(true) // Add crossfade
                            .build(),
                        contentDescription = if (message.isUser) "User Image" else "Bot Image", // More specific description
                        modifier = Modifier
                            .fillMaxWidth(0.7f) // Limit image width
                            .aspectRatio(1f) // Maintain aspect ratio (adjust as needed)
                            .padding(bottom = if (message.text.isNotBlank()) 8.dp else 0.dp) // Add padding only if text exists
                            .align(if (message.isUser) Alignment.End else Alignment.Start) // Align image within the bubble
                    )
                }
                // Only show Text composable if text is not blank
                if (message.text.isNotBlank()) {
                    Text(
                        text = message.text,
                        color = if (message.isUser) MaterialTheme.colorScheme.onPrimaryContainer else MaterialTheme.colorScheme.onSecondaryContainer
                    )
                }
            }
        }
    }
}