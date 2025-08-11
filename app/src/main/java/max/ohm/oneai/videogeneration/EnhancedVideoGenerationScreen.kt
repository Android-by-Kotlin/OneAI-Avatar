package max.ohm.oneai.videogeneration

import androidx.compose.animation.*
import androidx.compose.animation.core.*
import androidx.compose.foundation.BorderStroke
import androidx.compose.foundation.Canvas
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material.icons.outlined.*
import androidx.compose.material.icons.filled.Download
import androidx.compose.material.icons.filled.CloudDownload
import androidx.compose.material3.*
import androidx.compose.runtime.*
import android.widget.Toast
import android.app.DownloadManager
import android.net.Uri
import android.os.Environment
import android.content.Context
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.ui.draw.blur
import androidx.compose.ui.draw.clip
import androidx.compose.ui.draw.shadow
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
import max.ohm.oneai.utils.SetStatusBarColor
import max.ohm.oneai.utils.StatusBarUtils
import max.ohm.oneai.ui.theme.*
import max.ohm.oneai.components.EmotionIntelligentButton
import max.ohm.oneai.components.EmotionIntelligentTextField
import max.ohm.oneai.components.EmotionState
import max.ohm.oneai.components.EmotionStatusIndicator
import androidx.compose.ui.text.TextStyle

// Data class for model choices
data class ModelChoice(
    val displayName: String,
    val internalName: String
)


@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun EnhancedVideoGenerationScreen(navController: NavController) {
    val context = LocalContext.current
    val viewModel: NewVideoGenerationViewModel = viewModel()
    val state = viewModel.state.collectAsState().value
    
    var prompt by remember { mutableStateOf("") }
    var modelMenuExpanded by remember { mutableStateOf(false) }
    var selectedModel by remember { mutableStateOf("seedance-t2v") }
    
    // Timer state
    var elapsedTimeInSeconds by remember { mutableStateOf(0L) }
    var totalGenerationTimeInSeconds by remember { mutableStateOf<Long?>(null) }
    var startTime by remember { mutableStateOf(0L) }
    
    val modelChoices = listOf(
//        ModelChoice("WAN 2.1", "provider-6/wan-2.1"),
//        ModelChoice("MiniMax", "T2V-01-Director"),
//        ModelChoice("CogVideoX (ModelsLab)", "cogvideox"),
//        ModelChoice("Seedance I2V (Image to Video)", "seedance-i2v"),
        ModelChoice("Seedance", "seedance-t2v")
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

    // Set status bar color for video generation screen
    SetStatusBarColor(StatusBarUtils.VideoGenerationStatusBarColor)

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
        // Animated background orbs for glassmorphic effect
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
        Column(
            modifier = Modifier.fillMaxSize()
        ) {
            // Enhanced Top Bar with Glass Effect (No Border, matching image gen)
            Surface(
                modifier = Modifier.fillMaxWidth(),
                color = Color.Transparent,
                shadowElevation = 0.dp
            ) {
                Box(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(16.dp)
                ) {
                    // Back button on the left
                    IconButton(
                        onClick = { navController.popBackStack() },
                        modifier = Modifier.align(Alignment.CenterStart)
                    ) {
                        Icon(
                            imageVector = Icons.Default.ArrowBack,
                            contentDescription = "Back",
                            tint = TextPrimary
                        )
                    }
                    
                    // App Title with emotion indicator in the center
                    Column(
                        modifier = Modifier.align(Alignment.Center),
                        horizontalAlignment = Alignment.CenterHorizontally
                    ) {
                        Text(
                            text = "Video Studio",
                            fontSize = 20.sp,
                            fontWeight = FontWeight.Bold,
                            color = TextPrimary,
                            modifier = Modifier.graphicsLayer(alpha = 0.99f)
                        )
                        Spacer(modifier = Modifier.height(4.dp))
                        Surface(
                            shape = RoundedCornerShape(12.dp),
                            color = GradientPurple.copy(alpha = 0.1f),
                            modifier = Modifier.padding(top = 2.dp)
                        ) {
                            Row(
                                modifier = Modifier.padding(horizontal = 12.dp, vertical = 4.dp),
                                verticalAlignment = Alignment.CenterVertically
                            ) {
                                Icon(
                                    imageVector = Icons.Outlined.Videocam,
                                    contentDescription = null,
                                    tint = GradientPurple,
                                    modifier = Modifier.size(14.dp)
                                )
                                Spacer(modifier = Modifier.width(4.dp))
                                Text(
                                    text = "Cinematic Mode",
                                    color = GradientPurple,
                                    fontSize = 12.sp,
                                    fontWeight = FontWeight.Medium
                                )
                            }
                        }
                    }
                    
                    // Settings button on the right
//                    IconButton(
//                        onClick = { /* Settings */ },
//                        modifier = Modifier.align(Alignment.CenterEnd)
//                    ) {
//                        Icon(
//                            imageVector = Icons.Outlined.Settings,
//                            contentDescription = "Settings",
//                            tint = TextPrimary
//                        )
//                    }
                }
            }
            
            // Main Content
            Column(
                modifier = Modifier
                    .fillMaxSize()
                    .padding(horizontal = 16.dp)
                    .padding(bottom = 8.dp),  // Add bottom padding for spacing
                horizontalAlignment = Alignment.CenterHorizontally,
                verticalArrangement = Arrangement.spacedBy(12.dp)  // Reduced spacing
            ) {
                // Enhanced Video Display with Premium Glass Effect
                PremiumGlassCard(
                    modifier = Modifier
                        .fillMaxWidth()
                        .weight(0.85f)  // Slightly reduced to make room for button
                        .animateContentSize(),
                    accentType = GlassAccentType.Cyan,
                    cornerRadius = 24.dp,
                    contentPadding = PaddingValues(0.dp)
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
                                Box(modifier = Modifier.fillMaxSize()) {
                                    VideoPlayer(
                                        videoUrl = state.videoUrl!!,
                                        autoplay = true,
                                        modifier = Modifier.fillMaxSize()
                                    )
                                    
                                    // Download button overlay
                                    Box(
                                        modifier = Modifier
                                            .align(Alignment.TopEnd)
                                            .padding(12.dp)
                                    ) {
                                        DownloadButton(
                                            videoUrl = state.videoUrl!!,
                                            context = context
                                        )
                                    }
                                }
                            }
                            else -> {
                                EmptyStateDisplay()
                            }
                        }
                    }
                }
                
                // Model Selection with Glass Effect
                ModelSelectionGlassCard(
                    currentModel = currentSelectedModelChoice,
                    modelChoices = modelChoices,
                    expanded = modelMenuExpanded,
                    onExpandedChange = { modelMenuExpanded = it },
                    onModelSelected = { model ->
                        selectedModel = model.internalName
                        modelMenuExpanded = false
                    }
                )
                
                // Prompt Input with Glass Effect
                PromptInputGlassCard(
                    prompt = prompt,
                    isLoading = state.isLoading,
                    onPromptChange = { prompt = it }
                )
                
                // Generate Button
                GenerateButton(
                    isLoading = state.isLoading,
                    enabled = !state.isLoading && prompt.isNotEmpty(),
                    onClick = { 
                        startTime = System.currentTimeMillis()
                        totalGenerationTimeInSeconds = null
                        viewModel.generateVideo(prompt, selectedModel) 
                    }
                )
                
                // Error display with Glass Effect
                if (state.error != null) {
                    PremiumGlassCard(
                        modifier = Modifier.fillMaxWidth(),
                        accentType = GlassAccentType.Pink,
                        cornerRadius = 12.dp,
                        contentPadding = PaddingValues(16.dp)
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
        modifier = Modifier
            .fillMaxSize()
            .padding(24.dp)  // Add padding to prevent content from touching edges
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
private fun ModelSelectionGlassCard(
    currentModel: ModelChoice,
    modelChoices: List<ModelChoice>,
    expanded: Boolean,
    onExpandedChange: (Boolean) -> Unit,
    onModelSelected: (ModelChoice) -> Unit
) {
    // Transparent container - no outer box
    Box(
        modifier = Modifier
            .fillMaxWidth()
            .clip(RoundedCornerShape(16.dp))
            .background(Color.Transparent)
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
                    color = DarkBackground.copy(alpha = 0.8f),
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
                        .background(
                            brush = Brush.verticalGradient(
                                colors = listOf(
                                    DarkBackground.copy(alpha = 0.95f),
                                    DarkBackground
                                )
                            )
                        )
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
private fun PromptInputGlassCard(
    prompt: String,
    isLoading: Boolean,
    onPromptChange: (String) -> Unit
) {
    // Transparent container matching enhanced image generation
    Box(
        modifier = Modifier
            .fillMaxWidth()
            .clip(RoundedCornerShape(16.dp))
            .background(Color.Transparent)
    ) {
        Column(
            modifier = Modifier.padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(12.dp)
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
                    text = "Creative Prompt",
                    color = TextSecondary,
                    fontSize = 14.sp,
                    fontWeight = FontWeight.Medium
                )
            }
            
            EmotionIntelligentTextField(
                value = prompt,
                onValueChange = onPromptChange,
                emotion = EmotionState.Creative,
                placeholder = "Describe your cinematic vision...",
                enabled = !isLoading,
                modifier = Modifier
                    .fillMaxWidth()
                    .border(
                        width = 2.dp,
                        brush = Brush.linearGradient(
                            colors = listOf(
                                GradientPurple.copy(alpha = 0.6f),
                                GradientPink.copy(alpha = 0.7f),
                                GradientCyan.copy(alpha = 0.5f),
                                GradientPurple.copy(alpha = 0.4f)
                            )
                        ),
                        shape = RoundedCornerShape(12.dp)
                    ),
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
    EmotionIntelligentButton(
        onClick = onClick,
        enabled = enabled,
        modifier = Modifier
            .fillMaxWidth()
            .height(56.dp),
        emotion = if (isLoading) EmotionState.Energetic else EmotionState.Creative,
        text = if (isLoading) "Creating Magic..." else "Generate Video",
        icon = if (isLoading) Icons.Outlined.HourglassEmpty else Icons.Outlined.VideoCall
    )
}

@Composable
private fun DownloadButton(
    videoUrl: String,
    context: Context
) {
    var isDownloading by remember { mutableStateOf(false) }
    
    // Auto-reset download state after 3 seconds
    LaunchedEffect(isDownloading) {
        if (isDownloading) {
            kotlinx.coroutines.delay(3000)
            isDownloading = false
        }
    }
    
    // Gradient colors for animated effect
    val infiniteTransition = rememberInfiniteTransition(label = "download_animation")
    val animatedOffset by infiniteTransition.animateFloat(
        initialValue = 0f,
        targetValue = 1f,
        animationSpec = infiniteRepeatable(
            animation = tween(2000, easing = LinearEasing),
            repeatMode = RepeatMode.Reverse
        ),
        label = "gradient_animation"
    )
    
    val gradientColors = listOf(
        Color(0xFF00D4FF),  // Cyan
        Color(0xFF00FF88),  // Green
        Color(0xFFFFD700),  // Gold
        Color(0xFFFF6B6B),  // Coral
        Color(0xFF8B5CF6)   // Purple
    )
    
    Box(
        modifier = Modifier
            .size(36.dp)  // Reduced from 48.dp
            .shadow(
                elevation = 6.dp,  // Reduced from 8.dp
                shape = RoundedCornerShape(18.dp),  // Adjusted for smaller size
                ambientColor = AccentPink.copy(alpha = 0.3f),
                spotColor = AccentPurple.copy(alpha = 0.3f)
            )
            .clip(RoundedCornerShape(18.dp))  // Adjusted for smaller size
            .background(
                Brush.sweepGradient(
                    colors = if (isDownloading) {
                        gradientColors + gradientColors.first()
                    } else {
                        listOf(
                            AccentPurple,
                            AccentPink,
                            AccentPurple
                        )
                    },
                    center = Offset(0.5f, 0.5f)
                )
            )
            .clickable {
                if (!isDownloading) {
                    downloadVideo(videoUrl, context)
                    isDownloading = true
                }
            },
        contentAlignment = Alignment.Center
    ) {
        // Inner glow effect
        Canvas(
            modifier = Modifier
                .fillMaxSize()
                .graphicsLayer { 
                    alpha = if (isDownloading) 0.8f else 0.5f
                }
        ) {
            val radiusValue = size.minDimension * animatedOffset.coerceAtLeast(0.1f)
            if (radiusValue > 0f) {
                drawCircle(
                    brush = Brush.radialGradient(
                        colors = listOf(
                            Color.White.copy(alpha = 0.3f),
                            Color.Transparent
                        ),
                        radius = radiusValue
                    )
                )
            }
        }
        
        // Icon with animation
        Icon(
            imageVector = if (isDownloading) Icons.Filled.CloudDownload else Icons.Filled.Download,
            contentDescription = "Download Video",
            tint = Color.White,
            modifier = Modifier
                .size(18.dp)  // Reduced from 24.dp
                .graphicsLayer {
                    if (isDownloading) {
                        scaleX = 0.9f + (animatedOffset * 0.2f)
                        scaleY = 0.9f + (animatedOffset * 0.2f)
                    }
                }
        )
    }
}

private fun downloadVideo(videoUrl: String, context: Context) {
    try {
        val request = DownloadManager.Request(Uri.parse(videoUrl))
        val fileName = "AI_Video_${System.currentTimeMillis()}.mp4"
        
        request.setTitle("Downloading AI Video")
        request.setDescription("Your AI-generated video is being downloaded")
        request.setNotificationVisibility(DownloadManager.Request.VISIBILITY_VISIBLE_NOTIFY_COMPLETED)
        request.setDestinationInExternalPublicDir(Environment.DIRECTORY_DOWNLOADS, fileName)
        request.setAllowedOverMetered(true)
        request.setAllowedOverRoaming(true)
        
        val downloadManager = context.getSystemService(Context.DOWNLOAD_SERVICE) as DownloadManager
        downloadManager.enqueue(request)
        
        Toast.makeText(context, "Download started: $fileName", Toast.LENGTH_SHORT).show()
    } catch (e: Exception) {
        Toast.makeText(context, "Download failed: ${e.message}", Toast.LENGTH_SHORT).show()
    }
}


