package max.ohm.oneai.chatbot

import android.net.Uri
import android.provider.MediaStore
import android.widget.Toast
import androidx.activity.compose.rememberLauncherForActivityResult
import androidx.activity.result.contract.ActivityResultContracts
import androidx.compose.animation.AnimatedVisibility
import androidx.compose.animation.core.*
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.lazy.rememberLazyListState
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Image
import androidx.compose.material.icons.outlined.Delete
import androidx.compose.material.icons.outlined.LightMode
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.lifecycle.viewmodel.compose.viewModel
import coil.compose.AsyncImage
import coil.request.ImageRequest
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch

// Define the color scheme based on the HTML design
private val DarkGreen = Color(0xFF10231c)
private val MediumGreen = Color(0xFF214a3c)
private val LightGreen = Color(0xFF8ecdb7)
private val AccentGreen = Color(0xFF019863)
private val Black= Color(0xFF000000)
private val AccentRed = Color(0xFF023788)

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
    
    // State for tracking scroll position
    val listState = rememberLazyListState()
    val coroutineScope = rememberCoroutineScope()
    
    // State for managing model selection dropdown
    var showModelSelector by remember { mutableStateOf(false) }
    
    // Available model options
    val modelOptions = listOf(
        "gemini-2.0-flash" to "Gemini Flash",
        "gemini-2.0-pro" to "Gemini Pro",
        "gpt-4" to "GPT-4"
    )

    LaunchedEffect(initialModelType) {
        initialModelType?.let {
            unifiedChatBotViewModel.updateSelectedModel(it)
        }
    }

    // Auto-scroll to bottom when sending new messages
    LaunchedEffect(messages.size) {
        if (messages.isNotEmpty() && !listState.isScrollInProgress) {
            delay(100) // Short delay for smoother experience
            listState.animateScrollToItem(messages.size - 1)
        }
    }

    // Add another LaunchedEffect to handle scrolling during typing
    LaunchedEffect(isLoading) {
        if (!isLoading && messages.isNotEmpty()) {
            // When loading completes (message is received), scroll to the bottom
            delay(100) // Short delay for smoother experience
            listState.animateScrollToItem(messages.size - 1)
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
            unifiedChatBotViewModel.clearErrorMessage()
        }
    }

    Column(
        modifier = Modifier
            .fillMaxSize()
            .background(Black)
    ) {
        // Top Bar
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .background(DarkGreen)
                .padding(16.dp, 16.dp, 16.dp, 8.dp),
            verticalAlignment = Alignment.CenterVertically,
            horizontalArrangement = Arrangement.SpaceBetween
        ) {
            // Empty space for alignment
            Spacer(modifier = Modifier.width(48.dp))
            
            // Title
            Text(
                text = "OneAI Chat",
                color = Color.White,
                fontSize = 25.sp,
                fontWeight = FontWeight.Bold,
                modifier = Modifier.weight(1f).padding(top = 25.dp),
                textAlign = TextAlign.Center
            )
            
            // Theme toggle button
            IconButton(
                onClick = { /* Theme toggle functionality */ },
                modifier = Modifier.size(48.dp).padding(top = 25.dp),
            ) {
                Icon(
                    imageVector = Icons.Outlined.LightMode,
                    contentDescription = "Toggle Theme",
                    tint = Color.White
                )
            }
        }
        
        // Chat Messages
        Box(
            modifier = Modifier
                .weight(1f)
                .fillMaxWidth()
        ) {
            LazyColumn(
                modifier = Modifier.fillMaxSize(),
                state = listState,
                reverseLayout = false
            ) {
                // Initial welcome message if no messages
                if (messages.isEmpty()) {
                    item {
                        // AI Message
                        Row(
                            modifier = Modifier
                                .fillMaxWidth()
                                .padding(16.dp),
                            verticalAlignment = Alignment.Bottom
                        ) {
                            // AI Avatar
                            Box(
                                modifier = Modifier
                                    .size(40.dp)
                                    .clip(CircleShape)
                                    .background(AccentGreen)
                            ) {
                                Text(
                                    text = "AI",
                                    color = Color.White,
                                    fontSize = 14.sp,
                                    modifier = Modifier.align(Alignment.Center)
                                )
                            }
                            
                            Spacer(modifier = Modifier.width(12.dp))
                            
                            Column(
                                horizontalAlignment = Alignment.Start
                            ) {
                                Text(
                                    text = "AI Assistant",
                                    color = LightGreen,
                                    fontSize = 13.sp
                                )
                                
                                Spacer(modifier = Modifier.height(4.dp))
                                
                                // Use MessageBubble for welcome message to have typing effect
                                MessageBubble(message = Message("Hello! How can I assist you today?", false))
                            }
                        }
                    }
                }
                
                // Actual messages
                items(messages) { message ->
                    if (message.isUser) {
                        // User Message
                        Row(
                            modifier = Modifier
                                .fillMaxWidth()
                                .padding(16.dp),
                            horizontalArrangement = Arrangement.End,
                            verticalAlignment = Alignment.Bottom
                        ) {
                            Column(
                                horizontalAlignment = Alignment.End,
                                modifier = Modifier.weight(1f)
                            ) {
                                Text(
                                    text = "You",
                                    color = LightGreen,
                                    fontSize = 13.sp
                                )
                                
                                Spacer(modifier = Modifier.height(4.dp))
                                
                                Box(
                                    modifier = Modifier
                                        .clip(RoundedCornerShape(16.dp))
                                        .background(AccentGreen)
                                        .padding(16.dp)
                                        .widthIn(max = 280.dp)
                                ) {
                                    if (message.image != null) {
                                        Column {
                                            AsyncImage(
                                                model = ImageRequest.Builder(LocalContext.current)
                                                    .data(message.image)
                                                    .crossfade(true)
                                                    .build(),
                                                contentDescription = "User Image",
                                                contentScale = ContentScale.FillWidth,
                                                modifier = Modifier
                                                    .fillMaxWidth()
                                                    .clip(RoundedCornerShape(8.dp))
                                            )
                                            
                                            if (message.text.isNotBlank()) {
                                                Spacer(modifier = Modifier.height(8.dp))
                                                Text(
                                                    text = message.text,
                                                    color = Color.White,
                                                    fontSize = 16.sp
                                                )
                                            }
                                        }
                                    } else {
                                        Text(
                                            text = message.text,
                                            color = Color.White,
                                            fontSize = 16.sp
                                        )
                                    }
                                }
                            }
                            
                            Spacer(modifier = Modifier.width(12.dp))
                            
                            // User Avatar
                            Box(
                                modifier = Modifier
                                    .size(40.dp)
                                    .clip(CircleShape)
                                    .background(Color(0xFF3700B3))
                            ) {
                                Text(
                                    text = "You",
                                    color = Color.White,
                                    fontSize = 14.sp,
                                    modifier = Modifier.align(Alignment.Center)
                                )
                            }
                        }
                    } else {
                        // AI Message
                        Row(
                            modifier = Modifier
                                .fillMaxWidth()
                                .padding(16.dp),
                            verticalAlignment = Alignment.Bottom
                        ) {
                            // AI Avatar
                            Box(
                                modifier = Modifier
                                    .size(40.dp)
                                    .clip(CircleShape)
                                    .background(AccentGreen)
                            ) {
                                Text(
                                    text = "AI",
                                    color = Color.White,
                                    fontSize = 14.sp,
                                    modifier = Modifier.align(Alignment.Center)
                                )
                            }
                            
                            Spacer(modifier = Modifier.width(12.dp))
                            
                            Column(
                                horizontalAlignment = Alignment.Start,
                                modifier = Modifier.weight(1f)
                            ) {
                                Text(
                                    text = "AI Assistant",
                                    color = LightGreen,
                                    fontSize = 13.sp
                                )
                                
                                Spacer(modifier = Modifier.height(4.dp))
                                
                                // Use MessageBubble component for AI messages to enable typing effect
                                MessageBubble(message = message)
                            }
                        }
                    }
                }
                
                // Show typing indicator if loading
                if (isLoading) {
                    item {
                        Row(
                            modifier = Modifier
                                .fillMaxWidth()
                                .padding(16.dp),
                            verticalAlignment = Alignment.Bottom
                        ) {
                            // AI Avatar
                            Box(
                                modifier = Modifier
                                    .size(40.dp)
                                    .clip(CircleShape)
                                    .background(AccentGreen)
                            ) {
                                Text(
                                    text = "AI",
                                    color = Color.White,
                                    fontSize = 14.sp,
                                    modifier = Modifier.align(Alignment.Center)
                                )
                            }
                            
                            Spacer(modifier = Modifier.width(12.dp))
                            
                            Box(
                                modifier = Modifier
                                    .width(80.dp)
                                    .clip(RoundedCornerShape(16.dp))
                                    .background(MediumGreen)
                                    .padding(16.dp)
                            ) {
                                Row(
                                    horizontalArrangement = Arrangement.SpaceEvenly,
                                    modifier = Modifier.fillMaxWidth()
                                ) {
                                    TypingDot(delay = 0)
                                    TypingDot(delay = 150)
                                    TypingDot(delay = 300)
                                }
                            }
                        }
                    }
                }
            }
        }
        
        // Input Area
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .background(DarkGreen)
        ) {
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(16.dp, 12.dp),
                verticalAlignment = Alignment.CenterVertically
            ) {
                // Text Input Field
                OutlinedTextField(
                    value = inputText,
                    onValueChange = { unifiedChatBotViewModel.updateInputText(it) },
                    placeholder = { Text("Type your message...", color = LightGreen) },
                    modifier = Modifier
                        .weight(1f)
                        .height(60.dp),
                    shape = RoundedCornerShape(16.dp),
                    colors = TextFieldDefaults.outlinedTextFieldColors(
                        containerColor = MediumGreen,
                        cursorColor = Color.White,
                        focusedBorderColor = MediumGreen,
                        unfocusedBorderColor = MediumGreen
                    ),
                    trailingIcon = {
                        Row {
                            // Image Upload Button
                            IconButton(
                                onClick = { imagePickerLauncher.launch("image/*") }
                            ) {
                                Icon(
                                    imageVector = Icons.Default.Image,
                                    contentDescription = "Upload Image",
                                    tint = LightGreen
                                )
                            }
                            
                            // Send Button (visible on wider screens)
                            Button(
                                onClick = {
                                    if (inputText.text.isNotEmpty() || selectedImage != null) {
                                        unifiedChatBotViewModel.sendMessage()
                                    }
                                },
                                enabled = !isLoading && (inputText.text.isNotEmpty() || selectedImage != null),
                                colors = ButtonDefaults.buttonColors(
                                    containerColor = AccentGreen,
                                    disabledContainerColor = AccentGreen.copy(alpha = 0.5f)
                                ),
                                shape = RoundedCornerShape(16.dp),
                                modifier = Modifier
                                    .padding(end = 10.dp, top = 6.dp)
                                    .height(36.dp)
                            ) {
//                                Text("Send", fontSize = 14.sp)
                                Text(
                                    text = "Send",
                                    fontSize = 14.sp,
                                    color = Color(0xFFFFFFFF) // White
                                )
                            }
                        }
                    },
                    singleLine = true
                )
            }
            
            // Preview of selected image if any
            AnimatedVisibility(visible = selectedImage != null) {
                Box(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(16.dp, 0.dp, 16.dp, 16.dp)
                ) {
                    selectedImage?.let { bitmap ->
                        Box(
                            modifier = Modifier
                                .fillMaxWidth()
                                .height(120.dp)
                                .clip(RoundedCornerShape(8.dp))
                                .background(MediumGreen)
                        ) {
                            AsyncImage(
                                model = bitmap,
                                contentDescription = "Selected Image",
                                contentScale = ContentScale.Fit,
                                modifier = Modifier
                                    .fillMaxSize()
                                    .padding(8.dp)
                            )
                            
                            // Remove image button
                            IconButton(
                                onClick = { unifiedChatBotViewModel.updateSelectedImage(null) },
                                modifier = Modifier
                                    .align(Alignment.TopEnd)
                                    .padding(4.dp)
                                    .size(24.dp)
                                    .background(Color.Black.copy(alpha = 0.5f), CircleShape)
                            ) {
                                Icon(
                                    imageVector = Icons.Outlined.Delete,
                                    contentDescription = "Remove Image",
                                    tint = Color.White,
                                    modifier = Modifier.size(16.dp)
                                )
                            }
                        }
                    }
                }
            }
            
            // Bottom spacing
            Spacer(modifier = Modifier.height(20.dp))
        }
    }
}

@Composable
fun TypingDot(delay: Int) {
    var visible by remember { mutableStateOf(true) }
    
    LaunchedEffect(Unit) {
        while (true) {
            delay(delay.toLong())
            visible = !visible
            delay(500)
        }
    }
    
    Box(
        modifier = Modifier
            .size(8.dp)
            .clip(CircleShape)
            .background(if (visible) Color.White else Color.White.copy(alpha = 0.3f))
    )
}

