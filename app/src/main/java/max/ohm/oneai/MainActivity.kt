package max.ohm.oneai

import android.Manifest
import android.content.pm.PackageManager
import android.os.Build
import android.os.Bundle
import android.util.Log
import android.widget.Toast
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.result.contract.ActivityResultContracts
import androidx.core.content.ContextCompat
import androidx.core.view.WindowCompat
import androidx.core.view.WindowInsetsControllerCompat
import androidx.compose.ui.graphics.toArgb
import androidx.lifecycle.lifecycleScope
import android.view.View
import android.view.WindowManager
import com.google.firebase.FirebaseApp
import kotlinx.coroutines.launch
import max.ohm.oneai.navigationsystem.AppNavigation
import max.ohm.oneai.ui.theme.OneAITheme
import max.ohm.oneai.utils.FirebaseDebugger
import max.ohm.oneai.utils.FirebaseUtils
import max.ohm.oneai.utils.GeminiUtils
import max.ohm.oneai.utils.StatusBarUtils


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
        
        // Configure full-screen immersive UI
        configureSystemUI()
        
        // Set content immediately to show splash screen
        try {
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
        
        // Initialize other components in background after UI is shown
        lifecycleScope.launch {
            // Request required permissions
            requestPermissions()
            
            // Initialize and check Firebase
            initializeFirebase()
            
            // Test Gemini API key
            testGeminiApiKey()
        }
    }
    
    private fun configureSystemUI() {
        // Make the app draw edge-to-edge
        WindowCompat.setDecorFitsSystemWindows(window, false)
        
        // Set status bar and navigation bar colors to match app theme
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            window.statusBarColor = StatusBarUtils.DefaultStatusBarColor.toArgb()
            window.navigationBarColor = StatusBarUtils.DefaultStatusBarColor.toArgb()
        }
        
        // Configure window controller for immersive experience
        val windowInsetsController = WindowCompat.getInsetsController(window, window.decorView)
        windowInsetsController?.let { controller ->
            // Set status bar content to light (white icons/text) since we're using dark background
            controller.isAppearanceLightStatusBars = false
            controller.isAppearanceLightNavigationBars = false
            
            // Enable immersive mode with sticky system bars
            controller.systemBarsBehavior = WindowInsetsControllerCompat.BEHAVIOR_SHOW_TRANSIENT_BARS_BY_SWIPE
        }
        
        // Additional flags for full immersive experience
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
            window.attributes.layoutInDisplayCutoutMode = WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_SHORT_EDGES
        }
        
        // Keep screen on while app is active (optional - remove if not needed)
        window.addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON)
    }
    
    private fun initializeFirebase() {
        try {
            // Check if google-services.json is in the correct location
            FirebaseDebugger.checkGoogleServicesJson(this)
            
            // Ensure Firebase is initialized
            FirebaseApp.initializeApp(this)
            
            // Log Firebase configuration
            FirebaseUtils.logFirebaseConfig()
            
            // Run Firebase diagnostics
            lifecycleScope.launch {
                try {
                    val diagnostics = FirebaseDebugger.runDiagnostics(this@MainActivity)
                    Log.d(TAG, "Firebase Diagnostics:\n$diagnostics")
                    
                    // Test Firebase connection
                    val isConnected = FirebaseUtils.testFirebaseConnection()
                    if (!isConnected) {
                        Log.w(TAG, "Firebase connection test failed")
                    }
                } catch (e: Exception) {
                    Log.e(TAG, "Error testing Firebase connection", e)
                }
            }
        } catch (e: Exception) {
            Log.e(TAG, "Error initializing Firebase", e)
            
            // Attempt manual initialization
            lifecycleScope.launch {
                FirebaseDebugger.attemptManualFirebaseInitialization(this@MainActivity)
            }
        }
    }
    
    private fun testGeminiApiKey() {
        lifecycleScope.launch {
            try {
                val diagnostics = GeminiUtils.getGeminiApiKeyDiagnostics()
                Log.d(TAG, "Gemini API Key Diagnostics:\n$diagnostics")
                
                val result = GeminiUtils.testGeminiApiKey()
                result.fold(
                    onSuccess = {
                        Log.d(TAG, "Gemini API key is valid and working")
                    },
                    onFailure = { error ->
                        Log.e(TAG, "Gemini API key test failed", error)
                    }
                )
            } catch (e: Exception) {
                Log.e(TAG, "Error testing Gemini API key", e)
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










