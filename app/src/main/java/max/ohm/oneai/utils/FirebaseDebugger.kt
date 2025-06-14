package max.ohm.oneai.utils

import android.content.Context
import android.util.Log
import android.widget.Toast
import com.google.firebase.FirebaseApp
import com.google.firebase.FirebaseOptions
import com.google.firebase.auth.FirebaseAuth
import com.google.firebase.firestore.FirebaseFirestore
import com.google.firebase.storage.FirebaseStorage
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import java.io.File
import java.io.FileInputStream

/**
 * Utility class to help debug Firebase issues
 */
object FirebaseDebugger {
    private const val TAG = "FirebaseDebugger"
    
    /**
     * Checks if google-services.json exists in the correct location
     */
    fun checkGoogleServicesJson(context: Context): Boolean {
        val correctPath = File(context.applicationInfo.dataDir, "../google-services.json")
        val incorrectPath = File(context.applicationInfo.dataDir, "../src/main/java/max/ohm/oneai/google-services.json")
        
        val correctExists = correctPath.exists()
        val incorrectExists = incorrectPath.exists()
        
        Log.d(TAG, "google-services.json in correct location: $correctExists")
        Log.d(TAG, "google-services.json in incorrect location: $incorrectExists")
        
        if (incorrectExists && !correctExists) {
            Log.w(TAG, "google-services.json found in incorrect location")
            Toast.makeText(
                context,
                "google-services.json is in the wrong location. Please move it to the app/ directory.",
                Toast.LENGTH_LONG
            ).show()
        }
        
        return correctExists
    }
    
    /**
     * Attempts to manually initialize Firebase with the google-services.json file
     */
    fun attemptManualFirebaseInitialization(context: Context): Boolean {
        try {
            val googleServicesFile = File(context.filesDir, "google-services.json")
            if (!googleServicesFile.exists()) {
                Log.e(TAG, "google-services.json not found in files directory")
                return false
            }
            
            val inputStream = FileInputStream(googleServicesFile)
            val options = FirebaseOptions.fromResource(context)
            
            if (options != null) {
                try {
                    FirebaseApp.initializeApp(context, options)
                    Log.d(TAG, "Manual Firebase initialization successful")
                    return true
                } catch (e: Exception) {
                    Log.e(TAG, "Error during manual Firebase initialization", e)
                }
            } else {
                Log.e(TAG, "Failed to create FirebaseOptions from resource")
            }
        } catch (e: Exception) {
            Log.e(TAG, "Error reading google-services.json", e)
        }
        
        return false
    }
    
    /**
     * Run a comprehensive Firebase diagnostics check
     */
    suspend fun runDiagnostics(context: Context): String = withContext(Dispatchers.IO) {
        val report = StringBuilder()
        
        try {
            // Check if Firebase is initialized
            report.append("Firebase initialized: ${isFirebaseInitialized()}\n")
            
            // Check google-services.json
            val correctPath = File(context.applicationInfo.dataDir, "../google-services.json")
            val incorrectPath = File(context.applicationInfo.dataDir, "../src/main/java/max/ohm/oneai/google-services.json")
            report.append("google-services.json in app/: ${correctPath.exists()}\n")
            report.append("google-services.json in wrong location: ${incorrectPath.exists()}\n")
            
            // Check Firebase components
            try {
                val app = FirebaseApp.getInstance()
                report.append("Firebase App Name: ${app.name}\n")
                report.append("Firebase Options Project ID: ${app.options.projectId}\n")
            } catch (e: Exception) {
                report.append("Error getting Firebase app: ${e.message}\n")
            }
            
            // Check Auth
            try {
                val auth = FirebaseAuth.getInstance()
                report.append("Auth initialized: ${auth != null}\n")
                report.append("Current user: ${auth.currentUser?.uid ?: "Not logged in"}\n")
            } catch (e: Exception) {
                report.append("Error with Firebase Auth: ${e.message}\n")
            }
            
            // Check Firestore
            try {
                val firestore = FirebaseFirestore.getInstance()
                report.append("Firestore initialized: ${firestore != null}\n")
                
                // Try a simple Firestore operation
                try {
                    val docRef = firestore.collection("test").document("test")
                    val snapshot = docRef.get().await()
                    report.append("Firestore read test: ${if (snapshot != null) "Success" else "Failed"}\n")
                } catch (e: Exception) {
                    report.append("Firestore read test failed: ${e.message}\n")
                }
            } catch (e: Exception) {
                report.append("Error with Firestore: ${e.message}\n")
            }
            
            // Check Storage
            try {
                val storage = FirebaseStorage.getInstance()
                report.append("Storage initialized: ${storage != null}\n")
            } catch (e: Exception) {
                report.append("Error with Firebase Storage: ${e.message}\n")
            }
        } catch (e: Exception) {
            report.append("Diagnostics error: ${e.message}\n")
        }
        
        report.toString()
    }
    
    /**
     * Check if Firebase is properly initialized
     */
    private fun isFirebaseInitialized(): Boolean {
        return try {
            FirebaseApp.getInstance() != null
        } catch (e: Exception) {
            false
        }
    }
    
    /**
     * Extension function to make Tasks awaitable in coroutines
     */
    private suspend fun <T> com.google.android.gms.tasks.Task<T>.await(): T = withContext(Dispatchers.IO) {
        val task = this@await
        return@withContext kotlin.coroutines.suspendCoroutine { continuation ->
            task.addOnCompleteListener { task ->
                if (task.isSuccessful) {
                    continuation.resumeWith(Result.success(task.result))
                } else {
                    continuation.resumeWith(Result.failure(task.exception ?: Exception("Unknown error")))
                }
            }
        }
    }
} 