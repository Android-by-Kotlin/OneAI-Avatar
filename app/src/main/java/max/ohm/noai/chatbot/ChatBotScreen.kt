package max.ohm.noai.chatbot

import android.R.attr.content
import android.R.id.content
import android.graphics.Bitmap
import android.net.Uri
import androidx.activity.compose.rememberLauncherForActivityResult
import androidx.activity.result.contract.ActivityResultContracts
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Send
import androidx.compose.material.icons.filled.Settings
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.input.TextFieldValue
import androidx.compose.ui.unit.dp
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import androidx.lifecycle.viewmodel.compose.viewModel
import coil.compose.AsyncImage
import coil.request.ImageRequest
import com.google.ai.client.generativeai.GenerativeModel
import com.google.ai.client.generativeai.type.content
import kotlinx.coroutines.launch
import max.ohm.noai.NEBIUS_API_KEY // Assuming you'll use this for Gemini as well, or replace with Gemini key
import android.provider.MediaStore
import android.widget.Toast
import androidx.compose.material.icons.filled.Image
//import androidx.compose.ui.graphics.asImageBitmap
//import com.google.ai.client.generativeai.type.image
//import com.google.ai.client.generativeai.type.text


data class Message(val text: String, val isUser: Boolean, val image: Bitmap? = null)

class ChatBotViewModel : ViewModel() {
    private val API_KEY = "AIzaSyBllTUQBqy8vNW_XztRKncxlv9QoAbjoi8" // Replace with your Gemini API Key
    private lateinit var generativeModel: GenerativeModel

    init {
        if (API_KEY != "YOUR_NEBIUS_API_KEY_HERE") { // Check if API key is set
             generativeModel = GenerativeModel(
                modelName = "gemini-2.0-flash", // Use the specified model
                apiKey = API_KEY
            )
        }
    }


    var messages by mutableStateOf(listOf<Message>())
        private set

    var inputText by mutableStateOf(TextFieldValue(""))
        private set

    var isLoading by mutableStateOf(false)
        private set

    var errorMessage by mutableStateOf<String?>(null)
        private set

    fun onInputTextChange(newText: TextFieldValue) {
        inputText = newText
    }

    fun sendMessage(imageBitmap: Bitmap? = null) {
        if (API_KEY == "YOUR_NEBIUS_API_KEY_HERE") {
            errorMessage = "Please replace 'YOUR_NEBIUS_API_KEY_HERE' with your Gemini API key."
            return
        }
        if (inputText.text.isBlank() && imageBitmap == null) {
            return // Don't send empty messages
        }

        val userMessage = Message(inputText.text, true, imageBitmap)
        messages = messages + userMessage // Add user message immediately
        inputText = TextFieldValue("") // Clear input field
        isLoading = true
        errorMessage = null

        viewModelScope.launch {
            try {
                val content = if (imageBitmap != null) {
                    content {
                        image(imageBitmap)
                        if (userMessage.text.isNotBlank()) {
                            text(userMessage.text)
                        }
                    }
                } else {
                    content {
                        text(userMessage.text)
                    }
                }

                val response = generativeModel.generateContent(content)
                val botMessage = Message(response.text ?: "No response from bot", false)
                messages = messages + botMessage // Add bot response

            } catch (e: Exception) {
                errorMessage = "Error: ${e.localizedMessage}"
                e.printStackTrace()
            } finally {
                isLoading = false
            }
        }
    }

    fun clearErrorMessage() {
        errorMessage = null
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun ChatBotScreen(viewModel: ChatBotViewModel = viewModel()) {
    val context = LocalContext.current
    val messages = viewModel.messages
    val inputText = viewModel.inputText
    val isLoading = viewModel.isLoading
    val errorMessage = viewModel.errorMessage

    val imagePickerLauncher = rememberLauncherForActivityResult(
        contract = ActivityResultContracts.GetContent()
    ) { uri: Uri? ->
        uri?.let {
            val bitmap = MediaStore.Images.Media.getBitmap(context.contentResolver, it)
            viewModel.sendMessage(imageBitmap = bitmap)
        }
    }


    // Show Toast when errorMessage changes
    LaunchedEffect(errorMessage) {
        errorMessage?.let {
            Toast.makeText(context, it, Toast.LENGTH_LONG).show()
            viewModel.clearErrorMessage() // Clear message after showing
        }
    }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Gemini Chat Bot") },
                actions = {
                    // Settings icon placeholder
                    IconButton(onClick = { /* TODO: Navigate to settings */ }) {
                        Icon(Icons.Filled.Settings, contentDescription = "Settings")
                    }
                }
            )
        },
        bottomBar = {
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(8.dp),
                verticalAlignment = Alignment.CenterVertically
            ) {
                IconButton(onClick = { imagePickerLauncher.launch("image/*") }) {
                    Icon(Icons.Filled.Image, contentDescription = "Select Image")
                }
                OutlinedTextField(
                    value = inputText,
                    onValueChange = { viewModel.onInputTextChange(it) },
                    label = { Text("Type a prompt") },
                    modifier = Modifier.weight(1f),
                    singleLine = true,
                    enabled = !isLoading
                )
                Spacer(modifier = Modifier.width(8.dp))
                Button(
                    onClick = { viewModel.sendMessage() },
                    enabled = !isLoading && inputText.text.isNotBlank(),
                    shape = RoundedCornerShape(50),
                    contentPadding = PaddingValues(12.dp)
                ) {
                    Icon(Icons.Filled.Send, contentDescription = "Send")
                }
            }
        }
    ) { paddingValues ->
        LazyColumn(
            modifier = Modifier
                .padding(paddingValues)
                .padding(horizontal = 8.dp)
                .fillMaxSize(),
            reverseLayout = true // To show latest messages at the bottom
        ) {
            items(messages.reversed()) { message ->
                MessageBubble(message = message)
            }
        }
        if (isLoading) {
            LinearProgressIndicator(modifier = Modifier.fillMaxWidth())
        }
    }
}

@Composable
fun MessageBubble(message: Message) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .padding(vertical = 4.dp),
        horizontalArrangement = if (message.isUser) Arrangement.End else Arrangement.Start
    ) {
        Card(
            shape = RoundedCornerShape(12.dp),
            colors = CardDefaults.cardColors(
                containerColor = if (message.isUser) Color(0xFFD1C4E9) else Color(0xFFC8E6C9) // Light purple for user, light green for bot
            )
        ) {
            Column(modifier = Modifier.padding(10.dp)) {
                if (message.image != null) {
                    AsyncImage(
                        model = ImageRequest.Builder(LocalContext.current)
                            .data(message.image)
                            .build(),
                        contentDescription = "User Image",
                        modifier = Modifier
                            .size(200.dp)
                            .padding(bottom = 8.dp)
                    )
                }
                Text(text = message.text)
            }
        }
    }
}

// Preview
//@Preview(showBackground = true)
//@Composable
//fun ChatBotScreenPreview() {
//    ChatBotScreen()
//}