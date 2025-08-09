package max.ohm.oneai.components

import androidx.compose.animation.core.*
import androidx.compose.animation.animateColorAsState
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.interaction.MutableInteractionSource
import androidx.compose.foundation.interaction.collectIsPressedAsState
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.*
import androidx.compose.ui.focus.onFocusChanged
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.hapticfeedback.HapticFeedbackType
import androidx.compose.ui.platform.LocalHapticFeedback
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.Dp
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import max.ohm.oneai.ui.theme.*

// Emotion-Intelligent Glassmorphic Button
@Composable
fun EmotionIntelligentButton(
    text: String,
    onClick: () -> Unit,
    modifier: Modifier = Modifier,
    enabled: Boolean = true,
    emotion: EmotionState = EmotionState.Calm,
    isLoading: Boolean = false,
    icon: ImageVector? = null,
    hapticEnabled: Boolean = true
) {
    val hapticFeedback = LocalHapticFeedback.current
    val interactionSource = remember { MutableInteractionSource() }
    val isPressed by interactionSource.collectIsPressedAsState()
    
    // Emotion-based color selection
    val emotionColor = when (emotion) {
        EmotionState.Calm -> EmotionCalm
        EmotionState.Energetic -> EmotionEnergetic
        EmotionState.Creative -> EmotionCreative
        EmotionState.Focused -> EmotionFocused
        EmotionState.Success -> EmotionSuccess
    }
    
    // Micro-animations
    val scale by animateFloatAsState(
        targetValue = if (isPressed) 0.96f else 1f,
        animationSpec = spring(
            dampingRatio = Spring.DampingRatioMediumBouncy,
            stiffness = Spring.StiffnessLow
        ),
        label = "button_scale"
    )
    
    val elevation by animateFloatAsState(
        targetValue = if (isPressed) 2.dp.value else 8.dp.value,
        animationSpec = tween(150),
        label = "button_elevation"
    )
    
    // Loading animation
    val infiniteTransition = rememberInfiniteTransition(label = "loading")
    val loadingRotation by infiniteTransition.animateFloat(
        initialValue = 0f,
        targetValue = 360f,
        animationSpec = infiniteRepeatable(
            animation = tween(1000, easing = LinearEasing),
            repeatMode = RepeatMode.Restart
        ),
        label = "loading_rotation"
    )
    
    Box(
        modifier = modifier
            .scale(scale)
            .shadow(
                elevation = elevation.dp,
                shape = RoundedCornerShape(16.dp),
                ambientColor = emotionColor.copy(alpha = 0.3f),
                spotColor = emotionColor.copy(alpha = 0.3f)
            )
            .clip(RoundedCornerShape(16.dp))
            .background(
                brush = Brush.linearGradient(
                    colors = listOf(
                        emotionColor.copy(alpha = if (enabled) 1f else 0.5f),
                        emotionColor.copy(alpha = if (enabled) 0.8f else 0.3f)
                    )
                )
            )
            .clickable(
                enabled = enabled && !isLoading,
                interactionSource = interactionSource,
                indication = null
            ) {
                if (hapticEnabled) {
                    hapticFeedback.performHapticFeedback(HapticFeedbackType.LongPress)
                }
                onClick()
            },
        contentAlignment = Alignment.Center
    ) {
        // Glassmorphic overlay
        Box(
            modifier = Modifier
                .fillMaxSize()
                .background(
                    brush = Brush.linearGradient(
                        colors = listOf(
                            Color.White.copy(alpha = 0.2f),
                            Color.Transparent
                        )
                    )
                )
        )
        
        Row(
            verticalAlignment = Alignment.CenterVertically,
            horizontalArrangement = Arrangement.Center,
            modifier = Modifier.padding(horizontal = 24.dp, vertical = 16.dp)
        ) {
            if (isLoading) {
                Box(
                    modifier = Modifier
                        .size(20.dp)
                        .rotate(loadingRotation)
                ) {
                    CircularProgressIndicator(
                        modifier = Modifier.fillMaxSize(),
                        color = Color.White,
                        strokeWidth = 2.dp
                    )
                }
            } else {
                icon?.let {
                    Icon(
                        imageVector = it,
                        contentDescription = null,
                        tint = Color.White,
                        modifier = Modifier.size(20.dp)
                    )
                    Spacer(modifier = Modifier.width(8.dp))
                }
            }
            
            if (!isLoading) {
                Text(
                    text = text,
                    color = Color.White,
                    fontSize = 16.sp,
                    fontWeight = FontWeight.SemiBold,
                    style = MaterialTheme.typography.labelLarge
                )
            }
        }
    }
}

// Enhanced Glassmorphic Card with Adaptive Design
@Composable
fun AdaptiveGlassCard(
    modifier: Modifier = Modifier,
    onClick: (() -> Unit)? = null,
    emotion: EmotionState = EmotionState.Calm,
    elevation: Dp = 8.dp,
    borderWidth: Dp = 1.dp,
    content: @Composable BoxScope.() -> Unit
) {
    val interactionSource = remember { MutableInteractionSource() }
    val isPressed by interactionSource.collectIsPressedAsState()
    
    val emotionColor = when (emotion) {
        EmotionState.Calm -> EmotionCalm
        EmotionState.Energetic -> EmotionEnergetic
        EmotionState.Creative -> EmotionCreative
        EmotionState.Focused -> EmotionFocused
        EmotionState.Success -> EmotionSuccess
    }
    
    val scale by animateFloatAsState(
        targetValue = if (isPressed) 0.98f else 1f,
        animationSpec = spring(
            dampingRatio = Spring.DampingRatioMediumBouncy,
            stiffness = Spring.StiffnessLow
        ),
        label = "card_scale"
    )
    
    Box(
        modifier = modifier
            .scale(scale)
            .shadow(
                elevation = elevation,
                shape = RoundedCornerShape(20.dp),
                ambientColor = emotionColor.copy(alpha = 0.1f),
                spotColor = emotionColor.copy(alpha = 0.2f)
            )
            .clip(RoundedCornerShape(20.dp))
            .background(
                brush = Brush.verticalGradient(
                    colors = listOf(
                        GlassAdaptiveBackground.copy(alpha = 0.2f),
                        GlassAdaptiveBackground.copy(alpha = 0.1f)
                    )
                )
            )
            .border(
                width = borderWidth,
                brush = Brush.linearGradient(
                    colors = listOf(
                        emotionColor.copy(alpha = 0.3f),
                        Color.White.copy(alpha = 0.1f),
                        emotionColor.copy(alpha = 0.2f)
                    )
                ),
                shape = RoundedCornerShape(20.dp)
            )
            .let { mod ->
                onClick?.let {
                    mod.clickable(
                        interactionSource = interactionSource,
                        indication = null
                    ) { it() }
                } ?: mod
            }
    ) {
        // Glassmorphic highlight
        Box(
            modifier = Modifier
                .fillMaxWidth()
                .height(40.dp)
                .background(
                    brush = Brush.verticalGradient(
                        colors = listOf(
                            Color.White.copy(alpha = 0.1f),
                            Color.Transparent
                        )
                    )
                )
        )
        
        content()
    }
}

// Emotion-Responsive Input Field
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun EmotionIntelligentTextField(
    value: String,
    onValueChange: (String) -> Unit,
    placeholder: String,
    modifier: Modifier = Modifier,
    emotion: EmotionState = EmotionState.Calm,
    leadingIcon: ImageVector? = null,
    trailingIcon: ImageVector? = null,
    onTrailingIconClick: (() -> Unit)? = null,
    maxLines: Int = 1,
    enabled: Boolean = true
) {
    var isFocused by remember { mutableStateOf(false) }
    
    val emotionColor = when (emotion) {
        EmotionState.Calm -> EmotionCalm
        EmotionState.Energetic -> EmotionEnergetic
        EmotionState.Creative -> EmotionCreative
        EmotionState.Focused -> EmotionFocused
        EmotionState.Success -> EmotionSuccess
    }
    
    val borderColor by animateColorAsState(
        targetValue = if (isFocused) emotionColor else Color.White.copy(alpha = 0.2f),
        animationSpec = tween(300),
        label = "border_color"
    )
    
    OutlinedTextField(
        value = value,
        onValueChange = onValueChange,
        placeholder = {
            Text(
                text = placeholder,
                color = TextHint,
                style = MaterialTheme.typography.bodyMedium
            )
        },
        modifier = modifier
            .fillMaxWidth()
            .onFocusChanged { isFocused = it.isFocused },
        enabled = enabled,
        maxLines = maxLines,
        leadingIcon = leadingIcon?.let { icon ->
            {
                Icon(
                    imageVector = icon,
                    contentDescription = null,
                    tint = if (isFocused) emotionColor else TextSecondary,
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
                        tint = TextSecondary,
                        modifier = Modifier.size(20.dp)
                    )
                }
            }
        },
        colors = OutlinedTextFieldDefaults.colors(
            focusedTextColor = TextPrimary,
            unfocusedTextColor = TextPrimary,
            disabledTextColor = TextMuted,
            focusedContainerColor = Color.Transparent,
            unfocusedContainerColor = Color.Transparent,
            disabledContainerColor = Color.Transparent,
            focusedBorderColor = borderColor,
            unfocusedBorderColor = borderColor,
            cursorColor = emotionColor
        ),
        shape = RoundedCornerShape(16.dp),
        textStyle = MaterialTheme.typography.bodyLarge
    )
}

// Floating Action Button with Micro-animations
@Composable
fun EmotionIntelligentFAB(
    onClick: () -> Unit,
    icon: ImageVector,
    modifier: Modifier = Modifier,
    emotion: EmotionState = EmotionState.Energetic,
    contentDescription: String? = null
) {
    val hapticFeedback = LocalHapticFeedback.current
    val interactionSource = remember { MutableInteractionSource() }
    val isPressed by interactionSource.collectIsPressedAsState()
    
    val emotionColor = when (emotion) {
        EmotionState.Calm -> EmotionCalm
        EmotionState.Energetic -> EmotionEnergetic
        EmotionState.Creative -> EmotionCreative
        EmotionState.Focused -> EmotionFocused
        EmotionState.Success -> EmotionSuccess
    }
    
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
            .size(56.dp)
            .scale(scale)
            .shadow(
                elevation = 12.dp,
                shape = CircleShape,
                ambientColor = emotionColor.copy(alpha = 0.4f),
                spotColor = emotionColor.copy(alpha = 0.4f)
            )
            .clip(CircleShape)
            .background(
                brush = Brush.radialGradient(
                    colors = listOf(
                        emotionColor,
                        emotionColor.copy(alpha = 0.8f)
                    )
                )
            )
            .clickable(
                interactionSource = interactionSource,
                indication = null
            ) {
                hapticFeedback.performHapticFeedback(HapticFeedbackType.LongPress)
                onClick()
            },
        contentAlignment = Alignment.Center
    ) {
        // Glassmorphic highlight
        Box(
            modifier = Modifier
                .fillMaxSize()
                .background(
                    brush = Brush.radialGradient(
                        colors = listOf(
                            Color.White.copy(alpha = 0.3f),
                            Color.Transparent
                        )
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
}

// Emotion State Enum for Context-Aware Design
enum class EmotionState {
    Calm,      // Blue-purple for trust and stability
    Energetic, // Pink for excitement and creativity
    Creative,  // Violet for inspiration and imagination  
    Focused,   // Cyan for concentration and clarity
    Success    // Green for achievement and progress
}

// Status Indicator with Emotion Intelligence
@Composable
fun EmotionStatusIndicator(
    status: String,
    emotion: EmotionState,
    modifier: Modifier = Modifier,
    icon: ImageVector? = null
) {
    val emotionColor = when (emotion) {
        EmotionState.Calm -> EmotionCalm
        EmotionState.Energetic -> EmotionEnergetic
        EmotionState.Creative -> EmotionCreative
        EmotionState.Focused -> EmotionFocused
        EmotionState.Success -> EmotionSuccess
    }
    
    Row(
        modifier = modifier
            .clip(RoundedCornerShape(12.dp))
            .background(
                emotionColor.copy(alpha = 0.1f)
            )
            .border(
                width = 1.dp,
                color = emotionColor.copy(alpha = 0.3f),
                shape = RoundedCornerShape(12.dp)
            )
            .padding(horizontal = 12.dp, vertical = 8.dp),
        verticalAlignment = Alignment.CenterVertically
    ) {
        icon?.let {
            Icon(
                imageVector = it,
                contentDescription = null,
                tint = emotionColor,
                modifier = Modifier.size(16.dp)
            )
            Spacer(modifier = Modifier.width(6.dp))
        }
        
        Text(
            text = status,
            color = TextPrimary,
            fontSize = 14.sp,
            fontWeight = FontWeight.Medium,
            style = MaterialTheme.typography.labelMedium
        )
    }
}
