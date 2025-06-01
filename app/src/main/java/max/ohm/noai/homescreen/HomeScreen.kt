package max.ohm.noai.homescreen

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Settings
import androidx.compose.material3.CardDefaults
import androidx.compose.material3.ElevatedCard
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.material3.TopAppBar
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import androidx.navigation.NavController

// --- Home Screen Composable ---
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun HomeScreen(navController: NavController) {
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("OneAI") },
                actions = {
                    // Settings icon placeholder
                    IconButton(onClick = { /* TODO: Navigate to settings */ }) {
                        Icon(Icons.Filled.Settings, contentDescription = "Settings")
                    }
                }
            )
        }
    ) { paddingValues ->
        Column(
            modifier = Modifier
                .padding(paddingValues)
                .padding(16.dp)
                .fillMaxSize(),
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            // AI ChatBot Card
            ElevatedCard(
                onClick = { navController.navigate("chatbot") }, // Navigate to chatbot screen
                modifier = Modifier.fillMaxWidth(),
                shape = RoundedCornerShape(16.dp),
                colors = CardDefaults.elevatedCardColors(
                    containerColor = MaterialTheme.colorScheme.primaryContainer // Light blue color
                )
            ) {
                Row(
                    modifier = Modifier
                        .padding(16.dp)
                        .fillMaxWidth(),
                    verticalAlignment = Alignment.CenterVertically,
                    horizontalArrangement = Arrangement.SpaceBetween
                ) {
                    // Placeholder for ChatBot image
                    Spacer(modifier = Modifier.size(64.dp)) // Placeholder size
                    Text("AI ChatBot", style = MaterialTheme.typography.headlineSmall)
                    // Placeholder for ChatBot image
                    Spacer(modifier = Modifier.size(64.dp)) // Placeholder size
                }
            }

            // AI Image Creator Card
            ElevatedCard(
                onClick = { navController.navigate("imageGenerator") },
                modifier = Modifier.fillMaxWidth(),
                shape = RoundedCornerShape(16.dp),
                colors = CardDefaults.elevatedCardColors(
                    containerColor = MaterialTheme.colorScheme.primaryContainer // Light blue color
                )
            ) {
                Row(
                    modifier = Modifier
                        .padding(16.dp)
                        .fillMaxWidth(),
                    verticalAlignment = Alignment.CenterVertically,
                    horizontalArrangement = Arrangement.SpaceBetween
                ) {
                    // Placeholder for Image Creator image
                    Spacer(modifier = Modifier.size(64.dp)) // Placeholder size
                    Text("AI Image", style = MaterialTheme.typography.headlineSmall)
                    // Placeholder for Image Creator image
                    Spacer(modifier = Modifier.size(64.dp)) // Placeholder size
                }
            }

            // AI Music Generator Card (Reverted)
            ElevatedCard(
                onClick = { navController.navigate("aiMusic") },
                modifier = Modifier.fillMaxWidth(),
                shape = RoundedCornerShape(16.dp),
                colors = CardDefaults.elevatedCardColors(
                    containerColor = MaterialTheme.colorScheme.primaryContainer // Light blue color
                )
            ) {
                Row(
                    modifier = Modifier
                        .padding(16.dp)
                        .fillMaxWidth(),
                    verticalAlignment = Alignment.CenterVertically,
                    horizontalArrangement = Arrangement.SpaceBetween
                ) {
                    // Placeholder for Music image
                    Spacer(modifier = Modifier.size(64.dp)) // Placeholder size
                    Text("AI Music", style = MaterialTheme.typography.headlineSmall)
                    // Placeholder for Music image
                    Spacer(modifier = Modifier.size(64.dp)) // Placeholder size
                }
            }

            // AI Video Card
            ElevatedCard(
                onClick = { navController.navigate("videoGeneration") }, // Navigate to video generation screen
                modifier = Modifier.fillMaxWidth(),
                shape = RoundedCornerShape(16.dp),
                colors = CardDefaults.elevatedCardColors(
                    containerColor = MaterialTheme.colorScheme.primaryContainer // Light blue color
                )
            ) {
                Row(
                    modifier = Modifier
                        .padding(16.dp)
                        .fillMaxWidth(),
                    verticalAlignment = Alignment.CenterVertically,
                    horizontalArrangement = Arrangement.SpaceBetween
                ) {
                    // Placeholder for Video image
                    Spacer(modifier = Modifier.size(64.dp)) // Placeholder size
                    Text("AI Video", style = MaterialTheme.typography.headlineSmall)
                    // Placeholder for Video image
                    Spacer(modifier = Modifier.size(64.dp)) // Placeholder size
                }
            }

            // AI Talk Card
            ElevatedCard(
                onClick = { navController.navigate("aiTalk") }, // Navigate to AI Talk screen
                modifier = Modifier.fillMaxWidth(),
                shape = RoundedCornerShape(16.dp),
                colors = CardDefaults.elevatedCardColors(
                    containerColor = MaterialTheme.colorScheme.primaryContainer // Light blue color
                )
            ) {
                Row(
                    modifier = Modifier
                        .padding(16.dp)
                        .fillMaxWidth(),
                    verticalAlignment = Alignment.CenterVertically,
                    horizontalArrangement = Arrangement.SpaceBetween
                ) {
                    // Placeholder for AI Talk image
                    Spacer(modifier = Modifier.size(64.dp)) // Placeholder size
                    Text("AI Talk", style = MaterialTheme.typography.headlineSmall)
                    // Placeholder for AI Talk image
                    Spacer(modifier = Modifier.size(64.dp)) // Placeholder size
                }
            }

        }
    }
}
