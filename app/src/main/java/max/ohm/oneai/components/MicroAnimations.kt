package max.ohm.oneai.components

import androidx.compose.animation.*
import androidx.compose.animation.core.*
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.interaction.MutableInteractionSource
import androidx.compose.foundation.interaction.collectIsPressedAsState
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.ripple.rememberRipple
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.composed
import androidx.compose.ui.draw.clip
import androidx.compose.ui.draw.scale
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.graphics.*
import androidx.compose.ui.graphics.drawscope.DrawScope
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.platform.LocalDensity
import androidx.compose.ui.unit.Dp
import androidx.compose.ui.unit.dp
import kotlinx.coroutines.delay
import max.ohm.oneai.ui.theme.*

// Micro-animation extensions and utilities
@Composable
fun Modifier.animateHover(
    hoverScale: Float = 1.05f,
    pressedScale: Float = 0.98f,
    animationDuration: Int = 200
): Modifier = composed {
    val interactionSource = remember { MutableInteractionSource() }
    val isPressed by interactionSource.collectIsPressedAsState()
    
    val scale by animateFloatAsState(
        targetValue = if (isPressed) pressedScale else hoverScale,
        animationSpec = tween(
            durationMillis = animationDuration,
            easing = FastOutSlowInEasing
        ),
        label = "hover_scale"
    )
    
    this.scale(scale)
}

@Composable
fun Modifier.pulseAnimation(
    scale: Float = 1.1f,
    duration: Int = 1000
): Modifier = composed {
    val infiniteTransition = rememberInfiniteTransition(label = "pulse")
    val animatedScale by infiniteTransition.animateFloat(
        initialValue = 1f,
        targetValue = scale,
        animationSpec = infiniteRepeatable(
            animation = tween(duration, easing = FastOutSlowInEasing),
            repeatMode = RepeatMode.Reverse
        ),
        label = "pulse_scale"
    )
    
    this.scale(animatedScale)
}

@Composable
fun Modifier.breatheAnimation(
    minAlpha: Float = 0.3f,
    maxAlpha: Float = 1f,
    duration: Int = 2000
): Modifier = composed {
    val infiniteTransition = rememberInfiniteTransition(label = "breathe")
    val animatedAlpha by infiniteTransition.animateFloat(
        initialValue = minAlpha,
        targetValue = maxAlpha,
        animationSpec = infiniteRepeatable(
            animation = tween(duration, easing = EaseInOutSine),
            repeatMode = RepeatMode.Reverse
        ),
        label = "breathe_alpha"
    )
    
    this.graphicsLayer { alpha = animatedAlpha }
}

@Composable
fun Modifier.slideInFromLeft(
    duration: Int = 300,
    delay: Int = 0
): Modifier = composed {
    var visible by remember { mutableStateOf(false) }
    
    LaunchedEffect(Unit) {
        delay(delay.toLong())
        visible = true
    }
    
    val offsetX by animateFloatAsState(
        targetValue = if (visible) 0f else -200f,
        animationSpec = tween(
            durationMillis = duration,
            easing = FastOutSlowInEasing
        ),
        label = "slide_in_x"
    )
    
    this.offset(x = offsetX.dp)
}

@Composable
fun Modifier.slideInFromBottom(
    duration: Int = 400,
    delay: Int = 0
): Modifier = composed {
    var visible by remember { mutableStateOf(false) }
    
    LaunchedEffect(Unit) {
        delay(delay.toLong())
        visible = true
    }
    
    val offsetY by animateFloatAsState(
        targetValue = if (visible) 0f else 100f,
        animationSpec = tween(
            durationMillis = duration,
            easing = FastOutSlowInEasing
        ),
        label = "slide_in_y"
    )
    
    this.offset(y = offsetY.dp)
}

@Composable
fun Modifier.fadeInWithScale(
    duration: Int = 500,
    delay: Int = 0,
    initialScale: Float = 0.8f
): Modifier = composed {
    var visible by remember { mutableStateOf(false) }
    
    LaunchedEffect(Unit) {
        delay(delay.toLong())
        visible = true
    }
    
    val alpha by animateFloatAsState(
        targetValue = if (visible) 1f else 0f,
        animationSpec = tween(
            durationMillis = duration,
            easing = FastOutSlowInEasing
        ),
        label = "fade_in_alpha"
    )
    
    val scale by animateFloatAsState(
        targetValue = if (visible) 1f else initialScale,
        animationSpec = tween(
            durationMillis = duration,
            easing = FastOutSlowInEasing
        ),
        label = "fade_in_scale"
    )
    
    this.graphicsLayer {
        this.alpha = alpha
        scaleX = scale
        scaleY = scale
    }
}

// Animated Floating Element
@Composable
fun FloatingElement(
    modifier: Modifier = Modifier,
    content: @Composable () -> Unit
) {
    val infiniteTransition = rememberInfiniteTransition(label = "floating")
    
    val offsetY by infiniteTransition.animateFloat(
        initialValue = 0f,
        targetValue = -10f,
        animationSpec = infiniteRepeatable(
            animation = tween(2000, easing = EaseInOutSine),
            repeatMode = RepeatMode.Reverse
        ),
        label = "floating_y"
    )
    
    Box(
        modifier = modifier.offset(y = offsetY.dp)
    ) {
        content()
    }
}

// Shimmer Effect for Loading States
@Composable
fun Modifier.shimmerEffect(
    colors: List<Color> = listOf(
        ShimmerBase.copy(alpha = 0.6f),
        ShimmerHighlight.copy(alpha = 0.2f),
        ShimmerBase.copy(alpha = 0.6f)
    ),
    duration: Int = 1300
): Modifier = composed {
    val infiniteTransition = rememberInfiniteTransition(label = "shimmer")
    val translateAnimation by infiniteTransition.animateFloat(
        initialValue = 0f,
        targetValue = 1000f,
        animationSpec = infiniteRepeatable(
            animation = tween(duration),
            repeatMode = RepeatMode.Restart
        ),
        label = "shimmer_translate"
    )
    
    background(
        brush = Brush.linearGradient(
            colors = colors,
            start = Offset(translateAnimation, translateAnimation),
            end = Offset(translateAnimation + 100f, translateAnimation + 100f)
        )
    )
}

// Ripple Click Effect
@Composable
fun Modifier.rippleClickable(
    onClick: () -> Unit,
    rippleColor: Color = AccentPurple.copy(alpha = 0.3f),
    bounded: Boolean = true
): Modifier = composed {
    clickable(
        interactionSource = remember { MutableInteractionSource() },
        indication = rememberRipple(
            color = rippleColor,
            bounded = bounded
        ),
        onClick = onClick
    )
}

// Bounce Animation on Tap
@Composable
fun Modifier.bounceOnTap(
    bounceScale: Float = 1.2f,
    duration: Int = 300
): Modifier = composed {
    var isTapped by remember { mutableStateOf(false) }
    
    val scale by animateFloatAsState(
        targetValue = if (isTapped) bounceScale else 1f,
        animationSpec = spring(
            dampingRatio = Spring.DampingRatioMediumBouncy,
            stiffness = Spring.StiffnessLow
        ),
        label = "bounce_scale"
    )
    
    LaunchedEffect(isTapped) {
        if (isTapped) {
            delay(duration.toLong())
            isTapped = false
        }
    }
    
    this
        .scale(scale)
        .clickable { isTapped = true }
}

// Rotate Animation
@Composable
fun Modifier.rotateAnimation(
    duration: Int = 1000,
    clockwise: Boolean = true
): Modifier = composed {
    val infiniteTransition = rememberInfiniteTransition(label = "rotation")
    val rotation by infiniteTransition.animateFloat(
        initialValue = 0f,
        targetValue = if (clockwise) 360f else -360f,
        animationSpec = infiniteRepeatable(
            animation = tween(duration, easing = LinearEasing),
            repeatMode = RepeatMode.Restart
        ),
        label = "rotation_angle"
    )
    
    this.graphicsLayer { rotationZ = rotation }
}

// Gradient Background Animation
@Composable
fun AnimatedGradientBackground(
    colors: List<Color> = listOf(
        GradientPurple.copy(alpha = 0.8f),
        GradientPink.copy(alpha = 0.8f),
        GradientCyan.copy(alpha = 0.8f)
    ),
    duration: Int = 5000,
    modifier: Modifier = Modifier
) {
    val infiniteTransition = rememberInfiniteTransition(label = "gradient_animation")
    
    val gradientOffset by infiniteTransition.animateFloat(
        initialValue = 0f,
        targetValue = 1000f,
        animationSpec = infiniteRepeatable(
            animation = tween(duration, easing = LinearEasing),
            repeatMode = RepeatMode.Reverse
        ),
        label = "gradient_offset"
    )
    
    Box(
        modifier = modifier.background(
            brush = Brush.linearGradient(
                colors = colors,
                start = Offset(gradientOffset, gradientOffset),
                end = Offset(gradientOffset + 500f, gradientOffset + 500f)
            )
        )
    )
}

// Typewriter Text Effect
@Composable
fun TypewriterText(
    text: String,
    modifier: Modifier = Modifier,
    style: androidx.compose.ui.text.TextStyle = LocalTextStyle.current,
    typingSpeed: Int = 100, // milliseconds per character
    onComplete: (() -> Unit)? = null
) {
    var displayedText by remember { mutableStateOf("") }
    
    LaunchedEffect(text) {
        displayedText = ""
        for (i in text.indices) {
            displayedText = text.substring(0, i + 1)
            delay(typingSpeed.toLong())
        }
        onComplete?.invoke()
    }
    
    Text(
        text = displayedText,
        modifier = modifier,
        style = style
    )
}

// Morphing Shape Animation
@Composable
fun MorphingCard(
    isExpanded: Boolean,
    normalShape: RoundedCornerShape = RoundedCornerShape(16.dp),
    expandedShape: RoundedCornerShape = RoundedCornerShape(32.dp),
    animationDuration: Int = 300,
    modifier: Modifier = Modifier,
    content: @Composable () -> Unit
) {
    val cornerRadius by animateDpAsState(
        targetValue = if (isExpanded) 32.dp else 16.dp,
        animationSpec = tween(
            durationMillis = animationDuration,
            easing = FastOutSlowInEasing
        ),
        label = "corner_radius"
    )
    
    Card(
        modifier = modifier,
        shape = RoundedCornerShape(cornerRadius),
        content = { content() }
    )
}

// Loading Dots Animation
@Composable
fun LoadingDots(
    modifier: Modifier = Modifier,
    dotColor: Color = AccentPurple,
    dotSize: Dp = 8.dp,
    spacing: Dp = 4.dp
) {
    val infiniteTransition = rememberInfiniteTransition(label = "loading_dots")
    
    Row(
        modifier = modifier,
        horizontalArrangement = Arrangement.spacedBy(spacing)
    ) {
        repeat(3) { index ->
            val alpha by infiniteTransition.animateFloat(
                initialValue = 0.3f,
                targetValue = 1f,
                animationSpec = infiniteRepeatable(
                    animation = tween(600),
                    repeatMode = RepeatMode.Reverse,
                    initialStartOffset = StartOffset(index * 200)
                ),
                label = "dot_alpha_$index"
            )
            
            Box(
                modifier = Modifier
                    .size(dotSize)
                    .clip(CircleShape)
                    .background(dotColor.copy(alpha = alpha))
            )
        }
    }
}

// Staggered List Animation
@Composable
fun StaggeredAnimationScope(
    itemCount: Int,
    staggerDelay: Int = 100,
    content: @Composable (index: Int, animationDelay: Int) -> Unit
) {
    repeat(itemCount) { index ->
        val delay = index * staggerDelay
        content(index, delay)
    }
}

// Gesture-based Scale Animation
@Composable
fun Modifier.scaleOnPress(
    pressedScale: Float = 0.95f,
    releasedScale: Float = 1f
): Modifier = composed {
    val interactionSource = remember { MutableInteractionSource() }
    val isPressed by interactionSource.collectIsPressedAsState()
    
    val scale by animateFloatAsState(
        targetValue = if (isPressed) pressedScale else releasedScale,
        animationSpec = tween(150),
        label = "press_scale"
    )
    
    this.scale(scale)
}
