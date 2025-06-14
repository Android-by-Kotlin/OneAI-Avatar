package max.ohm.oneai.splash

import androidx.compose.animation.core.*
import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Check
import androidx.compose.material.icons.filled.KeyboardArrowRight
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.draw.rotate
import androidx.compose.ui.draw.scale
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.navigation.NavController
import coil.compose.rememberAsyncImagePainter
import coil.request.ImageRequest

@Composable
fun WelcomeScreen(navController: NavController) {
    // Define background gradient
    val backgroundGradient = Brush.linearGradient(
        colors = listOf(
            Color(0xFFE8F5E8),
            Color(0xFFF0F8F0),
            Color(0xFFE0F2E0)
        )
    )
    
    // Animation for breathing circles
    val animationCircle1 = rememberInfiniteTransition(label = "circle1")
    val scaleCircle1 by animationCircle1.animateFloat(
        initialValue = 1f,
        targetValue = 1.1f,
        animationSpec = infiniteRepeatable(
            animation = tween(4000, easing = EaseInOutCubic),
            repeatMode = RepeatMode.Reverse
        ),
        label = "scaleCircle1"
    )
    val opacityCircle1 by animationCircle1.animateFloat(
        initialValue = 0.3f,
        targetValue = 0.1f,
        animationSpec = infiniteRepeatable(
            animation = tween(4000, easing = EaseInOutCubic),
            repeatMode = RepeatMode.Reverse
        ),
        label = "opacityCircle1"
    )
    
    val animationCircle2 = rememberInfiniteTransition(label = "circle2")
    val scaleCircle2 by animationCircle2.animateFloat(
        initialValue = 1f,
        targetValue = 1.1f,
        animationSpec = infiniteRepeatable(
            animation = tween(4000, easing = EaseInOutCubic, delayMillis = 1000),
            repeatMode = RepeatMode.Reverse
        ),
        label = "scaleCircle2"
    )
    val opacityCircle2 by animationCircle2.animateFloat(
        initialValue = 0.3f,
        targetValue = 0.1f,
        animationSpec = infiniteRepeatable(
            animation = tween(4000, easing = EaseInOutCubic, delayMillis = 1000),
            repeatMode = RepeatMode.Reverse
        ),
        label = "opacityCircle2"
    )
    
    val animationCircle3 = rememberInfiniteTransition(label = "circle3")
    val scaleCircle3 by animationCircle3.animateFloat(
        initialValue = 1f,
        targetValue = 1.1f,
        animationSpec = infiniteRepeatable(
            animation = tween(4000, easing = EaseInOutCubic, delayMillis = 2000),
            repeatMode = RepeatMode.Reverse
        ),
        label = "scaleCircle3"
    )
    val opacityCircle3 by animationCircle3.animateFloat(
        initialValue = 0.3f,
        targetValue = 0.1f,
        animationSpec = infiniteRepeatable(
            animation = tween(4000, easing = EaseInOutCubic, delayMillis = 2000),
            repeatMode = RepeatMode.Reverse
        ),
        label = "opacityCircle3"
    )
    
    // Ripple animation
    val rippleAnimation = rememberInfiniteTransition(label = "ripple")
    val rippleScale by rippleAnimation.animateFloat(
        initialValue = 0.8f,
        targetValue = 2.4f,
        animationSpec = infiniteRepeatable(
            animation = tween(3000, easing = LinearEasing),
            repeatMode = RepeatMode.Restart
        ),
        label = "rippleScale"
    )
    val rippleOpacity by rippleAnimation.animateFloat(
        initialValue = 1f,
        targetValue = 0f,
        animationSpec = infiniteRepeatable(
            animation = tween(3000, easing = LinearEasing),
            repeatMode = RepeatMode.Restart
        ),
        label = "rippleOpacity"
    )
    
    Box(
        modifier = Modifier
            .fillMaxSize()
            .background(backgroundGradient)
    ) {
        // Breathing circle animations
        Box(
            modifier = Modifier
                .size(200.dp)
                .offset(x = (-50).dp, y = (-50).dp)
                .align(Alignment.TopEnd)
                .scale(scaleCircle1)
                .background(
                    color = Color(0xFF8BC38B).copy(alpha = opacityCircle1),
                    shape = CircleShape
                )
        )
        
        Box(
            modifier = Modifier
                .size(150.dp)
                .offset(x = (-30).dp, y = 100.dp)
                .align(Alignment.BottomStart)
                .scale(scaleCircle2)
                .background(
                    color = Color(0xFF8BC38B).copy(alpha = opacityCircle2),
                    shape = CircleShape
                )
        )
        
        Box(
            modifier = Modifier
                .size(100.dp)
                .offset(x = 50.dp, y = 200.dp)
                .align(Alignment.TopStart)
                .scale(scaleCircle3)
                .background(
                    color = Color(0xFF8BC38B).copy(alpha = opacityCircle3),
                    shape = CircleShape
                )
        )
        
        // Content
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(16.dp),
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            Spacer(modifier = Modifier.height(64.dp))
            
            // Logo with ripple effect
            Box(modifier = Modifier.padding(bottom = 24.dp)) {
                // Ripple effect
                Box(
                    modifier = Modifier
                        .size(64.dp)
                        .scale(rippleScale)
                        .align(Alignment.Center)
                        .background(
                            color = Color(0xFF8BC38B).copy(alpha = rippleOpacity),
                            shape = CircleShape
                        )
                )
                
                // Logo circle
                Box(
                    modifier = Modifier
                        .size(80.dp)
                        .align(Alignment.Center)
                        .background(
                            brush = Brush.linearGradient(
                                colors = listOf(
                                    Color(0xFFC8E6C9),
                                    Color(0xFFA5D6A7)
                                )
                            ),
                            shape = CircleShape
                        ),
                    contentAlignment = Alignment.Center
                ) {
                    Icon(
                        imageVector = Icons.Default.Check,
                        contentDescription = "Logo",
                        tint = Color.White,
                        modifier = Modifier.size(40.dp)
                    )
                }
            }
            
            // App name
            Text(
                text = "OneAI",
                fontSize = 30.sp,
                fontWeight = FontWeight.SemiBold,
                color = Color.Black,
                modifier = Modifier.padding(bottom = 12.dp)
            )
            
            // Tagline
            Text(
                text = "Your AI companion for everything",
                fontSize = 18.sp,
                fontWeight = FontWeight.Light,
                color = Color.Black.copy(alpha = 0.7f),
                textAlign = TextAlign.Center,
                lineHeight = 24.sp
            )
            
            // Main illustration
            Box(
                modifier = Modifier
                    .fillMaxWidth()
                    .height(200.dp)
                    .padding(vertical = 32.dp),
                contentAlignment = Alignment.Center
            ) {
                Box(
                    modifier = Modifier
                        .width(288.dp)
                        .height(192.dp)
                        .clip(RoundedCornerShape(24.dp))
                ) {
                    Image(
                        painter = rememberAsyncImagePainter(
                            ImageRequest.Builder(LocalContext.current)
                                .data("https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=300&h=200&fit=crop&crop=center")
                                .crossfade(true)
                                .build()
                        ),
                        contentDescription = "Serene mountain landscape",
                        contentScale = ContentScale.Crop,
                        modifier = Modifier.fillMaxSize()
                    )
                    
                    // Gradient overlay
                    Box(
                        modifier = Modifier
                            .fillMaxSize()
                            .background(
                                brush = Brush.verticalGradient(
                                    colors = listOf(
                                        Color.Transparent,
                                        Color(0xFFE8F5E8).copy(alpha = 0.2f)
                                    )
                                )
                            )
                    )
                }
            }
            
            // Welcome text
            Text(
                text = "Welcome to Your Journey",
                fontSize = 24.sp,
                fontWeight = FontWeight.Medium,
                color = Color.Black,
                modifier = Modifier.padding(bottom = 16.dp)
            )
            
            // Description
            Text(
                text = "Discover the power of AI through guided experiences and personalized interactions.",
                fontSize = 16.sp,
                fontWeight = FontWeight.Light,
                color = Color.Black.copy(alpha = 0.6f),
                textAlign = TextAlign.Center,
                lineHeight = 24.sp,
                modifier = Modifier.padding(horizontal = 16.dp)
            )
            
            Spacer(modifier = Modifier.weight(1f))
            
            // Begin button
            Button(
                onClick = {
                    navController.navigate("login") {
                        popUpTo("welcome") { inclusive = true }
                    }
                },
                modifier = Modifier
                    .fillMaxWidth()
                    .height(56.dp),
                shape = RoundedCornerShape(16.dp),
                colors = ButtonDefaults.buttonColors(
                    containerColor = Color(0xFF4CAF50)
                )
            ) {
                Text(
                    text = "Begin Your Journey",
                    fontSize = 18.sp,
                    fontWeight = FontWeight.Medium
                )
            }
            
            // Pagination indicators
            Row(
                modifier = Modifier
                    .padding(vertical = 24.dp)
                    .align(Alignment.CenterHorizontally),
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                Box(
                    modifier = Modifier
                        .width(32.dp)
                        .height(8.dp)
                        .background(
                            color = Color(0xFF4CAF50),
                            shape = RoundedCornerShape(4.dp)
                        )
                )
                Box(
                    modifier = Modifier
                        .size(8.dp)
                        .background(
                            color = Color(0xFFC8E6C9),
                            shape = CircleShape
                        )
                )
                Box(
                    modifier = Modifier
                        .size(8.dp)
                        .background(
                            color = Color(0xFFC8E6C9),
                            shape = CircleShape
                        )
                )
            }
        }
    }
}



