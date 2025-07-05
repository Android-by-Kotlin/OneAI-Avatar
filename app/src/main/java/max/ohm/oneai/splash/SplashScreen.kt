package max.ohm.oneai.splash

import androidx.compose.animation.core.Animatable
import androidx.compose.animation.core.tween
import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.size
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.runtime.remember
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.alpha
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

@Composable
fun SplashScreen(
    navController: NavController,
    loginViewModel: LoginViewModel = viewModel()
) {
    val alpha = remember { Animatable(0f) }
    val loginState by loginViewModel.loginState.collectAsState()

    LaunchedEffect(key1 = true) {
        alpha.animateTo(
            targetValue = 1f,
            animationSpec = tween(durationMillis = 1500)
        )
        delay(2000)
        
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
            .background(Color.Black),
        contentAlignment = Alignment.Center
    ) {
        Column(
            horizontalAlignment = Alignment.CenterHorizontally,
            modifier = Modifier.alpha(alpha.value)
        ) {
            Image(
                painter = painterResource(id = R.drawable.brain_logo),
                contentDescription = "App Logo",
                modifier = Modifier
                    .size(200.dp)
            )

            // Use letter drop animation for the title
            LetterDropAnimation(
                text = "O N E A I",
                textStyle = TextStyle(
                    color = Color.White,
                    fontSize = 40.sp,
                    fontWeight = FontWeight.Bold
                ),
                dropHeight = 400f,
                staggerDelay = 80,
                animationDuration = 1000
            )
            
            Spacer(modifier = Modifier.height(24.dp))
            
            // Use letter drop animation for the subtitle with delay
            LetterDropAnimation(
                text = "One New Era of AI",
                textStyle = TextStyle(
                    color = Color.White.copy(alpha = 0.9f),
                    fontSize = 20.sp,
                    fontWeight = FontWeight.Light
                ),
                dropHeight = 200f,
                staggerDelay = 40,
                animationDuration = 800
            )
        }
    }
} 

