package max.ohm.oneai.videogeneration

import android.app.Activity
import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.net.Uri
import android.os.Environment
import android.util.Log
import android.widget.Toast
import androidx.compose.animation.animateColor
import androidx.compose.animation.core.*
import androidx.compose.foundation.BorderStroke
import androidx.compose.foundation.Canvas
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.CloudDownload
import androidx.compose.material.icons.filled.Download
import androidx.compose.material3.Button
import androidx.compose.material3.ButtonDefaults
import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Icon
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.OutlinedButton
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.material3.TopAppBar
import androidx.compose.runtime.Composable
import androidx.compose.runtime.DisposableEffect
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.draw.shadow
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.graphicsLayer
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontFamily
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

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun VideoGenerationScreen(
    viewModel: VideoGenerationViewModel = viewModel()
) {
    val prompt by viewModel.prompt.collectAsState()
    val generatedVideoUrl by viewModel.videoUrl.collectAsState()
    val isLoading by viewModel.isLoading.collectAsState()
    val error by viewModel.error.collectAsState()
    val context = LocalContext.current

    val elapsedTimeInSeconds by viewModel.elapsedTimeInSeconds.collectAsState()
    val totalGenerationTimeInSeconds by viewModel.totalGenerationTimeInSeconds.collectAsState()

    // Infinite transition for animations when loading
    val infiniteTransition = rememberInfiniteTransition(label = "loading_transition")

    val animatedScreenBackgroundColor by infiniteTransition.animateColor(
        initialValue = MaterialTheme.colorScheme.background,
        targetValue = MaterialTheme.colorScheme.surfaceVariant.copy(alpha = 0.3f), // Subtle change
        animationSpec = infiniteRepeatable(
            tween(durationMillis = 1500, easing = LinearEasing),
            RepeatMode.Reverse
        ),
        label = "screen_bg_color_anim"
    )

    val animatedButtonContainerColor by infiniteTransition.animateColor(
        initialValue = MaterialTheme.colorScheme.primary,
        targetValue = MaterialTheme.colorScheme.secondary,
        animationSpec = infiniteRepeatable(
            tween(durationMillis = 1000, easing = FastOutSlowInEasing),
            RepeatMode.Reverse
        ),
        label = "button_container_color_anim"
    )

    val animatedButtonBorderColor by infiniteTransition.animateColor(
        initialValue = MaterialTheme.colorScheme.primaryContainer, // Or another distinct color
        targetValue = MaterialTheme.colorScheme.tertiary,      // Pulsate to this
        animationSpec = infiniteRepeatable(
            tween(durationMillis = 700, easing = LinearEasing),
            RepeatMode.Reverse
        ),
        label = "button_border_color_anim"
    )

    val currentScreenBg = if (isLoading) animatedScreenBackgroundColor else MaterialTheme.colorScheme.background
    
    // Button colors and border for OutlinedButton
    val generateButtonContainerColor = if (isLoading) animatedButtonContainerColor else MaterialTheme.colorScheme.primary
    val generateButtonBorder = if (isLoading) {
        BorderStroke(2.dp, animatedButtonBorderColor)
    } else {
        ButtonDefaults.outlinedButtonBorder // Default border when not loading
    }
    val generateButtonColors = ButtonDefaults.outlinedButtonColors(
        containerColor = generateButtonContainerColor,
        disabledContainerColor = ButtonDefaults.outlinedButtonColors().disabledContainerColor,
        // Content color can be specified if needed, e.g., based on container animation
        contentColor = if (isLoading) MaterialTheme.colorScheme.onSecondary else MaterialTheme.colorScheme.onPrimary,
        disabledContentColor = ButtonDefaults.outlinedButtonColors().disabledContentColor
    )

    Scaffold(
        containerColor = currentScreenBg, // Apply animated background to Scaffold
        topBar = {
            TopAppBar(title = { Text("AI Video Generation") })
        }
    ) { paddingValues ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
                .padding(horizontal = 16.dp)
        ) {
            Column(
                modifier = Modifier
                    .weight(1f)
                    .fillMaxWidth(),
                horizontalAlignment = Alignment.CenterHorizontally,
                verticalArrangement = Arrangement.Center
            ) {
                Box(
                    modifier = Modifier
                        .fillMaxWidth()
                        .height(250.dp)
                        .background(Color.DarkGray)
                ) {
                    if (generatedVideoUrl != null) {
                        Box(modifier = Modifier.fillMaxSize()) {
                            VideoPlayer(
                                videoUrl = generatedVideoUrl!!,
                                autoplay = true,
                                modifier = Modifier
                                    .fillMaxSize()
                                    .background(Color.Black)
                            )
                            
                            // Colorful Download button overlay
                            Box(
                                modifier = Modifier
                                    .align(Alignment.TopEnd)
                                    .padding(12.dp)
                            ) {
                                ColorfulDownloadButton(
                                    videoUrl = generatedVideoUrl!!,
                                    context = context
                                )
                            }
                        }
                    } else {
                        Box(
                            modifier = Modifier.fillMaxSize(),
                            contentAlignment = Alignment.Center
                        ) {
                            if (isLoading) {
                                Column(horizontalAlignment = Alignment.CenterHorizontally) {
                                    CircularProgressIndicator(color = Color.White)
                                    Spacer(modifier = Modifier.height(8.dp))
                                    Text(
                                        text = "Generating video... (${formatSecondsToMMSS(elapsedTimeInSeconds)})",
                                        color = Color.White
                                    )
                                }
                            } else {
                                Text("Generated video will appear here", color = Color.White)
                            }
                        }
                    }
                }

                Spacer(modifier = Modifier.height(16.dp))

                if (totalGenerationTimeInSeconds != null && error == null) {
                    Text(
                        text = "Video generated in ${formatSecondsToMMSS(totalGenerationTimeInSeconds!!)}",
                        style = MaterialTheme.typography.bodyMedium,
                        modifier = Modifier.padding(vertical = 8.dp)
                    )
                } else if (error != null) {
                     Text(
                        text = "Error: $error",
                        color = MaterialTheme.colorScheme.error,
                        modifier = Modifier.fillMaxWidth().padding(vertical=8.dp),
                        style = MaterialTheme.typography.bodyLarge,
                        textAlign = androidx.compose.ui.text.style.TextAlign.Center
                    )
                    
                    // Add a retry button when there's an error
                    Button(
                        onClick = { viewModel.generateVideo() },
                        modifier = Modifier.padding(top = 8.dp)
                    ) {
                        Text("Retry Video Generation")
                    }
                } else {
                    val textHeight = MaterialTheme.typography.bodyMedium.lineHeight.value.dp + 16.dp
                    Spacer(modifier = Modifier.height(textHeight))
                }
            }

            Column(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(bottom = 16.dp),
                horizontalAlignment = Alignment.CenterHorizontally
            ) {
                OutlinedTextField(
                    value = prompt,
                    onValueChange = { viewModel.setPrompt(it) },
                    label = { Text("Enter video prompt") },
                    modifier = Modifier.fillMaxWidth(),
                    singleLine = true,
                    shape = RoundedCornerShape(percent = 50)
                )
                Spacer(modifier = Modifier.height(8.dp))
                
                // Two generation options
                Column(
                    modifier = Modifier.fillMaxWidth(),
                    verticalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    // Original video generation button
                    OutlinedButton(
                        onClick = { viewModel.generateVideo() },
                        enabled = !isLoading && prompt.isNotBlank(),
                        colors = generateButtonColors,
                        border = generateButtonBorder,
                        modifier = Modifier.fillMaxWidth()
                    ) {
                        Text(if (isLoading && !viewModel.isUsingA4F.collectAsState().value && !viewModel.isUsingModelsLab.collectAsState().value) "Generating..." else "Generate Video (Original API)")
                    }
                    
                    // New text-to-video generation button
                    Button(
                        onClick = { viewModel.generateTextToVideo() },
                        enabled = !isLoading && prompt.isNotBlank(),
                        modifier = Modifier.fillMaxWidth(),
                        colors = ButtonDefaults.buttonColors(
                            containerColor = MaterialTheme.colorScheme.secondary
                        )
                    ) {
                        Text(if (isLoading && viewModel.isUsingA4F.collectAsState().value) "Generating..." else "Generate from Text (A4F API)")
                    }
                    
                    // ModelsLab video generation button  
                    Button(
                        onClick = { viewModel.generateModelsLabVideo() },
                        enabled = !isLoading && prompt.isNotBlank(),
                        modifier = Modifier.fillMaxWidth(),
                        colors = ButtonDefaults.buttonColors(
                            containerColor = MaterialTheme.colorScheme.tertiary
                        )
                    ) {
                        Text(if (isLoading && viewModel.isUsingModelsLab.collectAsState().value) "Generating..." else "Generate with CogVideoX (ModelsLab)")
                    }
                    
                    // Traditional Download button (keeping as secondary option)
                    if (generatedVideoUrl != null) {
                        Button(
                            onClick = {
                                generatedVideoUrl?.let { url -> downloadVideo(context, url) }
                                    ?: Toast.makeText(context, "No video to download", Toast.LENGTH_SHORT).show()
                            },
                            enabled = generatedVideoUrl != null && !isLoading,
                            modifier = Modifier.fillMaxWidth(),
                            colors = ButtonDefaults.buttonColors(
                                containerColor = MaterialTheme.colorScheme.surfaceVariant
                            )
                        ) {
                            Icon(
                                imageVector = Icons.Default.Download,
                                contentDescription = null,
                                modifier = Modifier.size(20.dp)
                            )
                            Spacer(modifier = Modifier.width(8.dp))
                            Text("Download Video")
                        }
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

@OptIn(DelicateCoroutinesApi::class)
@Composable
fun ColorfulDownloadButton(
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



