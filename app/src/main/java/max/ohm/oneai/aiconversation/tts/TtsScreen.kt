package max.ohm.oneai.aiconversation.tts

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
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Check
import androidx.compose.material.icons.filled.Error
import androidx.compose.material.icons.filled.KeyboardVoice
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
import androidx.compose.material3.Snackbar
import androidx.compose.material3.SnackbarHost
import androidx.compose.material3.SnackbarHostState
import androidx.compose.material3.Switch
import androidx.compose.material3.Text
import androidx.compose.material3.TopAppBar
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.rememberCoroutineScope
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.lifecycle.viewmodel.compose.viewModel
import kotlinx.coroutines.launch

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun TtsScreen(ttsViewModel: TtsViewModel = viewModel()) {
    val context = LocalContext.current
    val inputText = ttsViewModel.inputText
    val isLoading = ttsViewModel.isLoading
    val errorMessage = ttsViewModel.errorMessage
    val selectedVoice = ttsViewModel.selectedVoice
    val isMultiSpeaker = ttsViewModel.isMultiSpeaker
    val availableVoices = ttsViewModel.availableVoices
    
    var showVoiceDropdown by remember { mutableStateOf(false) }
    var showSpeaker1VoiceDropdown by remember { mutableStateOf(false) }
    var showSpeaker2VoiceDropdown by remember { mutableStateOf(false) }
    var showSettings by remember { mutableStateOf(false) }
    var showPlaybackSuccess by remember { mutableStateOf(false) }
    
    val snackbarHostState = remember { SnackbarHostState() }
    val scope = rememberCoroutineScope()
    
    // Show Toast when errorMessage changes
    LaunchedEffect(errorMessage) {
        errorMessage?.let {
            Toast.makeText(context, it, Toast.LENGTH_LONG).show()
            ttsViewModel.clearErrorMessage() // Clear message after showing
        }
    }
    
    // Show success message when playback completes
    LaunchedEffect(showPlaybackSuccess) {
        if (showPlaybackSuccess) {
            scope.launch {
                snackbarHostState.showSnackbar("Speech generated and played successfully!")
                showPlaybackSuccess = false
            }
        }
    }
    
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Text to Speech") },
                actions = {
                    IconButton(onClick = { showSettings = !showSettings }) {
                        Icon(Icons.Filled.Settings, contentDescription = "Settings")
                    }
                }
            )
        },
        snackbarHost = {
            SnackbarHost(hostState = snackbarHostState) { data ->
                Snackbar(
                    modifier = Modifier.padding(16.dp),
                    containerColor = MaterialTheme.colorScheme.primaryContainer,
                    contentColor = MaterialTheme.colorScheme.onPrimaryContainer,
                    action = {
                        Button(onClick = { data.dismiss() }) {
                            Text("OK")
                        }
                    }
                ) {
                    Text(data.visuals.message)
                }
            }
        }
    ) { paddingValues ->
        Column(
            modifier = Modifier
                .padding(paddingValues)
                .padding(16.dp)
                .fillMaxSize()
                .verticalScroll(rememberScrollState()),
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            // Settings card (expandable)
            if (showSettings) {
                Card(
                    modifier = Modifier.fillMaxWidth(),
                    shape = RoundedCornerShape(16.dp)
                ) {
                    Column(
                        modifier = Modifier.padding(16.dp),
                        verticalArrangement = Arrangement.spacedBy(8.dp)
                    ) {
                        Text(
                            "Voice Settings",
                            style = MaterialTheme.typography.titleMedium,
                            fontWeight = FontWeight.Bold
                        )
                        
                        // Multi-speaker toggle
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            verticalAlignment = Alignment.CenterVertically,
                            horizontalArrangement = Arrangement.SpaceBetween
                        ) {
                            Text("Multi-speaker conversation")
                            Switch(
                                checked = isMultiSpeaker,
                                onCheckedChange = { ttsViewModel.updateMultiSpeakerMode(it) }
                            )
                        }
                        
                        if (!isMultiSpeaker) {
                            // Single voice selector
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
                                    availableVoices.forEach { voice ->
                                        DropdownMenuItem(
                                            text = { Text(voice) },
                                            onClick = {
                                                ttsViewModel.updateSelectedVoice(voice)
                                                showVoiceDropdown = false
                                            }
                                        )
                                    }
                                }
                            }
                        } else {
                            // Speaker 1 settings
                            Text(
                                "Speaker 1",
                                style = MaterialTheme.typography.bodyMedium,
                                fontWeight = FontWeight.Bold
                            )
                            
                            OutlinedTextField(
                                value = ttsViewModel.speaker1Name,
                                onValueChange = { ttsViewModel.updateSpeaker1Name(it) },
                                label = { Text("Name") },
                                modifier = Modifier.fillMaxWidth()
                            )
                            
                            Row(
                                modifier = Modifier.fillMaxWidth(),
                                verticalAlignment = Alignment.CenterVertically,
                                horizontalArrangement = Arrangement.SpaceBetween
                            ) {
                                Text("Voice")
                                
                                Button(onClick = { showSpeaker1VoiceDropdown = true }) {
                                    Text(ttsViewModel.speaker1Voice)
                                }
                                
                                DropdownMenu(
                                    expanded = showSpeaker1VoiceDropdown,
                                    onDismissRequest = { showSpeaker1VoiceDropdown = false }
                                ) {
                                    availableVoices.forEach { voice ->
                                        DropdownMenuItem(
                                            text = { Text(voice) },
                                            onClick = {
                                                ttsViewModel.updateSpeaker1Voice(voice)
                                                showSpeaker1VoiceDropdown = false
                                            }
                                        )
                                    }
                                }
                            }
                            
                            Spacer(modifier = Modifier.height(8.dp))
                            
                            // Speaker 2 settings
                            Text(
                                "Speaker 2",
                                style = MaterialTheme.typography.bodyMedium,
                                fontWeight = FontWeight.Bold
                            )
                            
                            OutlinedTextField(
                                value = ttsViewModel.speaker2Name,
                                onValueChange = { ttsViewModel.updateSpeaker2Name(it) },
                                label = { Text("Name") },
                                modifier = Modifier.fillMaxWidth()
                            )
                            
                            Row(
                                modifier = Modifier.fillMaxWidth(),
                                verticalAlignment = Alignment.CenterVertically,
                                horizontalArrangement = Arrangement.SpaceBetween
                            ) {
                                Text("Voice")
                                
                                Button(onClick = { showSpeaker2VoiceDropdown = true }) {
                                    Text(ttsViewModel.speaker2Voice)
                                }
                                
                                DropdownMenu(
                                    expanded = showSpeaker2VoiceDropdown,
                                    onDismissRequest = { showSpeaker2VoiceDropdown = false }
                                ) {
                                    availableVoices.forEach { voice ->
                                        DropdownMenuItem(
                                            text = { Text(voice) },
                                            onClick = {
                                                ttsViewModel.updateSpeaker2Voice(voice)
                                                showSpeaker2VoiceDropdown = false
                                            }
                                        )
                                    }
                                }
                            }
                        }
                    }
                }
            }
            
            // Text input area
            OutlinedTextField(
                value = inputText,
                onValueChange = { ttsViewModel.updateInputText(it) },
                label = { 
                    Text(
                        if (isMultiSpeaker) 
                            "Enter conversation (format: Speaker: Text)" 
                        else 
                            "Enter text to speak"
                    ) 
                },
                modifier = Modifier
                    .fillMaxWidth()
                    .height(200.dp),
                singleLine = false,
                enabled = !isLoading
            )
            
            if (isMultiSpeaker) {
                Text(
                    text = "Example format:\n${ttsViewModel.speaker1Name}: Hello, how are you?\n${ttsViewModel.speaker2Name}: I'm doing well, thanks!",
                    style = MaterialTheme.typography.bodySmall,
                    textAlign = TextAlign.Start,
                    modifier = Modifier.fillMaxWidth()
                )
            }
            
            // Generate speech button
            Button(
                onClick = { 
                    ttsViewModel.generateAndPlaySpeech(context)
                    // Set success flag after a delay to simulate completion
                    scope.launch {
                        kotlinx.coroutines.delay(5000) // Wait for 5 seconds
                        if (!isLoading && errorMessage == null) {
                            showPlaybackSuccess = true
                        }
                    }
                },
                enabled = !isLoading && inputText.text.isNotBlank(),
                modifier = Modifier.fillMaxWidth(),
                contentPadding = PaddingValues(16.dp)
            ) {
                if (isLoading) {
                    CircularProgressIndicator(
                        modifier = Modifier.size(24.dp),
                        color = LocalContentColor.current,
                        strokeWidth = 2.dp
                    )
                    Spacer(modifier = Modifier.width(8.dp))
                    Text("Generating speech...")
                } else {
                    Icon(Icons.Filled.KeyboardVoice, contentDescription = "Generate Speech")
                    Spacer(modifier = Modifier.width(8.dp))
                    Text("Generate Speech")
                }
            }
            
            // Status indicator
            if (!isLoading && errorMessage == null && showPlaybackSuccess) {
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(8.dp),
                    horizontalArrangement = Arrangement.Center,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Icon(
                        Icons.Filled.Check,
                        contentDescription = "Success",
                        tint = Color.Green
                    )
                    Spacer(modifier = Modifier.width(8.dp))
                    Text(
                        "Speech played successfully!",
                        color = Color.Green
                    )
                }
            } else if (errorMessage != null) {
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(8.dp),
                    horizontalArrangement = Arrangement.Center,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Icon(
                        Icons.Filled.Error,
                        contentDescription = "Error",
                        tint = Color.Red
                    )
                    Spacer(modifier = Modifier.width(8.dp))
                    Text(
                        errorMessage,
                        color = Color.Red
                    )
                }
            }
            
            // Information text
            Text(
                text = "Powered by Gemini 2.5 Flash TTS",
                style = MaterialTheme.typography.bodySmall,
                textAlign = TextAlign.Center,
                modifier = Modifier.fillMaxWidth()
            )
            
            // Volume reminder
            Text(
                text = "Make sure your device volume is turned up!",
                style = MaterialTheme.typography.bodySmall,
                textAlign = TextAlign.Center,
                fontWeight = FontWeight.Bold,
                color = MaterialTheme.colorScheme.primary,
                modifier = Modifier.fillMaxWidth()
            )
        }
    }
} 
