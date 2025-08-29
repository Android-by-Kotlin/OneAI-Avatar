package max.ohm.oneai.homescreen

import androidx.compose.animation.core.tween
import androidx.compose.foundation.BorderStroke
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material.icons.outlined.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.graphicsLayer
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.lifecycle.viewmodel.compose.viewModel
import androidx.navigation.NavController
import coil.compose.AsyncImage
import coil.request.ImageRequest
import com.google.firebase.auth.FirebaseAuth
import max.ohm.oneai.login.LoginState
import max.ohm.oneai.login.LoginViewModel
import max.ohm.oneai.ui.theme.*

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
        Brush.linearGradient(
            colors = listOf(
                Color(0xFFF8F9FA),
                Color(0xFFE9ECEF)
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
                Column(
                    horizontalAlignment = Alignment.Start
                ) {
                    Text(
                        text = "Welcome to OneAI",
                        color = Color(0xFF343A40),
                        fontSize = 32.sp,
                        fontWeight = FontWeight.Bold,
                        style = MaterialTheme.typography.headlineMedium
                    )
                    Text(
                        text = "Your AI Companion",
                        color = Color(0xFF6C757D),
                        fontSize = 16.sp,
                        fontWeight = FontWeight.Normal
                    )
                }
                
                // Profile Icon
                Box(
                    modifier = Modifier
                        .size(52.dp)
                        .clip(CircleShape)
                        .background(Color(0xFFADB5BD))
                        .clickable { navController.navigate("profile") },
                    contentAlignment = Alignment.Center
                ) {
                    val auth = FirebaseAuth.getInstance()
                    val userPhotoUrl = remember { auth.currentUser?.photoUrl }
                    val userName = remember { auth.currentUser?.displayName ?: "User" }
                    val userInitial = remember { userName.firstOrNull()?.toString() ?: "U" }
                    
                    if (userPhotoUrl != null) {
                        // If user has a profile image, display it
                        AsyncImage(
                            model = ImageRequest.Builder(LocalContext.current)
                                .data(userPhotoUrl)
                                .crossfade(true)
                                .build(),
                            contentDescription = "Profile",
                            contentScale = ContentScale.Crop,
                            modifier = Modifier.fillMaxSize()
                        )
                    } else {
                        // Otherwise show a placeholder with initial
                        Text(
                            text = userInitial,
                            color = Color.White,
                            fontSize = 20.sp,
                            fontWeight = FontWeight.Bold
                        )
                    }
                }
            }
            
            // Welcome message
            Card(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(bottom = 24.dp),
                colors = CardDefaults.cardColors(
                    containerColor = Color.White
                ),
                shape = RoundedCornerShape(16.dp),
                elevation = CardDefaults.cardElevation(4.dp)
            ) {
                Column(
                    modifier = Modifier.padding(16.dp)
                ) {
                    val user = (loginState as? LoginState.Success)?.user
                    Text(
                        text = "Welcome ${user?.name ?: "to OneAI"}",
                        color = Color(0xFF343A40),
                        fontSize = 20.sp,
                        fontWeight = FontWeight.Bold
                    )
                    
                    Spacer(modifier = Modifier.height(8.dp))
                    
                    Text(
                        text = "Your all-in-one AI assistant for text, voice, image, and more",
                        color = Color(0xFF6C757D),
                        fontSize = 14.sp
                    )
                }
            }
            
            // Live Avatar Feature - Now Available!
            Card(
                shape = RoundedCornerShape(12.dp),
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(bottom = 16.dp),
                colors = CardDefaults.cardColors(containerColor = Color(0xFF4CAF50))
            ) {
                Box(
                    modifier = Modifier.fillMaxWidth(),
                    contentAlignment = Alignment.Center
                ) {
                    Row(
                        verticalAlignment = Alignment.CenterVertically,
                        modifier = Modifier.padding(16.dp)
                    ) {
                        Icon(
                            imageVector = Icons.Default.CheckCircle,
                            contentDescription = "Available",
                            tint = Color.White,
                            modifier = Modifier.size(24.dp)
                        )
                        Spacer(modifier = Modifier.width(8.dp))
                        Text(
                            text = "Live Avatar Feature Now Available!",
                            color = Color.White,
                            fontSize = 16.sp,
                            fontWeight = FontWeight.Bold
                        )
                    }
                }
            }

            // Tasks Grid Title
            Text(
                text = "AI Tools",
                color = Color(0xFF343A40),
                fontSize = 24.sp,
                fontWeight = FontWeight.Bold,
                modifier = Modifier.padding(bottom = 16.dp),
                style = MaterialTheme.typography.headlineSmall
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
                
//                FeatureButton(
//                    icon = Icons.Default.Image,
//                    title = "Image Gen",
//                    description = "Create images",
//                    modifier = Modifier.weight(1f),
//                    onClick = { navController.navigate("imageGenerator") }
//                )
            }
            
            Spacer(modifier = Modifier.height(12.dp))
            
            // Second row of task buttons
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween
            ) {
//                FeatureButton(
//                    icon = Icons.Default.MusicNote,
//                    title = "Music Gen",
//                    description = "Create music",
//                    modifier = Modifier.weight(1f),
//                    onClick = { navController.navigate("aiMusic") }
//                )
                
                Spacer(modifier = Modifier.width(12.dp))
                
                ComingSoonFeatureButton(
                    icon = Icons.Default.Videocam,
                    title = "Video Gen",
                    description = "Coming Soon",
                    modifier = Modifier.weight(1f),
                    onClick = { /* Show coming soon message */ }
                )
            }
            
            Spacer(modifier = Modifier.height(12.dp))
            
            // Third row of task buttons
//            Row(
//                modifier = Modifier.fillMaxWidth(),
//                horizontalArrangement = Arrangement.SpaceBetween
//            ) {
//                FeatureButton(
//                    icon = Icons.Default.RecordVoiceOver,
//                    title = "AI Talk",
//                    description = "Voice chat",
//                    modifier = Modifier.weight(1f),
//                    onClick = { navController.navigate("aiTalk") }
//                )
//
//                Spacer(modifier = Modifier.width(12.dp))
//
//                FeatureButton(
//                    icon = Icons.Default.VolumeUp,
//                    title = "Text to Speech",
//                    description = "Convert text to audio",
//                    modifier = Modifier.weight(1f),
//                    onClick = { navController.navigate("tts") }
//                )
//            }
            
            Spacer(modifier = Modifier.height(12.dp))
            
// Fourth row of task buttons
//            Row(
//                modifier = Modifier.fillMaxWidth(),
//                horizontalArrangement = Arrangement.SpaceBetween
//            ) {
//                FeatureButton(
//                    icon = Icons.Default.QuestionAnswer,
//                    title = "AI Conversation",
//                    description = "Natural dialogue",
//                    modifier = Modifier.weight(1f),
//                    onClick = { navController.navigate("aiConversation") }
//                )
//
//                Spacer(modifier = Modifier.width(12.dp))
//
//                FeatureButton(
//                    icon = Icons.Default.LibraryMusic,
//                    title = "Text to Music",
//                    description = "Generate music from text",
//                    modifier = Modifier.weight(1f),
//                    onClick = { navController.navigate("textToMusic") }
//                )
//            }
            
            Spacer(modifier = Modifier.height(12.dp))
            
// Fifth row with Live Avatar and Face Gen
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween
            ) {
                FeatureButton(
                    icon = Icons.Default.VideoCall,
                    title = "Live Avatar",
                    description = "Talk with AI Avatar",
                    modifier = Modifier.weight(1f),
                    onClick = { navController.navigate("liveAvatar") }
                )
                
                Spacer(modifier = Modifier.width(12.dp))
                
//                FeatureButton(
//                    icon = Icons.Default.Face,
//                    title = "Face Gen",
//                    description = "Generate faces",
//                    modifier = Modifier.weight(1f),
//                    onClick = { navController.navigate("faceGen") }
//                )
            }
            
            Spacer(modifier = Modifier.height(12.dp))
            
            // Sixth row with Image to Image
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween
            ) {
                FeatureButton(
                    icon = Icons.Default.Transform,
                    title = "Image to Image",
                    description = "Transform images",
                    modifier = Modifier.weight(1f),
                    onClick = { navController.navigate("imageToImage") }
                )
                
                Spacer(modifier = Modifier.width(12.dp))
                
//                FeatureButton(
//                    icon = Icons.Default.AutoAwesome,
//                    title = "Stability AI",
//                    description = "Premium image transform",
//                    modifier = Modifier.weight(1f),
//                    onClick = { navController.navigate("stabilityAI") }
//                )
            }
            
            Spacer(modifier = Modifier.height(12.dp))
            
            // Sketch to Image row
//            Row(
//                modifier = Modifier.fillMaxWidth(),
//                horizontalArrangement = Arrangement.SpaceBetween
//            ) {
//                FeatureButton(
//                    icon = Icons.Default.Brush,
//                    title = "Sketch to Image",
//                    description = "Transform sketches",
//                    modifier = Modifier.weight(1f),
//                    onClick = { navController.navigate("sketchToImage") }
//                )
//
//                Spacer(modifier = Modifier.width(12.dp))
//
//                // Placeholder for future feature
//                Card(
//                    modifier = Modifier
//                        .weight(1f)
//                        .height(80.dp),
//                    colors = CardDefaults.cardColors(
//                        containerColor = Color(0xFF2A2A2A).copy(alpha = 0.5f)
//                    ),
//                    shape = RoundedCornerShape(16.dp)
//                ) {
//                    Box(
//                        modifier = Modifier.fillMaxSize(),
//                        contentAlignment = Alignment.Center
//                    ) {
//                        Text(
//                            text = "Coming Soon",
//                            color = Color.White.copy(alpha = 0.5f),
//                            fontSize = 14.sp
//                        )
//                    }
//                }
//            }
            
            Spacer(modifier = Modifier.height(8.dp))
            
            // Enhanced Features row
            Card(
                modifier = Modifier
                    .fillMaxWidth()
                    .height(140.dp)
                    .clickable { navController.navigate("enhancedImageGenerator") }
                    .graphicsLayer {
                        shadowElevation = 16f
                    },
                shape = RoundedCornerShape(24.dp),
                colors = CardDefaults.cardColors(
                    containerColor = Color(0xFF2E2E3E)
                ),
                border = BorderStroke(
                    width = 1.dp,
                    brush = Brush.linearGradient(
                        colors = listOf(
                            Color(0xFF7F39FB).copy(alpha = 0.5f),
                            Color(0xFFBB86FC).copy(alpha = 0.5f)
                        )
                    )
                ),
                elevation = CardDefaults.cardElevation(12.dp)
            ) {
                Row(
                    modifier = Modifier
                        .fillMaxSize()
                        .padding(16.dp),
                    verticalAlignment = Alignment.CenterVertically,
                    horizontalArrangement = Arrangement.SpaceBetween
                ) {
                    Column(
                        modifier = Modifier.weight(1f)
                    ) {
                        Row(
                            verticalAlignment = Alignment.CenterVertically,
                            horizontalArrangement = Arrangement.spacedBy(8.dp)
                        ) {
                            Icon(
                                imageVector = Icons.Outlined.AutoAwesome,
                                contentDescription = "Enhanced Image Gen",
                                tint = Color(0xFFBB86FC),
                                modifier = Modifier.size(32.dp)
                            )
                            Text(
                                text = "Enhanced",
                                color = Color(0xFFBB86FC),
                                fontSize = 12.sp,
                                fontWeight = FontWeight.Bold
                            )
                        }
                        
                        Spacer(modifier = Modifier.height(8.dp))
                        
                        Text(
                            text = "AI Image Studio Pro",
                            color = Color.White,
                            fontSize = 20.sp,
                            fontWeight = FontWeight.Bold
                        )
                        
                        Spacer(modifier = Modifier.height(4.dp))
                        
                        Text(
                            text = "Gallery • History • Zoom • Share",
                            color = Color.White.copy(alpha = 0.7f),
                            fontSize = 14.sp
                        )
                    }
                    
                    Icon(
                        imageVector = Icons.Default.ArrowForward,
                        contentDescription = null,
                        tint = Color(0xFFBB86FC),
                        modifier = Modifier.size(24.dp)
                    )
                }
            }
            
            Spacer(modifier = Modifier.height(24.dp))
            
            // Advanced Models section
//            Text(
//                text = "Advanced Models",
//                color = Color.White,
//                fontSize = 20.sp,
//                fontWeight = FontWeight.Bold,
//                modifier = Modifier.padding(bottom = 16.dp)
//            )
//
//            // Advanced models button
//            Button(
//                onClick = { navController.navigate("openRouter") },
//                modifier = Modifier
//                    .fillMaxWidth()
//                    .height(60.dp),
//                shape = RoundedCornerShape(12.dp),
//                colors = ButtonDefaults.buttonColors(
//                    containerColor = Color(0xFF6200EE)
//                )
//            ) {
//                Row(
//                    verticalAlignment = Alignment.CenterVertically
//                ) {
//                    Icon(
//                        imageVector = Icons.Default.Bolt,
//                        contentDescription = "Advanced Models",
//                        tint = Color.White
//                    )
//
//                    Spacer(modifier = Modifier.width(8.dp))
//
//                    Text(
//                        text = "Access Premium AI Models",
//                        fontSize = 16.sp,
//                        fontWeight = FontWeight.Bold
//                    )
//                }
//            }
//
//            Spacer(modifier = Modifier.height(16.dp))
//
//            // Debug/Test section (for development)
//            Text(
//                text = "Development Tools",
//                color = Color.White.copy(alpha = 0.7f),
//                fontSize = 16.sp,
//                fontWeight = FontWeight.Bold,
//                modifier = Modifier.padding(bottom = 8.dp)
//            )
//
//            Button(
//                onClick = { navController.navigate("responsiveTest") },
//                modifier = Modifier
//                    .fillMaxWidth()
//                    .height(50.dp),
//                shape = RoundedCornerShape(8.dp),
//                colors = ButtonDefaults.buttonColors(
//                    containerColor = Color(0xFF333333)
//                )
//            ) {
//                Row(
//                    verticalAlignment = Alignment.CenterVertically
//                ) {
//                    Icon(
//                        imageVector = Icons.Default.PhoneAndroid,
//                        contentDescription = "Responsive Test",
//                        tint = Color.White.copy(alpha = 0.7f)
//                    )
//
//                    Spacer(modifier = Modifier.width(8.dp))
//
//                    Text(
//                        text = "Test Chat Bubbles Responsiveness",
//                        fontSize = 14.sp,
//                        color = Color.White.copy(alpha = 0.7f)
//                    )
//                }
//            }
            
            Spacer(modifier = Modifier.height(16.dp))
        }
    }
}

@Composable
fun ComingSoonFeatureButton(
    icon: ImageVector,
    title: String,
    description: String,
    modifier: Modifier = Modifier,
    onClick: () -> Unit
) {
    Card(
        onClick = onClick,
        modifier = modifier
            .aspectRatio(1f)
            .fillMaxWidth(),
        shape = RoundedCornerShape(12.dp),
        colors = CardDefaults.cardColors(
            containerColor = Color(0xFFFFE082)
        ),
        elevation = CardDefaults.cardElevation(2.dp)
    ) {
        Column(
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.Center,
            modifier = Modifier.padding(8.dp)
        ) {
            Icon(
                imageVector = icon,
                contentDescription = title,
                tint = Color(0xFF37474F),
                modifier = Modifier.size(40.dp)
            )
            
            
            Text(
                text = title,
                color = Color(0xFF37474F),
                fontSize = 15.sp,
                fontWeight = FontWeight.SemiBold,
                textAlign = TextAlign.Center,
                style = MaterialTheme.typography.bodyMedium
            )
            
            Text(
                text = description,
                color = Color(0xFF6C757D),
                fontSize = 12.sp,
                textAlign = TextAlign.Center,
                style = MaterialTheme.typography.bodySmall
            )
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
    Card(
        onClick = onClick,
        modifier = modifier
            .aspectRatio(1f)
            .fillMaxWidth(),
        shape = RoundedCornerShape(12.dp),
        colors = CardDefaults.cardColors(
            containerColor = Color.White
        ),
        elevation = CardDefaults.cardElevation(2.dp)
    ) {
        Column(
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.Center,
            modifier = Modifier.padding(8.dp)
        ) {
            Icon(
                imageVector = icon,
                contentDescription = title,
                tint = Color(0xFF495057),
                modifier = Modifier.size(40.dp)
            )
            
            
            Text(
                text = title,
                color = Color(0xFF495057),
                fontSize = 15.sp,
                fontWeight = FontWeight.SemiBold,
                textAlign = TextAlign.Center,
                style = MaterialTheme.typography.bodyMedium
            )
            
            Text(
                text = description,
                color = Color(0xFF6C757D),
                fontSize = 12.sp,
                textAlign = TextAlign.Center,
                style = MaterialTheme.typography.bodySmall
            )
        }
    }
}
