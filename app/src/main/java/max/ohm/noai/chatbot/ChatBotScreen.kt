package max.ohm.noai.chatbot

import android.net.Uri
import android.provider.MediaStore
import android.widget.Toast
import androidx.activity.compose.rememberLauncherForActivityResult
import androidx.activity.result.contract.ActivityResultContracts
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Close
import androidx.compose.material.icons.filled.Image
import androidx.compose.material.icons.filled.Send
import androidx.compose.material.icons.filled.Settings
import androidx.compose.material3.Button
import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.LocalContentColor
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.material3.TopAppBar
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.unit.dp
import androidx.lifecycle.viewmodel.compose.viewModel
import coil.compose.AsyncImage
import coil.request.ImageRequest


// ChatBotScreen Composable
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
                title = { Text("OneAi Chat") },
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

    }
}

