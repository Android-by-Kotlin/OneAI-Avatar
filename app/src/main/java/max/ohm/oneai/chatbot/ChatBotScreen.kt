package max.ohm.oneai.chatbot

import android.net.Uri
import android.provider.MediaStore
import android.widget.Toast
import androidx.activity.compose.rememberLauncherForActivityResult
import androidx.activity.result.contract.ActivityResultContracts
import androidx.compose.animation.core.*
import androidx.compose.animation.*
import androidx.compose.foundation.background
import androidx.compose.foundation.BorderStroke
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.ui.draw.blur
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.graphicsLayer
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
import androidx.compose.foundation.layout.offset
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
import androidx.compose.material.icons.filled.CheckCircle
import androidx.compose.material.icons.filled.KeyboardArrowDown
import androidx.compose.material.icons.outlined.Delete
import androidx.compose.material.icons.outlined.Psychology
import androidx.compose.material.icons.outlined.AutoAwesome
import androidx.compose.material.icons.outlined.WorkspacePremium
import androidx.compose.material.icons.outlined.Stars
import androidx.compose.material.icons.outlined.TipsAndUpdates
import androidx.compose.material.icons.outlined.Palette
import androidx.compose.material.icons.outlined.RocketLaunch
import androidx.compose.material.icons.outlined.Bolt
import androidx.compose.material3.Surface
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
        "provider-3/gpt-4.1-nano" to "GPT-4.1-Nano",
        "provider-3/kimi-k2" to "Kimi K2",
        "provider-1/deepseek-r1-0528" to "DeepSeek R1",
        "provider-6/r1-1776" to "Perplexity-R1",
        "provider-2/qwen-3-235b" to "Qwen 3",
        "provider-6/horizon-beta" to "GPT-Horizon Beta",
        "provider-3/gpt-5-nano" to "GPT-5 Nano",
        "provider-6/gpt-4o" to "GPT-4o",
        "provider-6/gemini-2.5-flash" to "Gemini 2.5 Flash"
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
        if (isLoading && messages.isNotEmpty()) {
            // When loading starts, scroll to show the thinking animation
            delay(100) // Short delay for smoother experience
            listState.animateScrollToItem(messages.size)
        } else if (!isLoading && messages.isNotEmpty()) {
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
    SetStatusBarColor(Color.Black)
    
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
                    .background(Color.Black)
            ) {
                // Top bar with menu and title
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .background(Color.Transparent)
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
                    
                    // Enhanced Model Selector
                    EnhancedChatModelSelector(
                        selectedModel = selectedModel,
                        modelOptions = modelOptions,
                        expanded = showModelSelector,
                        onExpandedChange = { showModelSelector = it },
                        onModelSelected = { modelId ->
                            unifiedChatBotViewModel.updateSelectedModel(modelId)
                            showModelSelector = false
                        }
                    )
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
                            
                            // Show thinking bubble when loading
                            if (isLoading) {
                                item {
                                    MessageBubble(
                                        message = Message(
                                            text = "",
                                            isUser = false,
                                            image = null,
                                            id = -1 // Special ID for thinking bubble
                                        ),
                                        isNewMessage = false,
                                        isTyping = true,
                                        isTypingSoundEnabled = false,
                                        isThinking = true
                                    )
                                }
                            }
                            
                            // Add a spacer at the bottom for better UX
                            item {
                                Spacer(modifier = Modifier.height(8.dp))
                            }
                        }
                    }
                }
                
                // Input area
                Column(
                    modifier = Modifier
                        .fillMaxWidth()
                        .background(Color.Transparent)
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
                                .background(Color.Transparent, CircleShape)
                        ) {
                            Icon(
                                imageVector = Icons.Default.Image,
                                contentDescription = "Add Image",
                                tint = Color.White,
                                modifier = Modifier.size(24.dp)
                            )
                        }
                        
                        Spacer(modifier = Modifier.width(8.dp))
                        
                        // OutlinedTextField with gradient border
                        Box(
                            modifier = Modifier
                                .weight(1f)
                                .border(
                                    width = 2.dp,
                                    color = Color(0xFF00C853), // Bright green
                                    shape = RoundedCornerShape(24.dp)
                                )
                        ) {
                            OutlinedTextField(
                                value = inputText,
                                onValueChange = { unifiedChatBotViewModel.updateInputText(it) },
                                placeholder = {
                                    Text(
                                        text = "Type a message...",
                                        color = Color.White.copy(alpha = 0.7f),
                                        fontSize = 16.sp
                                    )
                                },
                                modifier = Modifier.fillMaxWidth(),
                                enabled = !isLoading,
                                colors = OutlinedTextFieldDefaults.colors(
                                    focusedBorderColor = Color.Transparent,
                                    unfocusedBorderColor = Color.Transparent,
                                    focusedTextColor = Color.White,
                                    unfocusedTextColor = Color.White,
                                    cursorColor = Color.White,
                                    focusedContainerColor = Color.Transparent,
                                    unfocusedContainerColor = Color.Transparent
                                ),
                                shape = RoundedCornerShape(24.dp),
                                maxLines = 5,
                                singleLine = false
                            )
                        }
                        
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
    Box(
        modifier = Modifier
            .fillMaxHeight()
            .width(280.dp)
    ) {
        // Glassmorphism background with animated orbs
        Box(
            modifier = Modifier
                .fillMaxSize()
                .background(
                    Brush.verticalGradient(
                        colors = listOf(
                            Color(0xFF0A0E27), // DarkBackground
                            Color(0xFF0A0E27).copy(alpha = 0.95f),
                            Color(0xFF0F172A)
                        )
                    )
                )
        ) {
            // Animated background orbs
            repeat(3) { index ->
                val infiniteTransition = androidx.compose.animation.core.rememberInfiniteTransition(label = "drawer_orb_$index")
                val offsetX by infiniteTransition.animateFloat(
                    initialValue = -100f + index * 80f,
                    targetValue = 100f + index * 80f,
                    animationSpec = androidx.compose.animation.core.infiniteRepeatable(
                        animation = androidx.compose.animation.core.tween(
                            durationMillis = 6000 + index * 1500,
                            easing = androidx.compose.animation.core.EaseInOutSine
                        ),
                        repeatMode = androidx.compose.animation.core.RepeatMode.Reverse
                    ),
                    label = "drawer_orb_offset_x_$index"
                )
                val offsetY by infiniteTransition.animateFloat(
                    initialValue = -80f + index * 120f,
                    targetValue = 80f + index * 120f,
                    animationSpec = androidx.compose.animation.core.infiniteRepeatable(
                        animation = androidx.compose.animation.core.tween(
                            durationMillis = 8000 + index * 1000,
                            easing = androidx.compose.animation.core.EaseInOutSine
                        ),
                        repeatMode = androidx.compose.animation.core.RepeatMode.Reverse
                    ),
                    label = "drawer_orb_offset_y_$index"
                )
                
                Box(
                    modifier = Modifier
                        .offset(x = offsetX.dp, y = offsetY.dp)
                        .size(120.dp + (index * 20).dp)
                        .background(
                            brush = Brush.radialGradient(
                                colors = when (index) {
                                    0 -> listOf(
                                        Color(0xFF8B5CF6).copy(alpha = 0.08f), // GradientPurple
                                        Color.Transparent
                                    )
                                    1 -> listOf(
                                        Color(0xFFEC4899).copy(alpha = 0.06f), // GradientPink
                                        Color.Transparent
                                    )
                                    else -> listOf(
                                        Color(0xFF06B6D4).copy(alpha = 0.05f), // GradientCyan
                                        Color.Transparent
                                    )
                                }
                            ),
                            shape = CircleShape
                        )
                        .blur(40.dp)
                )
            }
        }
        
        // Content overlay
        Column(
            modifier = Modifier
                .fillMaxSize()
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

                // Sound toggle and New chat buttons - smaller and more beautiful
                Row(
                    horizontalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    // Sound toggle button - smaller with theme colors
                    Box(
                        modifier = Modifier
                            .size(32.dp)
                            .background(
                                brush = if (isTypingSoundEnabled) {
                                    Brush.linearGradient(
                                        colors = listOf(
                                            Color(0xFF10B981), // GradientCyan
                                            Color(0xFF06B6D4)
                                        )
                                    )
                                } else {
                                    Brush.linearGradient(
                                        colors = listOf(
                                            Color(0xFF6B7280),
                                            Color(0xFF4B5563)
                                        )
                                    )
                                },
                                shape = CircleShape
                            )
                            .clickable { onToggleTypingSound() },
                        contentAlignment = Alignment.Center
                    ) {
                        Icon(
                            imageVector = if (isTypingSoundEnabled) 
                                Icons.Default.VolumeUp else Icons.Default.VolumeOff,
                            contentDescription = if (isTypingSoundEnabled) 
                                "Disable typing sound" else "Enable typing sound",
                            tint = Color.White,
                            modifier = Modifier.size(16.dp)
                        )
                    }
                    
                    // New chat button - smaller with theme colors
                    Box(
                        modifier = Modifier
                            .size(32.dp)
                            .background(
                                brush = Brush.linearGradient(
                                    colors = listOf(
                                        Color(0xFF8B5CF6), // GradientPurple
                                        Color(0xFFEC4899)  // GradientPink
                                    )
                                ),
                                shape = CircleShape
                            )
                            .clickable { onNewChatClicked() },
                        contentAlignment = Alignment.Center
                    ) {
                        Icon(
                            imageVector = Icons.Default.Add,
                            contentDescription = "New Conversation",
                            tint = Color.White,
                            modifier = Modifier.size(16.dp)
                        )
                    }
                }
            }

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
                                if (isSelected) {
                                    Brush.horizontalGradient(
                                        colors = listOf(
                                            Color(0xFF8B5CF6).copy(alpha = 0.2f),
                                            Color(0xFFEC4899).copy(alpha = 0.1f)
                                        )
                                    )
                                } else {
                                    Brush.horizontalGradient(
                                        colors = listOf(Color.Transparent, Color.Transparent)
                                    )
                                }
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

                        // Delete button - smaller and more colorful
                        Box(
                            modifier = Modifier
                                .size(28.dp)
                                .background(
                                    Color(0xFFDC2626).copy(alpha = 0.2f),
                                    CircleShape
                                )
                                .clickable { onDeleteChatClicked(chat) },
                            contentAlignment = Alignment.Center
                        ) {
                            Icon(
                                imageVector = Icons.Outlined.Delete,
                                contentDescription = "Delete Conversation",
                                tint = Color(0xFFDC2626),
                                modifier = Modifier.size(14.dp)
                            )
                        }
                    }
                }
            }
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun EnhancedChatModelSelector(
    selectedModel: String,
    modelOptions: List<Pair<String, String>>,
    expanded: Boolean,
    onExpandedChange: (Boolean) -> Unit,
    onModelSelected: (String) -> Unit
) {
    // Animation for arrow rotation
    val rotationAngle by animateFloatAsState(
        targetValue = if (expanded) 180f else 0f,
        animationSpec = spring(
            dampingRatio = Spring.DampingRatioMediumBouncy,
            stiffness = Spring.StiffnessLow
        ),
        label = "arrow_rotation"
    )
    
    val currentModelName = modelOptions.find { it.first == selectedModel }?.second ?: "Select Model"
    
    Box {
        // Enhanced Trigger with Matrix/Hacker Styling
        Surface(
            modifier = Modifier
                .clickable { onExpandedChange(!expanded) }
                .width(180.dp),
            shape = RoundedCornerShape(12.dp),
            color = if (expanded) {
                Color(0xFF0A0E27).copy(alpha = 0.9f)
            } else {
                Color.Black.copy(alpha = 0.8f)
            },
            border = BorderStroke(
                width = 1.5.dp,
                color = if (expanded) {
                    Color(0xFF00FF88).copy(alpha = 0.8f) // Bright green when expanded
                } else {
                    Color(0xFF00C853).copy(alpha = 0.6f) // Chatbot green
                }
            )
        ) {
            Row(
                modifier = Modifier
                    .padding(horizontal = 12.dp, vertical = 8.dp),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Row(
                    verticalAlignment = Alignment.CenterVertically,
                    modifier = Modifier.weight(1f)
                ) {
                    // AI Brain Icon
                    Box(
                        modifier = Modifier
                            .size(28.dp)
                            .clip(RoundedCornerShape(8.dp))
                            .background(
                                Brush.linearGradient(
                                    colors = when {
                                        currentModelName.contains("GPT") -> listOf(
                                            Color(0xFF00FF88).copy(alpha = 0.2f),
                                            Color(0xFF00C853).copy(alpha = 0.2f)
                                        )
                                        currentModelName.contains("Gemini") -> listOf(
                                            Color(0xFF06B6D4).copy(alpha = 0.2f),
                                            Color(0xFF0EA5E9).copy(alpha = 0.2f)
                                        )
                                        currentModelName.contains("DeepSeek") -> listOf(
                                            Color(0xFF8B5CF6).copy(alpha = 0.2f),
                                            Color(0xFFEC4899).copy(alpha = 0.2f)
                                        )
                                        else -> listOf(
                                            Color(0xFF10B981).copy(alpha = 0.2f),
                                            Color(0xFF06B6D4).copy(alpha = 0.2f)
                                        )
                                    }
                                )
                            ),
                        contentAlignment = Alignment.Center
                    ) {
                        Icon(
                            imageVector = when {
                                currentModelName.contains("GPT-5") || currentModelName.contains("GPT-4.1") -> Icons.Outlined.Stars
                                currentModelName.contains("GPT") -> Icons.Outlined.AutoAwesome
                                currentModelName.contains("Gemini") -> Icons.Outlined.Psychology
                                currentModelName.contains("DeepSeek") -> Icons.Outlined.TipsAndUpdates
                                currentModelName.contains("Perplexity") -> Icons.Outlined.RocketLaunch
                                else -> Icons.Outlined.Psychology
                            },
                            contentDescription = null,
                            tint = when {
                                currentModelName.contains("GPT") -> Color(0xFF00FF88)
                                currentModelName.contains("Gemini") -> Color(0xFF06B6D4)
                                currentModelName.contains("DeepSeek") -> Color(0xFF8B5CF6)
                                else -> Color(0xFF10B981)
                            },
                            modifier = Modifier.size(16.dp)
                        )
                    }
                    
                    Spacer(modifier = Modifier.width(8.dp))
                    
                    Column {
                        Text(
                            text = currentModelName,
                            color = Color.White,
                            fontSize = 13.sp,
                            fontWeight = FontWeight.SemiBold,
                            maxLines = 1,
                            overflow = TextOverflow.Ellipsis
                        )
                        // Model Type Badge
                        Text(
                            text = when {
                                currentModelName.contains("GPT-5") -> "Next-Gen • Ultra"
                                currentModelName.contains("GPT-4.1") -> "Advanced • Nano"
                                currentModelName.contains("GPT-4o") -> "Optimized • Fast"
                                currentModelName.contains("Gemini 2.5") -> "Latest • Enhanced"
                                currentModelName.contains("Gemini") -> "Multimodal • Smart"
                                currentModelName.contains("DeepSeek") -> "Reasoning • Deep"
                                currentModelName.contains("Perplexity") -> "Research • R1"
                                currentModelName.contains("Qwen") -> "Multilingual • 3B"
                                else -> "Conversational • AI"
                            },
                            color = when {
                                currentModelName.contains("GPT-5") || currentModelName.contains("GPT-4.1") -> 
                                    Color(0xFF00FF88).copy(alpha = 0.9f)
                                else -> Color.White.copy(alpha = 0.6f)
                            },
                            fontSize = 10.sp,
                            fontWeight = FontWeight.Normal
                        )
                    }
                }
                
                // Animated Arrow Icon
                Icon(
                    imageVector = Icons.Default.KeyboardArrowDown,
                    contentDescription = null,
                    tint = Color(0xFF00C853),
                    modifier = Modifier
                        .size(20.dp)
                        .graphicsLayer {
                            rotationZ = rotationAngle
                        }
                )
            }
        }
        
        // Enhanced Dropdown Menu
        AnimatedVisibility(
            visible = expanded,
            enter = expandVertically(
                animationSpec = spring(
                    dampingRatio = Spring.DampingRatioLowBouncy,
                    stiffness = Spring.StiffnessLow
                )
            ) + fadeIn(),
            exit = shrinkVertically() + fadeOut()
        ) {
            Surface(
                modifier = Modifier
                    .width(280.dp) // Adjusted width to fit better
                    .padding(top = 4.dp)
                    .clip(RoundedCornerShape(16.dp)),
                color = Color(0xFF0A0E27).copy(alpha = 0.95f),
                border = BorderStroke(
                    width = 1.dp,
                    color = Color(0xFF00C853).copy(alpha = 0.3f)
                ),
                shadowElevation = 12.dp
            ) {
                LazyColumn(
                    modifier = Modifier.padding(8.dp),
                    verticalArrangement = Arrangement.spacedBy(2.dp)
                ) {
                    items(modelOptions.size) { index ->
                        val (modelId, modelName) = modelOptions[index]
                        val isSelected = modelId == selectedModel
                        
                        Surface(
                            modifier = Modifier
                                .fillMaxWidth()
                                .animateContentSize(),
                            color = if (isSelected) {
                                Color(0xFF00C853).copy(alpha = 0.15f)
                            } else {
                                Color.Transparent
                            },
                            shape = RoundedCornerShape(12.dp),
                            onClick = {
                                onModelSelected(modelId)
                                onExpandedChange(false)
                            }
                        ) {
                            Row(
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .padding(12.dp),
                                verticalAlignment = Alignment.CenterVertically,
                                horizontalArrangement = Arrangement.spacedBy(12.dp)
                            ) {
                                // Selection Indicator
                                Box(
                                    modifier = Modifier.size(18.dp),
                                    contentAlignment = Alignment.Center
                                ) {
                                    if (isSelected) {
                                        Icon(
                                            imageVector = Icons.Default.CheckCircle,
                                            contentDescription = null,
                                            tint = Color(0xFF00FF88),
                                            modifier = Modifier.size(18.dp)
                                        )
                                    } else {
                                        Box(
                                            modifier = Modifier
                                                .size(18.dp)
                                                .border(
                                                    width = 1.5.dp,
                                                    color = Color.White.copy(alpha = 0.3f),
                                                    shape = CircleShape
                                                )
                                        )
                                    }
                                }
                                
                                // Model Icon
                                Box(
                                    modifier = Modifier
                                        .size(36.dp)
                                        .clip(RoundedCornerShape(10.dp))
                                        .background(
                                            if (isSelected) {
                                                Brush.linearGradient(
                                                    colors = listOf(
                                                        Color(0xFF00FF88).copy(alpha = 0.2f),
                                                        Color(0xFF00C853).copy(alpha = 0.2f)
                                                    )
                                                )
                                            } else {
                                                Brush.linearGradient(
                                                    colors = listOf(
                                                        Color.White.copy(alpha = 0.05f),
                                                        Color.White.copy(alpha = 0.02f)
                                                    )
                                                )
                                            }
                                        ),
                                    contentAlignment = Alignment.Center
                                ) {
                                    Icon(
                                        imageVector = when {
                                            modelName.contains("GPT-5") || modelName.contains("GPT-4.1") -> Icons.Outlined.Stars
                                            modelName.contains("GPT-4o") -> Icons.Outlined.WorkspacePremium
                                            modelName.contains("GPT") -> Icons.Outlined.AutoAwesome
                                            modelName.contains("Gemini 2.5") -> Icons.Outlined.Stars
                                            modelName.contains("Gemini") -> Icons.Outlined.Psychology
                                            modelName.contains("DeepSeek") -> Icons.Outlined.TipsAndUpdates
                                            modelName.contains("Perplexity") -> Icons.Outlined.RocketLaunch
                                            modelName.contains("Kimi") -> Icons.Outlined.Palette
                                            modelName.contains("Qwen") -> Icons.Outlined.Bolt
                                            else -> Icons.Outlined.Psychology
                                        },
                                        contentDescription = null,
                                        tint = if (isSelected) {
                                            Color(0xFF00FF88)
                                        } else {
                                            Color.White.copy(alpha = 0.7f)
                                        },
                                        modifier = Modifier.size(20.dp)
                                    )
                                }
                                
                                // Model Details
                                Column(
                                    modifier = Modifier.weight(1f),
                                    verticalArrangement = Arrangement.spacedBy(4.dp)
                                ) {
                                    Text(
                                        text = modelName,
                                        color = if (isSelected) Color.White else Color.White.copy(alpha = 0.9f),
                                        fontSize = 14.sp,
                                        fontWeight = if (isSelected) FontWeight.SemiBold else FontWeight.Medium
                                    )
                                    
                                    // Model Features/Tags
                                    Row(
                                        horizontalArrangement = Arrangement.spacedBy(6.dp),
                                        verticalAlignment = Alignment.CenterVertically
                                    ) {
                                        // Quality Badge
                                        val (badgeText, badgeColor) = when {
                                            modelName.contains("GPT-5") -> "Next-Gen" to Color(0xFF00FF88)
                                            modelName.contains("GPT-4.1") -> "Advanced" to Color(0xFF00FF88)
                                            modelName.contains("GPT-4o") -> "Optimized" to Color(0xFF10B981)
                                            modelName.contains("Gemini 2.5") -> "Latest" to Color(0xFF06B6D4)
                                            modelName.contains("Gemini") -> "Smart" to Color(0xFF06B6D4)
                                            modelName.contains("DeepSeek") -> "Reasoning" to Color(0xFF8B5CF6)
                                            modelName.contains("Perplexity") -> "Research" to Color(0xFFEC4899)
                                            modelName.contains("Horizon") -> "Beta" to Color(0xFFF59E0B)
                                            else -> "Standard" to Color.White.copy(alpha = 0.6f)
                                        }
                                        
                                        Surface(
                                            shape = RoundedCornerShape(4.dp),
                                            color = badgeColor.copy(alpha = 0.15f)
                                        ) {
                                            Text(
                                                text = badgeText,
                                                color = badgeColor,
                                                fontSize = 10.sp,
                                                fontWeight = FontWeight.Bold,
                                                modifier = Modifier.padding(horizontal = 6.dp, vertical = 2.dp)
                                            )
                                        }
                                        
                                        // Premium indicator for advanced models
                                        if (modelName.contains("GPT-5") || modelName.contains("GPT-4.1") || modelName.contains("Gemini 2.5")) {
                                            Row(
                                                verticalAlignment = Alignment.CenterVertically,
                                                horizontalArrangement = Arrangement.spacedBy(2.dp)
                                            ) {
                                                Icon(
                                                    imageVector = Icons.Outlined.Bolt,
                                                    contentDescription = null,
                                                    tint = Color(0xFF00FF88),
                                                    modifier = Modifier.size(12.dp)
                                                )
                                                Text(
                                                    text = "Premium",
                                                    color = Color(0xFF00FF88),
                                                    fontSize = 10.sp
                                                )
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        
                        if (index < modelOptions.size - 1) {
                            Box(
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .height(0.5.dp)
                                    .background(Color.White.copy(alpha = 0.1f))
                            )
                        }
                    }
                    
                    item {
                        Spacer(modifier = Modifier.height(4.dp))
                    }
                }
            }
        }
    }
}
