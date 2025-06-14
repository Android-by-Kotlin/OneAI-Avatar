package max.ohm.oneai.data.repository

import android.content.Context
import android.net.Uri
import com.google.android.gms.auth.api.signin.GoogleSignIn
import com.google.android.gms.auth.api.signin.GoogleSignInClient
import com.google.android.gms.auth.api.signin.GoogleSignInOptions
import com.google.firebase.Timestamp
import com.google.firebase.auth.AuthResult
import com.google.firebase.auth.FirebaseAuth
import com.google.firebase.auth.GoogleAuthProvider
import com.google.firebase.auth.UserProfileChangeRequest
import com.google.firebase.firestore.FirebaseFirestore
import com.google.firebase.storage.FirebaseStorage
import kotlinx.coroutines.tasks.await
import max.ohm.oneai.data.model.Chat
import max.ohm.oneai.data.model.Message
import max.ohm.oneai.data.model.User
import java.util.UUID

class FirebaseRepository {
    private val auth: FirebaseAuth = FirebaseAuth.getInstance()
    private val firestore: FirebaseFirestore = FirebaseFirestore.getInstance()
    private val storage: FirebaseStorage = FirebaseStorage.getInstance()

    // Authentication
    suspend fun signUpWithEmail(email: String, password: String, name: String): Result<AuthResult> {
        return try {
            val result = auth.createUserWithEmailAndPassword(email, password).await()
            
            // Update user profile with display name
            val profileUpdates = UserProfileChangeRequest.Builder()
                .setDisplayName(name)
                .build()
            
            auth.currentUser?.updateProfile(profileUpdates)?.await()
            
            // Create user document in Firestore
            val user = User(
                id = auth.currentUser?.uid ?: "",
                email = email,
                name = name
            )
            
            firestore.collection("users")
                .document(user.id)
                .set(user)
                .await()
                
            Result.success(result)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
    
    suspend fun signInWithEmail(email: String, password: String): Result<AuthResult> {
        return try {
            val result = auth.signInWithEmailAndPassword(email, password).await()
            Result.success(result)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
    
    fun getGoogleSignInClient(context: Context): GoogleSignInClient {
        val gso = GoogleSignInOptions.Builder(GoogleSignInOptions.DEFAULT_SIGN_IN)
            .requestIdToken("827202302425-gg2s8plq4p37oknuno1r6ch614grna5m.apps.googleusercontent.com")
            .requestEmail()
            .build()
        
        return GoogleSignIn.getClient(context, gso)
    }
    
    suspend fun signInWithGoogle(idToken: String): Result<AuthResult> {
        return try {
            val credential = GoogleAuthProvider.getCredential(idToken, null)
            val result = auth.signInWithCredential(credential).await()
            
            // Check if this is a new user
            val isNewUser = result.additionalUserInfo?.isNewUser ?: false
            
            if (isNewUser) {
                // Create user document in Firestore
                val user = User(
                    id = auth.currentUser?.uid ?: "",
                    email = auth.currentUser?.email ?: "",
                    name = auth.currentUser?.displayName ?: "",
                    profileImage = auth.currentUser?.photoUrl?.toString() ?: ""
                )
                
                firestore.collection("users")
                    .document(user.id)
                    .set(user)
                    .await()
            }
            
            Result.success(result)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
    
    fun signOut() {
        auth.signOut()
    }
    
    fun getCurrentUser(): User? {
        val firebaseUser = auth.currentUser ?: return null
        return User(
            id = firebaseUser.uid,
            email = firebaseUser.email ?: "",
            name = firebaseUser.displayName ?: "",
            profileImage = firebaseUser.photoUrl?.toString() ?: ""
        )
    }
    
    // Chat operations
    suspend fun createChat(title: String): Result<Chat> {
        return try {
            val userId = auth.currentUser?.uid ?: return Result.failure(Exception("User not authenticated"))
            val timestamp = Timestamp.now()
            
            val chat = Chat(
                title = title,
                createdAt = timestamp,
                updatedAt = timestamp
            )
            
            val chatRef = firestore.collection("users")
                .document(userId)
                .collection("chats")
                .document()
            
            val chatWithId = chat.copy(id = chatRef.id)
            chatRef.set(chatWithId).await()
            
            Result.success(chatWithId)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
    
    suspend fun getChats(): Result<List<Chat>> {
        return try {
            val userId = auth.currentUser?.uid ?: return Result.failure(Exception("User not authenticated"))
            
            val snapshot = firestore.collection("users")
                .document(userId)
                .collection("chats")
                .orderBy("updatedAt")
                .get()
                .await()
                
            val chats = snapshot.documents.mapNotNull { doc ->
                doc.toObject(Chat::class.java)
            }
            
            Result.success(chats)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
    
    suspend fun addMessage(chatId: String, text: String, role: String): Result<Message> {
        return try {
            val userId = auth.currentUser?.uid ?: return Result.failure(Exception("User not authenticated"))
            val timestamp = Timestamp.now()
            
            val message = Message(
                text = text,
                role = role,
                timestamp = timestamp
            )
            
            // Add message to the messages subcollection
            val messageRef = firestore.collection("users")
                .document(userId)
                .collection("chats")
                .document(chatId)
                .collection("messages")
                .document()
                
            val messageWithId = message.copy(id = messageRef.id)
            messageRef.set(messageWithId).await()
            
            // Update chat's updatedAt timestamp
            firestore.collection("users")
                .document(userId)
                .collection("chats")
                .document(chatId)
                .update("updatedAt", timestamp)
                .await()
                
            Result.success(messageWithId)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
    
    suspend fun getMessages(chatId: String): Result<List<Message>> {
        return try {
            val userId = auth.currentUser?.uid ?: return Result.failure(Exception("User not authenticated"))
            
            val snapshot = firestore.collection("users")
                .document(userId)
                .collection("chats")
                .document(chatId)
                .collection("messages")
                .orderBy("timestamp")
                .get()
                .await()
                
            val messages = snapshot.documents.mapNotNull { doc ->
                doc.toObject(Message::class.java)
            }
            
            Result.success(messages)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
    
    // Profile image upload
    suspend fun uploadProfileImage(imageUri: Uri): Result<String> {
        return try {
            val userId = auth.currentUser?.uid ?: return Result.failure(Exception("User not authenticated"))
            val filename = "profile_${UUID.randomUUID()}"
            val storageRef = storage.reference.child("profile_images/$userId/$filename")
            
            val uploadTask = storageRef.putFile(imageUri).await()
            val downloadUrl = storageRef.downloadUrl.await().toString()
            
            // Update user profile
            val profileUpdates = UserProfileChangeRequest.Builder()
                .setPhotoUri(Uri.parse(downloadUrl))
                .build()
                
            auth.currentUser?.updateProfile(profileUpdates)?.await()
            
            // Update user document
            firestore.collection("users")
                .document(userId)
                .update("profileImage", downloadUrl)
                .await()
                
            Result.success(downloadUrl)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
} 