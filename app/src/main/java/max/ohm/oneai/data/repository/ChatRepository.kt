package max.ohm.oneai.data.repository

import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.net.Uri
import android.util.Log
import com.google.firebase.Timestamp
import com.google.firebase.auth.FirebaseAuth
import com.google.firebase.firestore.FirebaseFirestore
import com.google.firebase.firestore.Query
import com.google.firebase.storage.FirebaseStorage
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.flow
import kotlinx.coroutines.tasks.await
import kotlinx.coroutines.withContext
import max.ohm.oneai.chatbot.Message
import max.ohm.oneai.data.model.Chat
import max.ohm.oneai.data.model.User
import java.io.ByteArrayOutputStream
import java.util.UUID

class ChatRepository {
    private val auth: FirebaseAuth = FirebaseAuth.getInstance()
    private val firestore: FirebaseFirestore = FirebaseFirestore.getInstance()
    private val storage: FirebaseStorage = FirebaseStorage.getInstance()
    private val TAG = "ChatRepository"
    
    // Ensure user document exists before any operation
    private suspend fun ensureUserDocumentExists(): Result<String> {
        return try {
            val currentUser = auth.currentUser ?: return Result.failure(Exception("User not authenticated"))
            val userId = currentUser.uid
            
            // Check if user document exists
            val userDocRef = firestore.collection("users").document(userId)
            val userDoc = userDocRef.get().await()
            
            if (!userDoc.exists()) {
                // Create user document if it doesn't exist
                val user = User(
                    id = userId,
                    email = currentUser.email ?: "",
                    name = currentUser.displayName ?: "User",
                    profileImage = currentUser.photoUrl?.toString() ?: ""
                )
                
                userDocRef.set(user).await()
                Log.d(TAG, "Created new user document for user: $userId")
            }
            
            Result.success(userId)
        } catch (e: Exception) {
            Log.e(TAG, "Error ensuring user document exists", e)
            Result.failure(e)
        }
    }
    
    suspend fun createChat(title: String): Result<String> {
        return withContext(Dispatchers.IO) {
            try {
                // First ensure the user document exists
                val userResult = ensureUserDocumentExists()
                if (userResult.isFailure) {
                    return@withContext Result.failure(userResult.exceptionOrNull() ?: Exception("Failed to ensure user document exists"))
                }
                
                val userId = userResult.getOrThrow()
                val timestamp = Timestamp.now()
                
                val chat = Chat(
                    title = title,
                    createdAt = timestamp,
                    updatedAt = timestamp
                )
                
                // Create chats collection if it doesn't exist
                val chatRef = firestore.collection("users")
                    .document(userId)
                    .collection("chats")
                    .document()
                
                chatRef.set(chat).await()
                Log.d(TAG, "Created new chat with ID: ${chatRef.id}")
                
                // Create an initial empty messages collection to ensure it exists
                val initialMessageRef = chatRef.collection("messages").document()
                initialMessageRef.set(mapOf(
                    "text" to "Chat started",
                    "role" to "system",
                    "timestamp" to timestamp
                )).await()
                
                Result.success(chatRef.id)
            } catch (e: Exception) {
                Log.e(TAG, "Error creating chat", e)
                Result.failure(e)
            }
        }
    }
    
    suspend fun getAllChats(): Result<List<Chat>> {
        return withContext(Dispatchers.IO) {
            try {
                // First ensure the user document exists
                val userResult = ensureUserDocumentExists()
                if (userResult.isFailure) {
                    return@withContext Result.failure(userResult.exceptionOrNull() ?: Exception("Failed to ensure user document exists"))
                }
                
                val userId = userResult.getOrThrow()
                
                val snapshot = firestore.collection("users")
                    .document(userId)
                    .collection("chats")
                    .orderBy("updatedAt", Query.Direction.DESCENDING)
                    .get()
                    .await()
                    
                val chats = snapshot.documents.mapNotNull { doc ->
                    val chat = doc.toObject(Chat::class.java)
                    chat?.copy(id = doc.id)
                }
                
                Result.success(chats)
            } catch (e: Exception) {
                Log.e(TAG, "Error getting all chats", e)
                Result.failure(e)
            }
        }
    }
    
    suspend fun saveMessage(chatId: String, message: Message): Result<Unit> {
        return withContext(Dispatchers.IO) {
            try {
                // First ensure the user document exists
                val userResult = ensureUserDocumentExists()
                if (userResult.isFailure) {
                    return@withContext Result.failure(userResult.exceptionOrNull() ?: Exception("Failed to ensure user document exists"))
                }
                
                val userId = userResult.getOrThrow()
                val timestamp = Timestamp.now()
                
                // If there's an image, upload it first
                var imageUrl: String? = null
                if (message.image != null) {
                    try {
                        imageUrl = uploadImage(message.image)
                    } catch (e: Exception) {
                        Log.e(TAG, "Failed to upload image, continuing without image", e)
                        // Continue without the image if upload fails
                    }
                }
                
                // Create message document
                val messageData = hashMapOf(
                    "text" to message.text,
                    "role" to if (message.isUser) "user" else "assistant",
                    "timestamp" to timestamp,
                    "imageUrl" to imageUrl
                )
                
                // Add message to the messages subcollection
                val messageRef = firestore.collection("users")
                    .document(userId)
                    .collection("chats")
                    .document(chatId)
                    .collection("messages")
                    .document()
                
                messageRef.set(messageData).await()
                
                // Update chat's updatedAt timestamp
                firestore.collection("users")
                    .document(userId)
                    .collection("chats")
                    .document(chatId)
                    .update("updatedAt", timestamp)
                    .await()
                    
                Result.success(Unit)
            } catch (e: Exception) {
                Log.e(TAG, "Error saving message", e)
                Result.failure(e)
            }
        }
    }
    
    suspend fun getMessages(chatId: String): Result<List<Message>> {
        return withContext(Dispatchers.IO) {
            try {
                // First ensure the user document exists
                val userResult = ensureUserDocumentExists()
                if (userResult.isFailure) {
                    return@withContext Result.failure(userResult.exceptionOrNull() ?: Exception("Failed to ensure user document exists"))
                }
                
                val userId = userResult.getOrThrow()
                
                val snapshot = firestore.collection("users")
                    .document(userId)
                    .collection("chats")
                    .document(chatId)
                    .collection("messages")
                    .orderBy("timestamp", Query.Direction.ASCENDING)
                    .get()
                    .await()
                    
                val messages = snapshot.documents.mapNotNull { doc ->
                    val text = doc.getString("text") ?: ""
                    val role = doc.getString("role") ?: "user"
                    
                    // Skip system messages
                    if (role == "system") {
                        return@mapNotNull null
                    }
                    
                    val imageUrl = doc.getString("imageUrl")
                    
                    // Convert imageUrl to Bitmap if it exists
                    var bitmap: Bitmap? = null
                    if (imageUrl != null) {
                        try {
                            bitmap = downloadImage(imageUrl)
                        } catch (e: Exception) {
                            // Handle image download failure
                            Log.e(TAG, "Failed to download image", e)
                        }
                    }
                    
                    Message(
                        text = text,
                        isUser = role == "user",
                        image = bitmap,
                        id = doc.id.hashCode().toLong()
                    )
                }
                
                Result.success(messages)
            } catch (e: Exception) {
                Log.e(TAG, "Error getting messages", e)
                Result.failure(e)
            }
        }
    }
    
    fun getMessagesFlow(chatId: String): Flow<Result<List<Message>>> = flow {
        val userResult = ensureUserDocumentExists()
        if (userResult.isFailure) {
            emit(Result.failure(userResult.exceptionOrNull() ?: Exception("Failed to ensure user document exists")))
            return@flow
        }
        
        val userId = userResult.getOrThrow()
        
        try {
            // Listen for real-time updates
            firestore.collection("users")
                .document(userId)
                .collection("chats")
                .document(chatId)
                .collection("messages")
                .orderBy("timestamp", Query.Direction.ASCENDING)
                .addSnapshotListener { snapshot, error ->
                    if (error != null) {
                        return@addSnapshotListener
                    }
                    
                    if (snapshot != null) {
                        val messages = snapshot.documents.mapNotNull { doc ->
                            val text = doc.getString("text") ?: ""
                            val role = doc.getString("role") ?: "user"
                            
                            Message(
                                text = text,
                                isUser = role == "user",
                                id = doc.id.hashCode().toLong()
                            )
                        }
                        
                        // Emit the result
                    }
                }
        } catch (e: Exception) {
            Log.e(TAG, "Error in messages flow", e)
            emit(Result.failure(e))
        }
    }
    
    private suspend fun uploadImage(bitmap: Bitmap): String {
        return withContext(Dispatchers.IO) {
            val userId = auth.currentUser?.uid ?: throw Exception("User not authenticated")
            val filename = "chat_image_${UUID.randomUUID()}.jpg"
            val storageRef = storage.reference.child("chat_images/$userId/$filename")
            
            // Convert bitmap to bytes
            val baos = ByteArrayOutputStream()
            bitmap.compress(Bitmap.CompressFormat.JPEG, 80, baos) // Reduced quality for better performance
            val data = baos.toByteArray()
            
            // Upload to Firebase Storage
            storageRef.putBytes(data).await()
            
            // Get the download URL
            storageRef.downloadUrl.await().toString()
        }
    }
    
    private suspend fun downloadImage(imageUrl: String): Bitmap? {
        return withContext(Dispatchers.IO) {
            try {
                val storageRef = storage.getReferenceFromUrl(imageUrl)
                val maxDownloadSize = 5L * 1024 * 1024 // 5MB
                val bytes = storageRef.getBytes(maxDownloadSize).await()
                BitmapFactory.decodeByteArray(bytes, 0, bytes.size)
            } catch (e: Exception) {
                Log.e(TAG, "Error downloading image", e)
                null
            }
        }
    }
} 