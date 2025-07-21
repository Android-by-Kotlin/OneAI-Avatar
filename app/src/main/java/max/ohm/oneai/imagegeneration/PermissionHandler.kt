package max.ohm.oneai.imagegeneration

import android.Manifest
import android.content.pm.PackageManager
import android.os.Build
import androidx.activity.compose.rememberLauncherForActivityResult
import androidx.activity.result.contract.ActivityResultContracts
import androidx.compose.runtime.*
import androidx.compose.ui.platform.LocalContext
import androidx.core.content.ContextCompat

@Composable
fun rememberStoragePermissionState(): StoragePermissionState {
    val context = LocalContext.current
    var hasPermission by remember {
        mutableStateOf(
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                // Android 10+ doesn't need WRITE_EXTERNAL_STORAGE for MediaStore
                true
            } else {
                ContextCompat.checkSelfPermission(
                    context,
                    Manifest.permission.WRITE_EXTERNAL_STORAGE
                ) == PackageManager.PERMISSION_GRANTED
            }
        )
    }
    
    val launcher = rememberLauncherForActivityResult(
        ActivityResultContracts.RequestPermission()
    ) { isGranted ->
        hasPermission = isGranted
    }
    
    return remember {
        StoragePermissionState(
            hasPermission = hasPermission,
            shouldShowRationale = false, // You can implement rationale logic if needed
            requestPermission = {
                if (Build.VERSION.SDK_INT < Build.VERSION_CODES.Q) {
                    launcher.launch(Manifest.permission.WRITE_EXTERNAL_STORAGE)
                }
            }
        )
    }
}

data class StoragePermissionState(
    val hasPermission: Boolean,
    val shouldShowRationale: Boolean,
    val requestPermission: () -> Unit
)
