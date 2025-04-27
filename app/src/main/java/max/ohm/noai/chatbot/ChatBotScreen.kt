package max.ohm.noai.chatbot

import android.graphics.Bitmap
import android.net.Uri
import android.provider.MediaStore
import android.widget.Toast
import androidx.activity.compose.rememberLauncherForActivityResult
import androidx.activity.result.contract.ActivityResultContracts
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons

import androidx.compose.material.icons.filled.Close // Added for remove image button
import androidx.compose.material.icons.filled.Image
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
import androidx.compose.ui.unit.dp

import androidx.lifecycle.viewModelScope
import androidx.lifecycle.viewmodel.compose.viewModel
import coil.compose.AsyncImage
import coil.request.ImageRequest
import com.google.ai.client.generativeai.GenerativeModel
import com.google.ai.client.generativeai.type.content
// Need these imports for Gemini content builder
//import com.google.ai.client.generativeai.type.image
//import com.google.ai.client.generativeai.type.text
import kotlinx.coroutines.launch
// import max.ohm.noai.NEBIUS_API_KEY // Unused import


data class Message(val text: String, val isUser: Boolean, val image: Bitmap? = null)

class ChatBotViewModel : ViewModel() {
    // Consider moving the API key outside the ViewModel or using a secure storage mechanism
    private val API_KEY = "AIzaSyBllTUQBqy8vNW_XztRKncxlv9QoAbjoi8" // Replace with your Gemini API Key
    private var generativeModel: GenerativeModel? = null // Make nullable to handle init failure

    init {
        // Basic check, consider more robust validation
        if (API_KEY != "YOUR_NEBIUS_API_KEY_HERE" && API_KEY.isNotBlank()) {
             generativeModel = GenerativeModel(
                // Use a stable model name, e.g., "gemini-1.5-flash" if available and suitable
                modelName = "gemini-1.5-flash", // Updated model name
                apiKey = API_KEY
            )
        } else {
            // Handle the case where the API key is missing or invalid during init
            // Maybe log an error or set a state to indicate the issue
            println("Error: Gemini API Key is not configured correctly.") // Simple log
        }
    }


    var messages by mutableStateOf(listOf<Message>())
        private set

    var inputText by mutableStateOf(TextFieldValue(""))
        private set

    // State to hold the image selected by the user before sending
    var selectedImageBitmap by mutableStateOf<Bitmap?>(null)
        private set

    var isLoading by mutableStateOf(false)
        private set

    var errorMessage by mutableStateOf<String?>(null)
        private set

    fun onInputTextChange(newText: TextFieldValue) {
        inputText = newText
    }

    // Function to update the selected image state
    fun onImageSelected(bitmap: Bitmap?) {
        selectedImageBitmap = bitmap
    }

    fun sendMessage() { // Removed imageBitmap parameter
        if (generativeModel == null) {
            errorMessage = "Chatbot is not initialized. Check API Key."
            return
        }
        // Use the state variable selectedImageBitmap
        val imageToSend = selectedImageBitmap
        // Allow sending if there's text OR an image selected
        if (inputText.text.isBlank() && imageToSend == null) {
            return // Don't send empty messages
        }

        val userMessage = Message(inputText.text, true, imageToSend)
        messages = messages + userMessage // Add user message immediately
        inputText = TextFieldValue("") // Clear input field
        selectedImageBitmap = null // Clear selected image after adding to message list
        isLoading = true
        errorMessage = null

        viewModelScope.launch {
            try {
                // Use the image from the message object
                val content = if (userMessage.image != null) {
                    content {
                        image(userMessage.image) // Use the image from the message
                        if (userMessage.text.isNotBlank()) {
                            text(userMessage.text)
                        }
                    }
                } else {
                    content {
                        text(userMessage.text)
                    }
                }

                // Ensure generativeModel is not null before using (already checked, but good practice)
                val response = generativeModel!!.generateContent(content)
                val botMessage = Message(response.text ?: "No response from bot", false)
                messages = messages + botMessage // Add bot response

            } catch (e: Exception) {
                errorMessage = "Error: ${e.localizedMessage}"
                // Consider more specific error handling based on exception type
                e.printStackTrace() // Keep logging for debugging
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
    val selectedImage = viewModel.selectedImageBitmap // Get selected image state

    val imagePickerLauncher = rememberLauncherForActivityResult(
        contract = ActivityResultContracts.GetContent()
    ) { uri: Uri? ->
        uri?.let {
            try { // Add try-catch for potential bitmap loading errors
                val bitmap = MediaStore.Images.Media.getBitmap(context.contentResolver, it)
                // Update the ViewModel state instead of sending immediately
                viewModel.onImageSelected(bitmap)
            } catch (e: Exception) {
                Toast.makeText(context, "Failed to load image", Toast.LENGTH_SHORT).show()
                e.printStackTrace()
            }
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
                // Consider adding colors = TopAppBarDefaults.smallTopAppBarColors(...) for theming
            )
        },
        bottomBar = {
            // Column to potentially stack image preview above the input row
            Column(modifier = Modifier.padding(8.dp)) {
                // Optional: Show a preview of the selected image
                if (selectedImage != null) {
                    Row(verticalAlignment = Alignment.CenterVertically) {
                         AsyncImage(
                            model = ImageRequest.Builder(LocalContext.current)
                                .data(selectedImage)
                                .crossfade(true) // Add crossfade for smoother loading
                                .build(),
                            contentDescription = "Selected Image Preview",
                            modifier = Modifier
                                .size(60.dp) // Smaller preview size
                                .padding(end = 8.dp)
                        )
                        // Add a button to remove the selected image
                        IconButton(onClick = { viewModel.onImageSelected(null) }) {
                            // Use a clear or close icon
                            Icon(Icons.Filled.Close, contentDescription = "Remove Image")
                        }
                        Spacer(modifier = Modifier.weight(1f)) // Push input field to the right
                    }
                    Spacer(modifier = Modifier.height(4.dp)) // Space between preview and input
                }

                Row(
                    modifier = Modifier.fillMaxWidth(),
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
                        singleLine = false, // Allow multi-line input if needed
                        maxLines = 5, // Limit max lines
                        enabled = !isLoading // Still disable while loading/sending
                    )
                    Spacer(modifier = Modifier.width(8.dp))
                    Button(
                        onClick = { viewModel.sendMessage() },
                        // Enable if not loading AND (text is not blank OR an image is selected)
                        enabled = !isLoading && (inputText.text.isNotBlank() || selectedImage != null),
                        shape = RoundedCornerShape(50), // Consider MaterialTheme shapes
                        contentPadding = PaddingValues(12.dp)
                    ) {
                        // Show progress indicator inside button when loading
                        if (isLoading) {
                            CircularProgressIndicator(
                                modifier = Modifier.size(24.dp),
                                color = LocalContentColor.current, // Use button's content color
                                strokeWidth = 2.dp
                            )
                        } else {
                            Icon(Icons.Filled.Send, contentDescription = "Send")
                        }
                    }
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
            // Add a key for better performance and state preservation
            items(messages.reversed(), key = { message -> message.hashCode() + message.text.hashCode() }) { message ->
                MessageBubble(message = message)
                Spacer(modifier = Modifier.height(8.dp)) // Add space between bubbles
            }
        }
        // Removed the LinearProgressIndicator from here as it's now inside the button
        // if (isLoading) {
        //     LinearProgressIndicator(modifier = Modifier.fillMaxWidth())
        // }
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
            shape = RoundedCornerShape( // Consider different shapes for user/bot
                topStart = if (!message.isUser) 4.dp else 12.dp,
                topEnd = if (message.isUser) 4.dp else 12.dp,
                bottomStart = 12.dp,
                bottomEnd = 12.dp
            ),
            colors = CardDefaults.cardColors(
                containerColor = if (message.isUser) MaterialTheme.colorScheme.primaryContainer else MaterialTheme.colorScheme.secondaryContainer
                // Use theme colors
                // containerColor = if (message.isUser) Color(0xFFD1C4E9) else Color(0xFFC8E6C9)
            )
        ) {
            Column(modifier = Modifier.padding(10.dp)) {
                if (message.image != null) {
                    AsyncImage(
                        model = ImageRequest.Builder(LocalContext.current)
                            .data(message.image)
                            .crossfade(true) // Add crossfade
                            .build(),
                        contentDescription = if (message.isUser) "User Image" else "Bot Image", // More specific description
                        modifier = Modifier
                            .fillMaxWidth(0.7f) // Limit image width
                            .aspectRatio(1f) // Maintain aspect ratio (adjust as needed)
                            .padding(bottom = if (message.text.isNotBlank()) 8.dp else 0.dp) // Add padding only if text exists
                            .align(if (message.isUser) Alignment.End else Alignment.Start) // Align image within the bubble
                    )
                }
                // Only show Text composable if text is not blank
                if (message.text.isNotBlank()) {
                    Text(
                        text = message.text,
                        color = if (message.isUser) MaterialTheme.colorScheme.onPrimaryContainer else MaterialTheme.colorScheme.onSecondaryContainer
                    )
                }
            }
        }
    }
}

// Preview (Requires fixing dependencies or providing a mock ViewModel)
//@Preview(showBackground = true)
//@Composable
//fun ChatBotScreenPreview() {
//    // Provide a mock ViewModel for preview
//    val mockViewModel = ChatBotViewModel() // Basic mock, might need more setup
//    // Wrap in Theme
//    MaterialTheme {
//        ChatBotScreen(viewModel = mockViewModel)
//    }
//}

// Add Close icon import if not already present
// import androidx.compose.material.icons.filled.Close // Already added above
