package max.ohm.oneai.components

import androidx.compose.animation.*
import androidx.compose.animation.core.*
import androidx.compose.foundation.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.blur
import androidx.compose.ui.draw.clip
import androidx.compose.ui.draw.scale
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.graphics.*
import androidx.compose.ui.graphics.drawscope.Stroke
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.platform.LocalDensity
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.Dp
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.compose.ui.zIndex
import max.ohm.oneai.ui.theme.*

// Glass Card Component
@Composable
fun GlassCard(
    modifier: Modifier = Modifier,
    shape: RoundedCornerShape = RoundedCornerShape(16.dp),
    elevation: Dp = 8.dp,
    onClick: (() -> Unit)? = null,
    content: @Composable BoxScope.() -> Unit
) {
    val clickableModifier = if (onClick != null) {
        modifier.clickable { onClick() }
    } else modifier
    
    Card(
        modifier = clickableModifier,
        shape = shape,
        colors = CardDefaults.cardColors(
            containerColor = GlassBackground
        ),
        border = BorderStroke(1.dp, GlassBorder),
        elevation = CardDefaults.cardElevation(defaultElevation = elevation)
    ) {
        Box(
            modifier = Modifier
                .fillMaxSize()
                .background(
                    brush = Brush.linearGradient(
                        colors = listOf(
                            GlassBackgroundLight,
                            GlassBackground
                        ),
                        start = Offset(0f, 0f),
                        end = Offset(500f, 500f)
                    )
                )
        ) {
            content()
        }
    }
}

// Glass Button Component
@Composable
fun GlassButton(
    onClick: () -> Unit,
    modifier: Modifier = Modifier,
    enabled: Boolean = true,
    shape: RoundedCornerShape = RoundedCornerShape(12.dp),
    colors: List<Color> = listOf(AccentPurple, AccentPink),
    contentPadding: PaddingValues = PaddingValues(horizontal = 24.dp, vertical = 12.dp),
    content: @Composable RowScope.() -> Unit
) {
    var isPressed by remember { mutableStateOf(false) }
    val scale by animateFloatAsState(
        targetValue = if (isPressed) 0.95f else 1f,
        animationSpec = tween(100),
        label = "button_scale"
    )
    
    Card(
        onClick = onClick,
        modifier = modifier
            .scale(scale)
            .clip(shape),
        enabled = enabled,
        shape = shape,
        colors = CardDefaults.cardColors(
            containerColor = if (enabled) Color.Transparent else GlassBackground.copy(alpha = 0.5f)
        ),
        border = BorderStroke(
            1.dp, 
            if (enabled) GlassBorderAccent else GlassBorder.copy(alpha = 0.5f)
        )
    ) {
        Box(
            modifier = Modifier
                .background(
                    brush = if (enabled) {
                        Brush.linearGradient(
                            colors = colors.map { it.copy(alpha = 0.8f) }
                        )
                    } else {
                        Brush.linearGradient(
                            colors = listOf(
                                GlassBackground.copy(alpha = 0.3f),
                                GlassBackground.copy(alpha = 0.1f)
                            )
                        )
                    }
                )
                .padding(contentPadding)
        ) {
            Row(
                horizontalArrangement = Arrangement.Center,
                verticalAlignment = Alignment.CenterVertically,
                content = content
            )
        }
    }
}

// Glass Icon Button
@Composable
fun GlassIconButton(
    onClick: () -> Unit,
    icon: ImageVector,
    modifier: Modifier = Modifier,
    size: Dp = 48.dp,
    enabled: Boolean = true,
    colors: List<Color> = listOf(AccentPurple, AccentPink),
    contentDescription: String? = null
) {
    var isPressed by remember { mutableStateOf(false) }
    val scale by animateFloatAsState(
        targetValue = if (isPressed) 0.9f else 1f,
        animationSpec = tween(100),
        label = "icon_button_scale"
    )
    
    Box(
        modifier = modifier
            .size(size)
            .scale(scale)
            .clip(CircleShape)
            .background(
                brush = if (enabled) {
                    Brush.linearGradient(colors)
                } else {
                    Brush.linearGradient(
                        colors = listOf(
                            GlassBackground.copy(alpha = 0.5f),
                            GlassBackground.copy(alpha = 0.3f)
                        )
                    )
                }
            )
            .clickable(enabled = enabled) { onClick() },
        contentAlignment = Alignment.Center
    ) {
        Icon(
            imageVector = icon,
            contentDescription = contentDescription,
            tint = if (enabled) Color.White else TextMuted,
            modifier = Modifier.size(size * 0.5f)
        )
    }
}

// Glass Loading Indicator
@Composable
fun GlassLoadingIndicator(
    modifier: Modifier = Modifier,
    size: Dp = 40.dp,
    strokeWidth: Dp = 4.dp,
    colors: List<Color> = listOf(AccentPurple, AccentPink, AccentCyan)
) {
    val infiniteTransition = rememberInfiniteTransition(label = "loading_rotation")
    val rotation by infiniteTransition.animateFloat(
        initialValue = 0f,
        targetValue = 360f,
        animationSpec = infiniteRepeatable(
            animation = tween(1000, easing = LinearEasing),
            repeatMode = RepeatMode.Restart
        ),
        label = "loading_rotation_value"
    )
    
    Box(
        modifier = modifier.size(size),
        contentAlignment = Alignment.Center
    ) {
        Canvas(
            modifier = Modifier
                .size(size)
                .graphicsLayer { rotationZ = rotation }
        ) {
            val radius = size.toPx() / 2f
            val strokeWidthPx = strokeWidth.toPx()
            
            drawCircle(
                brush = Brush.sweepGradient(colors),
                radius = radius - strokeWidthPx / 2f,
                style = Stroke(
                    width = strokeWidthPx,
                    cap = StrokeCap.Round
                ),
                center = center
            )
        }
    }
}

// Glass Text Field
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun GlassTextField(
    value: String,
    onValueChange: (String) -> Unit,
    modifier: Modifier = Modifier,
    placeholder: String = "",
    leadingIcon: ImageVector? = null,
    trailingIcon: ImageVector? = null,
    onTrailingIconClick: (() -> Unit)? = null,
    enabled: Boolean = true,
    singleLine: Boolean = true,
    maxLines: Int = 1
) {
    Card(
        modifier = modifier,
        shape = RoundedCornerShape(16.dp),
        colors = CardDefaults.cardColors(
            containerColor = GlassBackground
        ),
        border = BorderStroke(1.dp, GlassBorder)
    ) {
        Box(
            modifier = Modifier
                .fillMaxWidth()
                .background(
                    brush = Brush.linearGradient(
                        colors = listOf(
                            GlassBackgroundLight,
                            GlassBackground
                        )
                    )
                )
        ) {
            OutlinedTextField(
                value = value,
                onValueChange = onValueChange,
                modifier = Modifier.fillMaxWidth(),
                placeholder = {
                    Text(
                        text = placeholder,
                        color = TextMuted
                    )
                },
                leadingIcon = leadingIcon?.let { icon ->
                    {
                        Icon(
                            imageVector = icon,
                            contentDescription = null,
                            tint = AccentPurple,
                            modifier = Modifier.size(20.dp)
                        )
                    }
                },
                trailingIcon = trailingIcon?.let { icon ->
                    {
                        IconButton(
                            onClick = { onTrailingIconClick?.invoke() }
                        ) {
                            Icon(
                                imageVector = icon,
                                contentDescription = null,
                                tint = AccentPurple,
                                modifier = Modifier.size(20.dp)
                            )
                        }
                    }
                },
                enabled = enabled,
                singleLine = singleLine,
                maxLines = maxLines,
                colors = TextFieldDefaults.outlinedTextFieldColors(
                    focusedTextColor = TextPrimary,
                    unfocusedTextColor = TextPrimary,
                    focusedBorderColor = Color.Transparent,
                    unfocusedBorderColor = Color.Transparent,
                    containerColor = Color.Transparent
                ),
                shape = RoundedCornerShape(16.dp)
            )
        }
    }
}

// Glass Shimmer Effect
@Composable
fun GlassShimmerBox(
    modifier: Modifier = Modifier,
    shape: RoundedCornerShape = RoundedCornerShape(12.dp)
) {
    val infiniteTransition = rememberInfiniteTransition(label = "shimmer_animation")
    val shimmerTranslateAnim by infiniteTransition.animateFloat(
        initialValue = 0f,
        targetValue = 1000f,
        animationSpec = infiniteRepeatable(
            animation = tween(1200, easing = FastOutSlowInEasing),
            repeatMode = RepeatMode.Restart
        ),
        label = "shimmer_translate"
    )
    
    Box(
        modifier = modifier
            .clip(shape)
            .background(ShimmerBase)
            .background(
                brush = Brush.linearGradient(
                    colors = listOf(
                        Color.Transparent,
                        ShimmerHighlight.copy(alpha = 0.3f),
                        Color.Transparent
                    ),
                    start = Offset(shimmerTranslateAnim - 200f, shimmerTranslateAnim - 200f),
                    end = Offset(shimmerTranslateAnim, shimmerTranslateAnim)
                )
            )
    )
}

// Glass Badge
@Composable
fun GlassBadge(
    text: String,
    modifier: Modifier = Modifier,
    colors: List<Color> = listOf(AccentOrange, AccentPink),
    textColor: Color = Color.White
) {
    Box(
        modifier = modifier
            .clip(RoundedCornerShape(8.dp))
            .background(
                brush = Brush.linearGradient(colors)
            )
            .padding(horizontal = 8.dp, vertical = 4.dp),
        contentAlignment = Alignment.Center
    ) {
        Text(
            text = text,
            color = textColor,
            fontSize = 10.sp,
            fontWeight = FontWeight.Medium
        )
    }
}

// Glass Progress Indicator
@Composable
fun GlassProgressIndicator(
    progress: Float,
    modifier: Modifier = Modifier,
    colors: List<Color> = listOf(AccentPurple, AccentPink),
    backgroundColor: Color = GlassBackground,
    height: Dp = 4.dp
) {
    Box(
        modifier = modifier
            .fillMaxWidth()
            .height(height)
            .clip(RoundedCornerShape(height / 2))
            .background(backgroundColor)
    ) {
        Box(
            modifier = Modifier
                .fillMaxHeight()
                .fillMaxWidth(progress.coerceIn(0f, 1f))
                .clip(RoundedCornerShape(height / 2))
                .background(
                    brush = Brush.linearGradient(colors)
                )
        )
    }
}

// Animated Glass Orb Background
@Composable
fun AnimatedGlassOrb(
    modifier: Modifier = Modifier,
    colors: List<Color> = listOf(
        GradientPurple.copy(alpha = 0.1f),
        Color.Transparent
    ),
    size: Dp = 200.dp,
    duration: Int = 8000
) {
    val infiniteTransition = rememberInfiniteTransition(label = "orb_animation")
    
    val offsetX by infiniteTransition.animateFloat(
        initialValue = -100f,
        targetValue = 100f,
        animationSpec = infiniteRepeatable(
            animation = tween(duration, easing = EaseInOutSine),
            repeatMode = RepeatMode.Reverse
        ),
        label = "orb_offset_x"
    )
    
    val offsetY by infiniteTransition.animateFloat(
        initialValue = -50f,
        targetValue = 50f,
        animationSpec = infiniteRepeatable(
            animation = tween(duration + 1000, easing = EaseInOutSine),
            repeatMode = RepeatMode.Reverse
        ),
        label = "orb_offset_y"
    )
    
    Box(
        modifier = modifier
            .offset(x = offsetX.dp, y = offsetY.dp)
            .size(size)
            .background(
                brush = Brush.radialGradient(colors),
                shape = CircleShape
            )
            .blur(60.dp)
    )
}

// Glass Floating Action Button
@Composable
fun GlassFloatingActionButton(
    onClick: () -> Unit,
    modifier: Modifier = Modifier,
    icon: ImageVector = Icons.Default.Add,
    colors: List<Color> = listOf(AccentPurple, AccentPink),
    size: Dp = 56.dp,
    contentDescription: String? = null
) {
    var isPressed by remember { mutableStateOf(false) }
    val scale by animateFloatAsState(
        targetValue = if (isPressed) 0.9f else 1f,
        animationSpec = spring(
            dampingRatio = Spring.DampingRatioMediumBouncy,
            stiffness = Spring.StiffnessLow
        ),
        label = "fab_scale"
    )
    
    Box(
        modifier = modifier
            .size(size)
            .scale(scale)
            .clip(CircleShape)
            .background(
                brush = Brush.linearGradient(colors)
            )
            .clickable { 
                isPressed = true
                onClick()
            }
            .zIndex(1f),
        contentAlignment = Alignment.Center
    ) {
        // Glass overlay effect
        Box(
            modifier = Modifier
                .fillMaxSize()
                .background(
                    brush = Brush.linearGradient(
                        colors = listOf(
                            Color.White.copy(alpha = 0.2f),
                            Color.Transparent
                        ),
                        start = Offset(0f, 0f),
                        end = Offset(size.value, size.value)
                    )
                )
        )
        
        Icon(
            imageVector = icon,
            contentDescription = contentDescription,
            tint = Color.White,
            modifier = Modifier.size(24.dp)
        )
    }
    
    LaunchedEffect(isPressed) {
        if (isPressed) {
            kotlinx.coroutines.delay(100)
            isPressed = false
        }
    }
}
