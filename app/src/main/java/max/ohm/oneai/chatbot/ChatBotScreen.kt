package max.ohm.oneai.chatbot

import android.net.Uri
import android.provider.MediaStore
import android.widget.Toast
import androidx.activity.compose.rememberLauncherForActivityResult
import androidx.activity.result.contract.ActivityResultContracts
import androidx.compose.animation.AnimatedVisibility
import androidx.compose.animation.core.*
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.lazy.rememberLazyListState
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.text.BasicTextField
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material.icons.outlined.Delete
import androidx.compose.material.icons.outlined.LightMode
import androidx.compose.material3.*
import androidx.compose.runtime.*
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
import coil.request.ImageRequest
import com.google.firebase.auth.FirebaseAuth
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch
import max.ohm.oneai.data.model.Chat

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
                }
            )
        },
        content = {
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
                    // Menu button
                    IconButton(
                        onClick = { unifiedChatBotViewModel.toggleChatDrawer() },
                        modifier = Modifier.size(48.dp).padding(top = 25.dp),
                    ) {
//                        Icon(
//                            imageVector = Icons.Default.Menu,
//                            contentDescription = "Open Conversations",
//                            tint = Color.White
//                        )
                    }
                    
                    // Title
                    Text(
                        text = "OneAI Chat",
                        color = Color.White,
                        fontSize = 25.sp,
                        fontWeight = FontWeight.Bold,
                        modifier = Modifier.weight(1f).padding(top = 25.dp),
                        textAlign = TextAlign.Center,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis
                    )
                    
                    // New chat button
                    IconButton(
                        onClick = { unifiedChatBotViewModel.createNewChat() },
                        modifier = Modifier.size(48.dp).padding(top = 25.dp),
                    ) {
//                        Icon(
//                            imageVector = Icons.Default.Add,
//                            contentDescription = "New Conversation",
//                            tint = Color.White
//                        )
                    }
                }
                
                // Authentication warning banner
                if (!isAuthenticated.value) {
                    Surface(
                        color = ErrorRed,
                        modifier = Modifier.fillMaxWidth()
                    ) {
                        Row(
                            modifier = Modifier
                                .fillMaxWidth()
                                .padding(16.dp),
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Text(
                                text = "You must be logged in to use the chat. Please log in.",
                                color = Color.White,
                                fontSize = 14.sp,
                                modifier = Modifier.weight(1f)
                            )
                        }
                    }
                }
                
                // Model selector
//                Row(
//                    modifier = Modifier
//                        .fillMaxWidth()
//                        .background(MediumGreen)
//                        .padding(8.dp),
//                    verticalAlignment = Alignment.CenterVertically
//                ) {
//                    Text(
//                        text = "Model:",
//                        color = Color.White,
//                        fontSize = 14.sp,
//                        modifier = Modifier.padding(end = 8.dp)
//                    )
//
//                    Box {
//                        Row(
//                            modifier = Modifier
//                                .clip(RoundedCornerShape(4.dp))
//                                .background(DarkGreen)
//                                .clickable { showModelSelector = !showModelSelector }
//                                .padding(8.dp),
//                            verticalAlignment = Alignment.CenterVertically
//                        ) {
//                            Text(
//                                text = modelOptions.find { it.first == selectedModel }?.second ?: selectedModel,
//                                color = Color.White,
//                                fontSize = 14.sp,
//                                modifier = Modifier.padding(end = 4.dp)
//                            )
//                            Icon(
//                                imageVector = Icons.Default.ArrowDropDown,
//                                contentDescription = "Select Model",
//                                tint = Color.White,
//                                modifier = Modifier.size(20.dp)
//                            )
//                        }
//
//                        DropdownMenu(
//                            expanded = showModelSelector,
//                            onDismissRequest = { showModelSelector = false },
//                            modifier = Modifier.background(DarkGreen)
//                        ) {
//                            modelOptions.forEach { (modelId, modelName) ->
//                                DropdownMenuItem(
//                                    text = { Text(modelName, color = Color.White) },
//                                    onClick = {
//                                        unifiedChatBotViewModel.updateSelectedModel(modelId)
//                                        showModelSelector = false
//                                    },
//                                    colors = MenuDefaults.itemColors(
//                                        textColor = Color.White
//                                    )
//                                )
//                            }
//                        }
//                    }
//                }
                
                // Chat messages
                Box(
                    modifier = Modifier
                        .weight(1f)
                        .fillMaxWidth()
                ) {
                    if (messages.isEmpty()) {
                        // Empty state
                        Column(
                            modifier = Modifier
                                .fillMaxSize()
                                .padding(16.dp),
                            horizontalAlignment = Alignment.CenterHorizontally,
                            verticalArrangement = Arrangement.Center
                        ) {
                            Text(
                                text = "Welcome to OneAI Chat",
                                color = Color.White.copy(alpha = 0.7f),
                                fontSize = 18.sp,
                                textAlign = TextAlign.Center
                            )
                            Spacer(modifier = Modifier.height(8.dp))
                            Text(
                                text = "Let,s Start a Conversation",
                                color = Color.White.copy(alpha = 0.5f),
                                fontSize = 14.sp,
                                textAlign = TextAlign.Center
                            )
                        }
                    } else {
                        LazyColumn(
                            state = listState,
                            modifier = Modifier
                                .fillMaxSize()
                                .padding(16.dp),
                            verticalArrangement = Arrangement.spacedBy(16.dp)
                        ) {
                            items(messages) { message ->
                                MessageBubble(message = message)
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
                        .padding(16.dp)
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
                    
                    // Custom text field with integrated buttons
                    Box(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(horizontal = 16.dp, vertical = 8.dp)
                    ) {
                        // Text field with rounded corners
                        Box(
                            modifier = Modifier
                                .fillMaxWidth()
                                .clip(RoundedCornerShape(24.dp))
                                .background(MediumGreen)
                                .padding(horizontal = 16.dp, vertical = 8.dp)
                        ) {
                            Row(
                                modifier = Modifier.fillMaxWidth(),
                                verticalAlignment = Alignment.CenterVertically
                            ) {
                                // Image picker button inside text field
                                IconButton(
                                    onClick = { imagePickerLauncher.launch("image/*") },
                                    modifier = Modifier.size(40.dp)
                                ) {
                                    Icon(
                                        imageVector = Icons.Default.Image,
                                        contentDescription = "Add Image",
                                        tint = Color.White
                                    )
                                }
                                
                                // Text input
                                BasicTextField(
                                    value = inputText,
                                    onValueChange = { unifiedChatBotViewModel.updateInputText(it) },
                                    modifier = Modifier
                                        .weight(1f)
                                        .padding(horizontal = 8.dp),
                                    textStyle = TextStyle(
                                        color = Color.White,
                                        fontSize = 16.sp
                                    ),
                                    cursorBrush = SolidColor(Color.White),
                                    decorationBox = { innerTextField ->
                                        Box {
                                            if (inputText.text.isEmpty()) {
                                                Text(
                                                    text = "Type a message...",
                                                    color = Color.White.copy(alpha = 0.6f),
                                                    fontSize = 16.sp
                                                )
                                            }
                                            innerTextField()
                                        }
                                    }
                                )
                                
                                // Send button inside text field
                                IconButton(
                                    onClick = { unifiedChatBotViewModel.sendMessage() },
                                    modifier = Modifier
                                        .size(40.dp)
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
    onDeleteChatClicked: (Chat) -> Unit
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

