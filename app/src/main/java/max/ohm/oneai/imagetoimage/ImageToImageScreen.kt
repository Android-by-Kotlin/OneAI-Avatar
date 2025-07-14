package max.ohm.oneai.imagetoimage

import android.graphics.Bitmap
import android.net.Uri
import android.provider.MediaStore
import androidx.activity.compose.rememberLauncherForActivityResult
import androidx.activity.result.contract.ActivityResultContracts
import androidx.compose.animation.*
import androidx.compose.animation.core.*
import androidx.compose.foundation.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material.icons.outlined.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.window.Dialog
import androidx.compose.ui.window.DialogProperties
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.draw.scale
import androidx.compose.ui.draw.shadow
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.asImageBitmap
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import coil.compose.AsyncImage
import max.ohm.oneai.imagetoimage.ImageToImageViewModel
import androidx.lifecycle.viewmodel.compose.viewModel
import android.content.ContentValues
import android.content.Intent
import android.os.Build
import android.os.Environment
import android.widget.Toast
import androidx.core.content.FileProvider
import kotlinx.coroutines.launch
import java.io.File
import java.io.FileOutputStream

@OptIn(ExperimentalMaterial3Api::class, ExperimentalAnimationApi::class)
@Composable
fun ImageToImageScreen(
    viewModel: ImageToImageViewModel = viewModel(),
    onNavigateToGallery: () -> Unit = {}
) {
    val context = LocalContext.current
    val scrollState = rememberScrollState()
    var showAdvancedSettings by remember { mutableStateOf(false) }
    val coroutineScope = rememberCoroutineScope()
    var showFullscreenImage by remember { mutableStateOf(false) }
    
    // Gradient colors for Pro style
    val gradientColors = listOf(
        Color(0xFF6366F1),
        Color(0xFFEC4899)
    )
    
    // Image picker launcher
    val imagePickerLauncher = rememberLauncherForActivityResult(
        contract = ActivityResultContracts.GetContent()
    ) { uri: Uri? ->
        uri?.let {
            try {
                val bitmap = MediaStore.Images.Media.getBitmap(context.contentResolver, uri)
                viewModel.updateSelectedImage(bitmap)
            } catch (e: Exception) {
                viewModel.errorMessage = "Failed to load image: ${e.message}"
            }
        }
    }
    
    // Camera launcher
    val cameraLauncher = rememberLauncherForActivityResult(
        contract = ActivityResultContracts.TakePicturePreview()
    ) { bitmap: Bitmap? ->
        bitmap?.let {
            viewModel.updateSelectedImage(it)
        }
    }
    
    Box(
        modifier = Modifier
            .fillMaxSize()
            .background(
                Brush.verticalGradient(
                    colors = listOf(
                        Color(0xFF0A0E27),
                        Color(0xFF1A1F3A)
                    )
                )
            )
    ) {
        Scaffold(
            containerColor = Color.Transparent,
            topBar = {
                TopAppBar(
                    title = { 
                        Row(
                            verticalAlignment = Alignment.CenterVertically,
                            horizontalArrangement = Arrangement.spacedBy(8.dp)
                        ) {
                            Icon(
                                imageVector = Icons.Outlined.AutoAwesome,
                                contentDescription = null,
                                tint = Color(0xFFEC4899),
                                modifier = Modifier.size(24.dp)
                            )
                            Text(
                                "AI Image Studio Pro",
                                fontWeight = FontWeight.Bold,
                                fontSize = 20.sp
                            )
                            // Pro badge
                            Surface(
                                shape = RoundedCornerShape(4.dp),
                                color = Color(0xFFEC4899).copy(alpha = 0.2f),
                                modifier = Modifier.padding(start = 4.dp)
                            ) {
                                Text(
                                    "TRANSFORM",
                                    modifier = Modifier.padding(horizontal = 6.dp, vertical = 2.dp),
                                    fontSize = 10.sp,
                                    fontWeight = FontWeight.Bold,
                                    color = Color(0xFFEC4899)
                                )
                            }
                        }
                    },
                    colors = TopAppBarDefaults.topAppBarColors(
                        containerColor = Color.Transparent,
                        titleContentColor = Color.White
                    ),
                    actions = {
                        // Gallery button
                        IconButton(
                            onClick = onNavigateToGallery,
                            modifier = Modifier
                                .size(40.dp)
                                .background(
                                    Color(0xFFEC4899).copy(alpha = 0.2f),
                                    CircleShape
                                )
                        ) {
                            Icon(
                                Icons.Outlined.PhotoLibrary,
                                contentDescription = "Gallery",
                                tint = Color(0xFFEC4899)
                            )
                        }
                    }
                )
            }
        ) { paddingValues ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
                .verticalScroll(scrollState),
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            // Hero Section - Image Upload
            Card(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(horizontal = 16.dp, vertical = 8.dp)
                    .shadow(
                        elevation = 8.dp,
                        shape = RoundedCornerShape(24.dp),
                        ambientColor = Color(0xFF6366F1).copy(alpha = 0.3f),
                        spotColor = Color(0xFF6366F1).copy(alpha = 0.3f)
                    ),
                shape = RoundedCornerShape(24.dp),
                colors = CardDefaults.cardColors(
                    containerColor = Color(0xFF1A1F3A).copy(alpha = 0.9f)
                ),
                border = BorderStroke(
                    width = 1.dp,
                    brush = Brush.linearGradient(
                        colors = gradientColors.map { it.copy(alpha = 0.5f) }
                    )
                )
            ) {
                Column(
                    modifier = Modifier.padding(20.dp),
                    horizontalAlignment = Alignment.CenterHorizontally
                ) {
                    // Title Section - Dynamic based on state
                    AnimatedContent(
                        targetState = viewModel.generatedImageUrl != null || viewModel.generatedImageBitmap != null,
                        transitionSpec = {
                            fadeIn(animationSpec = tween(300)) togetherWith
                                fadeOut(animationSpec = tween(300))
                        }
                    ) { hasGeneratedImage ->
                        Row(
                            verticalAlignment = Alignment.CenterVertically,
                            horizontalArrangement = Arrangement.Center,
                            modifier = Modifier.padding(bottom = 16.dp)
                        ) {
                            if (hasGeneratedImage) {
                                Icon(
                                    Icons.Outlined.CheckCircle,
                                    contentDescription = null,
                                    tint = Color(0xFF10B981),
                                    modifier = Modifier.size(28.dp)
                                )
                                Spacer(modifier = Modifier.width(8.dp))
                                Text(
                                    "Transformation Complete",
                                    fontSize = 22.sp,
                                    fontWeight = FontWeight.Bold,
                                    color = Color.White
                                )
                            } else {
                                Icon(
                                    Icons.Outlined.Transform,
                                    contentDescription = null,
                                    tint = Color(0xFF6366F1),
                                    modifier = Modifier.size(28.dp)
                                )
                                Spacer(modifier = Modifier.width(8.dp))
                                Text(
                                    "Transform Your Vision",
                                    fontSize = 22.sp,
                                    fontWeight = FontWeight.Bold,
                                    color = Color.White
                                )
                            }
                        }
                    }
                    
                    // Image Display Area - Shows comparison when generated
                    val hasGeneratedImage = viewModel.generatedImageUrl != null || viewModel.generatedImageBitmap != null
                    
                    AnimatedContent(
                        targetState = hasGeneratedImage,
                        transitionSpec = {
                            fadeIn(animationSpec = tween(500)) + 
                            slideInHorizontally(animationSpec = tween(500)) togetherWith
                            fadeOut(animationSpec = tween(300))
                        },
                        label = "ImageDisplayTransition"
                    ) { showComparison ->
                        if (viewModel.selectedImage != null && showComparison) {
                            // Before/After Comparison View
                            Column {
                                Row(
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .height(280.dp),
                                horizontalArrangement = Arrangement.spacedBy(8.dp)
                            ) {
                                // Original Image
                                Box(
                                    modifier = Modifier
                                        .weight(1f)
                                        .fillMaxHeight()
                                        .clip(RoundedCornerShape(12.dp))
                                        .background(Color.Black)
                                ) {
                                    Image(
                                        bitmap = viewModel.selectedImage!!.asImageBitmap(),
                                        contentDescription = "Original Image",
                                        modifier = Modifier
                                            .fillMaxSize()
                                            .clip(RoundedCornerShape(12.dp)),
                                        contentScale = ContentScale.Fit
                                    )
                                    
                                    Surface(
                                        shape = RoundedCornerShape(8.dp),
                                        color = Color(0xFF6366F1).copy(alpha = 0.9f),
                                        modifier = Modifier
                                            .align(Alignment.TopStart)
                                            .padding(8.dp)
                                    ) {
                                        Text(
                                            "Original",
                                            modifier = Modifier.padding(horizontal = 10.dp, vertical = 4.dp),
                                            fontSize = 11.sp,
                                            fontWeight = FontWeight.Bold,
                                            color = Color.White
                                        )
                                    }
                                }
                                
                                // Generated Image
                                Box(
                                    modifier = Modifier
                                        .weight(1f)
                                        .fillMaxHeight()
                                        .clip(RoundedCornerShape(12.dp))
                                        .background(Color.Black)
                                        .clickable { showFullscreenImage = true }
                                ) {
                                    // Show URL image if available
                                    viewModel.generatedImageUrl?.let { imageUrl ->
                                        AsyncImage(
                                            model = imageUrl,
                                            contentDescription = "Generated Image",
                                            modifier = Modifier
                                                .fillMaxSize()
                                                .clip(RoundedCornerShape(12.dp)),
                                            contentScale = ContentScale.Fit
                                        )
                                    }
                                    
                                    // Show bitmap if URL is not available
                                    viewModel.generatedImageBitmap?.let { bitmap ->
                                        if (viewModel.generatedImageUrl == null) {
                                            Image(
                                                bitmap = bitmap.asImageBitmap(),
                                                contentDescription = "Generated Image",
                                                modifier = Modifier
                                                    .fillMaxSize()
                                                    .clip(RoundedCornerShape(12.dp)),
                                                contentScale = ContentScale.Fit
                                            )
                                        }
                                    }
                                    
                                    Surface(
                                        shape = RoundedCornerShape(8.dp),
                                        color = Color(0xFFEC4899).copy(alpha = 0.9f),
                                        modifier = Modifier
                                            .align(Alignment.TopStart)
                                            .padding(8.dp)
                                    ) {
                                        Text(
                                            "Transformed",
                                            modifier = Modifier.padding(horizontal = 10.dp, vertical = 4.dp),
                                            fontSize = 11.sp,
                                            fontWeight = FontWeight.Bold,
                                            color = Color.White
                                        )
                                    }
                                }
                            }
                            
                            // Clear button
                            IconButton(
                                onClick = { 
                                    viewModel.updateSelectedImage(null)
                                    viewModel.reset()
                                },
                                modifier = Modifier
                                    .align(Alignment.End)
                                    .padding(top = 8.dp)
                                    .size(36.dp)
                                    .background(
                                        Color.White.copy(alpha = 0.1f),
                                        CircleShape
                                    )
                            ) {
                                Icon(
                                    Icons.Default.Close,
                                    contentDescription = "Clear All",
                                    tint = Color.White,
                                    modifier = Modifier.size(20.dp)
                                )
                            }
                        }
                    } else if (viewModel.selectedImage != null) {
                        // Single image view when no generation yet
                        Box(
                            modifier = Modifier
                                .fillMaxWidth()
                                .height(280.dp)
                                .clip(RoundedCornerShape(16.dp))
                                .background(Color.Black)
                        ) {
                            Image(
                                bitmap = viewModel.selectedImage!!.asImageBitmap(),
                                contentDescription = "Selected Image",
                                modifier = Modifier
                                    .fillMaxSize()
                                    .clip(RoundedCornerShape(16.dp)),
                                contentScale = ContentScale.Fit
                            )
                            
                            // Overlay controls
                            Row(
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .align(Alignment.TopCenter)
                                    .background(
                                        Brush.verticalGradient(
                                            colors = listOf(
                                                Color.Black.copy(alpha = 0.7f),
                                                Color.Transparent
                                            )
                                        )
                                    )
                                    .padding(12.dp),
                                horizontalArrangement = Arrangement.SpaceBetween
                            ) {
                                Surface(
                                    shape = RoundedCornerShape(8.dp),
                                    color = Color.White.copy(alpha = 0.1f)
                                ) {
                                    Text(
                                        "Original",
                                        modifier = Modifier.padding(horizontal = 12.dp, vertical = 4.dp),
                                        fontSize = 12.sp,
                                        color = Color.White
                                    )
                                }
                                
                                IconButton(
                                    onClick = { viewModel.updateSelectedImage(null) },
                                    modifier = Modifier
                                        .size(36.dp)
                                        .background(
                                            Color.White.copy(alpha = 0.1f),
                                            CircleShape
                                        )
                                ) {
                                    Icon(
                                        Icons.Default.Close,
                                        contentDescription = "Clear Image",
                                        tint = Color.White,
                                        modifier = Modifier.size(20.dp)
                                    )
                                }
                            }
                        }
                    } else {
                        // Image Upload Area
                        Box(
                            modifier = Modifier
                                .fillMaxWidth()
                                .height(280.dp)
                                .clip(RoundedCornerShape(16.dp))
                                .background(
                                    Brush.verticalGradient(
                                        colors = listOf(
                                            Color(0xFF1A1F3A).copy(alpha = 0.5f),
                                            Color(0xFF0A0E27).copy(alpha = 0.8f)
                                        )
                                    )
                                )
                        ) {
                            Column(
                                modifier = Modifier
                                    .fillMaxSize()
                                    .padding(20.dp),
                                verticalArrangement = Arrangement.Center,
                                horizontalAlignment = Alignment.CenterHorizontally
                            ) {
                                // Main image upload button with animation
                                val infiniteTransition = rememberInfiniteTransition(label = "imageButton")
                                val pulseAnimation by infiniteTransition.animateFloat(
                                    initialValue = 0.9f,
                                    targetValue = 1.1f,
                                    animationSpec = infiniteRepeatable(
                                        animation = tween(2000, easing = FastOutSlowInEasing),
                                        repeatMode = RepeatMode.Reverse
                                    ),
                                    label = "pulse"
                                )
                                
                                val glowAnimation by infiniteTransition.animateFloat(
                                    initialValue = 0.3f,
                                    targetValue = 0.8f,
                                    animationSpec = infiniteRepeatable(
                                        animation = tween(2000, easing = FastOutSlowInEasing),
                                        repeatMode = RepeatMode.Reverse
                                    ),
                                    label = "glow"
                                )
                                
                                Box(
                                    modifier = Modifier
                                        .size(140.dp)
                                        .scale(pulseAnimation)
                                        .clickable { imagePickerLauncher.launch("image/*") },
                                    contentAlignment = Alignment.Center
                                ) {
                                    // Static gradient background with glow effect
                                    Box(
                                        modifier = Modifier
                                            .fillMaxSize()
                                            .clip(RoundedCornerShape(24.dp))
                                            .background(
                                                Brush.linearGradient(
                                                    colors = listOf(
                                                        Color(0xFF10B981).copy(alpha = glowAnimation),
                                                        Color(0xFF6366F1),
                                                        Color(0xFFEC4899).copy(alpha = glowAnimation)
                                                    ),
                                                    start = androidx.compose.ui.geometry.Offset(0f, 0f),
                                                    end = androidx.compose.ui.geometry.Offset(Float.POSITIVE_INFINITY, Float.POSITIVE_INFINITY)
                                                )
                                            )
                                    )
                                    
                                    // Inner box with icon
                                    Box(
                                        modifier = Modifier
                                            .size(130.dp)
                                            .clip(RoundedCornerShape(20.dp))
                                            .background(
                                                Brush.linearGradient(
                                                    colors = listOf(
                                                        Color(0xFF0A0E27).copy(alpha = 0.95f),
                                                        Color(0xFF1A1F3A).copy(alpha = 0.95f)
                                                    )
                                                )
                                            ),
                                        contentAlignment = Alignment.Center
                                    ) {
                                        Column(
                                            horizontalAlignment = Alignment.CenterHorizontally,
                                            verticalArrangement = Arrangement.Center
                                        ) {
                                            Icon(
                                                Icons.Outlined.AddPhotoAlternate,
                                                contentDescription = "Choose Image",
                                                modifier = Modifier.size(48.dp),
                                                tint = Color.White
                                            )
                                            Spacer(modifier = Modifier.height(4.dp))
                                            Text(
                                                "Gallery",
                                                fontSize = 12.sp,
                                                color = Color.White.copy(alpha = 0.8f)
                                            )
                                        }
                                    }
                                }
                                
                                Spacer(modifier = Modifier.height(24.dp))
                                
                                Text(
                                    "Transform Your Image",
                                    fontSize = 22.sp,
                                    fontWeight = FontWeight.Bold,
                                    color = Color.White
                                )
                                
                                Spacer(modifier = Modifier.height(8.dp))
                                
                                Text(
                                    "Upload an image to begin transformation",
                                    fontSize = 14.sp,
                                    color = Color.White.copy(alpha = 0.7f),
                                    textAlign = TextAlign.Center
                                )
                                
                                Spacer(modifier = Modifier.height(32.dp))
                                
                                // Secondary options row
                                Row(
                                    horizontalArrangement = Arrangement.spacedBy(16.dp),
                                    verticalAlignment = Alignment.CenterVertically
                                ) {
                                    // Camera option
                                    OutlinedCard(
                                        onClick = { cameraLauncher.launch(null) },
                                        modifier = Modifier
                                            .weight(1f)
                                            .height(80.dp),
                                        shape = RoundedCornerShape(16.dp),
                                        border = BorderStroke(
                                            width = 1.dp,
                                            color = Color(0xFF6366F1).copy(alpha = 0.3f)
                                        ),
                                        colors = CardDefaults.outlinedCardColors(
                                            containerColor = Color.White.copy(alpha = 0.05f)
                                        )
                                    ) {
                                        Column(
                                            modifier = Modifier
                                                .fillMaxSize()
                                                .padding(12.dp),
                                            horizontalAlignment = Alignment.CenterHorizontally,
                                            verticalArrangement = Arrangement.Center
                                        ) {
                                            Icon(
                                                Icons.Outlined.PhotoCamera,
                                                contentDescription = "Camera",
                                                modifier = Modifier.size(24.dp),
                                                tint = Color(0xFF6366F1)
                                            )
                                            Spacer(modifier = Modifier.height(4.dp))
                                            Text(
                                                "Camera",
                                                fontSize = 12.sp,
                                                color = Color.White.copy(alpha = 0.8f)
                                            )
                                        }
                                    }
                                    
                                    // Recent files option
                                    OutlinedCard(
                                        onClick = { /* TODO: Implement recent files */ },
                                        modifier = Modifier
                                            .weight(1f)
                                            .height(80.dp),
                                        shape = RoundedCornerShape(16.dp),
                                        border = BorderStroke(
                                            width = 1.dp,
                                            color = Color(0xFFEC4899).copy(alpha = 0.3f)
                                        ),
                                        colors = CardDefaults.outlinedCardColors(
                                            containerColor = Color.White.copy(alpha = 0.05f)
                                        )
                                    ) {
                                        Column(
                                            modifier = Modifier
                                                .fillMaxSize()
                                                .padding(12.dp),
                                            horizontalAlignment = Alignment.CenterHorizontally,
                                            verticalArrangement = Arrangement.Center
                                        ) {
                                            Icon(
                                                Icons.Outlined.History,
                                                contentDescription = "Recent",
                                                modifier = Modifier.size(24.dp),
                                                tint = Color(0xFFEC4899)
                                            )
                                            Spacer(modifier = Modifier.height(4.dp))
                                            Text(
                                                "Recent",
                                                fontSize = 12.sp,
                                                color = Color.White.copy(alpha = 0.8f)
                                            )
                                        }
                                    }
                                }
                            }
                        }
                    }
                    }
                }
            }
            
            // Transformation Settings Card
            Card(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(horizontal = 16.dp, vertical = 8.dp),
                shape = RoundedCornerShape(20.dp),
                colors = CardDefaults.cardColors(
                    containerColor = Color(0xFF1A1F3A).copy(alpha = 0.9f)
                )
            ) {
                Column(
                    modifier = Modifier.padding(20.dp)
                ) {
                    // Prompt Section Header
                    Row(
                        verticalAlignment = Alignment.CenterVertically,
                        modifier = Modifier.padding(bottom = 16.dp)
                    ) {
                        Icon(
                            Icons.Outlined.AutoAwesome,
                            contentDescription = null,
                            tint = Color(0xFF6366F1),
                            modifier = Modifier.size(24.dp)
                        )
                        Spacer(modifier = Modifier.width(8.dp))
                        Text(
                            "Transformation Instructions",
                            fontSize = 18.sp,
                            fontWeight = FontWeight.SemiBold,
                            color = Color.White
                        )
                    }
                    
                    // Main Prompt Input
                    OutlinedTextField(
                        value = viewModel.prompt,
                        onValueChange = { viewModel.prompt = it },
                        placeholder = { 
                            Text(
                                "Describe your transformation...",
                                color = Color.White.copy(alpha = 0.5f)
                            ) 
                        },
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(bottom = 12.dp),
                        colors = OutlinedTextFieldDefaults.colors(
                            focusedTextColor = Color.White,
                            unfocusedTextColor = Color.White,
                            focusedBorderColor = Color(0xFF6366F1),
                            unfocusedBorderColor = Color.White.copy(alpha = 0.2f),
                            focusedContainerColor = Color(0xFF0A0E27).copy(alpha = 0.5f),
                            unfocusedContainerColor = Color(0xFF0A0E27).copy(alpha = 0.3f),
                            cursorColor = Color(0xFF6366F1)
                        ),
                        shape = RoundedCornerShape(12.dp),
                        minLines = 3,
                        maxLines = 5,
                        leadingIcon = {
                            Icon(
                                Icons.Outlined.Edit,
                                contentDescription = null,
                                tint = Color(0xFF6366F1),
                                modifier = Modifier.size(20.dp)
                            )
                        }
                    )
                    
                    // Negative Prompt (Collapsible)
                    AnimatedVisibility(
                        visible = showAdvancedSettings,
                        enter = expandVertically() + fadeIn(),
                        exit = shrinkVertically() + fadeOut()
                    ) {
                        OutlinedTextField(
                            value = viewModel.negativePrompt,
                            onValueChange = { viewModel.negativePrompt = it },
                            placeholder = { 
                                Text(
                                    "What to avoid...",
                                    color = Color.White.copy(alpha = 0.5f)
                                ) 
                            },
                            modifier = Modifier
                                .fillMaxWidth()
                                .padding(top = 8.dp),
                            colors = OutlinedTextFieldDefaults.colors(
                                focusedTextColor = Color.White,
                                unfocusedTextColor = Color.White,
                                focusedBorderColor = Color(0xFFEC4899),
                                unfocusedBorderColor = Color.White.copy(alpha = 0.2f),
                                focusedContainerColor = Color(0xFF0A0E27).copy(alpha = 0.5f),
                                unfocusedContainerColor = Color(0xFF0A0E27).copy(alpha = 0.3f),
                                cursorColor = Color(0xFFEC4899)
                            ),
                            shape = RoundedCornerShape(12.dp),
                            minLines = 2,
                            maxLines = 3,
                            leadingIcon = {
                                Icon(
                                    Icons.Outlined.Block,
                                    contentDescription = null,
                                    tint = Color(0xFFEC4899),
                                    modifier = Modifier.size(20.dp)
                                )
                            }
                        )
                    }
                }
            }
            
            // Advanced Settings Toggle
            Card(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(horizontal = 16.dp, vertical = 8.dp)
                    .clickable { showAdvancedSettings = !showAdvancedSettings },
                shape = RoundedCornerShape(16.dp),
                colors = CardDefaults.cardColors(
                    containerColor = Color(0xFF1A1F3A).copy(alpha = 0.7f)
                )
            ) {
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(horizontal = 20.dp, vertical = 16.dp),
                    verticalAlignment = Alignment.CenterVertically,
                    horizontalArrangement = Arrangement.SpaceBetween
                ) {
                    Row(
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Icon(
                            Icons.Outlined.Tune,
                            contentDescription = null,
                            tint = Color(0xFF6366F1),
                            modifier = Modifier.size(24.dp)
                        )
                        Spacer(modifier = Modifier.width(12.dp))
                        Text(
                            "Advanced Settings",
                            fontSize = 16.sp,
                            fontWeight = FontWeight.Medium,
                            color = Color.White
                        )
                    }
                    
                    Icon(
                        imageVector = if (showAdvancedSettings) 
                            Icons.Default.ExpandLess else Icons.Default.ExpandMore,
                        contentDescription = null,
                        tint = Color.White.copy(alpha = 0.6f)
                    )
                }
            }
            
            // Advanced Settings Content
            AnimatedVisibility(
                visible = showAdvancedSettings,
                enter = expandVertically() + fadeIn(),
                exit = shrinkVertically() + fadeOut()
            ) {
                Card(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(horizontal = 16.dp)
                        .padding(bottom = 8.dp),
                    shape = RoundedCornerShape(16.dp),
                    colors = CardDefaults.cardColors(
                        containerColor = Color(0xFF1A1F3A).copy(alpha = 0.5f)
                    )
                ) {
                    Column(
                        modifier = Modifier.padding(20.dp)
                    ) {
                        // Strength Slider
                        Column(
                            modifier = Modifier.padding(bottom = 20.dp)
                        ) {
                            Row(
                                modifier = Modifier.fillMaxWidth(),
                                horizontalArrangement = Arrangement.SpaceBetween
                            ) {
                                Text(
                                    "Transformation Strength",
                                    color = Color.White,
                                    fontSize = 14.sp,
                                    fontWeight = FontWeight.Medium
                                )
                                Text(
                                    String.format("%.0f%%", viewModel.strength * 100),
                                    color = Color(0xFF6366F1),
                                    fontSize = 14.sp,
                                    fontWeight = FontWeight.Bold
                                )
                            }
                            
                            Slider(
                                value = viewModel.strength,
                                onValueChange = { viewModel.strength = it },
                                valueRange = 0.1f..1f,
                                colors = SliderDefaults.colors(
                                    thumbColor = Color(0xFF6366F1),
                                    activeTrackColor = Color(0xFF6366F1),
                                    inactiveTrackColor = Color.White.copy(alpha = 0.1f)
                                ),
                                modifier = Modifier.padding(top = 8.dp)
                            )
                        }
                        
                        // Guidance Scale Slider
                        Column(
                            modifier = Modifier.padding(bottom = 20.dp)
                        ) {
                            Row(
                                modifier = Modifier.fillMaxWidth(),
                                horizontalArrangement = Arrangement.SpaceBetween
                            ) {
                                Text(
                                    "Guidance Scale",
                                    color = Color.White,
                                    fontSize = 14.sp,
                                    fontWeight = FontWeight.Medium
                                )
                                Text(
                                    String.format("%.1f", viewModel.guidanceScale),
                                    color = Color(0xFFEC4899),
                                    fontSize = 14.sp,
                                    fontWeight = FontWeight.Bold
                                )
                            }
                            
                            Slider(
                                value = viewModel.guidanceScale,
                                onValueChange = { viewModel.guidanceScale = it },
                                valueRange = 1f..20f,
                                colors = SliderDefaults.colors(
                                    thumbColor = Color(0xFFEC4899),
                                    activeTrackColor = Color(0xFFEC4899),
                                    inactiveTrackColor = Color.White.copy(alpha = 0.1f)
                                ),
                                modifier = Modifier.padding(top = 8.dp)
                            )
                        }
                        
                        // Steps Slider
                        Column {
                            Row(
                                modifier = Modifier.fillMaxWidth(),
                                horizontalArrangement = Arrangement.SpaceBetween
                            ) {
                                Text(
                                    "Quality Steps",
                                    color = Color.White,
                                    fontSize = 14.sp,
                                    fontWeight = FontWeight.Medium
                                )
                                Text(
                                    "${viewModel.steps}",
                                    color = Color(0xFF6366F1),
                                    fontSize = 14.sp,
                                    fontWeight = FontWeight.Bold
                                )
                            }
                            
                            Slider(
                                value = viewModel.steps.toFloat(),
                                onValueChange = { viewModel.steps = it.toInt() },
                                valueRange = 10f..50f,
                                colors = SliderDefaults.colors(
                                    thumbColor = Color(0xFF6366F1),
                                    activeTrackColor = Color(0xFF6366F1),
                                    inactiveTrackColor = Color.White.copy(alpha = 0.1f)
                                ),
                                modifier = Modifier.padding(top = 8.dp)
                            )
                        }
                    }
                }
            }
            
            // Generate Button
            Box(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(horizontal = 16.dp, vertical = 8.dp)
            ) {
                Button(
                    onClick = { viewModel.generateImage() },
                    modifier = Modifier
                        .fillMaxWidth()
                        .height(60.dp)
                        .shadow(
                            elevation = if (!viewModel.isLoading) 8.dp else 0.dp,
                            shape = RoundedCornerShape(16.dp),
                            ambientColor = Color(0xFF6366F1).copy(alpha = 0.4f),
                            spotColor = Color(0xFF6366F1).copy(alpha = 0.4f)
                        ),
                    enabled = !viewModel.isLoading && viewModel.selectedImage != null,
                    colors = ButtonDefaults.buttonColors(
                        containerColor = Color(0xFF6366F1),
                        disabledContainerColor = Color.Gray.copy(alpha = 0.3f)
                    ),
                    shape = RoundedCornerShape(16.dp)
                ) {
                    AnimatedContent(
                        targetState = viewModel.isLoading,
                        transitionSpec = {
                            fadeIn(animationSpec = tween(300)) togetherWith
                                fadeOut(animationSpec = tween(300))
                        }
                    ) { isLoading ->
                        if (isLoading) {
                            Row(
                                verticalAlignment = Alignment.CenterVertically,
                                horizontalArrangement = Arrangement.Center
                            ) {
                                CircularProgressIndicator(
                                    color = Color.White,
                                    modifier = Modifier.size(24.dp),
                                    strokeWidth = 2.dp
                                )
                                Spacer(modifier = Modifier.width(12.dp))
                                Text(
                                    "Transforming...",
                                    fontSize = 16.sp,
                                    fontWeight = FontWeight.Medium
                                )
                            }
                        } else {
                            Row(
                                verticalAlignment = Alignment.CenterVertically,
                                horizontalArrangement = Arrangement.Center
                            ) {
                                Icon(
                                    Icons.Outlined.AutoAwesome,
                                    contentDescription = null,
                                    modifier = Modifier.size(24.dp)
                                )
                                Spacer(modifier = Modifier.width(8.dp))
                                Text(
                                    "Transform Image",
                                    fontSize = 18.sp,
                                    fontWeight = FontWeight.Bold
                                )
                            }
                        }
                    }
                }
            }
            
            // Error Message
            AnimatedVisibility(
                visible = viewModel.errorMessage != null,
                enter = fadeIn() + slideInVertically(),
                exit = fadeOut() + slideOutVertically()
            ) {
                viewModel.errorMessage?.let { error ->
                    Card(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(horizontal = 16.dp, vertical = 8.dp),
                        colors = CardDefaults.cardColors(
                            containerColor = Color(0xFFEF4444).copy(alpha = 0.1f)
                        ),
                        shape = RoundedCornerShape(12.dp),
                        border = BorderStroke(
                            width = 1.dp,
                            color = Color(0xFFEF4444).copy(alpha = 0.5f)
                        )
                    ) {
                        Row(
                            modifier = Modifier.padding(16.dp),
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Icon(
                                Icons.Outlined.ErrorOutline,
                                contentDescription = null,
                                tint = Color(0xFFEF4444),
                                modifier = Modifier.size(24.dp)
                            )
                            Spacer(modifier = Modifier.width(12.dp))
                            Text(
                                text = error,
                                color = Color.White,
                                fontSize = 14.sp
                            )
                        }
                    }
                }
            }
            
            // Action Buttons - Show when image is generated
            AnimatedVisibility(
                visible = viewModel.generatedImageUrl != null || viewModel.generatedImageBitmap != null,
                enter = fadeIn() + slideInVertically(initialOffsetY = { it / 2 }),
                exit = fadeOut() + slideOutVertically()
            ) {
                Card(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(horizontal = 16.dp, vertical = 8.dp),
                    shape = RoundedCornerShape(16.dp),
                    colors = CardDefaults.cardColors(
                        containerColor = Color(0xFF1A1F3A).copy(alpha = 0.9f)
                    )
                ) {
//                    Row(
//                        modifier = Modifier
//                            .fillMaxWidth()
//                            .padding(16.dp),
//                        horizontalArrangement = Arrangement.spacedBy(8.dp)
//                    ) {
//                        // View button
//                        OutlinedButton(
//                            onClick = { showFullscreenImage = true },
//                            modifier = Modifier.weight(1f),
//                            shape = RoundedCornerShape(12.dp),
//                            colors = ButtonDefaults.outlinedButtonColors(
//                                contentColor = Color(0xFF10B981)
//                            ),
//                            border = BorderStroke(
//                                width = 1.dp,
//                                color = Color(0xFF10B981).copy(alpha = 0.5f)
//                            )
//                        ) {
//                            Icon(
//                                Icons.Outlined.Fullscreen,
//                                contentDescription = null,
//                                modifier = Modifier.size(18.dp)
//                            )
//                            Spacer(modifier = Modifier.width(4.dp))
//                            Text("View", fontWeight = FontWeight.Medium, fontSize = 14.sp)
//                        }
//
//                        // Save button
//                        OutlinedButton(
//                            onClick = {
//                                coroutineScope.launch {
//                                    // Save the image first
//                                    saveGeneratedImage(context, viewModel)
//                                    // Then add to gallery
//                                    viewModel.addToGallery()
//                                }
//                            },
//                            modifier = Modifier.weight(1f),
//                            shape = RoundedCornerShape(12.dp),
//                            colors = ButtonDefaults.outlinedButtonColors(
//                                contentColor = Color(0xFF6366F1)
//                            ),
//                            border = BorderStroke(
//                                width = 1.dp,
//                                color = Color(0xFF6366F1).copy(alpha = 0.5f)
//                            )
//                        ) {
//                            Icon(
//                                Icons.Outlined.Download,
//                                contentDescription = null,
//                                modifier = Modifier.size(18.dp)
//                            )
//                            Spacer(modifier = Modifier.width(4.dp))
//                            Text("Save", fontWeight = FontWeight.Medium, fontSize = 14.sp)
//                        }
//
//                        // Share button
//                        OutlinedButton(
//                            onClick = {
//                                coroutineScope.launch {
//                                    shareGeneratedImage(context, viewModel)
//                                }
//                            },
//                            modifier = Modifier.weight(1f),
//                            shape = RoundedCornerShape(12.dp),
//                            colors = ButtonDefaults.outlinedButtonColors(
//                                contentColor = Color(0xFFEC4899)
//                            ),
//                            border = BorderStroke(
//                                width = 1.dp,
//                                color = Color(0xFFEC4899).copy(alpha = 0.5f)
//                            )
//                        ) {
//                            Icon(
//                                Icons.Outlined.Share,
//                                contentDescription = null,
//                                modifier = Modifier.size(18.dp)
//                            )
//                            Spacer(modifier = Modifier.width(4.dp))
//                            Text("Share", fontWeight = FontWeight.Medium, fontSize = 14.sp)
//                        }
//
//                        // New button
//                        Button(
//                            onClick = { viewModel.reset() },
//                            modifier = Modifier.weight(1f),
//                            shape = RoundedCornerShape(12.dp),
//                            colors = ButtonDefaults.buttonColors(
//                                containerColor = Color(0xFF6366F1)
//                            )
//                        ) {
//                            Icon(
//                                Icons.Outlined.AddCircle,
//                                contentDescription = null,
//                                modifier = Modifier.size(18.dp)
//                            )
//                            Spacer(modifier = Modifier.width(4.dp))
//                            Text("New", fontWeight = FontWeight.Medium, fontSize = 14.sp)
//                        }
//                    }
                }
            }
            
            Spacer(modifier = Modifier.height(80.dp))
        }
        }
        
        // Fullscreen Image Viewer Dialog
        if (showFullscreenImage && (viewModel.generatedImageUrl != null || viewModel.generatedImageBitmap != null)) {
            FullscreenImageDialog(
                originalImage = viewModel.selectedImage,
                generatedImageUrl = viewModel.generatedImageUrl,
                generatedImageBitmap = viewModel.generatedImageBitmap,
                onDismiss = { showFullscreenImage = false }
            )
        }
    }
}

// Helper functions for saving and sharing images
private suspend fun saveGeneratedImage(
    context: android.content.Context,
    viewModel: ImageToImageViewModel
) {
    try {
        val bitmap = viewModel.generatedImageBitmap
        if (bitmap != null) {
            val fileName = "AI_Image_${System.currentTimeMillis()}.png"
            
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                val resolver = context.contentResolver
                val contentValues = ContentValues().apply {
                    put(android.provider.MediaStore.MediaColumns.DISPLAY_NAME, fileName)
                    put(android.provider.MediaStore.MediaColumns.MIME_TYPE, "image/png")
                    put(android.provider.MediaStore.MediaColumns.RELATIVE_PATH, Environment.DIRECTORY_PICTURES)
                }
                
                val uri = resolver.insert(android.provider.MediaStore.Images.Media.EXTERNAL_CONTENT_URI, contentValues)
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
            
            Toast.makeText(context, "Image saved to Gallery and Pictures", Toast.LENGTH_SHORT).show()
        } else {
            Toast.makeText(context, "No image to save", Toast.LENGTH_SHORT).show()
        }
    } catch (e: Exception) {
        Toast.makeText(context, "Failed to save image: ${e.message}", Toast.LENGTH_SHORT).show()
    }
}

private suspend fun shareGeneratedImage(
    context: android.content.Context,
    viewModel: ImageToImageViewModel
) {
    try {
        val bitmap = viewModel.generatedImageBitmap
        if (bitmap != null) {
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
                putExtra(Intent.EXTRA_TEXT, "Created with AI Image Studio Pro: ${viewModel.prompt}")
                addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
            }
            
            context.startActivity(Intent.createChooser(shareIntent, "Share Image"))
        } else {
            Toast.makeText(context, "No image to share", Toast.LENGTH_SHORT).show()
        }
    } catch (e: Exception) {
        Toast.makeText(context, "Failed to share image: ${e.message}", Toast.LENGTH_SHORT).show()
    }
}

@Composable
private fun FullscreenImageDialog(
    originalImage: Bitmap?,
    generatedImageUrl: String?,
    generatedImageBitmap: Bitmap?,
    onDismiss: () -> Unit
) {
    var showOriginal by remember { mutableStateOf(false) }
    val context = LocalContext.current
    val coroutineScope = rememberCoroutineScope()
    
    Dialog(
        onDismissRequest = onDismiss,
        properties = DialogProperties(
            dismissOnBackPress = true,
            dismissOnClickOutside = true,
            usePlatformDefaultWidth = false
        )
    ) {
        Box(
            modifier = Modifier
                .fillMaxSize()
                .background(Color.Black.copy(alpha = 0.95f))
                .clickable(enabled = false) { } // Consume clicks
        ) {
            // Main image display
            AnimatedContent(
                targetState = showOriginal,
                transitionSpec = {
                    fadeIn(animationSpec = tween(300)) togetherWith
                        fadeOut(animationSpec = tween(300))
                },
                modifier = Modifier.fillMaxSize()
            ) { showingOriginal ->
                if (showingOriginal && originalImage != null) {
                    // Show original image
                    Image(
                        bitmap = originalImage.asImageBitmap(),
                        contentDescription = "Original Image",
                        modifier = Modifier
                            .fillMaxSize()
                            .padding(16.dp),
                        contentScale = ContentScale.Fit
                    )
                } else {
                    // Show generated image
                    when {
                        generatedImageUrl != null -> {
                            AsyncImage(
                                model = generatedImageUrl,
                                contentDescription = "Generated Image",
                                modifier = Modifier
                                    .fillMaxSize()
                                    .padding(16.dp),
                                contentScale = ContentScale.Fit
                            )
                        }
                        generatedImageBitmap != null -> {
                            Image(
                                bitmap = generatedImageBitmap.asImageBitmap(),
                                contentDescription = "Generated Image",
                                modifier = Modifier
                                    .fillMaxSize()
                                    .padding(16.dp),
                                contentScale = ContentScale.Fit
                            )
                        }
                    }
                }
            }
            
            // Top controls
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .align(Alignment.TopCenter)
                    .padding(16.dp),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                // Close button
                IconButton(
                    onClick = onDismiss,
                    modifier = Modifier
                        .size(48.dp)
                        .background(
                            Color.White.copy(alpha = 0.1f),
                            CircleShape
                        )
                ) {
                    Icon(
                        Icons.Default.Close,
                        contentDescription = "Close",
                        tint = Color.White,
                        modifier = Modifier.size(24.dp)
                    )
                }
                
                // Toggle button
                if (originalImage != null) {
                    Surface(
                        onClick = { showOriginal = !showOriginal },
                        shape = RoundedCornerShape(24.dp),
                        color = Color.White.copy(alpha = 0.1f),
                        modifier = Modifier.padding(horizontal = 8.dp)
                    ) {
                        Row(
                            modifier = Modifier.padding(horizontal = 16.dp, vertical = 12.dp),
                            verticalAlignment = Alignment.CenterVertically,
                            horizontalArrangement = Arrangement.Center
                        ) {
                            Icon(
                                Icons.Outlined.Compare,
                                contentDescription = null,
                                tint = Color.White,
                                modifier = Modifier.size(20.dp)
                            )
                            Spacer(modifier = Modifier.width(8.dp))
                            Text(
                                text = if (showOriginal) "Show Generated" else "Show Original",
                                color = Color.White,
                                fontSize = 14.sp,
                                fontWeight = FontWeight.Medium
                            )
                        }
                    }
                }
                
                Spacer(modifier = Modifier.width(48.dp)) // Balance the layout
            }
            
            // Bottom action bar
            Surface(
                modifier = Modifier
                    .fillMaxWidth()
                    .align(Alignment.BottomCenter),
                color = Color.Black.copy(alpha = 0.8f)
            ) {
                Column(
                    modifier = Modifier.padding(16.dp),
                    horizontalAlignment = Alignment.CenterHorizontally
                ) {
                    // Current image label
                    Surface(
                        shape = RoundedCornerShape(8.dp),
                        color = if (showOriginal) Color(0xFF6366F1).copy(alpha = 0.9f) else Color(0xFFEC4899).copy(alpha = 0.9f),
                        modifier = Modifier.padding(bottom = 12.dp)
                    ) {
                        Text(
                            text = if (showOriginal) "Original" else "AI Generated",
                            modifier = Modifier.padding(horizontal = 16.dp, vertical = 8.dp),
                            fontSize = 14.sp,
                            fontWeight = FontWeight.Bold,
                            color = Color.White
                        )
                    }
                    
                    // Action buttons
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.spacedBy(12.dp)
                    ) {
                        // Download button
                        OutlinedButton(
                            onClick = {
                                coroutineScope.launch {
                                    try {
                                        val bitmapToSave = if (showOriginal) originalImage else generatedImageBitmap
                                        if (bitmapToSave != null) {
                                            saveImageToDevice(context, bitmapToSave, showOriginal)
                                        } else {
                                            Toast.makeText(context, "No image to save", Toast.LENGTH_SHORT).show()
                                        }
                                    } catch (e: Exception) {
                                        Toast.makeText(context, "Failed to save: ${e.message}", Toast.LENGTH_SHORT).show()
                                    }
                                }
                            },
                            modifier = Modifier.weight(1f),
                            shape = RoundedCornerShape(12.dp),
                            colors = ButtonDefaults.outlinedButtonColors(
                                contentColor = Color(0xFF10B981)
                            ),
                            border = BorderStroke(
                                width = 1.dp,
                                color = Color(0xFF10B981).copy(alpha = 0.5f)
                            )
                        ) {
                            Icon(
                                Icons.Outlined.Download,
                                contentDescription = "Download",
                                modifier = Modifier.size(20.dp)
                            )
                            Spacer(modifier = Modifier.width(8.dp))
                            Text(
                                "Download",
                                fontSize = 16.sp,
                                fontWeight = FontWeight.Medium
                            )
                        }
                        
                        // Share button
                        OutlinedButton(
                            onClick = {
                                coroutineScope.launch {
                                    try {
                                        val bitmapToShare = if (showOriginal) originalImage else generatedImageBitmap
                                        if (bitmapToShare != null) {
                                            shareImage(context, bitmapToShare, showOriginal)
                                        } else {
                                            Toast.makeText(context, "No image to share", Toast.LENGTH_SHORT).show()
                                        }
                                    } catch (e: Exception) {
                                        Toast.makeText(context, "Failed to share: ${e.message}", Toast.LENGTH_SHORT).show()
                                    }
                                }
                            },
                            modifier = Modifier.weight(1f),
                            shape = RoundedCornerShape(12.dp),
                            colors = ButtonDefaults.outlinedButtonColors(
                                contentColor = Color(0xFF6366F1)
                            ),
                            border = BorderStroke(
                                width = 1.dp,
                                color = Color(0xFF6366F1).copy(alpha = 0.5f)
                            )
                        ) {
                            Icon(
                                Icons.Outlined.Share,
                                contentDescription = "Share",
                                modifier = Modifier.size(20.dp)
                            )
                            Spacer(modifier = Modifier.width(8.dp))
                            Text(
                                "Share",
                                fontSize = 16.sp,
                                fontWeight = FontWeight.Medium
                            )
                        }
                    }
                }
            }
        }
    }
}

// Helper function to save image from fullscreen viewer
private suspend fun saveImageToDevice(
    context: android.content.Context,
    bitmap: Bitmap,
    isOriginal: Boolean
) {
    try {
        val fileName = if (isOriginal) {
            "Original_Image_${System.currentTimeMillis()}.png"
        } else {
            "AI_Generated_${System.currentTimeMillis()}.png"
        }
        
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
        
        Toast.makeText(context, "Image saved to Pictures folder", Toast.LENGTH_SHORT).show()
    } catch (e: Exception) {
        throw e
    }
}

// Helper function to share image from fullscreen viewer
private suspend fun shareImage(
    context: android.content.Context,
    bitmap: Bitmap,
    isOriginal: Boolean
) {
    try {
        val cachePath = File(context.cacheDir, "images")
        cachePath.mkdirs()
        
        val fileName = if (isOriginal) "original_image.png" else "generated_image.png"
        val stream = FileOutputStream(File(cachePath, fileName))
        bitmap.compress(Bitmap.CompressFormat.PNG, 100, stream)
        stream.close()

        val imagePath = File(context.cacheDir, "images/$fileName")
        val imageUri = FileProvider.getUriForFile(
            context,
            "${context.packageName}.fileprovider",
            imagePath
        )
        
        val shareIntent = Intent().apply {
            action = Intent.ACTION_SEND
            type = "image/png"
            putExtra(Intent.EXTRA_STREAM, imageUri)
            putExtra(Intent.EXTRA_TEXT, if (isOriginal) "Original Image" else "AI Generated Image")
            addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
        }
        
        context.startActivity(Intent.createChooser(shareIntent, "Share Image"))
    } catch (e: Exception) {
        throw e
    }
}
