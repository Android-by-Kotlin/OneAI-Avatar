package max.ohm.oneai.profile

import androidx.compose.animation.*
import androidx.compose.animation.core.*
import androidx.compose.foundation.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material.icons.outlined.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.*
import androidx.compose.ui.graphics.*
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
import max.ohm.oneai.utils.SetStatusBarColor
import max.ohm.oneai.utils.StatusBarUtils

// Enhanced color scheme for professional look
private val DarkBackground = Color(0xFF0A0E27)
private val CardBackground = Color(0xFF1A1F3A)
private val AccentPurple = Color(0xFF6366F1)
private val AccentPink = Color(0xFFEC4899)
private val AccentGreen = Color(0xFF10B981)
private val TextPrimary = Color(0xFFFFFFFF)
private val TextSecondary = Color(0xFFB8BCC8)
private val BorderColor = Color(0xFF2D3748)

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun ProfileScreen(
    navController: NavController,
    loginViewModel: LoginViewModel = viewModel()
) {
    val loginState by loginViewModel.loginState.collectAsState()
    
    // Animation states
    var isVisible by remember { mutableStateOf(false) }
    val infiniteTransition = rememberInfiniteTransition(label = "profile_animation")
    
    // Floating animation for background elements
    val floatingOffset by infiniteTransition.animateFloat(
        initialValue = -10f,
        targetValue = 10f,
        animationSpec = infiniteRepeatable(
            animation = tween(3000, easing = FastOutSlowInEasing),
            repeatMode = RepeatMode.Reverse
        ),
        label = "floating"
    )
    
    // Check if user is logged in
    LaunchedEffect(loginState) {
        if (loginState !is LoginState.Success) {
            navController.navigate("login") {
                popUpTo("profile") { inclusive = true }
            }
        } else {
            isVisible = true
        }
    }
    
    val user = (loginState as? LoginState.Success)?.user
    
    // Set status bar color
    SetStatusBarColor(StatusBarUtils.ProfileStatusBarColor)
    
    Box(
        modifier = Modifier
            .fillMaxSize()
            .background(
                Brush.verticalGradient(
                    colors = listOf(
                        DarkBackground,
                        Color(0xFF1A1F3A),
                        Color(0xFF2D1B69)
                    )
                )
            )
    ) {
        // Animated background elements
        AnimatedBackgroundElements(floatingOffset)
        
        LazyColumn(
            modifier = Modifier
                .fillMaxSize()
                .padding(horizontal = 20.dp),
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            item {
                // Custom Top Bar
                Box(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(vertical = 16.dp)
                ) {
                    // Back button on the left
                    IconButton(
                        onClick = { navController.navigateUp() },
                        modifier = Modifier
                            .align(Alignment.CenterStart)
                            .size(48.dp)
                            .background(
                                CardBackground.copy(alpha = 0.8f),
                                CircleShape
                            )
                    ) {
                        Icon(
                            imageVector = Icons.Default.ArrowBack,
                            contentDescription = "Back",
                            tint = TextPrimary,
                            modifier = Modifier.size(24.dp)
                        )
                    }
                    
                    // Centered Profile title
                    Text(
                        text = "Profile",
                        color = TextPrimary,
                        fontSize = 24.sp,
                        fontWeight = FontWeight.Bold,
                        modifier = Modifier.align(Alignment.Center)
                    )
                }
            }
            
            item {
                Spacer(modifier = Modifier.height(20.dp))
                
                // Profile Header Card
                AnimatedVisibility(
                    visible = isVisible,
                    enter = slideInVertically(
                        initialOffsetY = { -it },
                        animationSpec = tween(800, easing = FastOutSlowInEasing)
                    ) + fadeIn(animationSpec = tween(800))
                ) {
                    ProfileHeaderCard(user = user)
                }
            }
            

            
            item {
                Spacer(modifier = Modifier.height(32.dp))
                
                // Action Buttons
                AnimatedVisibility(
                    visible = isVisible,
                    enter = slideInVertically(
                        initialOffsetY = { it },
                        animationSpec = tween(1400, delayMillis = 600, easing = FastOutSlowInEasing)
                    ) + fadeIn(animationSpec = tween(1400, delayMillis = 600))
                ) {
                    ActionButtonsSection(
                        onLogout = {
                            loginViewModel.signOut()
                            navController.navigate("login") {
                                popUpTo("home") { inclusive = true }
                            }
                        }
                    )
                }
            }
            
            item {
                Spacer(modifier = Modifier.height(40.dp))
            }
        }
    }
}


@Composable
fun AnimatedBackgroundElements(floatingOffset: Float) {
    Box(
        modifier = Modifier
            .fillMaxSize()
            .alpha(0.3f)
    ) {
        // Floating orbs
        Box(
            modifier = Modifier
                .size(200.dp)
                .offset(x = (-50).dp, y = (-100).dp + floatingOffset.dp)
                .blur(40.dp)
                .background(
                    Brush.radialGradient(
                        colors = listOf(
                            AccentPurple.copy(alpha = 0.4f),
                            Color.Transparent
                        )
                    ),
                    shape = CircleShape
                )
        )
        
        Box(
            modifier = Modifier
                .size(150.dp)
                .align(Alignment.BottomEnd)
                .offset(x = 50.dp, y = 50.dp + (-floatingOffset).dp)
                .blur(30.dp)
                .background(
                    Brush.radialGradient(
                        colors = listOf(
                            AccentPink.copy(alpha = 0.3f),
                            Color.Transparent
                        )
                    ),
                    shape = CircleShape
                )
        )
        
        Box(
            modifier = Modifier
                .size(120.dp)
                .align(Alignment.TopEnd)
                .offset(x = 30.dp, y = 200.dp + floatingOffset.dp)
                .blur(25.dp)
                .background(
                    Brush.radialGradient(
                        colors = listOf(
                            AccentGreen.copy(alpha = 0.3f),
                            Color.Transparent
                        )
                    ),
                    shape = CircleShape
                )
        )
    }
}

@Composable
fun ProfileHeaderCard(user: max.ohm.oneai.data.model.User?) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .shadow(
                elevation = 20.dp,
                shape = RoundedCornerShape(24.dp),
                ambientColor = AccentPurple.copy(alpha = 0.3f),
                spotColor = AccentPink.copy(alpha = 0.3f)
            ),
        shape = RoundedCornerShape(24.dp),
        colors = CardDefaults.cardColors(
            containerColor = CardBackground.copy(alpha = 0.9f)
        ),
        border = BorderStroke(
            1.dp,
            Brush.linearGradient(
                colors = listOf(
                    AccentPurple.copy(alpha = 0.5f),
                    AccentPink.copy(alpha = 0.5f)
                )
            )
        )
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(32.dp),
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            // Profile Avatar with Glow Effect
            Box(
                modifier = Modifier.size(140.dp),
                contentAlignment = Alignment.Center
            ) {
                // Glow effect
                Box(
                    modifier = Modifier
                        .size(160.dp)
                        .background(
                            Brush.radialGradient(
                                colors = listOf(
                                    AccentPurple.copy(alpha = 0.3f),
                                    Color.Transparent
                                )
                            ),
                            shape = CircleShape
                        )
                )
                
                // Avatar container
                Box(
                    modifier = Modifier
                        .size(140.dp)
                        .clip(CircleShape)
                        .background(
                            Brush.linearGradient(
                                colors = listOf(AccentPurple, AccentPink)
                            )
                        )
                        .padding(4.dp),
                    contentAlignment = Alignment.Center
                ) {
                    val auth = FirebaseAuth.getInstance()
                    val userPhotoUrl = remember { auth.currentUser?.photoUrl }
                    val userName = remember { user?.name ?: auth.currentUser?.displayName ?: "User" }
                    val userInitial = remember { userName.firstOrNull()?.toString()?.uppercase() ?: "U" }
                    
                    if (userPhotoUrl != null) {
                        AsyncImage(
                            model = ImageRequest.Builder(LocalContext.current)
                                .data(userPhotoUrl)
                                .crossfade(true)
                                .build(),
                            contentDescription = "Profile",
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
                                .background(CardBackground),
                            contentAlignment = Alignment.Center
                        ) {
                            Text(
                                text = userInitial,
                                color = TextPrimary,
                                fontSize = 48.sp,
                                fontWeight = FontWeight.Bold
                            )
                        }
                    }
                }
            }
            
            Spacer(modifier = Modifier.height(24.dp))
            
            // User Name with Gradient
            Text(
                text = user?.name ?: "User Name",
                fontSize = 28.sp,
                fontWeight = FontWeight.Bold,
                color = TextPrimary,
                textAlign = TextAlign.Center
            )
            
            Spacer(modifier = Modifier.height(8.dp))
            
            // User Email
            Text(
                text = user?.email ?: "user@example.com",
                fontSize = 16.sp,
                color = TextSecondary,
                textAlign = TextAlign.Center
            )
            
            Spacer(modifier = Modifier.height(16.dp))
            
            // Status Badge
            Surface(
                shape = RoundedCornerShape(20.dp),
                color = AccentGreen.copy(alpha = 0.2f),
                modifier = Modifier.padding(horizontal = 16.dp)
            ) {
                Row(
                    modifier = Modifier.padding(horizontal = 16.dp, vertical = 8.dp),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Box(
                        modifier = Modifier
                            .size(8.dp)
                            .background(AccentGreen, CircleShape)
                    )
                    Spacer(modifier = Modifier.width(8.dp))
                    Text(
                        text = "User ID: ${user?.id?.take(12) ?: "Not available"}",
                        color = AccentGreen,
                        fontSize = 14.sp,
                        fontWeight = FontWeight.Medium
                    )
                }
            }
        }
    }
}



@Composable
fun ActionButtonsSection(onLogout: () -> Unit) {
    Column(
        modifier = Modifier.fillMaxWidth(),
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
    
      
        // Logout Button
        Button(
            onClick = onLogout,
            modifier = Modifier
                .fillMaxWidth()
                .height(56.dp),
            shape = RoundedCornerShape(16.dp),
            colors = ButtonDefaults.buttonColors(
                containerColor = Color.Transparent
            ),
            border = BorderStroke(
                2.dp,
                Brush.linearGradient(
                    colors = listOf(AccentPurple, AccentPink)
                )
            )
        ) {
            Icon(
                imageVector = Icons.Outlined.Logout,
                contentDescription = "Logout",
                tint = AccentPink,
                modifier = Modifier.size(20.dp)
            )
            
            Spacer(modifier = Modifier.width(12.dp))
            
            Text(
                text = "Logout",
                fontSize = 16.sp,
                fontWeight = FontWeight.SemiBold,
                color = TextPrimary
            )
        }
    }
}