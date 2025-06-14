package max.ohm.oneai.utils

import android.util.Log
import com.google.firebase.FirebaseApp
import com.google.firebase.auth.FirebaseAuth
import com.google.firebase.firestore.FirebaseFirestore
import kotlinx.coroutines.tasks.await

/**
 * Firebase Utilities
 * 
 * To deploy the Firestore security rules:
 * 
 * 1. Install Firebase CLI if not already installed:
 *    npm install -g firebase-tools
 * 
 * 2. Login to Firebase:
 *    firebase login
 * 
 * 3. Initialize Firebase in your project (if not already done):
 *    firebase init
 *    - Select Firestore
 *    - Choose your project
 * 
 * 4. Copy the rules from assets/firestore.rules to the firestore.rules file in your project root
 * 
 * 5. Deploy the rules:
 *    firebase deploy --only firestore:rules
 * 
 * Note: You need to have proper permissions in the Firebase project to deploy rules.
 */
object FirebaseUtils {
    private const val TAG = "FirebaseUtils"
    
    /**
     * Checks if the current user has the necessary permissions for chat operations
     * 
     * @return true if the user is authenticated and has proper permissions
     */
    fun checkChatPermissions(): Boolean {
        // This is a client-side check only
        // The actual permission enforcement happens on the server via security rules
        val auth = FirebaseAuth.getInstance()
        return auth.currentUser != null
    }
    
    /**
     * Check if Firebase is properly initialized
     * 
     * @return true if Firebase is properly initialized
     */
    fun isFirebaseInitialized(): Boolean {
        return try {
            FirebaseApp.getInstance() != null && 
            FirebaseAuth.getInstance() != null &&
            FirebaseFirestore.getInstance() != null
        } catch (e: Exception) {
            Log.e(TAG, "Firebase not properly initialized", e)
            false
        }
    }
    
    /**
     * Test Firebase connection by performing a simple read operation
     * 
     * @return true if the connection is successful
     */
    suspend fun testFirebaseConnection(): Boolean {
        return try {
            val auth = FirebaseAuth.getInstance()
            if (auth.currentUser == null) {
                Log.d(TAG, "User not authenticated, can't test Firestore connection")
                return false
            }
            
            val firestore = FirebaseFirestore.getInstance()
            val testDoc = firestore.collection("connection_test").document("test")
            testDoc.get().await() // Just try to read a document to test connection
            
            Log.d(TAG, "Firebase connection test successful")
            true
        } catch (e: Exception) {
            Log.e(TAG, "Firebase connection test failed", e)
            false
        }
    }
    
    /**
     * Log Firebase configuration information for debugging
     */
    fun logFirebaseConfig() {
        try {
            val app = FirebaseApp.getInstance()
            Log.d(TAG, "Firebase App Name: ${app.name}")
            Log.d(TAG, "Firebase Options: ${app.options}")
            
            val auth = FirebaseAuth.getInstance()
            Log.d(TAG, "Firebase Auth initialized: ${auth != null}")
            Log.d(TAG, "Current user: ${auth.currentUser?.uid ?: "Not logged in"}")
            
            Log.d(TAG, "Firebase Firestore initialized: ${FirebaseFirestore.getInstance() != null}")
        } catch (e: Exception) {
            Log.e(TAG, "Error logging Firebase config", e)
        }
    }
} 