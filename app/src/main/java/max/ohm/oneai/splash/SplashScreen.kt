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
import androidx.compose.animation.core.EaseInOutSine

@Composable
fun SplashScreen(
    navController: NavController,
    loginViewModel: LoginViewModel = viewModel()
) {
    // Animation states for sequence
    val logoAlpha = remember { Animatable(0f) }
    val logoScale = remember { Animatable(0.5f) }
    val textAlpha = remember { Animatable(0f) }
    val taglineAlpha = remember { Animatable(0f) }
    val loginState by loginViewModel.loginState.collectAsState()
    
    // Background animation states
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
        // Step 1: Show the logo in center (0.2s)
        logoAlpha.animateTo(
            targetValue = 1f,
            animationSpec = tween(durationMillis = 200)
        )
        logoScale.animateTo(
            targetValue = 1f,
            animationSpec = tween(durationMillis = 200, easing = FastOutSlowInEasing)
        )
        
        delay(100) // Small delay
        
        // Step 2: Show "ONEAI" text below the logo (0.15s)
        textAlpha.animateTo(
            targetValue = 1f,
            animationSpec = tween(durationMillis = 150)
        )
        
        delay(50) // Small delay
        
        // Step 3: Show tagline below the text (0.15s)
        taglineAlpha.animateTo(
            targetValue = 1f,
            animationSpec = tween(durationMillis = 150)
        )
        
        delay(100) // Final wait
        
        // Navigate based on authentication state
        when (loginState) {
            is LoginState.Success -> {
                navController.navigate("home") {
                    popUpTo("splash") { inclusive = true }
                    launchSingleTop = true
                }
            }
            else -> {
                navController.navigate("login") {
                    popUpTo("splash") { inclusive = true }
                    launchSingleTop = true
                }
            }
        }
    }

    Box(
        modifier = Modifier
            .fillMaxSize()
            .background(
                Brush.verticalGradient(
                    colors = listOf(
                        DarkBackground,
                        DarkBackground.copy(alpha = 0.95f),
                        Color(0xFF0F172A)
                    )
                )
            ),
        contentAlignment = Alignment.Center
    ) {
        // Animated background orbs - same as other screens
        repeat(3) { index ->
            val infiniteTransition = rememberInfiniteTransition(label = "orb_$index")
            val offsetX by infiniteTransition.animateFloat(
                initialValue = -200f + index * 300f,
                targetValue = 200f + index * 300f,
                animationSpec = infiniteRepeatable(
                    animation = tween(
                        durationMillis = 8000 + index * 2000,
                        easing = EaseInOutSine
                    ),
                    repeatMode = RepeatMode.Reverse
                ),
                label = "orb_offset_x_$index"
            )
            val offsetY by infiniteTransition.animateFloat(
                initialValue = -100f + index * 200f,
                targetValue = 100f + index * 200f,
                animationSpec = infiniteRepeatable(
                    animation = tween(
                        durationMillis = 10000 + index * 1000,
                        easing = EaseInOutSine
                    ),
                    repeatMode = RepeatMode.Reverse
                ),
                label = "orb_offset_y_$index"
            )
            
            Box(
                modifier = Modifier
                    .offset(x = offsetX.dp, y = offsetY.dp)
                    .size(200.dp + (index * 50).dp)
                    .background(
                        brush = Brush.radialGradient(
                            colors = when (index) {
                                0 -> listOf(
                                    GradientPurple.copy(alpha = 0.1f),
                                    Color.Transparent
                                )
                                1 -> listOf(
                                    GradientPink.copy(alpha = 0.08f),
                                    Color.Transparent
                                )
                                else -> listOf(
                                    GradientCyan.copy(alpha = 0.06f),
                                    Color.Transparent
                                )
                            }
                        ),
                        shape = CircleShape
                    )
                    .blur(60.dp)
            )
        }
        
        // Main content - Column for centered layout
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(horizontal = 32.dp),
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.Center
        ) {
            // Logo appears centered with glow effects
            Box(
                modifier = Modifier
                    .size(120.dp)
                    .alpha(logoAlpha.value)
                    .scale(logoScale.value)
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
                        .padding(8.dp)
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
                
                // Brain logo with glass effect background
                Box(
                    modifier = Modifier
                        .fillMaxSize()
                        .padding(15.dp)
                        .background(
                            color = Color.White.copy(alpha = 0.1f),
                            shape = CircleShape
                        ),
                    contentAlignment = Alignment.Center
                ) {
                    Image(
                        painter = painterResource(id = R.drawable.brain_logo),
                        contentDescription = "OneAI Brain Logo",
                        modifier = Modifier
                            .size(80.dp)
                            .scale(pulseAnimation)
                    )
                }
            }

            Spacer(modifier = Modifier.height(32.dp))

            // Text appears below logo with separate animations
            Column(
                horizontalAlignment = Alignment.CenterHorizontally,
                modifier = Modifier.offset(y = floatingAnimation.dp)
            ) {
                // ONEAI title appears first
                Text(
                    text = "ONEAI",
                    style = TextStyle(
                        color = Color.White,
                        fontSize = 48.sp,
                        fontWeight = FontWeight.Bold
                    ),
                    modifier = Modifier.alpha(textAlpha.value)
                )
                
                // Tagline appears after the title
                Text(
                    text = "One New Era of AI",
                    style = TextStyle(
                        color = Color.White.copy(alpha = 0.8f),
                        fontSize = 18.sp,
                        fontWeight = FontWeight.Light
                    ),
                    modifier = Modifier.alpha(taglineAlpha.value)
                )
            }
        }
    }
}

