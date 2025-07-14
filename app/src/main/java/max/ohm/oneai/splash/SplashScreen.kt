package max.ohm.oneai.splash

import androidx.compose.animation.core.*
import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.AutoAwesome
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.alpha
import androidx.compose.ui.draw.blur
import androidx.compose.ui.draw.rotate
import androidx.compose.ui.draw.scale
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.lifecycle.viewmodel.compose.viewModel
import androidx.navigation.NavController
import kotlinx.coroutines.delay
import max.ohm.oneai.R
import max.ohm.oneai.login.LoginState
import max.ohm.oneai.login.LoginViewModel
import max.ohm.oneai.animation.LetterDropAnimation
import androidx.compose.ui.text.TextStyle
import max.ohm.oneai.ui.theme.*

@Composable
fun SplashScreen(
    navController: NavController,
    loginViewModel: LoginViewModel = viewModel()
) {
    val alpha = remember { Animatable(0f) }
    val loginState by loginViewModel.loginState.collectAsState()
    
    // Animation states
    val infiniteTransition = rememberInfiniteTransition(label = "background")
    val floatingAnimation by infiniteTransition.animateFloat(
        initialValue = -10f,
        targetValue = 10f,
        animationSpec = infiniteRepeatable(
            animation = tween(3000, easing = FastOutSlowInEasing),
            repeatMode = RepeatMode.Reverse
        ),
        label = "floating"
    )
    
    val rotationAnimation by infiniteTransition.animateFloat(
        initialValue = 0f,
        targetValue = 360f,
        animationSpec = infiniteRepeatable(
            animation = tween(20000, easing = LinearEasing),
            repeatMode = RepeatMode.Restart
        ),
        label = "rotation"
    )
    
    val pulseAnimation by infiniteTransition.animateFloat(
        initialValue = 0.8f,
        targetValue = 1.2f,
        animationSpec = infiniteRepeatable(
            animation = tween(1500, easing = FastOutSlowInEasing),
            repeatMode = RepeatMode.Reverse
        ),
        label = "pulse"
    )

    LaunchedEffect(key1 = true) {
        alpha.animateTo(
            targetValue = 1f,
            animationSpec = tween(durationMillis = 1500)
        )
        delay(3000)
        
        // Navigate based on authentication state
        if (loginState is LoginState.Success) {
            navController.navigate("home") {
                popUpTo("splash") { inclusive = true }
            }
        } else {
            navController.navigate("login") {
                popUpTo("splash") { inclusive = true }
            }
        }
    }

    Box(
        modifier = Modifier
            .fillMaxSize()
            .background(
                brush = Brush.verticalGradient(
                    colors = listOf(
                        Color(0xFF0A0E27),
                        Color(0xFF1A1F3A),
                        Color(0xFF2D1B69)
                    )
                )
            ),
        contentAlignment = Alignment.Center
    ) {
        // Animated background elements
        Box(
            modifier = Modifier
                .fillMaxSize()
                .alpha(0.3f)
        ) {
            // Floating orbs
            Box(
                modifier = Modifier
                    .size(300.dp)
                    .offset(x = (-100).dp, y = (-150).dp + floatingAnimation.dp)
                    .blur(60.dp)
                    .background(
                        Brush.radialGradient(
                            colors = listOf(
                                Color(0xFF6366F1).copy(alpha = 0.6f),
                                Color.Transparent
                            )
                        ),
                        shape = CircleShape
                    )
            )
            
            Box(
                modifier = Modifier
                    .size(250.dp)
                    .align(Alignment.BottomEnd)
                    .offset(x = 100.dp, y = 100.dp + (-floatingAnimation).dp)
                    .blur(50.dp)
                    .background(
                        Brush.radialGradient(
                            colors = listOf(
                                Color(0xFFEC4899).copy(alpha = 0.5f),
                                Color.Transparent
                            )
                        ),
                        shape = CircleShape
                    )
            )
            
            Box(
                modifier = Modifier
                    .size(200.dp)
                    .align(Alignment.TopEnd)
                    .offset(x = 50.dp, y = 100.dp + floatingAnimation.dp)
                    .blur(40.dp)
                    .background(
                        Brush.radialGradient(
                            colors = listOf(
                                Color(0xFF10B981).copy(alpha = 0.4f),
                                Color.Transparent
                            )
                        ),
                        shape = CircleShape
                    )
            )
        }
        
        // Main content
        Column(
            horizontalAlignment = Alignment.CenterHorizontally,
            modifier = Modifier
                .alpha(alpha.value)
                .padding(32.dp)
        ) {
            // Animated logo container
            Box(
                modifier = Modifier
                    .size(180.dp)
                    .offset(y = floatingAnimation.dp)
            ) {
                // Rotating background circle
                Box(
                    modifier = Modifier
                        .fillMaxSize()
                        .rotate(rotationAnimation)
                        .background(
                            Brush.sweepGradient(
                                colors = listOf(
                                    Color(0xFF6366F1).copy(alpha = 0.3f),
                                    Color(0xFFEC4899).copy(alpha = 0.3f),
                                    Color(0xFF10B981).copy(alpha = 0.3f),
                                    Color(0xFF6366F1).copy(alpha = 0.3f)
                                )
                            ),
                            shape = CircleShape
                        )
                )
                
                // Pulsing inner circle
                Box(
                    modifier = Modifier
                        .fillMaxSize()
                        .padding(10.dp)
                        .scale(pulseAnimation)
                        .background(
                            Brush.radialGradient(
                                colors = listOf(
                                    Color(0xFF6366F1).copy(alpha = 0.2f),
                                    Color(0xFFEC4899).copy(alpha = 0.1f)
                                )
                            ),
                            shape = CircleShape
                        )
                )
                
                // Logo background with glass effect
                Box(
                    modifier = Modifier
                        .fillMaxSize()
                        .padding(20.dp)
                        .background(
                            color = Color.White.copy(alpha = 0.1f),
                            shape = CircleShape
                        ),
                    contentAlignment = Alignment.Center
                ) {
                    Icon(
                        imageVector = Icons.Default.AutoAwesome,
                        contentDescription = "App Logo",
                        modifier = Modifier
                            .size(80.dp)
                            .scale(pulseAnimation),
                        tint = Color.White
                    )
                }
            }

            Spacer(modifier = Modifier.height(48.dp))

            // Use letter drop animation for the title
            LetterDropAnimation(
                text = "ONE AI",
                textStyle = TextStyle(
                    color = Color.White,
                    fontSize = 48.sp,
                    fontWeight = FontWeight.Bold
                ),
                dropHeight = 400f,
                staggerDelay = 80,
                animationDuration = 1000
            )
            
            Spacer(modifier = Modifier.height(24.dp))
            
            // Use letter drop animation for the subtitle with delay
            LetterDropAnimation(
                text = "Transform Your Vision",
                textStyle = TextStyle(
                    color = Color.White.copy(alpha = 0.8f),
                    fontSize = 20.sp,
                    fontWeight = FontWeight.Light
                ),
                dropHeight = 200f,
                staggerDelay = 40,
                animationDuration = 800
            )
            
            Spacer(modifier = Modifier.height(60.dp))
            
            // Loading indicator
            CircularProgressIndicator(
                color = Color(0xFF6366F1),
                modifier = Modifier
                    .size(48.dp)
                    .alpha(alpha.value),
                strokeWidth = 3.dp
            )
        }
    }
}

