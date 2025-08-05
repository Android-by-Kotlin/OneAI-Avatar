package max.ohm.oneai.chatbot

import android.net.Uri
import android.provider.MediaStore
import android.widget.Toast
import androidx.activity.compose.rememberLauncherForActivityResult
import androidx.activity.result.contract.ActivityResultContracts
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxHeight
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.lazy.rememberLazyListState
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.text.BasicTextField
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.OutlinedTextFieldDefaults
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Add
import androidx.compose.material.icons.filled.ArrowDropDown
import androidx.compose.material.icons.filled.Close
import androidx.compose.material.icons.filled.Image
import androidx.compose.material.icons.filled.Menu
import androidx.compose.material.icons.filled.Send
import androidx.compose.material.icons.filled.VolumeOff
import androidx.compose.material.icons.filled.VolumeUp
import androidx.compose.material.icons.outlined.Delete
import androidx.compose.material3.DrawerValue
import androidx.compose.material3.DropdownMenu
import androidx.compose.material3.DropdownMenuItem
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.MenuDefaults
import androidx.compose.material3.ModalNavigationDrawer
import androidx.compose.material3.Text
import androidx.compose.material3.rememberDrawerState
import androidx.compose.runtime.Composable
import androidx.compose.runtime.DisposableEffect
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.rememberCoroutineScope
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.SolidColor
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.lifecycle.viewmodel.compose.viewModel
import coil.compose.AsyncImage
import com.google.firebase.auth.FirebaseAuth
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch
import max.ohm.oneai.data.model.Chat
import max.ohm.oneai.utils.SetStatusBarColor
import max.ohm.oneai.utils.StatusBarUtils

// Define the color scheme based on the HTML design
private val DarkGreen = Color(0xFF10231c)
private val MediumGreen = Color(0xFF214a3c)
private val LightGreen = Color(0xFF8ecdb7)
private val AccentGreen = Color(0xFF019863)
private val Black= Color(0xFF000000)
private val AccentRed = Color(0xFF023788)
private val ErrorRed = Color(0xFFFF5252)

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
    val currentChatTitle = unifiedChatBotViewModel.currentChatTitle
    val showChatDrawer = unifiedChatBotViewModel.showChatDrawer
    val isLoadingFromHistory = unifiedChatBotViewModel.isLoadingFromHistory
    val chats by unifiedChatBotViewModel.chats.collectAsState()
    
    // State for tracking scroll position
    val listState = rememberLazyListState()
    val coroutineScope = rememberCoroutineScope()
    
    // State for managing model selection dropdown
    var showModelSelector by remember { mutableStateOf(false) }
    
    // Check if user is authenticated
    val isAuthenticated = remember { mutableStateOf(FirebaseAuth.getInstance().currentUser != null) }
    
    // Available model options
    val modelOptions = listOf(
        "gemini-2.0-flash" to "Gemini Flash",
//        "gemini-2.0-pro" to "Gemini Pro",
//        "gpt-4" to "GPT-4",
        "a4f-gpt-4.1-nano" to "GPT-4.1-Nano"
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
    
    // Check authentication status when the screen loads
    LaunchedEffect(Unit) {
        isAuthenticated.value = FirebaseAuth.getInstance().currentUser != null
        if (!isAuthenticated.value) {
            unifiedChatBotViewModel.errorMessage = "You must be logged in to use the chat. Please log in."
        }
    }
    
    // Update authentication status when it changes
    DisposableEffect(Unit) {
        val authStateListener = FirebaseAuth.AuthStateListener { firebaseAuth ->
            isAuthenticated.value = firebaseAuth.currentUser != null
        }
        FirebaseAuth.getInstance().addAuthStateListener(authStateListener)
        onDispose {
            FirebaseAuth.getInstance().removeAuthStateListener(authStateListener)
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

    // Drawer state for conversations
    val drawerState = rememberDrawerState(initialValue = DrawerValue.Closed)
    
    // Handle drawer state changes
    LaunchedEffect(showChatDrawer) {
        if (showChatDrawer) {
            drawerState.open()
        } else {
            drawerState.close()
        }
    }
    
    // Handle drawer state changes from gesture
    LaunchedEffect(drawerState.targetValue) {
        if (drawerState.targetValue == DrawerValue.Closed && showChatDrawer) {
            unifiedChatBotViewModel.toggleChatDrawer()
        }
    }

    // Set status bar color for chatbot screen
    SetStatusBarColor(StatusBarUtils.ChatBotStatusBarColor)
    
    ModalNavigationDrawer(
        drawerState = drawerState,
        drawerContent = {
            ConversationsDrawer(
                chats = chats,
                currentChatId = unifiedChatBotViewModel.currentChatId,
                onChatSelected = { 
                    unifiedChatBotViewModel.loadChat(it.id)
                    coroutineScope.launch {
                        drawerState.close()
                    }
                },
                onNewChatClicked = {
                    unifiedChatBotViewModel.createNewChat()
                    coroutineScope.launch {
                        drawerState.close()
                    }
                },
                onDeleteChatClicked = { chat ->
                    unifiedChatBotViewModel.deleteChat(chat.id)
                },
                isTypingSoundEnabled = unifiedChatBotViewModel.isTypingSoundEnabled,
                onToggleTypingSound = { unifiedChatBotViewModel.toggleTypingSound() }
            )
        },
        content = {
            Column(
                modifier = Modifier
                    .fillMaxSize()
                    .background(DarkGreen)
            ) {
                // Top bar with menu and title
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(horizontal = 16.dp, vertical = 8.dp),
                    verticalAlignment = Alignment.CenterVertically,
                    horizontalArrangement = Arrangement.SpaceBetween
                ) {
                    // Menu button and title
                    Row(
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        IconButton(
                            onClick = { unifiedChatBotViewModel.toggleChatDrawer() }
                        ) {
                            Icon(
                                imageVector = Icons.Default.Menu,
                                contentDescription = "Menu",
                                tint = Color.White
                            )
                        }
                        
                        // Title display removed from top bar - titles only show in sidebar
                    }
                    
                    // Model selector
                    Box {
                        Row(
                            modifier = Modifier
                                .clip(RoundedCornerShape(16.dp))
                                .background(MediumGreen)
                                .clickable { showModelSelector = true }
                                .padding(horizontal = 12.dp, vertical = 6.dp),
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Text(
                                text = modelOptions.find { it.first == selectedModel }?.second ?: "Select Model",
                                color = Color.White,
                                fontSize = 14.sp,
                                modifier = Modifier.padding(end = 4.dp)
                            )
                            Icon(
                                imageVector = Icons.Default.ArrowDropDown,
                                contentDescription = "Select Model",
                                tint = Color.White,
                                modifier = Modifier.size(20.dp)
                            )
                        }

                        DropdownMenu(
                            expanded = showModelSelector,
                            onDismissRequest = { showModelSelector = false },
                            modifier = Modifier.background(DarkGreen)
                        ) {
                            modelOptions.forEach { (modelId, modelName) ->
                                DropdownMenuItem(
                                    text = { Text(modelName, color = Color.White) },
                                    onClick = {
                                        unifiedChatBotViewModel.updateSelectedModel(modelId)
                                        showModelSelector = false
                                    },
                                    colors = MenuDefaults.itemColors(
                                        textColor = Color.White
                                    )
                                )
                            }
                        }
                    }
                }
                
                // Chat messages
                Box(
                    modifier = Modifier
                        .weight(1f)
                        .fillMaxWidth()
                ) {
                    // Add Matrix Hack Effect as background
                    MatrixHackEffect(
                        alpha = 0.7f,
                        backgroundColor = Color.Black.copy(alpha = 0.85f)
                    )
                    
                    if (messages.isEmpty()) {
                        // Empty state
                        Column(
                            modifier = Modifier
                                .fillMaxSize()
                                .padding(16.dp),
                            horizontalAlignment = Alignment.CenterHorizontally,
                            verticalArrangement = Arrangement.Center
                        ) {
//                            Text(
//                                text = "Welcome to OneAI Chat",
//                                color = Color.White.copy(alpha = 0.7f),
//                                fontSize = 18.sp,
//                                textAlign = TextAlign.Center
//                            )
//                            Spacer(modifier = Modifier.height(8.dp))
//                            Text(
//                                text = "Type a message below to start a new conversation",
//                                color = Color.White.copy(alpha = 0.5f),
//                                fontSize = 14.sp,
//                                textAlign = TextAlign.Center
//                            )
//                            Spacer(modifier = Modifier.height(8.dp))
//                            Text(
//                                text = "or click the + icon to create a new chat",
//                                color = Color.White.copy(alpha = 0.5f),
//                                fontSize = 14.sp,
//                                textAlign = TextAlign.Center
//                            )
                        }
                    } else {
                        LazyColumn(
                            state = listState,
                            modifier = Modifier
                                .fillMaxSize()
                                .padding(8.dp),
                            verticalArrangement = Arrangement.spacedBy(16.dp)
                        ) {
                            items(messages.size) { index ->
                                val message = messages[index]
                                val isLastMessage = index == messages.size - 1
                                val isRecentMessage = !isLoadingFromHistory && isLastMessage && !message.isUser
                                
                                MessageBubble(
                                    message = message,
                                    isNewMessage = isRecentMessage,
                                    isTypingSoundEnabled = unifiedChatBotViewModel.isTypingSoundEnabled
                                )
                            }
                            
                            // Add a spacer at the bottom for better UX
                            item {
                                Spacer(modifier = Modifier.height(8.dp))
                            }
                        }
                    }
                    
                    // Loading indicator overlay
//                    if (isLoading) {
//                        Box(
//                            modifier = Modifier
//                                .fillMaxSize()
//                                .background(Color.Black.copy(alpha = 0.3f)),
//                            contentAlignment = Alignment.Center
//                        ) {
//                           // CircularProgressIndicator(color = AccentGreen)
//                        }
//                    }
                }
                
                // Input area
                Column(
                    modifier = Modifier
                        .fillMaxWidth()
                        .background(DarkGreen)
                        .padding(horizontal = 16.dp, vertical = 8.dp)
                ) {
                    // Image preview
                    selectedImage?.let { bitmap ->
                        Box(
                            modifier = Modifier
                                .fillMaxWidth()
                                .padding(bottom = 8.dp)
                        ) {
                            AsyncImage(
                                model = bitmap,
                                contentDescription = "Selected Image",
                                modifier = Modifier
                                    .height(120.dp)
                                    .fillMaxWidth()
                                    .clip(RoundedCornerShape(8.dp)),
                                contentScale = ContentScale.Crop
                            )
                            
                            // Remove image button
                            IconButton(
                                onClick = { unifiedChatBotViewModel.updateSelectedImage(null) },
                                modifier = Modifier
                                    .align(Alignment.TopEnd)
                                    .size(32.dp)
                                    .background(Color.Black.copy(alpha = 0.5f), CircleShape)
                            ) {
                                Icon(
                                    imageVector = Icons.Default.Close,
                                    contentDescription = "Remove Image",
                                    tint = Color.White,
                                    modifier = Modifier.size(16.dp)
                                )
                            }
                        }
                    }
                    
                        // Input area with OutlinedTextField
                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(horizontal = 8.dp, vertical = 4.dp),
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        // Image picker button
                        IconButton(
                            onClick = { imagePickerLauncher.launch("image/*") },
                            modifier = Modifier
                                .size(48.dp)
                                .background(MediumGreen, CircleShape)
                        ) {
                            Icon(
                                imageVector = Icons.Default.Image,
                                contentDescription = "Add Image",
                                tint = Color.White,
                                modifier = Modifier.size(24.dp)
                            )
                        }
                        
                        Spacer(modifier = Modifier.width(8.dp))
                        
                        // OutlinedTextField
                        OutlinedTextField(
                            value = inputText,
                            onValueChange = { unifiedChatBotViewModel.updateInputText(it) },
                            placeholder = {
                                Text(
                                    text = "Type a message...",
                                    color = Color.White.copy(alpha = 0.6f),
                                    fontSize = 16.sp
                                )
                            },
                            modifier = Modifier.weight(1f),
                            enabled = !isLoading,
                            colors = OutlinedTextFieldDefaults.colors(
                                focusedBorderColor = Color.Transparent,
                                unfocusedBorderColor = Color.Transparent,
                                focusedTextColor = Color.White,
                                unfocusedTextColor = Color.White,
                                cursorColor = Color.White,
                                focusedContainerColor = MediumGreen,
                                unfocusedContainerColor = MediumGreen
                            ),
                            shape = RoundedCornerShape(24.dp),
                            maxLines = 5,
                            singleLine = false
                        )
                        
                        Spacer(modifier = Modifier.width(8.dp))
                        
                        // Send button
                        IconButton(
                            onClick = { 
                                if (inputText.text.isNotEmpty() || selectedImage != null) {
                                    unifiedChatBotViewModel.sendMessage()
                                }
                            },
                            enabled = !isLoading && (inputText.text.isNotEmpty() || selectedImage != null),
                            modifier = Modifier
                                .size(48.dp)
                                .background(AccentGreen, CircleShape)
                        ) {
                            Icon(
                                imageVector = Icons.Default.Send,
                                contentDescription = "Send Message",
                                tint = Color.White,
                                modifier = Modifier.size(20.dp)
                            )
                        }
                    }
                }
            }
        }
    )
}
@Composable

fun ConversationsDrawer(
    chats: List<Chat>,
    currentChatId: String?,
    onChatSelected: (Chat) -> Unit,
    onNewChatClicked: () -> Unit,
    onDeleteChatClicked: (Chat) -> Unit,
    isTypingSoundEnabled: Boolean = true,
    onToggleTypingSound: () -> Unit = {}
) {
    Column(
        modifier = Modifier
            .fillMaxHeight()
            .width(280.dp)
            .background(DarkGreen)
            .padding(vertical = 16.dp)
    ) {
        // Drawer header
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(horizontal = 16.dp, vertical = 8.dp),
            verticalAlignment = Alignment.CenterVertically,
            horizontalArrangement = Arrangement.SpaceBetween
        ) {
            Text(
                text = "Conversations",
                color = Color.White,
                fontSize = 25.sp,
                modifier = Modifier.padding(top = 5.dp),
                fontWeight = FontWeight.Bold
            )

            // Sound toggle and New chat buttons
            Row(
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                // Sound toggle button
                IconButton(
                    onClick = onToggleTypingSound,
                    modifier = Modifier
                        .size(40.dp)
                        .background(
                            if (isTypingSoundEnabled) AccentGreen else MediumGreen,
                            CircleShape
                        )
                ) {
                    Icon(
                        imageVector = if (isTypingSoundEnabled) 
                            Icons.Default.VolumeUp else Icons.Default.VolumeOff,
                        contentDescription = if (isTypingSoundEnabled) 
                            "Disable typing sound" else "Enable typing sound",
                        tint = Color.White
                    )
                }
                
                // New chat button
                IconButton(
                    onClick = onNewChatClicked,
                    modifier = Modifier
                        .size(40.dp)
                        .background(AccentGreen, CircleShape)
                ) {
                    Icon(
                        imageVector = Icons.Default.Add,
                        contentDescription = "New Conversation",
                        tint = Color.White
                    )
                }
            }
        }

        //Divider(color = MediumGreen, thickness = 1.dp)

        // Chat list
        LazyColumn(
            modifier = Modifier.fillMaxWidth(),
            contentPadding = PaddingValues(vertical = 8.dp)
        ) {
            items(chats) { chat ->
                val isSelected = chat.id == currentChatId

                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .background(
                            if (isSelected) MediumGreen else Color.Transparent
                        )
                        .clickable { onChatSelected(chat) }
                        .padding(horizontal = 16.dp, vertical = 12.dp),
                    verticalAlignment = Alignment.CenterVertically,
                    horizontalArrangement = Arrangement.SpaceBetween
                ) {
                    Column(
                        modifier = Modifier.weight(1f)
                    ) {
                        Text(
                            text = chat.title,
                            color = Color.White,
                            fontSize = 16.sp,
                            maxLines = 1,
                            overflow = TextOverflow.Ellipsis
                        )

                        Spacer(modifier = Modifier.height(4.dp))

                        Text(
                            text = "Updated: ${chat.updatedAt.toDate().toString().substringBefore("GMT")}",
                            color = Color.White.copy(alpha = 0.6f),
                            fontSize = 12.sp,
                            maxLines = 1,
                            overflow = TextOverflow.Ellipsis
                        )
                    }

                    // Delete button
                    IconButton(
                        onClick = { onDeleteChatClicked(chat) },
                        modifier = Modifier.size(32.dp)
                    ) {
                        Icon(
                            imageVector = Icons.Outlined.Delete,
                            contentDescription = "Delete Conversation",
                            tint = Color.White.copy(alpha = 0.6f)
                        )
                    }
                }
            }
        }
    }
}