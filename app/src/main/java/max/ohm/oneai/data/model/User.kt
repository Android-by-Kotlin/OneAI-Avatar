package max.ohm.oneai.data.model

import com.google.firebase.Timestamp
import com.google.firebase.firestore.DocumentId

data class User(
    @DocumentId val id: String = "",
    val email: String = "",
    val name: String = "",
    val profileImage: String = ""
)

data class Chat(
    @DocumentId val id: String = "",
    val title: String = "",
    val createdAt: Timestamp = Timestamp.now(),
    val updatedAt: Timestamp = Timestamp.now()
)

data class Message(
    @DocumentId val id: String = "",
    val text: String = "",
    val role: String = "",
    val timestamp: Timestamp = Timestamp.now()
) 