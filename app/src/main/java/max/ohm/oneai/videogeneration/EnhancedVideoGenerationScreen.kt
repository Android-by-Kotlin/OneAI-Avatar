package max.ohm.oneai.videogeneration

import androidx.compose.animation.*
import androidx.compose.animation.core.*
import androidx.compose.foundation.BorderStroke
import androidx.compose.foundation.Canvas
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material.icons.outlined.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.graphics.*
import androidx.compose.ui.graphics.drawscope.Stroke
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.lifecycle.viewmodel.compose.viewModel
import androidx.navigation.NavController

// Enhanced color scheme matching AI Art Studio
private val DarkBackground = Color(0xFF0A0E27)
private val CardBackground = Color(0xFF1A1F3A)
private val AccentPurple = Color(0xFF6366F1)
private val AccentPink = Color(0xFFEC4899)
private val TextPrimary = Color(0xFFFFFFFF)
private val TextSecondary = Color(0xFFB8BCC8)
private val BorderColor = Color(0xFF2D3748)

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun EnhancedVideoGenerationScreen(navController: NavController) {
    val context = LocalContext.current
    val viewModel: NewVideoGenerationViewModel = viewModel()
    val state = viewModel.state.collectAsState().value
    
    var prompt by remember { mutableStateOf("") }
    var modelMenuExpanded by remember { mutableStateOf(false) }
    var selectedModel by remember { mutableStateOf("provider-6/wan-2.1") }
    
    // Timer state
    var elapsedTimeInSeconds by remember { mutableStateOf(0L) }
    var totalGenerationTimeInSeconds by remember { mutableStateOf<Long?>(null) }
    var startTime by remember { mutableStateOf(0L) }
    
    val modelChoices = listOf(
        ModelChoice("WAN 2.1", "provider-6/wan-2.1"),
        ModelChoice("MiniMax", "T2V-01-Director")
    )
    
    val currentSelectedModelChoice = modelChoices.find { it.internalName == selectedModel } ?: modelChoices[0]
    
    // Timer effect
    LaunchedEffect(state.isLoading) {
        if (state.isLoading) {
            elapsedTimeInSeconds = 0L
            while (state.isLoading) {
                kotlinx.coroutines.delay(1000)
                elapsedTimeInSeconds++
            }
        } else if (state.videoUrl != null && startTime > 0) {
            totalGenerationTimeInSeconds = (System.currentTimeMillis() - startTime) / 1000
            startTime = 0L
        }
    }
    
    // Animations
    val infiniteTransition = rememberInfiniteTransition(label = "loading_animation")
    
    val gradientRotation by infiniteTransition.animateFloat(
        initialValue = 0f,
        targetValue = 360f,
        animationSpec = infiniteRepeatable(
            animation = tween(3000, easing = LinearEasing),
            repeatMode = RepeatMode.Restart
        ),
        label = "gradient_rotation"
    )

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
        Column(
            modifier = Modifier.fillMaxSize()
        ) {
            // Enhanced Top Bar
            Surface(
                modifier = Modifier.fillMaxWidth(),
                color = CardBackground.copy(alpha = 0.9f),
                shadowElevation = 8.dp
            ) {
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(16.dp),
                    verticalAlignment = Alignment.CenterVertically,
                    horizontalArrangement = Arrangement.SpaceBetween
                ) {
                    IconButton(onClick = { navController.popBackStack() }) {
                        Icon(
                            imageVector = Icons.Default.ArrowBack,
                            contentDescription = "Back",
                            tint = TextPrimary
                        )
                    }
                    
                    Text(
                        text = "AI Video Studio",
                        fontSize = 24.sp,
                        fontWeight = FontWeight.Bold,
                        color = TextPrimary
                    )
                    
                    IconButton(onClick = { /* Settings */ }) {
                        Icon(
                            imageVector = Icons.Outlined.Settings,
                            contentDescription = "Settings",
                            tint = TextPrimary
                        )
                    }
                }
            }
            
            // Main Content
            Box(
                modifier = Modifier.fillMaxSize()
            ) {
                Column(
                    modifier = Modifier
                        .fillMaxSize()
                        .verticalScroll(rememberScrollState())
                        .padding(16.dp)
                        .padding(bottom = 80.dp), // Add padding for the button
                    horizontalAlignment = Alignment.CenterHorizontally,
                    verticalArrangement = Arrangement.spacedBy(16.dp)
                ) {
                // Video Display Card
                Card(
                    modifier = Modifier
                        .fillMaxWidth()
                        .aspectRatio(16f/9f)
                        .animateContentSize(),
                    shape = RoundedCornerShape(24.dp),
                    colors = CardDefaults.cardColors(
                        containerColor = CardBackground
                    ),
                    border = BorderStroke(
                        width = 1.dp,
                        brush = Brush.linearGradient(
                            colors = listOf(
                                AccentPurple.copy(alpha = 0.5f),
                                AccentPink.copy(alpha = 0.5f)
                            ),
                            start = Offset(0f, 0f),
                            end = Offset(1000f, 1000f)
                        )
                    ),
                    elevation = CardDefaults.cardElevation(defaultElevation = 8.dp)
                ) {
                    Box(
                        modifier = Modifier.fillMaxSize(),
                        contentAlignment = Alignment.Center
                    ) {
                        when {
                            state.isLoading -> {
                                LoadingAnimation(gradientRotation, elapsedTimeInSeconds)
                            }
                            state.videoUrl != null -> {
                                VideoPlayer(
                                    videoUrl = state.videoUrl!!,
                                    autoplay = true,
                                    modifier = Modifier.fillMaxSize()
                                )
                            }
                            else -> {
                                EmptyStateDisplay()
                            }
                        }
                    }
                }
                
                // Generation time display
                AnimatedVisibility(
                    visible = !state.isLoading && totalGenerationTimeInSeconds != null,
                    enter = fadeIn() + slideInVertically(),
                    exit = fadeOut() + slideOutVertically()
                ) {
                    Card(
                        colors = CardDefaults.cardColors(
                            containerColor = AccentPurple.copy(alpha = 0.1f)
                        ),
                        border = BorderStroke(1.dp, AccentPurple.copy(alpha = 0.3f))
                    ) {
                        Row(
                            modifier = Modifier.padding(horizontal = 16.dp, vertical = 8.dp),
                            horizontalArrangement = Arrangement.spacedBy(8.dp),
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Icon(
                                imageVector = Icons.Outlined.Timer,
                                contentDescription = null,
                                tint = AccentPurple,
                                modifier = Modifier.size(16.dp)
                            )
                            Text(
                                text = "Generated in ${formatSecondsToMMSS(totalGenerationTimeInSeconds ?: 0L)}",
                                color = TextPrimary,
                                fontSize = 14.sp
                            )
                        }
                    }
                }
                
                // Model Selection
                ModelSelectionCard(
                    currentModel = currentSelectedModelChoice,
                    modelChoices = modelChoices,
                    expanded = modelMenuExpanded,
                    onExpandedChange = { modelMenuExpanded = it },
                    onModelSelected = { model ->
                        selectedModel = model.internalName
                        modelMenuExpanded = false
                    }
                )
                
                // Prompt Input
                PromptInputCard(
                    prompt = prompt,
                    isLoading = state.isLoading,
                    onPromptChange = { prompt = it }
                )
                
                // Error display
                if (state.error != null) {
                    Card(
                        modifier = Modifier.fillMaxWidth(),
                        colors = CardDefaults.cardColors(
                            containerColor = Color.Red.copy(alpha = 0.1f)
                        ),
                        shape = RoundedCornerShape(8.dp)
                    ) {
                        Text(
                            text = state.error!!,
                            color = Color.Red,
                            modifier = Modifier.padding(12.dp),
                            fontSize = 14.sp
                        )
                    }
                }
            }
            
            // Generate Button at the bottom
            Box(
                modifier = Modifier
                    .align(Alignment.BottomCenter)
                    .fillMaxWidth()
                    .background(
                        Brush.verticalGradient(
                            colors = listOf(
                                Color.Transparent,
                                DarkBackground.copy(alpha = 0.9f),
                                DarkBackground
                            )
                        )
                    )
                    .padding(16.dp)
            ) {
                GenerateButton(
                    isLoading = state.isLoading,
                    enabled = !state.isLoading && prompt.isNotEmpty(),
                    onClick = { 
                        startTime = System.currentTimeMillis()
                        totalGenerationTimeInSeconds = null
                        viewModel.generateVideo(prompt, selectedModel) 
                    }
                )
            }
        }
    }
    }
}

@Composable
private fun LoadingAnimation(
    gradientRotation: Float,
    elapsedTime: Long
) {
    Column(
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center,
        modifier = Modifier.fillMaxSize()
    ) {
        Box(
            modifier = Modifier.size(120.dp),
            contentAlignment = Alignment.Center
        ) {
            Canvas(
                modifier = Modifier
                    .fillMaxSize()
                    .graphicsLayer { rotationZ = gradientRotation }
            ) {
                drawCircle(
                    brush = Brush.sweepGradient(
                        colors = listOf(
                            AccentPurple,
                            AccentPink,
                            AccentPurple.copy(alpha = 0.5f),
                            AccentPink.copy(alpha = 0.5f),
                            AccentPurple
                        )
                    ),
                    radius = size.minDimension / 2,
                    style = Stroke(width = 8.dp.toPx(), cap = StrokeCap.Round)
                )
            }
            
            Icon(
                imageVector = Icons.Outlined.VideoLibrary,
                contentDescription = null,
                tint = TextPrimary,
                modifier = Modifier.size(48.dp)
            )
        }
        
        Spacer(modifier = Modifier.height(24.dp))
        
        Text(
            text = "Creating your video masterpiece...",
            color = TextPrimary,
            fontSize = 18.sp,
            fontWeight = FontWeight.Medium
        )
        
        Spacer(modifier = Modifier.height(8.dp))
        
        Text(
            text = formatSecondsToMMSS(elapsedTime),
            color = TextSecondary,
            fontSize = 16.sp
        )
    }
}

@Composable
private fun EmptyStateDisplay() {
    Column(
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center,
        modifier = Modifier
            .fillMaxSize()
            .padding(32.dp)
    ) {
        Box(
            modifier = Modifier.size(120.dp),
            contentAlignment = Alignment.Center
        ) {
            Canvas(modifier = Modifier.fillMaxSize()) {
                drawCircle(
                    brush = Brush.radialGradient(
                        colors = listOf(
                            AccentPurple.copy(alpha = 0.2f),
                            Color.Transparent
                        )
                    )
                )
            }
            Icon(
                imageVector = Icons.Outlined.VideoLibrary,
                contentDescription = null,
                tint = AccentPurple,
                modifier = Modifier.size(64.dp)
            )
        }
        
        Spacer(modifier = Modifier.height(5.dp))
        
        Text(
            text = "Ready to create videos",
            color = TextPrimary,
            fontSize = 20.sp,
            fontWeight = FontWeight.Medium
        )
        
        Spacer(modifier = Modifier.height(8.dp))
        
        Text(
            text = "Enter a prompt below and watch AI bring your video to life",
            color = TextSecondary,
            fontSize = 16.sp,
            textAlign = TextAlign.Center
        )
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun ModelSelectionCard(
    currentModel: ModelChoice,
    modelChoices: List<ModelChoice>,
    expanded: Boolean,
    onExpandedChange: (Boolean) -> Unit,
    onModelSelected: (ModelChoice) -> Unit
) {
    Card(
        modifier = Modifier.fillMaxWidth(),
        shape = RoundedCornerShape(16.dp),
        colors = CardDefaults.cardColors(
            containerColor = CardBackground
        ),
        border = BorderStroke(1.dp, BorderColor)
    ) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Text(
                text = "AI Model",
                color = TextSecondary,
                fontSize = 14.sp,
                fontWeight = FontWeight.Medium
            )
            
            Spacer(modifier = Modifier.height(8.dp))
            
            Box {
                Surface(
                    modifier = Modifier.fillMaxWidth(),
                    shape = RoundedCornerShape(12.dp),
                    color = DarkBackground,
                    onClick = { onExpandedChange(!expanded) }
                ) {
                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(16.dp),
                        horizontalArrangement = Arrangement.SpaceBetween,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Text(
                            text = currentModel.displayName,
                            color = TextPrimary,
                            fontSize = 16.sp
                        )
                        Icon(
                            imageVector = if (expanded) Icons.Default.KeyboardArrowUp else Icons.Default.KeyboardArrowDown,
                            contentDescription = null,
                            tint = TextSecondary
                        )
                    }
                }
                
                DropdownMenu(
                    expanded = expanded,
                    onDismissRequest = { onExpandedChange(false) },
                    modifier = Modifier
                        .fillMaxWidth(0.9f)
                        .background(CardBackground)
                ) {
                    modelChoices.forEach { model ->
                        DropdownMenuItem(
                            text = {
                                Text(
                                    text = model.displayName,
                                    color = TextPrimary
                                )
                            },
                            onClick = { onModelSelected(model) },
                            leadingIcon = {
                                RadioButton(
                                    selected = model == currentModel,
                                    onClick = null,
                                    colors = RadioButtonDefaults.colors(
                                        selectedColor = AccentPurple
                                    )
                                )
                            }
                        )
                    }
                }
            }
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun PromptInputCard(
    prompt: String,
    isLoading: Boolean,
    onPromptChange: (String) -> Unit
) {
    Card(
        modifier = Modifier.fillMaxWidth(),
        shape = RoundedCornerShape(16.dp),
        colors = CardDefaults.cardColors(
            containerColor = CardBackground
        ),
        border = BorderStroke(1.dp, BorderColor)
    ) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Row(
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                Icon(
                    imageVector = Icons.Outlined.Edit,
                    contentDescription = null,
                    tint = TextSecondary,
                    modifier = Modifier.size(20.dp)
                )
                Text(
                    text = "Prompt",
                    color = TextSecondary,
                    fontSize = 14.sp,
                    fontWeight = FontWeight.Medium
                )
            }
            
            Spacer(modifier = Modifier.height(12.dp))
            
            OutlinedTextField(
                value = prompt,
                onValueChange = onPromptChange,
                placeholder = {
                    Text(
                        "Describe your video vision...",
                        color = TextSecondary.copy(alpha = 0.6f)
                    )
                },
                modifier = Modifier.fillMaxWidth(),
                enabled = !isLoading,
                colors = TextFieldDefaults.outlinedTextFieldColors(
                    containerColor = DarkBackground,
                    cursorColor = AccentPurple,
                    focusedBorderColor = AccentPurple,
                    unfocusedBorderColor = BorderColor
                ),
                shape = RoundedCornerShape(12.dp),
                minLines = 3,
                maxLines = 5
            )
        }
    }
}

@Composable
private fun GenerateButton(
    isLoading: Boolean,
    enabled: Boolean,
    onClick: () -> Unit
) {
    Button(
        onClick = onClick,
        enabled = enabled,
        modifier = Modifier
            .fillMaxWidth()
            .height(56.dp),
        shape = RoundedCornerShape(16.dp),
        colors = ButtonDefaults.buttonColors(
            containerColor = AccentPurple,
            disabledContainerColor = AccentPurple.copy(alpha = 0.5f)
        )
    ) {
        Row(
            horizontalArrangement = Arrangement.Center,
            verticalAlignment = Alignment.CenterVertically
        ) {
            if (isLoading) {
                CircularProgressIndicator(
                    modifier = Modifier.size(24.dp),
                    color = TextPrimary,
                    strokeWidth = 2.dp
                )
            } else {
                Icon(
                    imageVector = Icons.Default.VideoLibrary,
                    contentDescription = null,
                    modifier = Modifier.size(24.dp)
                )
            }
            Spacer(modifier = Modifier.width(8.dp))
            Text(
                text = if (isLoading) "Generating..." else "Generate Video",
                fontSize = 18.sp,
                fontWeight = FontWeight.Bold
            )
        }
    }
}

// Data class
data class ModelChoice(val displayName: String, val internalName: String)
