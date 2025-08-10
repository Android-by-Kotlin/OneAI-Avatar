package max.ohm.oneai.aitalk

import android.Manifest
import android.content.Intent
import android.content.pm.PackageManager
import android.speech.RecognizerIntent
import android.widget.Toast
import androidx.activity.compose.rememberLauncherForActivityResult
import androidx.activity.result.ActivityResult
import androidx.activity.result.contract.ActivityResultContracts
import androidx.compose.animation.core.*
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
import androidx.compose.foundation.layout.offset
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.lazy.rememberLazyListState
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Clear
import androidx.compose.material.icons.filled.Mic
import androidx.compose.material.icons.filled.MicOff
import androidx.compose.material.icons.filled.Settings
import androidx.compose.material3.Button
import androidx.compose.material3.Card
import androidx.compose.material3.CardDefaults
import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.material3.DropdownMenu
import androidx.compose.material3.DropdownMenuItem
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.FloatingActionButton
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.material3.TopAppBar
import androidx.compose.material3.TopAppBarDefaults
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.scale
import androidx.compose.ui.draw.blur
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.core.content.ContextCompat
import androidx.lifecycle.viewmodel.compose.viewModel
import max.ohm.oneai.chatbot.MessageBubble
import max.ohm.oneai.ui.theme.*

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun AiTalkScreen(
    aiTalkViewModel: AiTalkViewModel = viewModel()
) {
    val context = LocalContext.current
    val messages = aiTalkViewModel.messages
    val isListening = aiTalkViewModel.isListening
    val isProcessing = aiTalkViewModel.isProcessing
    val isGeneratingSpeech = aiTalkViewModel.isGeneratingSpeech
    val errorMessage = aiTalkViewModel.errorMessage
    val recognizedText = aiTalkViewModel.recognizedText
    val selectedLlmModel = aiTalkViewModel.selectedLlmModel
    val selectedVoice = aiTalkViewModel.selectedVoice
    val useDirectSpeechRecognition = aiTalkViewModel.useDirectSpeechRecognition
    
    var showSettings by remember { mutableStateOf(false) }
    var showLlmModelDropdown by remember { mutableStateOf(false) }
    var showVoiceDropdown by remember { mutableStateOf(false) }
    
    // Animation for the mic button when listening
    val scale by animateFloatAsState(
        targetValue = if (isListening) 1.2f else 1f,
        animationSpec = infiniteRepeatable(animation = tween(500)),
        label = "MicScale"
    )
    
    // Background animations
    val infiniteTransition = rememberInfiniteTransition(label = "background_animation")
    
    // Permission handling
    val audioPermission = Manifest.permission.RECORD_AUDIO
    val permissionState = ContextCompat.checkSelfPermission(context, audioPermission) == PackageManager.PERMISSION_GRANTED
    var hasPermission by remember { mutableStateOf(permissionState) }
    
    // Activity result launcher for speech recognition
    val speechRecognitionLauncher = rememberLauncherForActivityResult(
        contract = ActivityResultContracts.StartActivityForResult()
    ) { result: ActivityResult ->
        aiTalkViewModel.handleSpeechResult(result.resultCode, result.data)
    }
    
    // Lambda to start speech recognition based on available method
    val startSpeechRecognition: () -> Unit = {
        if (!useDirectSpeechRecognition) {
            // Use system activity for speech recognition
            aiTalkViewModel.launchSystemSpeechRecognition(speechRecognitionLauncher)
        } else {
            // Use direct SpeechRecognizer API
            aiTalkViewModel.startListening(context)
        }
    }
    
    val permissionLauncher = rememberLauncherForActivityResult(
        contract = ActivityResultContracts.RequestPermission()
    ) { isGranted ->
        hasPermission = isGranted
        if (isGranted) {
            aiTalkViewModel.initSpeechRecognizer(context)
            startSpeechRecognition.invoke()
        } else {
            Toast.makeText(context, "Microphone permission is required for voice input", Toast.LENGTH_LONG).show()
        }
    }
    
    // Initialize speech recognizer
    LaunchedEffect(Unit) {
        if (hasPermission) {
            aiTalkViewModel.initSpeechRecognizer(context)
        }
    }
    
    // Show Toast when errorMessage changes
    LaunchedEffect(errorMessage) {
        errorMessage?.let {
            Toast.makeText(context, it, Toast.LENGTH_LONG).show()
            aiTalkViewModel.clearErrorMessage()
        }
    }
    
    Box(
        modifier = Modifier
            .fillMaxSize()
            .background(
                Brush.verticalGradient(
                    colors = listOf(
                        DarkBackground,
                        DarkBackground.copy(alpha = 0.95f),
                        Color(0xFF0F172A)
                    )
                )
            )
    ) {
        // Animated background orbs
        repeat(3) { index ->
            val infiniteTransition = rememberInfiniteTransition(label = "orb_$index")
            val offsetX by infiniteTransition.animateFloat(
                initialValue = -200f + index * 300f,
                targetValue = 200f + index * 300f,
                animationSpec = infiniteRepeatable(
                    animation = tween(
                        durationMillis = 8000 + index * 2000,
                        easing = EaseInOutSine
                    ),
                    repeatMode = RepeatMode.Reverse
                ),
                label = "orb_offset_x_$index"
            )
            val offsetY by infiniteTransition.animateFloat(
                initialValue = -100f + index * 200f,
                targetValue = 100f + index * 200f,
                animationSpec = infiniteRepeatable(
                    animation = tween(
                        durationMillis = 10000 + index * 1000,
                        easing = EaseInOutSine
                    ),
                    repeatMode = RepeatMode.Reverse
                ),
                label = "orb_offset_y_$index"
            )
            
            Box(
                modifier = Modifier
                    .offset(x = offsetX.dp, y = offsetY.dp)
                    .size(200.dp + (index * 50).dp)
                    .background(
                        brush = Brush.radialGradient(
                            colors = when (index) {
                                0 -> listOf(
                                    GradientPurple.copy(alpha = 0.1f),
                                    Color.Transparent
                                )
                                1 -> listOf(
                                    GradientPink.copy(alpha = 0.08f),
                                    Color.Transparent
                                )
                                else -> listOf(
                                    GradientCyan.copy(alpha = 0.06f),
                                    Color.Transparent
                                )
                            }
                        ),
                        shape = CircleShape
                    )
                    .blur(60.dp)
            )
        }
        
        Scaffold(
            containerColor = Color.Transparent,
            topBar = {
                TopAppBar(
                    title = { 
                        Text(
                            "AI Talk",
                            color = TextPrimary,
                            fontWeight = FontWeight.Bold
                        ) 
                    },
                    colors = TopAppBarDefaults.topAppBarColors(
                        containerColor = Color.Transparent
                    ),
                    actions = {
                        // Settings button
                        IconButton(onClick = { showSettings = !showSettings }) {
                            Icon(
                                Icons.Filled.Settings, 
                                contentDescription = "Settings",
                                tint = TextPrimary
                            )
                        }
                        
                        // Clear button
                        IconButton(onClick = { aiTalkViewModel.clearMessages() }) {
                            Icon(
                                Icons.Filled.Clear, 
                                contentDescription = "Clear Chat",
                                tint = TextPrimary
                            )
                        }
                    }
                )
            },
            floatingActionButton = {
                FloatingActionButton(
                    onClick = {
                        if (!hasPermission) {
                            permissionLauncher.launch(audioPermission)
                        } else if (isListening) {
                            aiTalkViewModel.stopListening()
                        } else {
                            startSpeechRecognition.invoke()
                        }
                    },
                    modifier = Modifier.scale(if (isListening) scale else 1f),
                    containerColor = if (isListening) {
                        Color(0xFFDC2626)
                    } else {
                        Color(0xFF1F2937).copy(alpha = 0.8f)
                    }
                ) {
                    Icon(
                        imageVector = if (isListening) Icons.Filled.MicOff else Icons.Filled.Mic,
                        contentDescription = if (isListening) "Stop Listening" else "Start Listening",
                        tint = Color.White
                    )
                }
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
                        shape = RoundedCornerShape(16.dp),
                        colors = CardDefaults.cardColors(
                            containerColor = GlassBackground
                        )
                    ) {
                    Column(
                        modifier = Modifier.padding(16.dp),
                        verticalArrangement = Arrangement.spacedBy(8.dp)
                    ) {
                        Text(
                            "Settings",
                            style = MaterialTheme.typography.titleMedium,
                            fontWeight = FontWeight.Bold,
                            color = TextPrimary
                        )
                        
                        // LLM Model selector
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            verticalAlignment = Alignment.CenterVertically,
                            horizontalArrangement = Arrangement.SpaceBetween
                        ) {
                            Text("LLM Model", color = TextSecondary)
                            
                            Button(onClick = { showLlmModelDropdown = true }) {
                                Text(selectedLlmModel.substringAfterLast('/').substringBefore(':'))
                            }
                            
                            DropdownMenu(
                                expanded = showLlmModelDropdown,
                                onDismissRequest = { showLlmModelDropdown = false }
                            ) {
                                aiTalkViewModel.availableLlmModels.forEach { model ->
                                    DropdownMenuItem(
                                        text = { Text(model.substringAfterLast('/').substringBefore(':')) },
                                        onClick = {
                                            aiTalkViewModel.updateSelectedLlmModel(model)
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
                            Text("TTS Voice", color = TextSecondary)
                            
                            Button(onClick = { showVoiceDropdown = true }) {
                                Text(selectedVoice)
                            }
                            
                            DropdownMenu(
                                expanded = showVoiceDropdown,
                                onDismissRequest = { showVoiceDropdown = false }
                            ) {
                                aiTalkViewModel.availableVoices.forEach { voice ->
                                    DropdownMenuItem(
                                        text = { Text(voice) },
                                        onClick = {
                                            aiTalkViewModel.updateSelectedVoice(voice)
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
                if (isListening) {
                    Card(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(8.dp),
                        shape = RoundedCornerShape(16.dp),
                        colors = CardDefaults.cardColors(
                            containerColor = GlassBackground
                        )
                    ) {
                    Column(
                        modifier = Modifier.padding(16.dp),
                        horizontalAlignment = Alignment.CenterHorizontally
                    ) {
                        Text(
                            "Listening...",
                            style = MaterialTheme.typography.titleMedium,
                            color = AccentPurple
                        )
                        
                        if (recognizedText.isNotEmpty()) {
                            Spacer(modifier = Modifier.height(8.dp))
                            Text(
                                recognizedText,
                                style = MaterialTheme.typography.bodyMedium,
                                textAlign = TextAlign.Center,
                                color = TextPrimary
                            )
                        }
                    }
                }
            } else if (isProcessing || isGeneratingSpeech) {
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
                        if (isProcessing) "Processing..." else "Generating speech...",
                        style = MaterialTheme.typography.bodyMedium,
                        color = TextSecondary
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
            if (messages.isEmpty() && !isListening && !isProcessing) {
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
                            "Tap the microphone button to start speaking",
                            style = MaterialTheme.typography.bodyLarge,
                            textAlign = TextAlign.Center,
                            color = TextSecondary
                        )
                        
                        Icon(
                            imageVector = Icons.Filled.Mic,
                            contentDescription = null,
                            modifier = Modifier.size(48.dp),
                            tint = AccentPurple
                        )
                    }
                }
            }
            }
        }
    }
} 

