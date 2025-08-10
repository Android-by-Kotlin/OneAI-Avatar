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
    
    // Define transparent status bar colors for all screens to show glassmorphism background
    val ChatBotStatusBarColor = Color.Transparent // Transparent for glassmorphism
    val ImageGenerationStatusBarColor = Color.Transparent // Transparent for glassmorphism
    val VideoGenerationStatusBarColor = Color.Transparent // Transparent for glassmorphism
    val ImageToImageStatusBarColor = Color.Transparent // Transparent for glassmorphism
    val ProfileStatusBarColor = Color.Transparent // Transparent for glassmorphism
    val DefaultStatusBarColor = Color.Transparent // Transparent for glassmorphism
    
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
