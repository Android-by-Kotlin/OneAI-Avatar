package max.ohm.oneai

import android.Manifest
import android.content.pm.PackageManager
import android.os.Build
import android.os.Bundle
import android.util.Log
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.result.contract.ActivityResultContracts
import androidx.core.content.ContextCompat
import androidx.core.view.WindowCompat
import max.ohm.oneai.navigationsystem.AppNavigation
import max.ohm.oneai.ui.theme.OneAITheme


class MainActivity : ComponentActivity() {
    private val TAG = "MainActivity"
    
    // Permission launcher for audio permissions
    private val requestPermissionLauncher = registerForActivityResult(
        ActivityResultContracts.RequestMultiplePermissions()
    ) { permissions ->
        permissions.entries.forEach { entry ->
            Log.d(TAG, "Permission ${entry.key} = ${entry.value}")
        }
    }
    
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        
        // Make the app draw edge-to-edge
        WindowCompat.setDecorFitsSystemWindows(window, false)
        
        // Request required permissions
        requestPermissions()
        
        try {
            // Set content with error handling
            setContent {
                OneAITheme {
                    AppNavigation()
                }
            }
        } catch (e: Exception) {
            // Log any exceptions during content setting
            Log.e(TAG, "Error setting content: ${e.message}", e)
            
            // Try a simplified approach if the first attempt fails
            try {
                setContent {
                    AppNavigation()
                }
            } catch (e2: Exception) {
                Log.e(TAG, "Second attempt to set content failed: ${e2.message}", e2)
            }
        }
    }
    
    private fun requestPermissions() {
        val permissions = mutableListOf(
            Manifest.permission.INTERNET,
            Manifest.permission.MODIFY_AUDIO_SETTINGS,
            Manifest.permission.RECORD_AUDIO
        )
        
        // Add storage permissions based on Android version
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            permissions.add(Manifest.permission.READ_MEDIA_AUDIO)
        } else {
            permissions.add(Manifest.permission.WRITE_EXTERNAL_STORAGE)
        }
        
        // Check which permissions are not granted yet
        val permissionsToRequest = permissions.filter {
            ContextCompat.checkSelfPermission(this, it) != PackageManager.PERMISSION_GRANTED
        }.toTypedArray()
        
        // Request permissions if needed
        if (permissionsToRequest.isNotEmpty()) {
            Log.d(TAG, "Requesting permissions: ${permissionsToRequest.joinToString()}")
            requestPermissionLauncher.launch(permissionsToRequest)
        }
    }
}










