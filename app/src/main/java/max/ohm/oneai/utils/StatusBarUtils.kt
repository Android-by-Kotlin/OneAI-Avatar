package max.ohm.oneai.utils

import android.app.Activity
import android.os.Build
import androidx.compose.runtime.Composable
import androidx.compose.runtime.DisposableEffect
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.toArgb
import androidx.compose.ui.platform.LocalContext
import androidx.core.view.WindowCompat

object StatusBarUtils {
    
    // Define status bar colors for different screens
    val ChatBotStatusBarColor = Color(0xFF10231c) // Dark green for chatbot
    val ImageGenerationStatusBarColor = Color(0xFF0A0E27) // Dark blue for image generation
    val VideoGenerationStatusBarColor = Color(0xFF0A0E27) // Dark blue for video generation
    val ImageToImageStatusBarColor = Color(0xFF0A0E27) // Dark blue for image to image
    val ProfileStatusBarColor = Color(0xFF0A0E27) // Dark blue for profile screen
    val DefaultStatusBarColor = Color(0xFF1A1F3A) // Default dark blue
    
    fun setStatusBarColor(activity: Activity, color: Color) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            activity.window.statusBarColor = color.toArgb()
            
            // Configure window controller for status bar content
            val windowInsetsController = WindowCompat.getInsetsController(activity.window, activity.window.decorView)
            windowInsetsController?.let { controller ->
                // Set status bar content to light (white icons/text) since we're using dark backgrounds
                controller.isAppearanceLightStatusBars = false
            }
        }
    }
}

@Composable
fun SetStatusBarColor(color: Color) {
    val context = LocalContext.current
    
    DisposableEffect(color) {
        val activity = context as? Activity
        activity?.let {
            StatusBarUtils.setStatusBarColor(it, color)
        }
        
        onDispose {
            // Reset to default color when leaving the screen
            activity?.let {
                StatusBarUtils.setStatusBarColor(it, StatusBarUtils.DefaultStatusBarColor)
            }
        }
    }
}
