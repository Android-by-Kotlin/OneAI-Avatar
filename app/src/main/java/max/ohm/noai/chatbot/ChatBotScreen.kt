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
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.unit.dp
import androidx.lifecycle.viewmodel.compose.viewModel
import coil.compose.AsyncImage
import coil.request.ImageRequest
import androidx.compose.material3.OutlinedButton
import androidx.compose.foundation.BorderStroke
import androidx.compose.foundation.layout.Arrangement


// ChatBotScreen Composable
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun ChatBotScreen(
    unifiedChatBotViewModel: UnifiedChatBotViewModel = viewModel(),
    initialModelType: String? = null
) {
    val context = LocalContext.current
    val messages = unifiedChatBotViewModel.messages
    val inputText = unifiedChatBotViewModel.inputText
    val isLoading = unifiedChatBotViewModel.isLoading
    val errorMessage = unifiedChatBotViewModel.errorMessage
    val selectedImage = unifiedChatBotViewModel.selectedImageBitmap
    val selectedModel = unifiedChatBotViewModel.selectedModel

    LaunchedEffect(initialModelType) {
        initialModelType?.let {
            unifiedChatBotViewModel.updateSelectedModel(it)
        }
    }

    val imagePickerLauncher = rememberLauncherForActivityResult(
        contract = ActivityResultContracts.GetContent()
    ) { uri: Uri? ->
        uri?.let {
            try {
                val bitmap = MediaStore.Images.Media.getBitmap(context.contentResolver, it)
                unifiedChatBotViewModel.updateSelectedImage(bitmap)
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
            unifiedChatBotViewModel.clearErrorMessage() // Clear message after showing
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
            )
        },
        bottomBar = {
            Column(modifier = Modifier.padding(8.dp)) {
                // Model Selection Bar
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceAround,
                    verticalAlignment = Alignment.CenterVertically
                ) {


                }
                Spacer(modifier = Modifier.height(8.dp))

                // Optional: Show a preview of the selected image
                if (selectedImage != null) {
                    Row(verticalAlignment = Alignment.CenterVertically) {
                        AsyncImage(
                            model = ImageRequest.Builder(LocalContext.current)
                                .data(selectedImage)
                                .crossfade(true)
                                .build(),
                            contentDescription = "Selected Image Preview",
                            modifier = Modifier
                                .size(60.dp)
                                .padding(end = 8.dp)
                        )
                        IconButton(onClick = { unifiedChatBotViewModel.updateSelectedImage(null) }) {
                            Icon(Icons.Filled.Close, contentDescription = "Remove Image")
                        }
                        Spacer(modifier = Modifier.weight(1f))
                    }
                    Spacer(modifier = Modifier.height(4.dp))
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
                        onValueChange = { unifiedChatBotViewModel.updateInputText(it) },
                        label = { Text("Type a prompt") },
                        modifier = Modifier.weight(1f),
                        singleLine = false,
                        maxLines = 5,
                        enabled = !isLoading,
                        trailingIcon = {
                            OutlinedButton(
                                onClick = { unifiedChatBotViewModel.updateSelectedModel("gemini-2.0-flash") },
                                modifier = Modifier.padding(end = 6.dp), // Add right padding here
                                border = if (selectedModel == "gemini-2.0-flash") BorderStroke(2.dp, Color.Blue) else BorderStroke(1.dp, Color.Gray)
                            ) {
                                Text("AdvancedAi")
                            }
                        }
                    )
                    Spacer(modifier = Modifier.width(8.dp))
                    Button(
                        onClick = { unifiedChatBotViewModel.sendMessage() },
                        enabled = !isLoading && (inputText.text.isNotBlank() || selectedImage != null),
                        shape = RoundedCornerShape(50),
                        contentPadding = PaddingValues(12.dp)
                    ) {
                        if (isLoading) {
                            CircularProgressIndicator(
                                modifier = Modifier.size(24.dp),
                                color = LocalContentColor.current,
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
            reverseLayout = true
        ) {
            items(messages.reversed(), key = { message -> message.hashCode() + message.text.hashCode() }) { message ->
                MessageBubble(message = message)
                Spacer(modifier = Modifier.height(8.dp))
            }
        }
    }
}
