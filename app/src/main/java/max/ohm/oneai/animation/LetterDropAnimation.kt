package max.ohm.oneai.animation

import androidx.compose.animation.core.*
import androidx.compose.foundation.layout.*
import androidx.compose.material3.LocalTextStyle
import androidx.compose.material3.Text
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.alpha
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.TransformOrigin
import androidx.compose.ui.graphics.graphicsLayer
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.TextUnit
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import kotlinx.coroutines.delay

/**
 * A composable that animates text with a letter drop effect at 60 FPS.
 * Each letter drops from above with physics-based animation.
 *
 * @param text The text to animate
 * @param modifier Modifier for the container
 * @param textStyle Style for the text
 * @param dropHeight The height from which letters drop (in pixels)
 * @param staggerDelay Delay between each letter animation start (in milliseconds)
 * @param animationDuration Duration of the drop animation for each letter (in milliseconds)
 */
@Composable
fun LetterDropAnimation(
    text: String,
    modifier: Modifier = Modifier,
    textStyle: TextStyle = LocalTextStyle.current,
    dropHeight: Float = 300f,
    staggerDelay: Long = 50,
    animationDuration: Int = 800,
    onAnimationComplete: (() -> Unit)? = null
) {
    var animationTriggered by remember { mutableStateOf(false) }
    
    LaunchedEffect(text) {
        animationTriggered = false
        delay(100)
        animationTriggered = true
    }
    
    Row(
        modifier = modifier,
        horizontalArrangement = Arrangement.Center,
        verticalAlignment = Alignment.CenterVertically
    ) {
        text.forEachIndexed { index, char ->
            if (char == ' ') {
                Spacer(modifier = Modifier.width(4.dp))
            } else {
                AnimatedLetter(
                    letter = char,
                    index = index,
                    textStyle = textStyle,
                    dropHeight = dropHeight,
                    staggerDelay = staggerDelay,
                    animationDuration = animationDuration,
                    animationTriggered = animationTriggered,
                    isLastLetter = index == text.length - 1,
                    onLastLetterAnimationComplete = onAnimationComplete
                )
            }
        }
    }
}

@Composable
private fun AnimatedLetter(
    letter: Char,
    index: Int,
    textStyle: TextStyle,
    dropHeight: Float,
    staggerDelay: Long,
    animationDuration: Int,
    animationTriggered: Boolean,
    isLastLetter: Boolean,
    onLastLetterAnimationComplete: (() -> Unit)?
) {
    val animationSpec = tween<Float>(
        durationMillis = animationDuration,
        easing = FastOutSlowInEasing,
        delayMillis = (index * staggerDelay).toInt()
    )
    
    // Translation animation for drop effect
    val translationY = animateFloatAsState(
        targetValue = if (animationTriggered) 0f else -dropHeight,
        animationSpec = animationSpec,
        label = "translationY_$index",
        finishedListener = { 
            if (isLastLetter) {
                onLastLetterAnimationComplete?.invoke()
            }
        }
    )
    
    // Alpha animation for fade-in effect
    val alpha = animateFloatAsState(
        targetValue = if (animationTriggered) 1f else 0f,
        animationSpec = tween(
            durationMillis = animationDuration / 2,
            delayMillis = (index * staggerDelay).toInt()
        ),
        label = "alpha_$index"
    )
    
    // Bounce effect at the end
    val bounce = animateFloatAsState(
        targetValue = if (animationTriggered) 0f else 1f,
        animationSpec = spring(
            dampingRatio = Spring.DampingRatioMediumBouncy,
            stiffness = Spring.StiffnessLow,
            visibilityThreshold = 0.001f
        ),
        label = "bounce_$index"
    )
    
    Text(
        text = letter.toString(),
        style = textStyle,
        modifier = Modifier
            .graphicsLayer {
                this.translationY = translationY.value
                this.alpha = alpha.value
                this.scaleX = 1f + (bounce.value * 0.1f)
                this.scaleY = 1f - (bounce.value * 0.1f)
                transformOrigin = TransformOrigin(0.5f, 1f)
            }
    )
}

/**
 * Extension function to create a bouncing letter drop animation
 */
@Composable
fun BouncingLetterDropAnimation(
    text: String,
    modifier: Modifier = Modifier,
    fontSize: TextUnit = 24.sp,
    fontWeight: FontWeight = FontWeight.Normal,
    color: Color = Color.Black,
    dropHeight: Float = 400f,
    staggerDelay: Long = 40,
    animationDuration: Int = 1000
) {
    LetterDropAnimation(
        text = text,
        modifier = modifier,
        textStyle = TextStyle(
            fontSize = fontSize,
            fontWeight = fontWeight,
            color = color
        ),
        dropHeight = dropHeight,
        staggerDelay = staggerDelay,
        animationDuration = animationDuration
    )
}

/**
 * A wave-style letter drop animation where letters drop in a wave pattern
 */
@Composable
fun WaveLetterDropAnimation(
    text: String,
    modifier: Modifier = Modifier,
    textStyle: TextStyle = LocalTextStyle.current,
    waveAmplitude: Float = 100f,
    animationDuration: Int = 1200
) {
    var animationTriggered by remember { mutableStateOf(false) }
    
    LaunchedEffect(text) {
        animationTriggered = false
        delay(100)
        animationTriggered = true
    }
    
    Row(
        modifier = modifier,
        horizontalArrangement = Arrangement.Center,
        verticalAlignment = Alignment.CenterVertically
    ) {
        text.forEachIndexed { index, char ->
            if (char == ' ') {
                Spacer(modifier = Modifier.width(4.dp))
            } else {
                val waveDelay = (index * 30).toInt() + 
                    (kotlin.math.sin(index * 0.5) * 50).toInt()
                
                val translationY = animateFloatAsState(
                    targetValue = if (animationTriggered) 0f else 
                        -(waveAmplitude + waveAmplitude * kotlin.math.sin(index * 0.3f)),
                    animationSpec = tween(
                        durationMillis = animationDuration,
                        delayMillis = waveDelay,
                        easing = FastOutSlowInEasing
                    ),
                    label = "wave_translation_$index"
                )
                
                val alpha = animateFloatAsState(
                    targetValue = if (animationTriggered) 1f else 0f,
                    animationSpec = tween(
                        durationMillis = animationDuration / 3,
                        delayMillis = waveDelay
                    ),
                    label = "wave_alpha_$index"
                )
                
                val rotation = animateFloatAsState(
                    targetValue = if (animationTriggered) 0f else 360f,
                    animationSpec = tween(
                        durationMillis = animationDuration,
                        delayMillis = waveDelay,
                        easing = FastOutSlowInEasing
                    ),
                    label = "wave_rotation_$index"
                )
                
                Text(
                    text = char.toString(),
                    style = textStyle,
                    modifier = Modifier
                        .graphicsLayer {
                            this.translationY = translationY.value
                            this.alpha = alpha.value
                            this.rotationZ = rotation.value
                            transformOrigin = TransformOrigin.Center
                        }
                )
            }
        }
    }
}
