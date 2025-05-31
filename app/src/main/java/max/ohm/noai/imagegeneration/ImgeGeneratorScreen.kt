package max.ohm.noai.imagegeneration

import android.content.ContentValues
import android.content.Context
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.os.Build
import android.os.Environment
import android.provider.MediaStore
import android.widget.Toast
import androidx.compose.animation.core.RepeatMode
import androidx.compose.animation.core.animateFloat
import androidx.compose.animation.core.infiniteRepeatable
import androidx.compose.animation.core.rememberInfiniteTransition
import androidx.compose.animation.core.tween
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.BorderStroke
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Row
import androidx.compose.material3.Button
import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.material3.OutlinedButton
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.runtime.rememberCoroutineScope
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.alpha
import androidx.compose.ui.draw.scale
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.unit.dp
import androidx.lifecycle.viewmodel.compose.viewModel
import coil.compose.AsyncImage
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Scaffold
import androidx.compose.material3.TopAppBar
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Download
import androidx.compose.material.icons.filled.Settings
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.ui.tooling.preview.Preview
import max.ohm.noai.videogeneration.VideoGenerationScreen
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import java.io.ByteArrayOutputStream
import java.io.File
import java.io.FileOutputStream
import java.io.IOException
import java.io.OutputStream
import java.net.HttpURLConnection
import java.net.URL
import java.text.SimpleDateFormat
import java.util.Date
import java.util.Locale
import androidx.compose.material.icons.filled.ArrowDropDown
import androidx.compose.material3.DropdownMenu
import androidx.compose.material3.DropdownMenuItem
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.layout.heightIn
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material3.ExposedDropdownMenuBox
import androidx.compose.material3.ExposedDropdownMenuDefaults
import androidx.compose.foundation.layout.IntrinsicSize
import androidx.compose.foundation.layout.width

// Helper function to format seconds into MM:SS string
fun formatSecondsToMMSS(seconds: Long): String {
    val minutes = seconds / 60
    val remainingSeconds = seconds % 60
    return String.format("%02d:%02d", minutes, remainingSeconds)
}

private suspend fun downloadImageAndSaveToDevice(
    context: Context,
    imageData: Any?, // Can be ByteArray or String (URL)
    baseFileName: String
): Boolean = withContext(Dispatchers.IO) {
    val resolver = context.contentResolver
    val imageBytes: ByteArray? = when (imageData) {
        is String -> { // URL
            try {
                val url = URL(imageData)
                val connection = url.openConnection() as HttpURLConnection
                connection.doInput = true
                connection.connect()
                val inputStream = connection.inputStream
                val bitmap = BitmapFactory.decodeStream(inputStream)
                inputStream.close()
                connection.disconnect()

                val outputStream = ByteArrayOutputStream()
                bitmap.compress(Bitmap.CompressFormat.PNG, 100, outputStream)
                outputStream.toByteArray()
            } catch (e: IOException) {
                e.printStackTrace()
                null
            }
        }
        is ByteArray -> imageData
        else -> null
    }

    if (imageBytes == null) {
        withContext(Dispatchers.Main) {
            Toast.makeText(context, "Failed to load image data for download.", Toast.LENGTH_SHORT).show()
        }
        return@withContext false
    }

    val timeStamp = SimpleDateFormat("yyyyMMdd_HHmmss", Locale.getDefault()).format(Date())
    val safeBaseFileName = baseFileName.replace(Regex("[^a-zA-Z0-9_]"), "_").take(20)
    val fileName = "${safeBaseFileName}_${timeStamp}.png"

    var fos: OutputStream? = null
    var success = false
    try {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            val contentValues = ContentValues().apply {
                put(MediaStore.MediaColumns.DISPLAY_NAME, fileName)
                put(MediaStore.MediaColumns.MIME_TYPE, "image/png")
                put(MediaStore.MediaColumns.RELATIVE_PATH, Environment.DIRECTORY_DOWNLOADS)
            }
            val imageUri = resolver.insert(MediaStore.Downloads.EXTERNAL_CONTENT_URI, contentValues)
            fos = imageUri?.let { resolver.openOutputStream(it) }
        } else {
            val downloadsDir = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS)
            if (!downloadsDir.exists()) {
                downloadsDir.mkdirs()
            }
            val imageFile = File(downloadsDir, fileName)
            fos = FileOutputStream(imageFile)
        }

        fos?.use { it.write(imageBytes) }
        success = true
        withContext(Dispatchers.Main) {
            Toast.makeText(context, "Image saved to Downloads", Toast.LENGTH_SHORT).show()
        }
    } catch (e: IOException) {
        e.printStackTrace()
        withContext(Dispatchers.Main) {
            Toast.makeText(context, "Error saving image: ${e.message}", Toast.LENGTH_LONG).show()
        }
    }
    return@withContext success
}

// Data class to hold model information for the dropdown
data class ModelChoice(val displayName: String, val internalName: String)

// --- Image Generator Screen Composable ---
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun ImageGeneratorScreen(
    unifiedImageViewModel: UnifiedImageViewModel = viewModel(),
    initialModelType: String? = null
) {
    val context = LocalContext.current
    val prompt = unifiedImageViewModel.prompt
    val generatedImageData = unifiedImageViewModel.generatedImageData
    val imageUrl = unifiedImageViewModel.imageUrl
    val isLoading = unifiedImageViewModel.isLoading
    val errorMessage = unifiedImageViewModel.errorMessage
    val selectedModelInternalName = unifiedImageViewModel.selectedModel

    val elapsedTimeInSeconds by unifiedImageViewModel.elapsedTimeInSeconds.collectAsState()
    val totalGenerationTimeInSeconds by unifiedImageViewModel.totalGenerationTimeInSeconds.collectAsState()

    val infiniteTransition = rememberInfiniteTransition(label = "loading_animation")

    val textAlpha by infiniteTransition.animateFloat(
        initialValue = 0.5f,
        targetValue = 1f,
        animationSpec = infiniteRepeatable(
            animation = tween(durationMillis = 1000),
            repeatMode = RepeatMode.Reverse
        ), label = "text_alpha"
    )

    val progressScale by infiniteTransition.animateFloat(
        initialValue = 1f,
        targetValue = 1.2f,
        animationSpec = infiniteRepeatable(
            animation = tween(durationMillis = 700),
            repeatMode = RepeatMode.Reverse
        ), label = "progress_scale"
    )

    val coroutineScope = rememberCoroutineScope()

    var modelMenuExpanded by remember { mutableStateOf(false) }
    val modelChoices = listOf(
        ModelChoice("Flux Schnell", "flux.1-schnell"),
        ModelChoice("Flux Pro", "flux.1.1-pro"),
        ModelChoice("Flux Ultra Pro", "flux.ultra-pro"),
        ModelChoice("DALL-E 3", "provider-4/dall-e-3"),
        ModelChoice("Shuttle 3.1 Aesthetic", "provider-4/shuttle-3.1-aesthetic"),
        ModelChoice("Shuttle 3 Diffusion", "provider-4/shuttle-3-diffusion"),
        ModelChoice("Shuttle Jaguar", "provider-4/shuttle-jaguar"),
        ModelChoice("Flux Dev", "provider-4/flux-dev"),
        ModelChoice("Flux 1 Dev", "provider-2/flux.1-dev")
    )
    val currentSelectedModelChoice = modelChoices.find { it.internalName == selectedModelInternalName } ?: modelChoices.first()

    LaunchedEffect(initialModelType) {
        initialModelType?.let {
            unifiedImageViewModel.updateSelectedModel(it)
        }
    }

    // Show Toast when errorMessage changes
    LaunchedEffect(errorMessage) {
        errorMessage?.let {
            Toast.makeText(context, it, Toast.LENGTH_LONG).show()
            unifiedImageViewModel.clearErrorMessage() // Clear message after showing
        }
    }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("AI Image Generator") },
                actions = {
                    // Settings icon placeholder
                    IconButton(onClick = { /* TODO: Navigate to settings */ }) {
                        Icon(Icons.Filled.Settings, contentDescription = "Settings")
                    }
                }
            )
        }
    ) { paddingValues ->
        Column(
            modifier = Modifier
                .padding(paddingValues)
                .fillMaxSize()
                .padding(16.dp),
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            // Image Display Area
            Box(
                modifier = Modifier
                    .fillMaxWidth()
                    .weight(1f) // Takes up available space
                    .padding(bottom = 16.dp),
                contentAlignment = Alignment.Center
            ) {
                if (isLoading) {
                    Column(horizontalAlignment = Alignment.CenterHorizontally) { // Center content
                        CircularProgressIndicator(
                            modifier = Modifier.scale(progressScale) // Apply scale animation
                        )
                        Spacer(modifier = Modifier.height(16.dp)) // Increased spacer
                        Text(
                            text = "Generating... ${formatSecondsToMMSS(elapsedTimeInSeconds)}",
                            modifier = Modifier.alpha(textAlpha) // Apply alpha animation
                        )
                    }
                } else if (generatedImageData != null || imageUrl != null) {
                    val imageToDisplay = generatedImageData ?: imageUrl
                    AsyncImage(
                        model = imageToDisplay,
                        contentDescription = "Generated Image",
                        modifier = Modifier.fillMaxSize(),
                        contentScale = ContentScale.Fit
                    )
                    // Download Icon
                    IconButton(
                        onClick = {
                            val imageDataSource = generatedImageData ?: imageUrl
                            if (imageDataSource != null) {
                                coroutineScope.launch {
                                    downloadImageAndSaveToDevice(context, imageDataSource, prompt.text.ifBlank { "generated_image" })
                                }
                            } else {
                                Toast.makeText(context, "No image to download", Toast.LENGTH_SHORT).show()
                            }
                        },
                        modifier = Modifier
                            .align(Alignment.TopEnd)
                            .padding(8.dp)
                            .background(Color.Black.copy(alpha = 0.5f), shape = androidx.compose.foundation.shape.CircleShape)
                    ) {
                        Icon(
                            imageVector = Icons.Filled.Download,
                            contentDescription = "Download Image",
                            tint = Color.White
                        )
                    }
                } else {
                    // Placeholder or initial state text
                    Box(modifier = Modifier.fillMaxSize(), contentAlignment = Alignment.Center) { // Center placeholder text
                        Text("Enter a prompt and click Generate")
                    }
                }
            }

            // Display Total Generation Time if available and not loading
            if (!isLoading && totalGenerationTimeInSeconds != null) {
                Spacer(modifier = Modifier.height(8.dp))
                Text("Total time: ${formatSecondsToMMSS(totalGenerationTimeInSeconds!!)}")
            }

            // Input Field for Prompt
            OutlinedTextField(
                value = prompt,
                onValueChange = { unifiedImageViewModel.updatePrompt(it) },
                label = { Text("Enter Prompt") },
                modifier = Modifier.fillMaxWidth(),
                singleLine = true,
                enabled = !isLoading,
                shape = RoundedCornerShape(45.dp),
                trailingIcon = {
                    Box(modifier = Modifier.padding(start = 0.dp, end = 9.dp)) {
                        OutlinedButton(
                            onClick = { modelMenuExpanded = !modelMenuExpanded },
                            shape = RoundedCornerShape(45.dp),
                            border = BorderStroke(2.dp, Color.Blue),
                            contentPadding = PaddingValues(start = 19.dp, end = 9.dp, top = 8.dp, bottom = 8.dp)
                        ) {
                            Text(currentSelectedModelChoice.displayName)
                            Icon(
                                imageVector = Icons.Filled.ArrowDropDown,
                                contentDescription = "Select Model",
                                modifier = Modifier.padding(start = 4.dp)
                            )
                        }
                        // Simple dropdown without scrolling functionality
                        DropdownMenu(
                            expanded = modelMenuExpanded,
                            onDismissRequest = { modelMenuExpanded = false }
                        ) {
                            // No Column or scrolling - just direct list of items
                            modelChoices.forEach { selectionOption ->
                                DropdownMenuItem(
                                    text = { Text(selectionOption.displayName) },
                                    onClick = {
                                        unifiedImageViewModel.updateSelectedModel(selectionOption.internalName)
                                        modelMenuExpanded = false
                                    },
                                    contentPadding = ExposedDropdownMenuDefaults.ItemContentPadding
                                )
                            }
                        }
                    }
                }
            )
            Spacer(modifier = Modifier.height(16.dp))

            // Generate Button
            Button(
                onClick = { unifiedImageViewModel.generateImage() },
                enabled = !isLoading && prompt.text.isNotBlank(),
                modifier = Modifier.fillMaxWidth()
            ) {
                Text(if (isLoading) "Generating..." else "Generate")
            }
        }
    }
}

@Preview(showBackground = true)
@Composable
fun MyImagePreview() {
    ImageGeneratorScreen()// Your composable function here
}