package max.ohm.oneai.ui.theme

import androidx.compose.foundation.BorderStroke
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.blur
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.Dp
import androidx.compose.ui.unit.dp

/**
 * Glass morphism colors and modifiers for creating beautiful glass-style UI components
 */
object GlassMorphism {
    
    // Glass surface colors with transparency
    val GlassSurface = Color(255, 255, 255, 25) // 10% white
    val GlassSurfaceLight = Color(255, 255, 255, 38) // 15% white
    val GlassSurfaceDark = Color(0, 0, 0, 25) // 10% black
    
    // Glass border colors
    val GlassBorder = Color(255, 255, 255, 51) // 20% white
    val GlassBorderLight = Color(255, 255, 255, 76) // 30% white
    val GlassBorderSubtle = Color(255, 255, 255, 25) // 10% white
    
    // Gradient colors for glass effect
    val GlassGradientStart = Color(255, 255, 255, 20) // 8% white
    val GlassGradientEnd = Color(255, 255, 255, 5) // 2% white
    
    // Premium glass gradients with accent colors
    val PremiumGlassGradient = Brush.verticalGradient(
        colors = listOf(
            Color(255, 255, 255, 30), // 12% white at top
            Color(255, 255, 255, 10), // 4% white at middle
            Color(255, 255, 255, 20)  // 8% white at bottom
        )
    )
    
    val AccentGlassGradientPurple = Brush.verticalGradient(
        colors = listOf(
            Color(139, 92, 246, 20), // Purple with low opacity
            Color(139, 92, 246, 5),
            Color(255, 255, 255, 10)
        )
    )
    
    val AccentGlassGradientPink = Brush.verticalGradient(
        colors = listOf(
            Color(236, 72, 153, 20), // Pink with low opacity
            Color(236, 72, 153, 5),
            Color(255, 255, 255, 10)
        )
    )
    
    val AccentGlassGradientCyan = Brush.verticalGradient(
        colors = listOf(
            Color(6, 182, 212, 20), // Cyan with low opacity
            Color(6, 182, 212, 5),
            Color(255, 255, 255, 10)
        )
    )
}

/**
 * Modifier for applying glass morphism effect to any composable
 */
fun Modifier.glassMorphism(
    blur: Dp = 10.dp,
    cornerRadius: Dp = 16.dp,
    borderWidth: Dp = 1.dp,
    borderColor: Color = GlassMorphism.GlassBorder,
    backgroundColor: Color = GlassMorphism.GlassSurface
) = this
    .clip(RoundedCornerShape(cornerRadius))
    .background(backgroundColor)
    .border(
        width = borderWidth,
        color = borderColor,
        shape = RoundedCornerShape(cornerRadius)
    )

/**
 * Premium glass morphism modifier with gradient background
 */
fun Modifier.premiumGlassMorphism(
    blur: Dp = 12.dp,
    cornerRadius: Dp = 20.dp,
    borderWidth: Dp = 1.dp,
    borderGradient: Brush = Brush.linearGradient(
        colors = listOf(
            GlassMorphism.GlassBorderLight,
            GlassMorphism.GlassBorderSubtle
        )
    ),
    backgroundGradient: Brush = GlassMorphism.PremiumGlassGradient
) = this
    .clip(RoundedCornerShape(cornerRadius))
    .background(backgroundGradient)
    .border(
        width = borderWidth,
        brush = borderGradient,
        shape = RoundedCornerShape(cornerRadius)
    )

/**
 * Glass Card composable with built-in glass morphism effect
 */
@Composable
fun GlassCard(
    modifier: Modifier = Modifier,
    blur: Dp = 10.dp,
    cornerRadius: Dp = 16.dp,
    borderWidth: Dp = 1.dp,
    borderColor: Color = GlassMorphism.GlassBorder,
    backgroundColor: Color = GlassMorphism.GlassSurface,
    contentPadding: PaddingValues = PaddingValues(16.dp),
    content: @Composable BoxScope.() -> Unit
) {
    Box(
        modifier = modifier
            .glassMorphism(
                blur = blur,
                cornerRadius = cornerRadius,
                borderWidth = borderWidth,
                borderColor = borderColor,
                backgroundColor = backgroundColor
            )
            .padding(contentPadding),
        content = content
    )
}

/**
 * Premium Glass Card with gradient effects
 */
@Composable
fun PremiumGlassCard(
    modifier: Modifier = Modifier,
    accentType: GlassAccentType = GlassAccentType.Purple,
    blur: Dp = 12.dp,
    cornerRadius: Dp = 20.dp,
    borderWidth: Dp = 1.dp,
    contentPadding: PaddingValues = PaddingValues(16.dp),
    content: @Composable BoxScope.() -> Unit
) {
    val backgroundGradient = when (accentType) {
        GlassAccentType.Purple -> GlassMorphism.AccentGlassGradientPurple
        GlassAccentType.Pink -> GlassMorphism.AccentGlassGradientPink
        GlassAccentType.Cyan -> GlassMorphism.AccentGlassGradientCyan
        GlassAccentType.Neutral -> GlassMorphism.PremiumGlassGradient
    }
    
    val borderGradient = when (accentType) {
        GlassAccentType.Purple -> Brush.linearGradient(
            colors = listOf(
                Color(139, 92, 246, 76), // 30% purple
                Color(255, 255, 255, 25)  // 10% white
            )
        )
        GlassAccentType.Pink -> Brush.linearGradient(
            colors = listOf(
                Color(236, 72, 153, 76), // 30% pink
                Color(255, 255, 255, 25)  // 10% white
            )
        )
        GlassAccentType.Cyan -> Brush.linearGradient(
            colors = listOf(
                Color(6, 182, 212, 76), // 30% cyan
                Color(255, 255, 255, 25) // 10% white
            )
        )
        GlassAccentType.Neutral -> Brush.linearGradient(
            colors = listOf(
                GlassMorphism.GlassBorderLight,
                GlassMorphism.GlassBorderSubtle
            )
        )
    }
    
    Box(
        modifier = modifier
            .premiumGlassMorphism(
                blur = blur,
                cornerRadius = cornerRadius,
                borderWidth = borderWidth,
                borderGradient = borderGradient,
                backgroundGradient = backgroundGradient
            )
            .padding(contentPadding),
        content = content
    )
}

enum class GlassAccentType {
    Purple,
    Pink,
    Cyan,
    Neutral
}

/**
 * Glass Surface composable for sections and containers
 */
@Composable
fun GlassSurface(
    modifier: Modifier = Modifier,
    shape: RoundedCornerShape = RoundedCornerShape(16.dp),
    color: Color = GlassMorphism.GlassSurface,
    borderColor: Color = GlassMorphism.GlassBorder,
    borderWidth: Dp = 1.dp,
    content: @Composable () -> Unit
) {
    Surface(
        modifier = modifier,
        shape = shape,
        color = color,
        border = BorderStroke(borderWidth, borderColor),
        content = content
    )
}
