package max.ohm.oneai.imagegeneration

import android.content.ContentValues
import android.content.Context
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.os.Build
import android.os.Environment
import android.provider.MediaStore
import android.widget.Toast
import androidx.compose.animation.AnimatedVisibility
import androidx.compose.animation.core.*
import androidx.compose.foundation.background
import androidx.compose.foundation.BorderStroke
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowDropDown
import androidx.compose.material.icons.filled.Download
import androidx.compose.material.icons.outlined.Image
import androidx.compose.material.icons.outlined.LightMode
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.alpha
import androidx.compose.ui.draw.clip
import androidx.compose.ui.draw.scale
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.lifecycle.viewmodel.compose.viewModel
import coil.compose.AsyncImage
import coil.request.ImageRequest
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
import android.util.Log

// Define the color scheme based on the HTML design
private val DarkGreen = Color(0xFF10231c)
private val MediumGreen = Color(0xFF214a3c)
private val LightGreen = Color(0xFF8ecdb7)
private val AccentGreen = Color(0xFF019863)

// Helper function to format seconds into MM:SS string
internal fun formatSecondsToMMSS(seconds: Long): String {
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
        ModelChoice("Image-1", "provider-5/gpt-image-1"),
        ModelChoice("ImageGen-4", "provider-4/imagen-4"),
        ModelChoice("ImageGen-3", "provider-4/imagen-3"),
        ModelChoice("FLUX Kontext Max", "provider-2/FLUX.1-kontext-max"),
        ModelChoice("FLUX Kontext Pro", "provider-1/FLUX.1-kontext-pro"),
        ModelChoice("Flux Pro Raw", "provider-3/FLUX.1.1-pro-ultra-raw"),
        ModelChoice("Flux Pro", "provider-1/FLUX.1.1-pro"),
        ModelChoice("Flux Ultra Pro", "provider-3/FLUX.1.1-pro-ultra"),
        ModelChoice("DALL-E 3", "provider-3/dall-e-3"),
        ModelChoice("Shuttle 3.1 Aesthetic", "provider-3/shuttle-3.1-aesthetic"),
        ModelChoice("Shuttle 3 Diffusion", "provider-3/shuttle-3-diffusion"),
        ModelChoice("Shuttle Jaguar", "provider-3/shuttle-jaguar"),
        ModelChoice("Flux Dev", "provider-3/FLUX.1-dev")
    )
    // Always ensure we have a valid model choice, defaulting to Flux Schnell if not found
    val currentSelectedModelChoice = modelChoices.find { it.internalName == selectedModelInternalName } 
        ?: modelChoices.find { it.internalName == "flux.1-schnell" } 
        ?: modelChoices.first()

    // Ensure the model is properly initialized when the screen is first displayed
    LaunchedEffect(Unit) {
        // Force initialize with the default model to ensure proper setup
        val defaultModel = "flux.1-schnell"
        Log.d("ImageGeneratorScreen", "Initializing with default model: $defaultModel, current model: ${unifiedImageViewModel.selectedModel}")
        
        // Always force the model to be set to the default on screen initialization
        unifiedImageViewModel.updateSelectedModel(defaultModel)
    }

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

    Column(
        modifier = Modifier
            .fillMaxSize()
            .background(DarkGreen)
    ) {
        // Top Bar
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .background(DarkGreen)
                .padding(16.dp, 16.dp, 16.dp, 8.dp),
            verticalAlignment = Alignment.CenterVertically,
            horizontalArrangement = Arrangement.SpaceBetween
        ) {
            // Empty space for alignment
            Spacer(modifier = Modifier.width(48.dp))
            
            // Title
            Text(
                text = "AI Image Generator",
                color = Color.White,
                fontSize = 18.sp,
                fontWeight = FontWeight.Bold,
                modifier = Modifier.weight(1f),
                textAlign = TextAlign.Center
            )
            
            // Theme toggle button
            IconButton(
                onClick = { /* Theme toggle functionality */ },
                modifier = Modifier.size(48.dp)
            ) {
                Icon(
                    imageVector = Icons.Outlined.LightMode,
                    contentDescription = "Toggle Theme",
                    tint = Color.White
                )
            }
        }
        
        // Main Content
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(16.dp),
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            // Image Display Area with Card
            Card(
                modifier = Modifier
                    .fillMaxWidth()
                    .weight(1f)
                    .padding(bottom = 16.dp),
                shape = RoundedCornerShape(24.dp),
                colors = CardDefaults.cardColors(
                    containerColor = MediumGreen
                ),
                elevation = CardDefaults.cardElevation(
                    defaultElevation = 4.dp
                )
            ) {
                Box(
                    modifier = Modifier
                        .fillMaxSize()
                        .padding(16.dp),
                    contentAlignment = Alignment.Center
                ) {
                    if (isLoading) {
                        Column(
                            horizontalAlignment = Alignment.CenterHorizontally,
                            verticalArrangement = Arrangement.Center,
                            modifier = Modifier.fillMaxSize()
                        ) {
                            CircularProgressIndicator(
                                modifier = Modifier.scale(progressScale),
                                color = AccentGreen
                            )
                            
                            Spacer(modifier = Modifier.height(16.dp))
                            
                            Text(
                                text = "Creating your masterpiece...",
                                color = LightGreen,
                                fontSize = 16.sp,
                                fontWeight = FontWeight.Medium,
                                modifier = Modifier.alpha(textAlpha)
                            )
                            
                            Spacer(modifier = Modifier.height(8.dp))
                            
                            Text(
                                text = formatSecondsToMMSS(elapsedTimeInSeconds),
                                color = Color.White,
                                fontSize = 14.sp
                            )
                        }
                    } else if (generatedImageData != null || imageUrl != null) {
                        val imageToDisplay = generatedImageData ?: imageUrl
                        Box(modifier = Modifier.fillMaxSize()) {
                            AsyncImage(
                                model = ImageRequest.Builder(LocalContext.current)
                                    .data(imageToDisplay)
                                    .crossfade(true)
                                    .build(),
                                contentDescription = "Generated Image",
                                modifier = Modifier.fillMaxSize(),
                                contentScale = ContentScale.Fit
                            )
                            
                            // Download button with improved styling
                            IconButton(
                                onClick = {
                                    val imageDataSource = generatedImageData ?: imageUrl
                                    if (imageDataSource != null) {
                                        coroutineScope.launch {
                                            downloadImageAndSaveToDevice(context, imageDataSource, prompt.text.ifEmpty { "generated_image" })
                                        }
                                    } else {
                                        Toast.makeText(context, "No image to download", Toast.LENGTH_SHORT).show()
                                    }
                                },
                                modifier = Modifier
                                    .align(Alignment.TopEnd)
                                    .padding(8.dp)
                                    .size(48.dp)
                                    .background(Color.Black.copy(alpha = 0.6f), CircleShape)
                            ) {
                                Icon(
                                    imageVector = Icons.Filled.Download,
                                    contentDescription = "Download Image",
                                    tint = Color.White,
                                    modifier = Modifier.size(24.dp)
                                )
                            }
                        }
                    } else {
                        // Placeholder with icon and text
                        Column(
                            horizontalAlignment = Alignment.CenterHorizontally,
                            verticalArrangement = Arrangement.Center,
                            modifier = Modifier.fillMaxSize()
                        ) {
                            Icon(
                                imageVector = Icons.Outlined.Image,
                                contentDescription = "Image Placeholder",
                                tint = LightGreen.copy(alpha = 0.7f),
                                modifier = Modifier.size(80.dp)
                            )
                            
                            Spacer(modifier = Modifier.height(16.dp))
                            
                            Text(
                                text = "Enter a prompt below and click Generate",
                                color = LightGreen,
                                fontSize = 16.sp,
                                textAlign = TextAlign.Center
                            )
                        }
                    }
                }
            }

            // Display Total Generation Time if available and not loading
            if (!isLoading && totalGenerationTimeInSeconds != null) {
                Text(
                    text = "Generated in: ${formatSecondsToMMSS(totalGenerationTimeInSeconds!!)}",
                    color = LightGreen,
                    fontSize = 14.sp,
                    modifier = Modifier.padding(bottom = 16.dp)
                )
            }

            // Model Selection Dropdown
            Box(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(bottom = 16.dp)
            ) {
                OutlinedButton(
                    onClick = { modelMenuExpanded = !modelMenuExpanded },
                    shape = RoundedCornerShape(16.dp),
                    border = BorderStroke(1.dp, LightGreen),
                    colors = ButtonDefaults.outlinedButtonColors(
                        contentColor = Color.White
                    ),
                    modifier = Modifier.fillMaxWidth()
                ) {
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.SpaceBetween,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Text(
                            text = "Model: ${currentSelectedModelChoice.displayName}",
                            fontSize = 16.sp
                        )
                        Icon(
                            imageVector = Icons.Filled.ArrowDropDown,
                            contentDescription = "Select Model"
                        )
                    }
                }
                
                DropdownMenu(
                    expanded = modelMenuExpanded,
                    onDismissRequest = { modelMenuExpanded = false },
                    modifier = Modifier
                        .fillMaxWidth(0.9f)
                        .background(MediumGreen)
                ) {
                    modelChoices.forEach { selectionOption ->
                        DropdownMenuItem(
                            text = { 
                                Text(
                                    text = selectionOption.displayName,
                                    color = Color.White
                                ) 
                            },
                            onClick = {
                                unifiedImageViewModel.updateSelectedModel(selectionOption.internalName)
                                modelMenuExpanded = false
                            }
                        )
                    }
                }
            }

            // Input Field for Prompt with modern styling
            OutlinedTextField(
                value = prompt,
                onValueChange = { unifiedImageViewModel.updatePrompt(it) },
                placeholder = { Text("Describe the image you want to create...", color = LightGreen) },
                modifier = Modifier.fillMaxWidth(),
                enabled = !isLoading,
                shape = RoundedCornerShape(16.dp),
                colors = TextFieldDefaults.outlinedTextFieldColors(
                    containerColor = MediumGreen,
                    cursorColor = Color.White,
                    focusedBorderColor = AccentGreen,
                    unfocusedBorderColor = MediumGreen
                )
            )
            
            Spacer(modifier = Modifier.height(16.dp))

            // Generate Button with modern styling
            Button(
                onClick = { 
                    if (unifiedImageViewModel.selectedModel.isBlank()) {
                        Log.d("ImageGeneratorScreen", "Setting model before generating")
                        unifiedImageViewModel.updateSelectedModel("flux.1-schnell")
                    }
                    unifiedImageViewModel.generateImage() 
                },
                enabled = !isLoading && prompt.text.isNotEmpty(),
                modifier = Modifier.fillMaxWidth(),
                shape = RoundedCornerShape(16.dp),
                colors = ButtonDefaults.buttonColors(
                    containerColor = AccentGreen,
                    disabledContainerColor = AccentGreen.copy(alpha = 0.5f)
                ),
                contentPadding = PaddingValues(vertical = 16.dp)
            ) {
                Text(
                    text = if (isLoading) "Generating..." else "Generate Image",
                    fontSize = 16.sp,
                    fontWeight = FontWeight.Bold
                )
            }
        }
    }
}

@Preview(showBackground = true)
@Composable
fun MyImagePreview() {
    ImageGeneratorScreen()
}
