package max.ohm.oneai.imagegeneration

import android.content.ContentValues
import android.content.Context
import android.content.Intent
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.net.Uri
import android.os.Build
import android.os.Environment
import android.provider.MediaStore
import android.widget.Toast
import androidx.compose.animation.*
import androidx.compose.animation.core.*
import androidx.compose.foundation.*
import androidx.compose.foundation.gestures.rememberTransformableState
import androidx.compose.foundation.gestures.transformable
import androidx.compose.foundation.interaction.MutableInteractionSource
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.grid.GridCells
import androidx.compose.foundation.lazy.grid.LazyVerticalGrid
import androidx.compose.foundation.lazy.grid.items
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
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
import androidx.compose.ui.graphics.painter.Painter
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.text.input.TextFieldValue
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.compose.ui.window.Dialog
import androidx.compose.ui.window.DialogProperties
import androidx.core.content.FileProvider
import androidx.lifecycle.viewmodel.compose.viewModel
import coil.compose.AsyncImage
import coil.compose.rememberAsyncImagePainter
import coil.request.ImageRequest
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import java.io.*
import java.net.HttpURLConnection
import java.net.URL
import java.text.SimpleDateFormat
import java.util.*
import androidx.compose.runtime.collectAsState
import android.util.Log

// Enhanced color scheme
private val DarkBackground = Color(0xFF0A0E27)
private val CardBackground = Color(0xFF1A1F3A)
private val AccentPurple = Color(0xFF6366F1)
private val AccentPink = Color(0xFFEC4899)
private val TextPrimary = Color(0xFFFFFFFF)
private val TextSecondary = Color(0xFFB8BCC8)
private val BorderColor = Color(0xFF2D3748)

// Data class for generated images history
data class GeneratedImage(
    val id: String = UUID.randomUUID().toString(),
    val prompt: String,
    val imageData: Any?, // ByteArray or URL
    val timestamp: Long = System.currentTimeMillis(),
    val model: String
)

@OptIn(ExperimentalMaterial3Api::class, ExperimentalFoundationApi::class)
@Composable
fun EnhancedImageGeneratorScreen(
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
    
    // Initialize persistent storage
    val imageHistoryStore = remember { ImageHistoryDataStore(context) }
    
    // History of generated images from persistent storage
    val persistedHistory by imageHistoryStore.imageHistory.collectAsState(initial = emptyList())
    var imageHistory by remember { mutableStateOf(listOf<GeneratedImage>()) }
    var showGallery by remember { mutableStateOf(false) }
    var selectedImage by remember { mutableStateOf<GeneratedImage?>(null) }
    var showImageDetail by remember { mutableStateOf(false) }
    
    val elapsedTimeInSeconds by unifiedImageViewModel.elapsedTimeInSeconds.collectAsState()
    val totalGenerationTimeInSeconds by unifiedImageViewModel.totalGenerationTimeInSeconds.collectAsState()
    
    val coroutineScope = rememberCoroutineScope()
    
    // Model selection
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
    
    val currentSelectedModelChoice = modelChoices.find { it.internalName == selectedModelInternalName } 
        ?: modelChoices.first()
    
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
    
    // Initialize model
    LaunchedEffect(Unit) {
        unifiedImageViewModel.updateSelectedModel("flux.1-schnell")
    }
    
    LaunchedEffect(initialModelType) {
        initialModelType?.let {
            unifiedImageViewModel.updateSelectedModel(it)
        }
    }
    
    // Load persisted history
    LaunchedEffect(persistedHistory) {
        Log.d("EnhancedImageGenerator", "Loading ${persistedHistory.size} images from history")
        imageHistory = persistedHistory.mapNotNull { item ->
            val imageData = imageHistoryStore.getImageData(item)
            if (imageData != null) {
                GeneratedImage(
                    id = item.id,
                    prompt = item.prompt,
                    imageData = imageData,
                    timestamp = item.timestamp,
                    model = item.model
                )
            } else {
                Log.e("EnhancedImageGenerator", "Failed to load image data for id: ${item.id}")
                null
            }
        }
        Log.d("EnhancedImageGenerator", "Successfully loaded ${imageHistory.size} images")
    }
    
    // Add generated image to history and persist it
    LaunchedEffect(generatedImageData, imageUrl) {
        if (generatedImageData != null || imageUrl != null) {
            coroutineScope.launch {
                val savedItem = imageHistoryStore.saveImage(
                    prompt = prompt.text,
                    imageData = generatedImageData ?: imageUrl,
                    model = currentSelectedModelChoice.displayName
                )
                if (savedItem != null) {
                    Log.d("EnhancedImageGenerator", "Image saved successfully with id: ${savedItem.id}")
                } else {
                    Log.e("EnhancedImageGenerator", "Failed to save image")
                    Toast.makeText(context, "Failed to save image to gallery", Toast.LENGTH_SHORT).show()
                }
            }
        }
    }
    
    // Show error messages
    LaunchedEffect(errorMessage) {
        errorMessage?.let {
            Toast.makeText(context, it, Toast.LENGTH_LONG).show()
            unifiedImageViewModel.clearErrorMessage()
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
                    // App Title with gradient
                    Box {
                        Text(
                            text = "AI Art Studio",
                            fontSize = 24.sp,
                            fontWeight = FontWeight.Bold,
                            color = TextPrimary,
                            modifier = Modifier.graphicsLayer(alpha = 0.99f)
                        )
                    }
                    
                    // Action buttons
                    Row(
                        horizontalArrangement = Arrangement.spacedBy(8.dp)
                    ) {
                        // Gallery button with badge
                        Box {
                            IconButton(
                                onClick = { showGallery = true }
                            ) {
                                Icon(
                                    imageVector = Icons.Outlined.PhotoLibrary,
                                    contentDescription = "Gallery",
                                    tint = TextPrimary
                                )
                            }
                            if (imageHistory.isNotEmpty()) {
                                Badge(
                                    modifier = Modifier.align(Alignment.TopEnd),
                                    containerColor = AccentPink
                                ) {
                                    Text("${imageHistory.size}")
                                }
                            }
                        }
                        
                        IconButton(
                            onClick = { /* Theme toggle */ }
                        ) {
                            Icon(
                                imageVector = Icons.Outlined.DarkMode,
                                contentDescription = "Toggle Theme",
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
                // Enhanced Image Display Card
                Card(
                    modifier = Modifier
                        .fillMaxWidth()
                        .aspectRatio(1f)
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
                            isLoading -> {
                                LoadingAnimation(
                                    gradientRotation = gradientRotation,
                                    elapsedTime = elapsedTimeInSeconds
                                )
                            }
                            generatedImageData != null || imageUrl != null -> {
                                GeneratedImageDisplay(
                                    imageData = generatedImageData ?: imageUrl,
                                    prompt = prompt.text,
                                    onDownload = {
                                        coroutineScope.launch {
                                            downloadImage(context, generatedImageData ?: imageUrl, prompt.text)
                                        }
                                    },
                                    onShare = {
                                        coroutineScope.launch {
                                            shareImage(context, generatedImageData ?: imageUrl, prompt.text)
                                        }
                                    },
                                    onFullscreen = {
                                        selectedImage = imageHistory.firstOrNull()
                                        showImageDetail = true
                                    }
                                )
                            }
                            else -> {
                                EmptyStateDisplay()
                            }
                        }
                    }
                }
                
                // Generation time display
                val currentTotalTime = totalGenerationTimeInSeconds
                val showGenerationTime = remember(isLoading, currentTotalTime) {
                    !isLoading && currentTotalTime != null && currentTotalTime > 0L
                }
                AnimatedVisibility(
                    visible = showGenerationTime,
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
                
                // Recent generations preview
                if (imageHistory.isNotEmpty() && !showGallery) {
                    RecentGenerationsPreview(
                        images = imageHistory.take(5),
                        onImageClick = { image ->
                            selectedImage = image
                            showImageDetail = true
                        },
                        onViewAll = { showGallery = true }
                    )
                }
                
                // Model Selection
                ModelSelectionCard(
                    currentModel = currentSelectedModelChoice,
                    modelChoices = modelChoices,
                    expanded = modelMenuExpanded,
                    onExpandedChange = { modelMenuExpanded = it },
                    onModelSelected = { model ->
                        unifiedImageViewModel.updateSelectedModel(model.internalName)
                        modelMenuExpanded = false
                    }
                )
                
                // Enhanced Prompt Input
                PromptInputCard(
                    prompt = prompt,
                    isLoading = isLoading,
                    onPromptChange = { unifiedImageViewModel.updatePrompt(it) }
                )
                
                // Generate Button
                GenerateButton(
                    isLoading = isLoading,
                    enabled = !isLoading && prompt.text.isNotEmpty(),
                    onClick = { unifiedImageViewModel.generateImage() }
                )
            }
        }
        
        // Gallery Overlay
        AnimatedVisibility(
            visible = showGallery,
            enter = fadeIn() + slideInVertically(),
            exit = fadeOut() + slideOutVertically()
        ) {
            GalleryOverlay(
                images = imageHistory,
                onDismiss = { showGallery = false },
                onImageClick = { image ->
                    selectedImage = image
                    showImageDetail = true
                    showGallery = false
                },
                onDeleteImage = { image ->
                    coroutineScope.launch {
                        imageHistoryStore.deleteImage(image.id)
                    }
                }
            )
        }
        
        // Image Detail Overlay
        if (showImageDetail && selectedImage != null) {
            ImageDetailDialog(
                image = selectedImage!!,
                onDismiss = { showImageDetail = false },
                onDownload = {
                    coroutineScope.launch {
                        downloadImage(context, selectedImage!!.imageData, selectedImage!!.prompt)
                    }
                },
                onShare = {
                    coroutineScope.launch {
                        shareImage(context, selectedImage!!.imageData, selectedImage!!.prompt)
                    }
                }
            )
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
                imageVector = Icons.Outlined.AutoAwesome,
                contentDescription = null,
                tint = TextPrimary,
                modifier = Modifier.size(48.dp)
            )
        }
        
        Spacer(modifier = Modifier.height(24.dp))
        
        Text(
            text = "Creating your masterpiece...",
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
private fun GeneratedImageDisplay(
    imageData: Any?,
    prompt: String,
    onDownload: () -> Unit,
    onShare: () -> Unit,
    onFullscreen: () -> Unit
) {
    Box(modifier = Modifier.fillMaxSize()) {
        AsyncImage(
            model = ImageRequest.Builder(LocalContext.current)
                .data(imageData)
                .crossfade(true)
                .build(),
            contentDescription = "Generated Image",
            modifier = Modifier
                .fillMaxSize()
                .clickable { onFullscreen() },
            contentScale = ContentScale.Fit
        )
        
        // Action buttons overlay
        Row(
            modifier = Modifier
                .align(Alignment.TopEnd)
                .padding(12.dp),
            horizontalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            ActionButton(
                icon = Icons.Filled.Share,
                onClick = onShare,
                contentDescription = "Share"
            )
            ActionButton(
                icon = Icons.Filled.Download,
                onClick = onDownload,
                contentDescription = "Download"
            )
            ActionButton(
                icon = Icons.Filled.Fullscreen,
                onClick = onFullscreen,
                contentDescription = "Fullscreen"
            )
        }
        
        // Prompt overlay
        Surface(
            modifier = Modifier
                .align(Alignment.BottomCenter)
                .fillMaxWidth()
                .padding(12.dp),
            color = Color.Black.copy(alpha = 0.7f),
            shape = RoundedCornerShape(12.dp)
        ) {
            Text(
                text = prompt,
                color = TextPrimary,
                fontSize = 12.sp,
                maxLines = 2,
                overflow = TextOverflow.Ellipsis,
                modifier = Modifier.padding(12.dp)
            )
        }
    }
}

@Composable
private fun ActionButton(
    icon: ImageVector,
    onClick: () -> Unit,
    contentDescription: String
) {
    Surface(
        modifier = Modifier.size(40.dp),
        shape = CircleShape,
        color = Color.Black.copy(alpha = 0.6f),
        onClick = onClick
    ) {
        Icon(
            imageVector = icon,
            contentDescription = contentDescription,
            tint = TextPrimary,
            modifier = Modifier
                .fillMaxSize()
                .padding(8.dp)
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
                imageVector = Icons.Outlined.Image,
                contentDescription = null,
                tint = AccentPurple,
                modifier = Modifier.size(64.dp)
            )
        }
        
        Spacer(modifier = Modifier.height(24.dp))
        
        Text(
            text = "Ready to create",
            color = TextPrimary,
            fontSize = 20.sp,
            fontWeight = FontWeight.Medium
        )
        
        Spacer(modifier = Modifier.height(8.dp))
        
        Text(
            text = "Enter a prompt below and watch AI bring your ideas to life",
            color = TextSecondary,
            fontSize = 16.sp,
            textAlign = TextAlign.Center
        )
    }
}

@Composable
private fun RecentGenerationsPreview(
    images: List<GeneratedImage>,
    onImageClick: (GeneratedImage) -> Unit,
    onViewAll: () -> Unit
) {
    Column(
        modifier = Modifier.fillMaxWidth()
    ) {
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Text(
                text = "Recent Creations",
                color = TextPrimary,
                fontSize = 18.sp,
                fontWeight = FontWeight.Medium
            )
            
            TextButton(onClick = onViewAll) {
                Text("View All", color = AccentPurple)
                Icon(
                    imageVector = Icons.Default.ArrowForward,
                    contentDescription = null,
                    tint = AccentPurple,
                    modifier = Modifier.size(16.dp)
                )
            }
        }
        
        Spacer(modifier = Modifier.height(12.dp))
        
        LazyRow(
            horizontalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            items(images) { image ->
                Card(
                    modifier = Modifier
                        .size(80.dp)
                        .clickable { onImageClick(image) },
                    shape = RoundedCornerShape(12.dp),
                    elevation = CardDefaults.cardElevation(defaultElevation = 4.dp)
                ) {
                    AsyncImage(
                        model = image.imageData,
                        contentDescription = null,
                        modifier = Modifier.fillMaxSize(),
                        contentScale = ContentScale.Crop
                    )
                }
            }
        }
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
    prompt: TextFieldValue,
    isLoading: Boolean,
    onPromptChange: (TextFieldValue) -> Unit
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
                        "Describe your vision...",
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
                    imageVector = Icons.Default.AutoAwesome,
                    contentDescription = null,
                    modifier = Modifier.size(24.dp)
                )
            }
            Spacer(modifier = Modifier.width(8.dp))
            Text(
                text = if (isLoading) "Generating..." else "Generate",
                fontSize = 18.sp,
                fontWeight = FontWeight.Bold
            )
        }
    }
}

@Composable
private fun GalleryOverlay(
    images: List<GeneratedImage>,
    onDismiss: () -> Unit,
    onImageClick: (GeneratedImage) -> Unit,
    onDeleteImage: (GeneratedImage) -> Unit
) {
    Surface(
        modifier = Modifier.fillMaxSize(),
        color = DarkBackground
    ) {
        Column {
            // Gallery Header
            Surface(
                modifier = Modifier.fillMaxWidth(),
                color = CardBackground,
                shadowElevation = 4.dp
            ) {
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(16.dp),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text(
                        text = "Gallery",
                        fontSize = 20.sp,
                        fontWeight = FontWeight.Bold,
                        color = TextPrimary
                    )
                    
                    IconButton(onClick = onDismiss) {
                        Icon(
                            imageVector = Icons.Default.Close,
                            contentDescription = "Close",
                            tint = TextPrimary
                        )
                    }
                }
            }
            
            // Gallery Grid
            if (images.isEmpty()) {
                Box(
                    modifier = Modifier.fillMaxSize(),
                    contentAlignment = Alignment.Center
                ) {
                    Column(
                        horizontalAlignment = Alignment.CenterHorizontally
                    ) {
                        Icon(
                            imageVector = Icons.Outlined.ImageNotSupported,
                            contentDescription = null,
                            tint = TextSecondary,
                            modifier = Modifier.size(64.dp)
                        )
                        Spacer(modifier = Modifier.height(16.dp))
                        Text(
                            text = "No images yet",
                            color = TextSecondary,
                            fontSize = 18.sp
                        )
                    }
                }
            } else {
                LazyVerticalGrid(
                    columns = GridCells.Fixed(2),
                    contentPadding = PaddingValues(16.dp),
                    horizontalArrangement = Arrangement.spacedBy(12.dp),
                    verticalArrangement = Arrangement.spacedBy(12.dp)
                ) {
                    items(images) { image ->
                        GalleryItem(
                            image = image,
                            onClick = { onImageClick(image) },
                            onDelete = { onDeleteImage(image) }
                        )
                    }
                }
            }
        }
    }
}

@Composable
private fun GalleryItem(
    image: GeneratedImage,
    onClick: () -> Unit,
    onDelete: () -> Unit
) {
    var showDeleteConfirm by remember { mutableStateOf(false) }
    
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .aspectRatio(1f)
            .clickable { onClick() },
        shape = RoundedCornerShape(12.dp),
        elevation = CardDefaults.cardElevation(defaultElevation = 4.dp)
    ) {
        Box {
            AsyncImage(
                model = image.imageData,
                contentDescription = null,
                modifier = Modifier.fillMaxSize(),
                contentScale = ContentScale.Crop
            )
            
            // Gradient overlay
            Box(
                modifier = Modifier
                    .fillMaxSize()
                    .background(
                        Brush.verticalGradient(
                            colors = listOf(
                                Color.Transparent,
                                Color.Black.copy(alpha = 0.7f)
                            ),
                            startY = 200f
                        )
                    )
            )
            
            // Image info
            Column(
                modifier = Modifier
                    .align(Alignment.BottomStart)
                    .padding(12.dp)
            ) {
                Text(
                    text = image.prompt,
                    color = TextPrimary,
                    fontSize = 12.sp,
                    maxLines = 2,
                    overflow = TextOverflow.Ellipsis
                )
                Spacer(modifier = Modifier.height(4.dp))
                Text(
                    text = SimpleDateFormat("MMM dd, HH:mm", Locale.getDefault())
                        .format(Date(image.timestamp)),
                    color = TextSecondary,
                    fontSize = 10.sp
                )
            }
            
            // Delete button
            IconButton(
                onClick = { showDeleteConfirm = true },
                modifier = Modifier
                    .align(Alignment.TopEnd)
                    .padding(8.dp)
                    .size(36.dp)
                    .background(
                        color = Color.Black.copy(alpha = 0.6f),
                        shape = CircleShape
                    )
            ) {
                Icon(
                    imageVector = Icons.Default.Delete,
                    contentDescription = "Delete",
                    tint = Color.White,
                    modifier = Modifier.size(20.dp)
                )
            }
        }
    }
    
    // Delete confirmation dialog
    if (showDeleteConfirm) {
        AlertDialog(
            onDismissRequest = { showDeleteConfirm = false },
            title = { Text("Delete Image?", color = TextPrimary) },
            text = { Text("This action cannot be undone.", color = TextSecondary) },
            confirmButton = {
                TextButton(
                    onClick = {
                        onDelete()
                        showDeleteConfirm = false
                    }
                ) {
                    Text("Delete", color = Color.Red)
                }
            },
            dismissButton = {
                TextButton(onClick = { showDeleteConfirm = false }) {
                    Text("Cancel", color = TextSecondary)
                }
            },
            containerColor = CardBackground,
            tonalElevation = 8.dp
        )
    }
}

@Composable
private fun ImageDetailDialog(
    image: GeneratedImage,
    onDismiss: () -> Unit,
    onDownload: () -> Unit,
    onShare: () -> Unit
) {
    var scale by remember { mutableStateOf(1f) }
    var offset by remember { mutableStateOf(Offset.Zero) }
    
    Dialog(
        onDismissRequest = onDismiss,
        properties = DialogProperties(
            dismissOnBackPress = true,
            dismissOnClickOutside = true,
            usePlatformDefaultWidth = false
        )
    ) {
        Surface(
            modifier = Modifier.fillMaxSize(),
            color = Color.Black.copy(alpha = 0.9f)
        ) {
            Box(
                modifier = Modifier.fillMaxSize()
            ) {
                // Zoomable image
                val state = rememberTransformableState { zoomChange, offsetChange, _ ->
                    scale = (scale * zoomChange).coerceIn(0.5f, 5f)
                    offset = offset + offsetChange
                }
                
                AsyncImage(
                    model = image.imageData,
                    contentDescription = null,
                    modifier = Modifier
                        .fillMaxSize()
                        .graphicsLayer(
                            scaleX = scale,
                            scaleY = scale,
                            translationX = offset.x,
                            translationY = offset.y
                        )
                        .transformable(state = state)
                        .clickable(
                            indication = null,
                            interactionSource = remember { MutableInteractionSource() }
                        ) {
                            if (scale > 1f) {
                                scale = 1f
                                offset = Offset.Zero
                            }
                        },
                    contentScale = ContentScale.Fit
                )
                
                // Top bar with actions
                Surface(
                    modifier = Modifier
                        .fillMaxWidth()
                        .align(Alignment.TopCenter),
                    color = Color.Black.copy(alpha = 0.7f)
                ) {
                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(16.dp),
                        horizontalArrangement = Arrangement.SpaceBetween,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        IconButton(onClick = onDismiss) {
                            Icon(
                                imageVector = Icons.Default.Close,
                                contentDescription = "Close",
                                tint = Color.White
                            )
                        }
                        
                        Row {
                            IconButton(onClick = onShare) {
                                Icon(
                                    imageVector = Icons.Default.Share,
                                    contentDescription = "Share",
                                    tint = Color.White
                                )
                            }
                            IconButton(onClick = onDownload) {
                                Icon(
                                    imageVector = Icons.Default.Download,
                                    contentDescription = "Download",
                                    tint = Color.White
                                )
                            }
                        }
                    }
                }
                
                // Bottom info
                Surface(
                    modifier = Modifier
                        .fillMaxWidth()
                        .align(Alignment.BottomCenter),
                    color = Color.Black.copy(alpha = 0.7f)
                ) {
                    Column(
                        modifier = Modifier.padding(16.dp)
                    ) {
                        Text(
                            text = image.prompt,
                            color = Color.White,
                            fontSize = 14.sp
                        )
                        Spacer(modifier = Modifier.height(8.dp))
                        Row(
                            horizontalArrangement = Arrangement.spacedBy(16.dp)
                        ) {
                            Text(
                                text = image.model,
                                color = Color.White.copy(alpha = 0.7f),
                                fontSize = 12.sp
                            )
                            Text(
                                text = SimpleDateFormat("MMM dd, yyyy HH:mm", Locale.getDefault())
                                    .format(Date(image.timestamp)),
                                color = Color.White.copy(alpha = 0.7f),
                                fontSize = 12.sp
                            )
                        }
                    }
                }
            }
        }
    }
}

// Helper functions
private suspend fun downloadImage(
    context: Context,
    imageData: Any?,
    fileName: String
): Boolean = withContext(Dispatchers.IO) {
    try {
        val bitmap = when (imageData) {
            is String -> {
                // URL
                val url = URL(imageData)
                val connection = url.openConnection() as HttpURLConnection
                connection.doInput = true
                connection.connect()
                val input = connection.inputStream
                val bitmap = BitmapFactory.decodeStream(input)
                input.close()
                bitmap
            }
            is ByteArray -> {
                BitmapFactory.decodeByteArray(imageData, 0, imageData.size)
            }
            else -> null
        }
        
        bitmap?.let {
            val timeStamp = SimpleDateFormat("yyyyMMdd_HHmmss", Locale.getDefault()).format(Date())
            val fileName = "AI_Art_${timeStamp}.png"
            
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                val resolver = context.contentResolver
                val contentValues = ContentValues().apply {
                    put(MediaStore.MediaColumns.DISPLAY_NAME, fileName)
                    put(MediaStore.MediaColumns.MIME_TYPE, "image/png")
                    put(MediaStore.MediaColumns.RELATIVE_PATH, Environment.DIRECTORY_PICTURES)
                }
                
                val uri = resolver.insert(MediaStore.Images.Media.EXTERNAL_CONTENT_URI, contentValues)
                uri?.let {
                    resolver.openOutputStream(it)?.use { output ->
                        bitmap.compress(Bitmap.CompressFormat.PNG, 100, output)
                    }
                }
            } else {
                val imagesDir = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_PICTURES)
                if (!imagesDir.exists()) imagesDir.mkdirs()
                
                val imageFile = File(imagesDir, fileName)
                FileOutputStream(imageFile).use { output ->
                    bitmap.compress(Bitmap.CompressFormat.PNG, 100, output)
                }
            }
            
            withContext(Dispatchers.Main) {
                Toast.makeText(context, "Image saved to Pictures", Toast.LENGTH_SHORT).show()
            }
            true
        } ?: false
    } catch (e: Exception) {
        withContext(Dispatchers.Main) {
            Toast.makeText(context, "Failed to save image", Toast.LENGTH_SHORT).show()
        }
        false
    }
}

private suspend fun shareImage(
    context: Context,
    imageData: Any?,
    prompt: String
) = withContext(Dispatchers.IO) {
    try {
        val bitmap = when (imageData) {
            is String -> {
                // URL
                val url = URL(imageData)
                val connection = url.openConnection() as HttpURLConnection
                connection.doInput = true
                connection.connect()
                val input = connection.inputStream
                val bitmap = BitmapFactory.decodeStream(input)
                input.close()
                bitmap
            }
            is ByteArray -> {
                BitmapFactory.decodeByteArray(imageData, 0, imageData.size)
            }
            else -> null
        }
        
        bitmap?.let {
            val cachePath = File(context.cacheDir, "images")
            cachePath.mkdirs()
            
            val stream = FileOutputStream(File(cachePath, "shared_image.png"))
            bitmap.compress(Bitmap.CompressFormat.PNG, 100, stream)
            stream.close()
            
            val imagePath = File(context.cacheDir, "images/shared_image.png")
            val imageUri = FileProvider.getUriForFile(
                context,
                "${context.packageName}.fileprovider",
                imagePath
            )
            
            val shareIntent = Intent().apply {
                action = Intent.ACTION_SEND
                type = "image/png"
                putExtra(Intent.EXTRA_STREAM, imageUri)
                putExtra(Intent.EXTRA_TEXT, "Created with AI: $prompt")
                addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
            }
            
            withContext(Dispatchers.Main) {
                context.startActivity(Intent.createChooser(shareIntent, "Share Image"))
            }
        }
    } catch (e: Exception) {
        withContext(Dispatchers.Main) {
            Toast.makeText(context, "Failed to share image", Toast.LENGTH_SHORT).show()
        }
    }
}
