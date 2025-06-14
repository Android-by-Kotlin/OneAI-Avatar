package max.ohm.oneai.homescreen

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.lifecycle.viewmodel.compose.viewModel
import androidx.navigation.NavController
import max.ohm.oneai.login.LoginState
import max.ohm.oneai.login.LoginViewModel

@Composable
fun SimpleHomeScreen(
    navController: NavController,
    loginViewModel: LoginViewModel = viewModel()
) {
    val loginState by loginViewModel.loginState.collectAsState()
    
    // Check if user is logged in
    LaunchedEffect(loginState) {
        if (loginState !is LoginState.Success) {
            navController.navigate("login") {
                popUpTo("home") { inclusive = true }
            }
        }
    }
    
    Box(
        modifier = Modifier
            .fillMaxSize()
            .background(
                Brush.verticalGradient(
                    colors = listOf(
                        Color(0xFF121212),
                        Color(0xFF1E1E1E)
                    )
                )
            )
    ) {
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(16.dp)
                .verticalScroll(rememberScrollState())
        ) {
            // Header with profile icon
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(vertical = 24.dp),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text(
                    text = "OneAI",
                    color = Color.White,
                    fontSize = 32.sp,
                    fontWeight = FontWeight.Bold
                )
                
                // Profile Icon
                Box(
                    modifier = Modifier
                        .size(48.dp)
                        .clip(CircleShape)
                        .background(Color(0xFF6200EE))
                        .clickable { navController.navigate("profile") }
                        .padding(8.dp),
                    contentAlignment = Alignment.Center
                ) {
                    Icon(
                        imageVector = Icons.Default.Person,
                        contentDescription = "Profile",
                        tint = Color.White,
                        modifier = Modifier.size(24.dp)
                    )
                }
            }
            
            // Welcome message
            Card(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(bottom = 24.dp),
                colors = CardDefaults.cardColors(
                    containerColor = Color(0xFF2A2A2A)
                ),
                shape = RoundedCornerShape(16.dp)
            ) {
                Column(
                    modifier = Modifier.padding(16.dp)
                ) {
                    val user = (loginState as? LoginState.Success)?.user
                    Text(
                        text = "Welcome ${user?.name ?: "to OneAI"}",
                        color = Color.White,
                        fontSize = 20.sp,
                        fontWeight = FontWeight.Bold
                    )
                    
                    Spacer(modifier = Modifier.height(8.dp))
                    
                    Text(
                        text = "Your all-in-one AI assistant for text, voice, image, and more",
                        color = Color.White.copy(alpha = 0.7f),
                        fontSize = 14.sp
                    )
                }
            }
            
            // Tasks Grid Title
            Text(
                text = "AI Tools",
                color = Color.White,
                fontSize = 20.sp,
                fontWeight = FontWeight.Bold,
                modifier = Modifier.padding(bottom = 16.dp)
            )
            
            // First row of task buttons
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween
            ) {
                FeatureButton(
                    icon = Icons.Default.Chat,
                    title = "Chat Bot",
                    description = "Talk with AI",
                    modifier = Modifier.weight(1f),
                    onClick = { navController.navigate("chatbot") }
                )
                
                Spacer(modifier = Modifier.width(12.dp))
                
                FeatureButton(
                    icon = Icons.Default.Image,
                    title = "Image Gen",
                    description = "Create images",
                    modifier = Modifier.weight(1f),
                    onClick = { navController.navigate("imageGenerator") }
                )
            }
            
            Spacer(modifier = Modifier.height(12.dp))
            
            // Second row of task buttons
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween
            ) {
                FeatureButton(
                    icon = Icons.Default.MusicNote,
                    title = "Music Gen",
                    description = "Create music",
                    modifier = Modifier.weight(1f),
                    onClick = { navController.navigate("aiMusic") }
                )
                
                Spacer(modifier = Modifier.width(12.dp))
                
                FeatureButton(
                    icon = Icons.Default.Videocam,
                    title = "Video Gen",
                    description = "Create videos",
                    modifier = Modifier.weight(1f),
                    onClick = { navController.navigate("videoGeneration") }
                )
            }
            
            Spacer(modifier = Modifier.height(12.dp))
            
            // Third row of task buttons
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween
            ) {
                FeatureButton(
                    icon = Icons.Default.RecordVoiceOver,
                    title = "AI Talk",
                    description = "Voice chat",
                    modifier = Modifier.weight(1f),
                    onClick = { navController.navigate("aiTalk") }
                )
                
                Spacer(modifier = Modifier.width(12.dp))
                
                FeatureButton(
                    icon = Icons.Default.VolumeUp,
                    title = "Text to Speech",
                    description = "Convert text to audio",
                    modifier = Modifier.weight(1f),
                    onClick = { navController.navigate("tts") }
                )
            }
            
            Spacer(modifier = Modifier.height(12.dp))
            
            // Fourth row of task buttons
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween
            ) {
                FeatureButton(
                    icon = Icons.Default.QuestionAnswer,
                    title = "AI Conversation",
                    description = "Natural dialogue",
                    modifier = Modifier.weight(1f),
                    onClick = { navController.navigate("aiConversation") }
                )
                
                Spacer(modifier = Modifier.width(12.dp))
                
                FeatureButton(
                    icon = Icons.Default.LibraryMusic,
                    title = "Text to Music",
                    description = "Generate music from text",
                    modifier = Modifier.weight(1f),
                    onClick = { navController.navigate("textToMusic") }
                )
            }
            
            Spacer(modifier = Modifier.height(24.dp))
            
            // Advanced Models section
            Text(
                text = "Advanced Models",
                color = Color.White,
                fontSize = 20.sp,
                fontWeight = FontWeight.Bold,
                modifier = Modifier.padding(bottom = 16.dp)
            )
            
            // Advanced models button
            Button(
                onClick = { navController.navigate("openRouter") },
                modifier = Modifier
                    .fillMaxWidth()
                    .height(60.dp),
                shape = RoundedCornerShape(12.dp),
                colors = ButtonDefaults.buttonColors(
                    containerColor = Color(0xFF6200EE)
                )
            ) {
                Row(
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Icon(
                        imageVector = Icons.Default.Bolt,
                        contentDescription = "Advanced Models",
                        tint = Color.White
                    )
                    
                    Spacer(modifier = Modifier.width(8.dp))
                    
                    Text(
                        text = "Access Premium AI Models",
                        fontSize = 16.sp,
                        fontWeight = FontWeight.Bold
                    )
                }
            }
            
            Spacer(modifier = Modifier.height(16.dp))
        }
    }
}

@Composable
fun FeatureButton(
    icon: ImageVector,
    title: String,
    description: String,
    modifier: Modifier = Modifier,
    onClick: () -> Unit
) {
    Button(
        onClick = onClick,
        modifier = modifier
            .height(120.dp),
        shape = RoundedCornerShape(16.dp),
        colors = ButtonDefaults.buttonColors(
            containerColor = Color(0xFF2A2A2A)
        ),
        contentPadding = PaddingValues(12.dp)
    ) {
        Column(
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.Center
        ) {
            Icon(
                imageVector = icon,
                contentDescription = title,
                tint = Color(0xFF6200EE),
                modifier = Modifier.size(32.dp)
            )
            
            Spacer(modifier = Modifier.height(8.dp))
            
            Text(
                text = title,
                color = Color.White,
                fontSize = 14.sp,
                fontWeight = FontWeight.Bold,
                textAlign = TextAlign.Center
            )
            
            Text(
                text = description,
                color = Color.White.copy(alpha = 0.7f),
                fontSize = 12.sp,
                textAlign = TextAlign.Center
            )
        }
    }
} 
