package max.ohm.oneai.aiconversation.conversation

import android.widget.Toast
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
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
import androidx.compose.foundation.lazy.itemsIndexed
import androidx.compose.foundation.lazy.rememberLazyListState
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Clear
import androidx.compose.material.icons.filled.KeyboardVoice
import androidx.compose.material.icons.filled.Send
import androidx.compose.material.icons.filled.Settings
import androidx.compose.material3.Button
import androidx.compose.material3.Card
import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.material3.DropdownMenu
import androidx.compose.material3.DropdownMenuItem
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.LocalContentColor
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Switch
import androidx.compose.material3.Text
import androidx.compose.material3.TopAppBar
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.derivedStateOf
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.lifecycle.viewmodel.compose.viewModel
import max.ohm.oneai.chatbot.MessageBubble

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun AiConversationScreen(
    aiConversationViewModel: AiConversationViewModel = viewModel()
) {
    val context = LocalContext.current
    val messages = aiConversationViewModel.messages
    val inputText = aiConversationViewModel.inputText
    val isLoading = aiConversationViewModel.isLoading
    val isGeneratingSpeech = aiConversationViewModel.isGeneratingSpeech
    val errorMessage = aiConversationViewModel.errorMessage
    val selectedLlmModel = aiConversationViewModel.selectedLlmModel
    val selectedVoice = aiConversationViewModel.selectedVoice
    val autoTts = aiConversationViewModel.autoTts
    
    var showSettings by remember { mutableStateOf(false) }
    var showLlmModelDropdown by remember { mutableStateOf(false) }
    var showVoiceDropdown by remember { mutableStateOf(false) }
    
    val listState = rememberLazyListState()
    val shouldScrollToBottom by remember {
        derivedStateOf {
            messages.isNotEmpty()
        }
    }
    
    // Scroll to bottom when new messages arrive
    LaunchedEffect(shouldScrollToBottom, messages.size) {
        if (messages.isNotEmpty()) {
            listState.animateScrollToItem(0)
        }
    }
    
    // Show Toast when errorMessage changes
    LaunchedEffect(errorMessage) {
        errorMessage?.let {
            Toast.makeText(context, it, Toast.LENGTH_LONG).show()
            aiConversationViewModel.clearErrorMessage()
        }
    }
    
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("AI Conversation") },
                actions = {
                    // Settings button
                    IconButton(onClick = { showSettings = !showSettings }) {
                        Icon(Icons.Filled.Settings, contentDescription = "Settings")
                    }
                    
                    // Clear button
                    IconButton(onClick = { aiConversationViewModel.clearMessages() }) {
                        Icon(Icons.Filled.Clear, contentDescription = "Clear Chat")
                    }
                }
            )
        }
    ) { paddingValues ->
        Column(
            modifier = Modifier
                .padding(paddingValues)
                .fillMaxSize()
        ) {
            // Settings panel (expandable)
            if (showSettings) {
                Card(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(8.dp),
                    shape = RoundedCornerShape(16.dp)
                ) {
                    Column(
                        modifier = Modifier.padding(16.dp),
                        verticalArrangement = Arrangement.spacedBy(8.dp)
                    ) {
                        Text(
                            "Settings",
                            style = MaterialTheme.typography.titleMedium,
                            fontWeight = FontWeight.Bold
                        )
                        
                        // Auto TTS toggle
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            verticalAlignment = Alignment.CenterVertically,
                            horizontalArrangement = Arrangement.SpaceBetween
                        ) {
                            Text("Auto Text-to-Speech")
                            Switch(
                                checked = autoTts,
                                onCheckedChange = { aiConversationViewModel.updateAutoTts(it) }
                            )
                        }
                        
                        // LLM Model selector
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            verticalAlignment = Alignment.CenterVertically,
                            horizontalArrangement = Arrangement.SpaceBetween
                        ) {
                            Text("LLM Model")
                            
                            Button(onClick = { showLlmModelDropdown = true }) {
                                Text(selectedLlmModel.substringAfterLast('/').substringBefore(':'))
                            }
                            
                            DropdownMenu(
                                expanded = showLlmModelDropdown,
                                onDismissRequest = { showLlmModelDropdown = false }
                            ) {
                                aiConversationViewModel.availableLlmModels.forEach { model ->
                                    DropdownMenuItem(
                                        text = { Text(model.substringAfterLast('/').substringBefore(':')) },
                                        onClick = {
                                            aiConversationViewModel.updateSelectedLlmModel(model)
                                            showLlmModelDropdown = false
                                        }
                                    )
                                }
                            }
                        }
                        
                        // Voice selector
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            verticalAlignment = Alignment.CenterVertically,
                            horizontalArrangement = Arrangement.SpaceBetween
                        ) {
                            Text("TTS Voice")
                            
                            Button(onClick = { showVoiceDropdown = true }) {
                                Text(selectedVoice)
                            }
                            
                            DropdownMenu(
                                expanded = showVoiceDropdown,
                                onDismissRequest = { showVoiceDropdown = false }
                            ) {
                                aiConversationViewModel.availableVoices.forEach { voice ->
                                    DropdownMenuItem(
                                        text = { Text(voice) },
                                        onClick = {
                                            aiConversationViewModel.updateSelectedVoice(voice)
                                            showVoiceDropdown = false
                                        }
                                    )
                                }
                            }
                        }
                    }
                }
            }
            
            // Message list
            LazyColumn(
                modifier = Modifier
                    .weight(1f)
                    .fillMaxWidth()
                    .padding(horizontal = 8.dp),
                reverseLayout = true,
                state = listState
            ) {
                itemsIndexed(messages.reversed(), key = { _, message -> message.hashCode() }) { index, message ->
                    val actualIndex = messages.size - 1 - index
                    
                    Box(
                        modifier = Modifier.fillMaxWidth(),
                        contentAlignment = if (message.isUser) Alignment.CenterEnd else Alignment.CenterStart
                    ) {
                        Row(
                            verticalAlignment = Alignment.Bottom,
                            horizontalArrangement = if (message.isUser) Arrangement.End else Arrangement.Start,
                            modifier = Modifier.fillMaxWidth()
                        ) {
                            // TTS button for AI messages
                            if (!message.isUser) {
                                IconButton(
                                    onClick = { aiConversationViewModel.generateSpeechForMessage(context, actualIndex) },
                                    modifier = Modifier
                                        .size(32.dp)
                                        .clip(CircleShape)
                                        .background(MaterialTheme.colorScheme.primaryContainer)
                                ) {
                                    Icon(
                                        Icons.Filled.KeyboardVoice,
                                        contentDescription = "Speak",
                                        tint = MaterialTheme.colorScheme.onPrimaryContainer,
                                        modifier = Modifier.size(16.dp)
                                    )
                                }
                                Spacer(modifier = Modifier.width(4.dp))
                            }
                            
                            // Message bubble
                            MessageBubble(message = message)
                            
                            if (message.isUser) {
                                Spacer(modifier = Modifier.width(36.dp)) // Balance with TTS button space
                            }
                        }
                    }
                    
                    Spacer(modifier = Modifier.height(8.dp))
                }
            }
            
            // Input area
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(8.dp),
                verticalAlignment = Alignment.CenterVertically
            ) {
                OutlinedTextField(
                    value = inputText,
                    onValueChange = { aiConversationViewModel.updateInputText(it) },
                    label = { Text("Type a message") },
                    modifier = Modifier.weight(1f),
                    singleLine = false,
                    maxLines = 5,
                    enabled = !isLoading && !isGeneratingSpeech
                )
                
                Spacer(modifier = Modifier.width(8.dp))
                
                Button(
                    onClick = { aiConversationViewModel.sendMessage(context) },
                    enabled = !isLoading && !isGeneratingSpeech && inputText.text.isNotBlank(),
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
            
            // Status indicator
            if (isGeneratingSpeech) {
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(8.dp),
                    horizontalArrangement = Arrangement.Center,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    CircularProgressIndicator(
                        modifier = Modifier.size(16.dp),
                        strokeWidth = 2.dp
                    )
                    Spacer(modifier = Modifier.width(8.dp))
                    Text(
                        "Generating speech...",
                        style = MaterialTheme.typography.bodySmall
                    )
                }
            }
        }
    }
} 

