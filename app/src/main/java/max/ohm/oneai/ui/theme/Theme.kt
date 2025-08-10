package max.ohm.oneai.ui.theme

import android.app.Activity
import android.os.Build
import androidx.compose.foundation.isSystemInDarkTheme
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.darkColorScheme
import androidx.compose.material3.dynamicDarkColorScheme
import androidx.compose.material3.dynamicLightColorScheme
import androidx.compose.material3.lightColorScheme
import androidx.compose.runtime.Composable
import androidx.compose.runtime.SideEffect
import androidx.compose.ui.graphics.toArgb
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.platform.LocalView
import androidx.core.view.WindowCompat

// Modern Dark Color Scheme with Glassmorphism Support
private val ModernDarkColorScheme = darkColorScheme(
    primary = AccentPurple,
    secondary = AccentPink,
    tertiary = AccentCyan,
    background = DarkBackground,
    surface = SurfaceColor,
    onPrimary = TextPrimary,
    onSecondary = TextPrimary,
    onTertiary = TextPrimary,
    onBackground = TextPrimary,
    onSurface = TextPrimary,
    primaryContainer = CardBackground,
    secondaryContainer = SurfaceColorLight,
    onPrimaryContainer = TextPrimary,
    onSecondaryContainer = TextSecondary,
    outline = CardBorder,
    outlineVariant = GlassBorder
)

// Enhanced Light Color Scheme (for future light mode support)
private val ModernLightColorScheme = lightColorScheme(
    primary = AccentPurple,
    secondary = AccentPink,
    tertiary = AccentCyan,
    background = TextPrimary,
    surface = TextPrimary,
    onPrimary = TextPrimary,
    onSecondary = TextPrimary,
    onTertiary = DarkBackground,
    onBackground = DarkBackground,
    onSurface = DarkBackground,
    primaryContainer = AccentPurple.copy(alpha = 0.1f),
    secondaryContainer = AccentPink.copy(alpha = 0.1f),
    onPrimaryContainer = DarkBackground,
    onSecondaryContainer = DarkBackground
)

// Legacy color schemes for compatibility
private val DarkColorScheme = darkColorScheme(
    primary = Purple80,
    secondary = PurpleGrey80,
    tertiary = Pink80
)

private val LightColorScheme = lightColorScheme(
    primary = Purple40,
    secondary = PurpleGrey40,
    tertiary = Pink40
)

@Composable
fun OneAITheme(
    darkTheme: Boolean = true, // Force dark theme for modern glass design
    // Dynamic color disabled for consistent glassmorphism experience
    dynamicColor: Boolean = false,
    modernDesign: Boolean = true, // Use modern glassmorphism design by default
    content: @Composable () -> Unit
) {
    val colorScheme = when {
        modernDesign -> {
            // Always use our custom modern color scheme for glassmorphism
            if (darkTheme) ModernDarkColorScheme else ModernLightColorScheme
        }
        dynamicColor && Build.VERSION.SDK_INT >= Build.VERSION_CODES.S -> {
            val context = LocalContext.current
            if (darkTheme) dynamicDarkColorScheme(context) else dynamicLightColorScheme(context)
        }
        darkTheme -> DarkColorScheme
        else -> LightColorScheme
    }
    
    val view = LocalView.current
    if (!view.isInEditMode) {
        SideEffect {
            val window = (view.context as Activity).window
            // Set status bar to transparent for glassmorphism effect
            window.statusBarColor = android.graphics.Color.TRANSPARENT
            
            // Configure status bar content color (white icons for dark backgrounds)
            WindowCompat.getInsetsController(window, view).isAppearanceLightStatusBars = false
        }
    }

    MaterialTheme(
        colorScheme = colorScheme,
        typography = Typography,
        content = content
    )
}
