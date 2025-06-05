package max.ohm.noai.nativeaudiodialog

import android.widget.Toast
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
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.lazy.rememberLazyListState
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Clear
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
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.material3.TopAppBar
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.lifecycle.viewmodel.compose.viewModel
import max.ohm.noai.chatbot.MessageBubble

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun NativeAudioScreen(
    nativeAudioViewModel: NativeAudioViewModel = viewModel()
) {
    val context = LocalContext.current
    val messages = nativeAudioViewModel.messages
    val inputText = nativeAudioViewModel.inputText
    val isLoading = nativeAudioViewModel.isLoading
    val isGeneratingSpeech = nativeAudioViewModel.isGeneratingSpeech
    val errorMessage = nativeAudioViewModel.errorMessage
    val selectedVoice = nativeAudioViewModel.selectedVoice
    
    var showSettings by remember { mutableStateOf(false) }
    var showVoiceDropdown by remember { mutableStateOf(false) }
    
    // Show Toast when errorMessage changes
    LaunchedEffect(errorMessage) {
        errorMessage?.let {
            Toast.makeText(context, it, Toast.LENGTH_LONG).show()
            nativeAudioViewModel.clearErrorMessage()
        }
    }
    
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Gemini 2.5 Native Audio") },
                actions = {
                    // Settings button
                    IconButton(onClick = { showSettings = !showSettings }) {
                        Icon(Icons.Filled.Settings, contentDescription = "Settings")
                    }
                    
                    // Clear button
                    IconButton(onClick = { nativeAudioViewModel.clearMessages() }) {
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
                        
                        // Voice selector
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            verticalAlignment = Alignment.CenterVertically,
                            horizontalArrangement = Arrangement.SpaceBetween
                        ) {
                            Text("Voice")
                            
                            Button(onClick = { showVoiceDropdown = true }) {
                                Text(selectedVoice)
                            }
                            
                            DropdownMenu(
                                expanded = showVoiceDropdown,
                                onDismissRequest = { showVoiceDropdown = false }
                            ) {
                                nativeAudioViewModel.availableVoices.forEach { voice ->
                                    DropdownMenuItem(
                                        text = { Text(voice) },
                                        onClick = {
                                            nativeAudioViewModel.updateSelectedVoice(voice)
                                            showVoiceDropdown = false
                                        }
                                    )
                                }
                            }
                        }
                    }
                }
            }
            
            // Status indicators
            if (isLoading || isGeneratingSpeech) {
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(8.dp),
                    horizontalArrangement = Arrangement.Center,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    CircularProgressIndicator(
                        modifier = Modifier.size(24.dp),
                        strokeWidth = 2.dp
                    )
                    Spacer(modifier = Modifier.width(8.dp))
                    Text(
                        if (isGeneratingSpeech) "Generating speech..." else "Processing...",
                        style = MaterialTheme.typography.bodyMedium
                    )
                }
            }
            
            // Message list
            LazyColumn(
                modifier = Modifier
                    .weight(1f)
                    .fillMaxWidth()
                    .padding(horizontal = 8.dp),
                reverseLayout = true,
                state = rememberLazyListState()
            ) {
                items(messages.reversed(), key = { message -> message.hashCode() }) { message ->
                    MessageBubble(message = message)
                    Spacer(modifier = Modifier.height(8.dp))
                }
            }
            
            // Instructions
            if (messages.isEmpty() && !isLoading && !isGeneratingSpeech) {
                Box(
                    modifier = Modifier
                        .weight(1f)
                        .fillMaxWidth(),
                    contentAlignment = Alignment.Center
                ) {
                    Column(
                        horizontalAlignment = Alignment.CenterHorizontally,
                        verticalArrangement = Arrangement.spacedBy(16.dp)
                    ) {
                        Text(
                            "Enter a message to get an audio response from Gemini 2.5 Native Audio Dialog",
                            style = MaterialTheme.typography.bodyLarge,
                            textAlign = TextAlign.Center,
                            modifier = Modifier.padding(horizontal = 32.dp)
                        )
                    }
                }
            }
            
            // Input field
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(8.dp),
                verticalAlignment = Alignment.CenterVertically
            ) {
                OutlinedTextField(
                    value = inputText,
                    onValueChange = { nativeAudioViewModel.updateInputText(it) },
                    label = { Text("Type a message") },
                    modifier = Modifier.weight(1f),
                    enabled = !isLoading && !isGeneratingSpeech
                )
                
                Spacer(modifier = Modifier.width(8.dp))
                
                Button(
                    onClick = { nativeAudioViewModel.sendMessage(context) },
                    enabled = !isLoading && !isGeneratingSpeech && inputText.text.isNotBlank(),
                    contentPadding = PaddingValues(12.dp)
                ) {
                    Icon(Icons.Filled.Send, contentDescription = "Send")
                }
            }
        }
    }
} 