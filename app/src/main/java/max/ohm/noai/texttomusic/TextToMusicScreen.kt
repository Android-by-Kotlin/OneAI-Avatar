package max.ohm.noai.texttomusic

import android.Manifest
import android.content.pm.PackageManager
import android.os.Build
import android.widget.Toast
import androidx.activity.compose.rememberLauncherForActivityResult
import androidx.activity.result.contract.ActivityResultContracts
import androidx.compose.foundation.BorderStroke
import androidx.compose.foundation.background
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
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Delete
import androidx.compose.material.icons.filled.Download
import androidx.compose.material.icons.filled.DownloadDone
import androidx.compose.material.icons.filled.Info
import androidx.compose.material.icons.filled.MusicNote
import androidx.compose.material.icons.filled.Pause
import androidx.compose.material.icons.filled.PlayArrow
import androidx.compose.material.icons.filled.Send
import androidx.compose.material3.Button
import androidx.compose.material3.Card
import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.LinearProgressIndicator
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.material3.TopAppBar
import androidx.compose.material3.TooltipBox
import androidx.compose.material3.TooltipDefaults
import androidx.compose.material3.rememberTooltipState
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.core.content.ContextCompat
import androidx.lifecycle.viewmodel.compose.viewModel
import java.text.SimpleDateFormat
import java.util.Date
import java.util.Locale

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun TextToMusicScreen(
    textToMusicViewModel: TextToMusicViewModel = viewModel()
) {
    val context = LocalContext.current
    val prompt = textToMusicViewModel.prompt
    val isGenerating = textToMusicViewModel.isGenerating
    val isPlaying = textToMusicViewModel.isPlaying
    val generationProgress = textToMusicViewModel.generationProgress
    val errorMessage = textToMusicViewModel.errorMessage
    val generationStatus = textToMusicViewModel.generationStatus
    val trackHistory = textToMusicViewModel.trackHistory
    val isDownloading = textToMusicViewModel.isDownloading
    
    // Show test mode notice if using default API key
    val isTestMode = BEATOVEN_API_KEY == "YOUR_BEATOVEN_API_KEY"
    
    // For permission handling
    var trackToDownload by remember { mutableStateOf<String?>(null) }
    
    // Permission launcher
    val requestPermissionLauncher = rememberLauncherForActivityResult(
        contract = ActivityResultContracts.RequestPermission()
    ) { isGranted ->
        if (isGranted) {
            // Permission granted, proceed with download
            trackToDownload?.let {
                textToMusicViewModel.downloadTrack(context, it)
                trackToDownload = null
            }
        } else {
            // Permission denied
            Toast.makeText(
                context,
                "Storage permission is required to download music",
                Toast.LENGTH_LONG
            ).show()
        }
    }
    
    // Format for displaying timestamps
    val dateFormat = remember { SimpleDateFormat("MMM dd, HH:mm", Locale.getDefault()) }
    
    // Show Toast when errorMessage changes
    LaunchedEffect(errorMessage) {
        errorMessage?.let {
            Toast.makeText(context, it, Toast.LENGTH_LONG).show()
            textToMusicViewModel.clearErrorMessage()
        }
    }
    
    // Function to handle download with permission check
    val handleDownload = { trackId: String ->
        if (Build.VERSION.SDK_INT <= Build.VERSION_CODES.P) {
            // For Android 9 (API 28) and below, we need WRITE_EXTERNAL_STORAGE permission
            when (PackageManager.PERMISSION_GRANTED) {
                ContextCompat.checkSelfPermission(
                    context,
                    Manifest.permission.WRITE_EXTERNAL_STORAGE
                ) -> {
                    // Permission already granted
                    textToMusicViewModel.downloadTrack(context, trackId)
                }
                else -> {
                    // Request permission
                    trackToDownload = trackId
                    requestPermissionLauncher.launch(Manifest.permission.WRITE_EXTERNAL_STORAGE)
                }
            }
        } else {
            // For Android 10+ (API 29+), we don't need runtime permission for app-specific files
            // or when using MediaStore
            textToMusicViewModel.downloadTrack(context, trackId)
        }
    }
    
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Text to Music") }
            )
        }
    ) { paddingValues ->
        Column(
            modifier = Modifier
                .padding(paddingValues)
                .fillMaxSize()
                .padding(16.dp)
        ) {
            // API key notice if in test mode
            if (isTestMode) {
                Card(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(bottom = 16.dp),
                    shape = RoundedCornerShape(8.dp),
                    border = BorderStroke(1.dp, MaterialTheme.colorScheme.primary)
                ) {
                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(12.dp),
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Icon(
                            Icons.Filled.Info,
                            contentDescription = "Info",
                            tint = MaterialTheme.colorScheme.primary,
                            modifier = Modifier.padding(end = 8.dp)
                        )
                        Column {
                            Text(
                                "Running in test mode with sample audio",
                                style = MaterialTheme.typography.bodyMedium,
                                color = MaterialTheme.colorScheme.primary
                            )
                            Text(
                                "For actual music generation, get an API key from beatoven.ai and update BeatovenApiKey.kt",
                                style = MaterialTheme.typography.bodySmall
                            )
                        }
                    }
                }
            }
            
            // Input section
            Card(
                modifier = Modifier.fillMaxWidth(),
                shape = RoundedCornerShape(16.dp)
            ) {
                Column(
                    modifier = Modifier.padding(16.dp),
                    verticalArrangement = Arrangement.spacedBy(16.dp)
                ) {
                    Text(
                        "Generate music from text",
                        style = MaterialTheme.typography.titleMedium
                    )
                    
                    OutlinedTextField(
                        value = prompt,
                        onValueChange = { textToMusicViewModel.updatePrompt(it) },
                        label = { Text("Enter a text prompt") },
                        placeholder = { Text("E.g., 30 seconds soft piano melody") },
                        modifier = Modifier.fillMaxWidth(),
                        enabled = !isGenerating
                    )
                    
                    Button(
                        onClick = { textToMusicViewModel.generateMusic(context) },
                        enabled = !isGenerating && prompt.text.isNotBlank(),
                        modifier = Modifier.align(Alignment.End)
                    ) {
                        Icon(Icons.Filled.Send, contentDescription = "Generate")
                        Spacer(modifier = Modifier.width(8.dp))
                        Text("Generate Music")
                    }
                    
                    // Progress indicator and status
                    if (isGenerating) {
                        Column(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalAlignment = Alignment.CenterHorizontally,
                            verticalArrangement = Arrangement.spacedBy(8.dp)
                        ) {
                            LinearProgressIndicator(
                                progress = { generationProgress },
                                modifier = Modifier.fillMaxWidth()
                            )
                            
                            // Show estimated remaining time based on progress
                            val estimatedTimeText = when {
                                generationProgress < 0.3f -> "This may take 1-2 minutes..."
                                generationProgress < 0.5f -> "Almost halfway there..."
                                generationProgress < 0.8f -> "Getting close..."
                                else -> "Finalizing your music..."
                            }
                            
                            Column(horizontalAlignment = Alignment.CenterHorizontally) {
                                Text(
                                    generationStatus,
                                    style = MaterialTheme.typography.bodyMedium,
                                    textAlign = TextAlign.Center
                                )
                                
                                Spacer(modifier = Modifier.height(4.dp))
                                
                                Text(
                                    estimatedTimeText,
                                    style = MaterialTheme.typography.bodySmall,
                                    color = MaterialTheme.colorScheme.onSurfaceVariant,
                                    textAlign = TextAlign.Center
                                )
                            }
                        }
                    }
                }
            }
            
            Spacer(modifier = Modifier.height(16.dp))
            
            // History section
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text(
                    "Generated Music",
                    style = MaterialTheme.typography.titleMedium
                )
                
                if (isDownloading) {
                    Row(
                        verticalAlignment = Alignment.CenterVertically,
                        horizontalArrangement = Arrangement.spacedBy(8.dp)
                    ) {
                        CircularProgressIndicator(
                            modifier = Modifier.size(16.dp),
                            strokeWidth = 2.dp
                        )
                        Text(
                            "Downloading...",
                            style = MaterialTheme.typography.bodySmall
                        )
                    }
                }
            }
            
            Spacer(modifier = Modifier.height(8.dp))
            
            if (trackHistory.isEmpty()) {
                Box(
                    modifier = Modifier
                        .fillMaxWidth()
                        .height(200.dp),
                    contentAlignment = Alignment.Center
                ) {
                    Text(
                        "No music generated yet. Enter a text prompt to create music.",
                        textAlign = TextAlign.Center,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
            } else {
                LazyColumn(
                    modifier = Modifier.weight(1f),
                    verticalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    items(trackHistory.sortedByDescending { it.timestamp }) { track ->
                        TrackHistoryItem(
                            track = track,
                            isPlaying = isPlaying && textToMusicViewModel.currentTrackPath == track.filePath,
                            dateFormat = dateFormat,
                            onPlay = { textToMusicViewModel.playTrackFromHistory(context, track.id) },
                            onStop = { textToMusicViewModel.stopMusic() },
                            onDelete = { textToMusicViewModel.deleteTrack(track.id) },
                            onDownload = { handleDownload(track.id) },
                            isDownloading = isDownloading
                        )
                    }
                }
            }
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun TrackHistoryItem(
    track: TextToMusicViewModel.TrackInfo,
    isPlaying: Boolean,
    dateFormat: SimpleDateFormat,
    onPlay: () -> Unit,
    onStop: () -> Unit,
    onDelete: () -> Unit,
    onDownload: () -> Unit,
    isDownloading: Boolean
) {
    Surface(
        modifier = Modifier.fillMaxWidth(),
        shape = RoundedCornerShape(12.dp),
        border = BorderStroke(1.dp, MaterialTheme.colorScheme.outlineVariant)
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(12.dp),
            verticalAlignment = Alignment.CenterVertically,
            horizontalArrangement = Arrangement.SpaceBetween
        ) {
            // Music icon
            Icon(
                Icons.Filled.MusicNote,
                contentDescription = null,
                tint = MaterialTheme.colorScheme.primary
            )
            
            // Track info
            Column(
                modifier = Modifier
                    .weight(1f)
                    .padding(horizontal = 12.dp)
            ) {
                Text(
                    track.prompt,
                    style = MaterialTheme.typography.bodyMedium,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )
                Text(
                    dateFormat.format(Date(track.timestamp)),
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
            
            // Play/Pause button
            TooltipBox(
                positionProvider = TooltipDefaults.rememberPlainTooltipPositionProvider(),
                tooltip = { Text(if (isPlaying) "Stop" else "Play") },
                state = rememberTooltipState()
            ) {
                IconButton(onClick = { if (isPlaying) onStop() else onPlay() }) {
                    Icon(
                        if (isPlaying) Icons.Filled.Pause else Icons.Filled.PlayArrow,
                        contentDescription = if (isPlaying) "Stop" else "Play"
                    )
                }
            }
            
            // Download button
            TooltipBox(
                positionProvider = TooltipDefaults.rememberPlainTooltipPositionProvider(),
                tooltip = { Text(if (track.isDownloaded) "Already Downloaded" else "Download") },
                state = rememberTooltipState()
            ) {
                IconButton(
                    onClick = { if (!track.isDownloaded) onDownload() },
                    enabled = !track.isDownloaded && !isDownloading
                ) {
                    Icon(
                        if (track.isDownloaded) Icons.Filled.DownloadDone else Icons.Filled.Download,
                        contentDescription = if (track.isDownloaded) "Already Downloaded" else "Download",
                        tint = if (track.isDownloaded) 
                            MaterialTheme.colorScheme.primary 
                        else 
                            MaterialTheme.colorScheme.onSurface
                    )
                }
            }
            
            // Delete button
            TooltipBox(
                positionProvider = TooltipDefaults.rememberPlainTooltipPositionProvider(),
                tooltip = { Text("Delete") },
                state = rememberTooltipState()
            ) {
                IconButton(onClick = onDelete) {
                    Icon(
                        Icons.Filled.Delete,
                        contentDescription = "Delete",
                        tint = MaterialTheme.colorScheme.error
                    )
                }
            }
        }
    }
} 