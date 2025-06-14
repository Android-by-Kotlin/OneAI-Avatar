package max.ohm.oneai.utils

import android.util.Log
import com.google.firebase.auth.FirebaseAuth
import com.google.firebase.firestore.FirebaseFirestore
import kotlinx.coroutines.tasks.await

/**
 * Utility class to check and validate database permissions
 */
object DatabasePermissionChecker {
    private const val TAG = "DatabasePermissionChecker"
    
    /**
     * Check if the current user has permission to access the database
     * This performs an actual write operation to verify permissions
     * 
     * @return true if the user has permission, false otherwise
     */
    suspend fun checkDatabasePermissions(): Boolean {
        val auth = FirebaseAuth.getInstance()
        val firestore = FirebaseFirestore.getInstance()
        
        val currentUser = auth.currentUser ?: return false
        
        return try {
            // Try to write to a test document
            val testDocRef = firestore.collection("users")
                .document(currentUser.uid)
                .collection("permission_test")
                .document("test")
                
            // Write a test value
            val testData = hashMapOf(
                "timestamp" to com.google.firebase.Timestamp.now(),
                "test" to true
            )
            
            testDocRef.set(testData).await()
            
            // If we get here, the write was successful
            Log.d(TAG, "Database permission check passed")
            
            // Clean up the test document
            testDocRef.delete().await()
            
            true
        } catch (e: Exception) {
            Log.e(TAG, "Database permission check failed", e)
            false
        }
    }
    
    /**
     * Diagnose database permission issues and return a helpful message
     */
    suspend fun diagnoseDatabaseIssues(): String {
        val auth = FirebaseAuth.getInstance()
        
        if (auth.currentUser == null) {
            return "Not authenticated. Please sign in before using the chat."
        }
        
        val permissionResult = checkDatabasePermissions()
        
        return if (permissionResult) {
            "Database permissions are correctly configured."
        } else {
            """
            Permission denied. This could be due to:
            1. Firestore security rules not allowing access
            2. The database not being properly initialized
            3. Network connectivity issues
            
            Please check the Firebase console and ensure security rules are properly configured.
            """.trimIndent()
        }
    }
} 