package max.ohm.oneai.videogeneration

import android.app.Activity
import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.net.Uri
import android.os.Environment
import android.util.Log
import android.widget.Toast
import androidx.compose.animation.*
import androidx.compose.animation.core.*
import androidx.compose.foundation.BorderStroke
import androidx.compose.foundation.Canvas
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material.icons.outlined.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.*
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.graphics.*
import androidx.compose.ui.graphics.drawscope.Stroke
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.input.TextFieldValue
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.compose.ui.viewinterop.AndroidView
import androidx.lifecycle.lifecycleScope
import androidx.lifecycle.viewmodel.compose.viewModel
import androidx.media3.common.MediaItem
import androidx.media3.common.PlaybackException
import androidx.media3.common.Player
import androidx.media3.common.util.UnstableApi
import androidx.media3.datasource.DefaultHttpDataSource
import androidx.media3.exoplayer.ExoPlayer
import androidx.media3.exoplayer.source.ProgressiveMediaSource
import androidx.media3.ui.PlayerView
import kotlinx.coroutines.DelicateCoroutinesApi
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import java.io.File
import java.io.FileOutputStream
import java.net.URL
import max.ohm.oneai.ui.theme.*
import max.ohm.oneai.components.*
import max.ohm.oneai.utils.SetStatusBarColor
import max.ohm.oneai.utils.StatusBarUtils

// Helper function to find an Activity from a Context
fun Context.findActivity(): Activity? {
    var context = this
    while (context is ContextWrapper) {
        if (context is Activity) return context
        context = context.baseContext
    }
    return null
}

private const val SCREEN_TAG = "VideoGenScreen"
private const val APP_USER_AGENT = "OneAI Android App"

// Helper function to format seconds into MM:SS string
fun formatSecondsToMMSS(seconds: Long): String {
    val minutes = seconds / 60
    val remainingSeconds = seconds % 60
    return String.format("%02d:%02d", minutes, remainingSeconds)
}

// Data class for model choices
data class VideoModelChoice(
    val displayName: String,
    val internalName: String,
    val apiType: String // "original", "a4f", or "modelslab"
)

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun VideoGenerationScreen(
    viewModel: VideoGenerationViewModel = viewModel()
) {
    val context = LocalContext.current
    val prompt by viewModel.prompt.collectAsState()
    val generatedVideoUrl by viewModel.videoUrl.collectAsState()
    val isLoading by viewModel.isLoading.collectAsState()
    val error by viewModel.error.collectAsState()
    val isUsingA4F by viewModel.isUsingA4F.collectAsState()
    val isUsingModelsLab by viewModel.isUsingModelsLab.collectAsState()
    
    val elapsedTimeInSeconds by viewModel.elapsedTimeInSeconds.collectAsState()
    val totalGenerationTimeInSeconds by viewModel.totalGenerationTimeInSeconds.collectAsState()
    
    var promptText by remember { mutableStateOf(TextFieldValue("")) }
    var modelMenuExpanded by remember { mutableStateOf(false) }
    var selectedModel by remember { mutableStateOf<VideoModelChoice?>(null) }
    
    val modelChoices = listOf(
        VideoModelChoice("Original API", "original", "original"),
        VideoModelChoice("A4F Text-to-Video", "a4f", "a4f"),
        VideoModelChoice("CogVideoX (ModelsLab)", "modelslab", "modelslab")
    )
    
    val currentSelectedModel = selectedModel ?: modelChoices.first()

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
    
    // Update prompt in viewmodel when text changes
    LaunchedEffect(promptText) {
        viewModel.setPrompt(promptText.text)
    }
    
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
        Column(
            modifier = Modifier.fillMaxSize()
        ) {
            // Enhanced Top Bar with Glass Effect (No Border)
            Surface(
                modifier = Modifier.fillMaxWidth(),
                color = Color.Transparent,
                shadowElevation = 0.dp
            ) {
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(16.dp),
                    verticalAlignment = Alignment.CenterVertically,
                    horizontalArrangement = Arrangement.SpaceBetween
                ) {
                    // App Title with emotion indicator
                    Column {
                        Text(
                            text = "OneAI Video Studio",
                            fontSize = 20.sp,
                            fontWeight = FontWeight.Bold,
                            color = TextPrimary,
                            modifier = Modifier.graphicsLayer(alpha = 0.99f)
                        )
                        Spacer(modifier = Modifier.height(4.dp))
                        EmotionStatusIndicator(
                            status = "Video Creation",
                            emotion = EmotionState.Creative,
                            icon = Icons.Outlined.VideoLibrary
                        )
                    }
                    
                    // Action buttons
                    Row(
                        horizontalArrangement = Arrangement.spacedBy(8.dp)
                    ) {
                        IconButton(
                            onClick = { /* Settings */ }
                        ) {
                            Icon(
                                imageVector = Icons.Outlined.Settings,
                                contentDescription = "Settings",
                                tint = TextPrimary
                            )
                        }
                    }
                }
            }
            
            // Main Content
            Column(
                modifier = Modifier
                    .fillMaxSize()
                    .verticalScroll(rememberScrollState())
                    .padding(16.dp),
                horizontalAlignment = Alignment.CenterHorizontally,
                verticalArrangement = Arrangement.spacedBy(16.dp)
            ) {
                // Enhanced Video Display with Premium Glass Effect
                PremiumGlassCard(
                    modifier = Modifier
                        .fillMaxWidth()
                        .heightIn(min = 320.dp)  // Increased minimum height for loading animation
                        .aspectRatio(16f/10f)  // Changed to 16:10 for more vertical space
                        .animateContentSize(),
                    accentType = GlassAccentType.Purple,
                    cornerRadius = 24.dp,
                    contentPadding = PaddingValues(0.dp)
                ) {
                    Box(
                        modifier = Modifier.fillMaxSize(),
                        contentAlignment = Alignment.Center
                    ) {
                        when {
                            isLoading -> {
                                LoadingAnimation(
                                    gradientRotation = gradientRotation,
                                    elapsedTime = elapsedTimeInSeconds
                                )
                            }
                            generatedVideoUrl != null -> {
                                Box(modifier = Modifier.fillMaxSize()) {
                                    VideoPlayer(
                                        videoUrl = generatedVideoUrl!!,
                                        autoplay = true,
                                        modifier = Modifier
                                            .fillMaxSize()
                                            .background(Color.Black)
                                    )
                                    
                                    // Download button overlay with glassmorphic style
                                    Box(
                                        modifier = Modifier
                                            .align(Alignment.TopEnd)
                                            .padding(12.dp)
                                    ) {
                                        GlassDownloadButton(
                                            videoUrl = generatedVideoUrl!!,
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
                
                // Error message display
                AnimatedVisibility(
                    visible = !isLoading && error != null,
                    enter = fadeIn() + slideInVertically(),
                    exit = fadeOut() + slideOutVertically()
                ) {
                    GlassCard(
                        backgroundColor = Color(0xFFDC2626).copy(alpha = 0.08f),
                        borderColor = Color(0xFFDC2626).copy(alpha = 0.25f),
                        cornerRadius = 16.dp,
                        modifier = Modifier.fillMaxWidth(),
                        contentPadding = PaddingValues(0.dp)
                    ) {
                        Row(
                            modifier = Modifier.padding(16.dp),
                            horizontalArrangement = Arrangement.spacedBy(12.dp),
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Icon(
                                imageVector = Icons.Outlined.Error,
                                contentDescription = null,
                                tint = Color(0xFFDC2626),
                                modifier = Modifier.size(20.dp)
                            )
                            Column(
                                modifier = Modifier.weight(1f)
                            ) {
                                Text(
                                    text = error ?: "",
                                    color = Color(0xFFDC2626),
                                    fontSize = 14.sp,
                                    fontWeight = FontWeight.Medium
                                )
                            }
                            IconButton(
                                onClick = { /* Clear error */ },
                                modifier = Modifier.size(24.dp)
                            ) {
                                Icon(
                                    imageVector = Icons.Default.Close,
                                    contentDescription = "Dismiss",
                                    tint = Color(0xFFDC2626),
                                    modifier = Modifier.size(16.dp)
                                )
                            }
                        }
                    }
                }
                
                // Generation time display
                AnimatedVisibility(
                    visible = !isLoading && totalGenerationTimeInSeconds != null && totalGenerationTimeInSeconds!! > 0L,
                    enter = fadeIn() + slideInVertically(),
                    exit = fadeOut() + slideOutVertically()
                ) {
                    GlassCard(
                        backgroundColor = AccentPurple.copy(alpha = 0.08f),
                        borderColor = AccentPurple.copy(alpha = 0.25f),
                        cornerRadius = 12.dp,
                        contentPadding = PaddingValues(0.dp)
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
                
                // Model Selection Card
                ModelSelectionCard(
                    currentModel = currentSelectedModel,
                    modelChoices = modelChoices,
                    expanded = modelMenuExpanded,
                    onExpandedChange = { modelMenuExpanded = it },
                    onModelSelected = { model ->
                        selectedModel = model
                        modelMenuExpanded = false
                    }
                )
                
                // Enhanced Prompt Input with Emotion Intelligence
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
                                text = "Video Prompt",
                                color = TextSecondary,
                                fontSize = 14.sp,
                                fontWeight = FontWeight.Medium
                            )
                        }
                        
                        EmotionIntelligentTextField(
                            value = promptText.text,
                            onValueChange = { newText -> promptText = TextFieldValue(newText) },
                            emotion = EmotionState.Creative,
                            placeholder = "Describe your video vision...",
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
                
                // Generate Button with Dark Background
                Button(
                    onClick = { 
                        when (currentSelectedModel.apiType) {
                            "original" -> viewModel.generateVideo()
                            "a4f" -> viewModel.generateTextToVideo()
                            "modelslab" -> viewModel.generateModelsLabVideo()
                        }
                    },
                    enabled = !isLoading && promptText.text.isNotEmpty(),
                    modifier = Modifier
                        .fillMaxWidth()
                        .height(56.dp)
                        .border(
                            width = 1.dp,
                            brush = Brush.linearGradient(
                                colors = listOf(
                                    GradientPurple.copy(alpha = 0.4f),
                                    GradientPink.copy(alpha = 0.3f),
                                    GradientCyan.copy(alpha = 0.3f)
                                )
                            ),
                            shape = RoundedCornerShape(16.dp)
                        ),
                    shape = RoundedCornerShape(16.dp),
                    colors = ButtonDefaults.buttonColors(
                        containerColor = if (!isLoading && promptText.text.isNotEmpty()) {
                            Color(0xFF1F2937).copy(alpha = 0.8f) // Dark background
                        } else {
                            Color(0xFF1F2937).copy(alpha = 0.4f) // Lighter when disabled
                        },
                        disabledContainerColor = Color(0xFF1F2937).copy(alpha = 0.4f)
                    )
                ) {
                    Row(
                        horizontalArrangement = Arrangement.Center,
                        verticalAlignment = Alignment.CenterVertically,
                        modifier = Modifier.padding(horizontal = 16.dp)
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
                                tint = TextPrimary,
                                modifier = Modifier.size(24.dp)
                            )
                        }
                        Spacer(modifier = Modifier.width(8.dp))
                        Text(
                            text = if (isLoading) "Generating..." else "Generate Video",
                            fontSize = 18.sp,
                            fontWeight = FontWeight.Bold,
                            color = TextPrimary
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
        
        Spacer(modifier = Modifier.height(24.dp))
        
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
    currentModel: VideoModelChoice,
    modelChoices: List<VideoModelChoice>,
    expanded: Boolean,
    onExpandedChange: (Boolean) -> Unit,
    onModelSelected: (VideoModelChoice) -> Unit
) {
    // AI Model Card with No Border for Clean Glass Look
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

@Composable
fun ResponseSection(title: String, jsonString: String?) {
    if (jsonString == null) return
    Column(modifier = Modifier.fillMaxWidth().padding(vertical = 4.dp)) {
        Text(title, style = MaterialTheme.typography.titleSmall)
        Box(
            modifier = Modifier
                .fillMaxWidth()
                .background(MaterialTheme.colorScheme.surfaceVariant.copy(alpha = 0.3f))
                .padding(8.dp)
        ) {
            Text(
                text = jsonString,
                fontFamily = FontFamily.Monospace,
                fontSize = 12.sp,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
        }
    }
}

@androidx.annotation.OptIn(UnstableApi::class)
@Composable
fun VideoPlayer(
    videoUrl: String,
    autoplay: Boolean,
    modifier: Modifier = Modifier
) {
    val context = LocalContext.current
    val isBuffering = remember { mutableStateOf(true) }
    val playerErrorMessage = remember { mutableStateOf<String?>(null) }

    Log.d(SCREEN_TAG, "VideoPlayer recomposing. URL: $videoUrl, Autoplay: $autoplay")

    val exoPlayer = remember(videoUrl) {
        Log.d(SCREEN_TAG, "Creating new ExoPlayer instance for URL: $videoUrl")
        val player = if (videoUrl.startsWith("http") || videoUrl.startsWith("https")) {
            // For HTTP URLs, use custom data source factory
            val httpDataSourceFactory = DefaultHttpDataSource.Factory()
                .setUserAgent(APP_USER_AGENT)
                .setAllowCrossProtocolRedirects(true)
                .setConnectTimeoutMs(30000) // Increase timeout to 30 seconds
                .setReadTimeoutMs(30000)    // Increase read timeout to 30 seconds
                
            val mediaSourceFactory = ProgressiveMediaSource.Factory(httpDataSourceFactory)
            ExoPlayer.Builder(context)
                .setMediaSourceFactory(mediaSourceFactory)
                .build()
        } else {
            // For local files, use default player
            ExoPlayer.Builder(context).build()
        }
        player
            .apply {
                Log.d(SCREEN_TAG, "Setting media item: $videoUrl")
                try {
                    val mediaItem = MediaItem.fromUri(Uri.parse(videoUrl))
                    setMediaItem(mediaItem)
                    addListener(object : Player.Listener {
                        override fun onPlaybackStateChanged(playbackState: Int) {
                            isBuffering.value = playbackState == Player.STATE_BUFFERING
                            if (playbackState == Player.STATE_ENDED) {
                                this@apply.seekTo(0)
                                this@apply.playWhenReady = false
                            }
                            Log.d(SCREEN_TAG, "ExoPlayer state changed: $playbackState, isBuffering: ${isBuffering.value}")
                        }
                        override fun onIsPlayingChanged(isPlayingNow: Boolean) { 
                            Log.d(SCREEN_TAG, "ExoPlayer onIsPlayingChanged (actual): $isPlayingNow") 
                        }
                        override fun onPlayerError(error: PlaybackException) {
                            Log.e(SCREEN_TAG, "ExoPlayer error for $videoUrl. Code: ${error.errorCodeName}, Message: ${error.message}", error)
                            
                            // Provide more specific error messages based on error codes
                            val errorMessage = when (error.errorCode) {
                                PlaybackException.ERROR_CODE_IO_BAD_HTTP_STATUS -> {
                                    "HTTP Error: The server returned an error status code (2004).\n" +
                                    "This may be due to an invalid URL or authentication issue.\n" +
                                    "Please try generating the video again."
                                }
                                PlaybackException.ERROR_CODE_IO_NETWORK_CONNECTION_FAILED -> 
                                    "Network connection failed. Please check your internet connection."
                                PlaybackException.ERROR_CODE_IO_NETWORK_CONNECTION_TIMEOUT -> 
                                    "Network connection timed out. The server may be busy or unreachable."
                                PlaybackException.ERROR_CODE_IO_INVALID_HTTP_CONTENT_TYPE -> 
                                    "Invalid content type. The URL may not point to a valid video file."
                                PlaybackException.ERROR_CODE_IO_FILE_NOT_FOUND -> 
                                    "Video file not found. The URL may be incorrect or the file has been removed."
                                else -> "Video Error: ${error.errorCodeName} (${error.errorCode})\n${error.localizedMessage?.take(100)}"
                            }
                            
                            playerErrorMessage.value = errorMessage
                            isBuffering.value = false
                        }
                    })
                    playWhenReady = autoplay
                    Log.d(SCREEN_TAG, "Preparing ExoPlayer for $videoUrl, playWhenReady=$autoplay")
                    prepare()
                } catch (e: Exception) {
                    Log.e(SCREEN_TAG, "Exception setting up ExoPlayer: ${e.message}", e)
                    playerErrorMessage.value = "Error setting up video player: ${e.message}"
                    isBuffering.value = false
                }
            }
    }

    DisposableEffect(exoPlayer) {
        onDispose {
            Log.d(SCREEN_TAG, "Releasing ExoPlayer instance for URL: $videoUrl")
            exoPlayer.release()
        }
    }

    Box(modifier = modifier) {
        AndroidView(
            factory = { ctx ->
                PlayerView(ctx).apply {
                    player = exoPlayer
                    useController = true
                }
            },
            modifier = Modifier.fillMaxSize()
        )
        
        if (isBuffering.value) {
            CircularProgressIndicator(modifier = Modifier.align(Alignment.Center))
        }

        playerErrorMessage.value?.let { message ->
            Box(
                modifier = Modifier
                    .fillMaxSize()
                    .background(Color.Black.copy(alpha = 0.7f))
                    .padding(16.dp),
                contentAlignment = Alignment.Center
            ) {
                Text(
                    message, 
                    color = Color.White, 
                    style = MaterialTheme.typography.bodyLarge, 
                    textAlign = androidx.compose.ui.text.style.TextAlign.Center
                )
            }
        }
    }
}

@Composable
private fun GlassDownloadButton(
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
        Color(0xFF8B5CF6),  // Purple
        Color(0xFFFF1493),  // Deep Pink
        Color(0xFF00CED1)   // Dark Turquoise
    )
    
    Box(
        modifier = Modifier
            .size(48.dp)
            .shadow(
                elevation = 12.dp,
                shape = RoundedCornerShape(24.dp),
                ambientColor = Color(0xFFFF6B6B).copy(alpha = 0.4f),
                spotColor = Color(0xFF8B5CF6).copy(alpha = 0.4f)
            )
            .clip(RoundedCornerShape(24.dp))
            .background(
                Brush.sweepGradient(
                    colors = if (isDownloading) {
                        gradientColors + gradientColors.first()
                    } else {
                        listOf(
                            Color(0xFF8B5CF6),  // Purple
                            Color(0xFFFF6B6B),  // Coral
                            Color(0xFFFFD700),  // Gold
                            Color(0xFF00FF88),  // Green
                            Color(0xFF00D4FF),  // Cyan
                            Color(0xFF8B5CF6)   // Back to Purple
                        )
                    },
                    center = Offset(0.5f, 0.5f)
                )
            )
            .clickable {
                if (!isDownloading) {
                    downloadVideo(context, videoUrl)
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
                    alpha = if (isDownloading) 0.9f else 0.6f
                }
        ) {
            val radiusValue = size.minDimension * (0.5f + animatedOffset * 0.5f)
            if (radiusValue > 0f) {
                drawCircle(
                    brush = Brush.radialGradient(
                        colors = listOf(
                            Color.White.copy(alpha = 0.4f),
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
                .size(24.dp)
                .graphicsLayer {
                    if (isDownloading) {
                        scaleX = 0.8f + (animatedOffset * 0.4f)
                        scaleY = 0.8f + (animatedOffset * 0.4f)
                        rotationZ = animatedOffset * 360f
                    }
                }
        )
    }
}

fun downloadVideo(context: Context, videoUrl: String) {
    if (videoUrl.isEmpty()) {
        Toast.makeText(context, "Video URL is empty.", Toast.LENGTH_SHORT).show()
        return
    }
    Toast.makeText(context, "Download started...", Toast.LENGTH_SHORT).show()
    // Use a coroutine to perform network and file operations off the main thread
    val scope = (context as? androidx.lifecycle.LifecycleOwner)?.lifecycleScope ?: kotlinx.coroutines.GlobalScope
    scope.launch(Dispatchers.IO) {
        try {
            // Create a file in the Downloads directory
            val downloadsDir = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS)
            if (!downloadsDir.exists()) {
                downloadsDir.mkdirs()
            }
            val fileName = "generated_video_${System.currentTimeMillis()}.mp4"
            val file = File(downloadsDir, fileName)
            
            if (videoUrl.startsWith("http") || videoUrl.startsWith("https")) {
                // For HTTP URLs, download from the network
                val url = URL(videoUrl)
                val connection = url.openConnection()
                connection.connect()
                val inputStream = connection.getInputStream()
                val outputStream = FileOutputStream(file)

                inputStream.use { input ->
                    outputStream.use { output ->
                        input.copyTo(output)
                    }
                }
            } else {
                // For local file paths, copy the file
                val sourceFile = File(videoUrl)
                if (sourceFile.exists()) {
                    sourceFile.copyTo(file, overwrite = true)
                } else {
                    throw Exception("Source video file not found")
                }
            }
            
            withContext(Dispatchers.Main) {
                Toast.makeText(context, "Download complete: $fileName", Toast.LENGTH_LONG).show()
                // Optionally, notify the media scanner
                val mediaScanIntent = Intent(Intent.ACTION_MEDIA_SCANNER_SCAN_FILE)
                mediaScanIntent.data = Uri.fromFile(file)
                context.sendBroadcast(mediaScanIntent)
            }
        } catch (e: Exception) {
            Log.e("DownloadError", "Error downloading video: ${e.message}", e)
            withContext(Dispatchers.Main) {
                Toast.makeText(context, "Download failed: ${e.message}", Toast.LENGTH_LONG).show()
            }
        }
    }
}



