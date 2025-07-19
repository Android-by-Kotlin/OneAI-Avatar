package max.ohm.oneai.imagetoimage

import android.graphics.Bitmap
import android.net.Uri
import android.provider.MediaStore
import android.util.Log
import androidx.activity.compose.rememberLauncherForActivityResult
import androidx.activity.result.contract.ActivityResultContracts
import androidx.activity.result.PickVisualMediaRequest
import androidx.compose.animation.*
import androidx.compose.animation.core.*
import androidx.compose.foundation.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material.icons.outlined.*
import androidx.compose.material.icons.outlined.Search
import androidx.compose.material3.ExposedDropdownMenuBox
import androidx.compose.material3.ExposedDropdownMenuDefaults
import androidx.compose.material3.OutlinedTextFieldDefaults
import androidx.compose.material3.MenuDefaults
import androidx.compose.material3.DropdownMenuItem
import androidx.compose.material3.*
import androidx.compose.material3.TextFieldDefaults
import androidx.compose.material3.ButtonDefaults
import androidx.compose.material3.Divider
import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.material3.OutlinedTextField
import max.ohm.oneai.imagetoimage.ui.BrushMaskTool
import max.ohm.oneai.stabilityai.ui.ImageComparisonView
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
import coil.compose.rememberAsyncImagePainter
import coil.request.ImageRequest
import max.ohm.oneai.imagetoimage.UnifiedImageToImageViewModel
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


//@Composable
//fun RegularImageToImageInputs(viewModel: UnifiedImageToImageViewModel) {
//    Column(modifier = Modifier.fillMaxWidth()) {
//        // Prompt Input
//        OutlinedTextField(
//            value = viewModel.prompt,
//            onValueChange = { viewModel.prompt = it },
//            label = { Text("Prompt") },
//            modifier = Modifier.fillMaxWidth(),
//            colors = OutlinedTextFieldDefaults.colors(
//                focusedBorderColor = Color(0xFF6366F1),
//                focusedLabelColor = Color(0xFF6366F1),
//                unfocusedBorderColor = Color(0xFF374151),
//                unfocusedLabelColor = Color(0xFF9CA3AF)
//            )
//        )
//
//        Spacer(modifier = Modifier.height(16.dp))
//
//        // Negative Prompt Input
//        OutlinedTextField(
//            value = viewModel.negativePrompt,
//            onValueChange = { viewModel.negativePrompt = it },
//            label = { Text("Negative Prompt") },
//            modifier = Modifier.fillMaxWidth(),
//            colors = OutlinedTextFieldDefaults.colors(
//                focusedBorderColor = Color(0xFF6366F1),
//                focusedLabelColor = Color(0xFF6366F1),
//                unfocusedBorderColor = Color(0xFF374151),
//                unfocusedLabelColor = Color(0xFF9CA3AF)
//            )
//        )
//
//        Spacer(modifier = Modifier.height(16.dp))
//
//        // Advanced Settings
//        Column(
//            modifier = Modifier.fillMaxWidth()
//        ) {
//            // Strength Slider
//            Row(
//                modifier = Modifier.fillMaxWidth(),
//                horizontalArrangement = Arrangement.SpaceBetween,
//                verticalAlignment = Alignment.CenterVertically
//            ) {
//                Text(
//                    text = "Strength",
//                    color = Color.White,
//                    fontSize = 14.sp
//                )
//                Text(
//                    text = "%.1f".format(viewModel.strength),
//                    color = Color(0xFF6366F1),
//                    fontSize = 14.sp
//                )
//            }
//
//            Slider(
//                value = viewModel.strength,
//                onValueChange = { viewModel.strength = it },
//                valueRange = 0f..1f,
//                colors = SliderDefaults.colors(
//                    thumbColor = Color(0xFF6366F1),
//                    activeTrackColor = Color(0xFF6366F1),
//                    inactiveTrackColor = Color(0xFF374151)
//                )
//            )
//
//            Spacer(modifier = Modifier.height(16.dp))
//
//            // Guidance Scale Slider
//            Row(
//                modifier = Modifier.fillMaxWidth(),
//                horizontalArrangement = Arrangement.SpaceBetween,
//                verticalAlignment = Alignment.CenterVertically
//            ) {
//                Text(
//                    text = "Guidance Scale",
//                    color = Color.White,
//                    fontSize = 14.sp
//                )
//                Text(
//                    text = "%.1f".format(viewModel.guidanceScale),
//                    color = Color(0xFF6366F1),
//                    fontSize = 14.sp
//                )
//            }
//
//            Slider(
//                value = viewModel.guidanceScale,
//                onValueChange = { viewModel.guidanceScale = it },
//                valueRange = 1f..20f,
//                colors = SliderDefaults.colors(
//                    thumbColor = Color(0xFF6366F1),
//                    activeTrackColor = Color(0xFF6366F1),
//                    inactiveTrackColor = Color(0xFF374151)
//                )
//            )
//
//            Spacer(modifier = Modifier.height(16.dp))
//
//            // Steps Slider
//            Row(
//                modifier = Modifier.fillMaxWidth(),
//                horizontalArrangement = Arrangement.SpaceBetween,
//                verticalAlignment = Alignment.CenterVertically
//            ) {
//                Text(
//                    text = "Steps",
//                    color = Color.White,
//                    fontSize = 14.sp
//                )
//                Text(
//                    text = viewModel.steps.toString(),
//                    color = Color(0xFF6366F1),
//                    fontSize = 14.sp
//                )
//            }
//
//            Slider(
//                value = viewModel.steps.toFloat(),
//                onValueChange = { viewModel.steps = it.toInt() },
//                valueRange = 1f..50f,
//                colors = SliderDefaults.colors(
//                    thumbColor = Color(0xFF6366F1),
//                    activeTrackColor = Color(0xFF6366F1),
//                    inactiveTrackColor = Color(0xFF374151)
//                )
//            )
//        }
//
//        Spacer(modifier = Modifier.height(16.dp))
//    }
//}

@OptIn(ExperimentalMaterial3Api::class, ExperimentalAnimationApi::class)
@Composable
fun ImageToImageScreen(
    viewModel: UnifiedImageToImageViewModel = viewModel(),
    onNavigateToGallery: () -> Unit = {}
) {
    val context = LocalContext.current
    LaunchedEffect(Unit) {
        viewModel.setContext(context)
    }

    val scrollState = rememberScrollState()
    var showAdvancedSettings by remember { mutableStateOf(false) }
    val coroutineScope = rememberCoroutineScope()
    var showFullscreenImage by remember { mutableStateOf(false) }
    var expanded by remember { mutableStateOf(false) }
    
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
        if (bitmap != null) {
            Toast.makeText(context, "Camera image captured: ${bitmap.width}x${bitmap.height}", Toast.LENGTH_LONG).show()
            viewModel.updateSelectedImage(bitmap)
        } else {
            Toast.makeText(context, "No image captured from camera", Toast.LENGTH_SHORT).show()
        }
    }
    
    // Multiple image picker launcher for batch processing
    val multipleImagePickerLauncher = rememberLauncherForActivityResult(
        contract = ActivityResultContracts.GetMultipleContents()
    ) { uris: List<Uri> ->
        if (uris.isNotEmpty()) {
            val bitmaps = mutableListOf<Bitmap>()
            uris.forEach { uri ->
                try {
                    val bitmap = MediaStore.Images.Media.getBitmap(context.contentResolver, uri)
                    bitmaps.add(bitmap)
                } catch (e: Exception) {
                    Log.e("BatchProcessing", "Error loading image", e)
                }
            }
            if (bitmaps.isNotEmpty()) {
                viewModel.addBatchImages(bitmaps)
                Toast.makeText(context, "Added ${bitmaps.size} images to batch", Toast.LENGTH_SHORT).show()
            }
        }
    }
    
    // Background reference image picker launcher
    val backgroundImagePickerLauncher = rememberLauncherForActivityResult(
        contract = ActivityResultContracts.GetContent()
    ) { uri: Uri? ->
        uri?.let {
            try {
                viewModel.updateBackgroundReferenceUri(uri)
                Toast.makeText(context, "Background reference image selected", Toast.LENGTH_SHORT).show()
            } catch (e: Exception) {
                viewModel.errorMessage = "Failed to load background image: ${e.message}"
            }
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
            
            // Batch Processing Status (show only when batch images are selected)
            if (viewModel.batchImages.isNotEmpty()) {
                Card(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(horizontal = 16.dp, vertical = 4.dp),
                    shape = RoundedCornerShape(16.dp),
                    colors = CardDefaults.cardColors(
                        containerColor = Color(0xFF1A1F3A).copy(alpha = 0.9f)
                    ),
                    border = BorderStroke(
                        width = 1.dp,
                        color = Color(0xFFEC4899).copy(alpha = 0.3f)
                    )
                ) {
                    Column(
                        modifier = Modifier.padding(16.dp)
                    ) {
                        Row(
                            verticalAlignment = Alignment.CenterVertically,
                            modifier = Modifier.padding(bottom = 12.dp)
                        ) {
                            Icon(
                                Icons.Outlined.Collections,
                                contentDescription = null,
                                tint = Color(0xFFEC4899),
                                modifier = Modifier.size(20.dp)
                            )
                            Spacer(modifier = Modifier.width(6.dp))
                            Text(
                                "Batch Processing - ${viewModel.batchImages.size} images",
                                fontSize = 16.sp,
                                fontWeight = FontWeight.SemiBold,
                                color = Color.White
                            )
                            Spacer(modifier = Modifier.weight(1f))
                            TextButton(
                                onClick = { viewModel.clearBatchImages() }
                            ) {
                                Text(
                                    "Clear",
                                    color = Color(0xFFEC4899),
                                    fontSize = 12.sp
                                )
                            }
                        }
                        
                        // Progress indicator when processing
                        if (viewModel.isBatchProcessing) {
                            Column {
                                LinearProgressIndicator(
                                    progress = viewModel.batchProcessingProgress.toFloat() / viewModel.batchProcessingTotal.toFloat(),
                                    modifier = Modifier
                                        .fillMaxWidth()
                                        .padding(bottom = 8.dp),
                                    color = Color(0xFFEC4899)
                                )
                                Text(
                                    viewModel.batchProcessingCurrentImage ?: "Processing...",
                                    color = Color.White,
                                    fontSize = 14.sp
                                )
                            }
                        }
                    }
                }
            }
            
            // Model Selection Card
            Card(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(horizontal = 16.dp, vertical = 4.dp),
                shape = RoundedCornerShape(16.dp),
                colors = CardDefaults.cardColors(
                    containerColor = Color(0xFF1A1F3A).copy(alpha = 0.9f)
                ),
                border = BorderStroke(
                    width = 1.dp,
                    color = Color(0xFF6366F1).copy(alpha = 0.3f)
                )
            ) {
                Column(
                    modifier = Modifier.padding(16.dp)
                ) {
                    // Model Selection Header
                    Row(
                        verticalAlignment = Alignment.CenterVertically,
                        modifier = Modifier.padding(bottom = 12.dp)
                    ) {
                        Icon(
                            Icons.Outlined.Settings,
                            contentDescription = null,
                            tint = Color(0xFF6366F1),
                            modifier = Modifier.size(20.dp)
                        )
                        Spacer(modifier = Modifier.width(6.dp))
                        Text(
                            "AI Model Selection",
                            fontSize = 14.sp,
                            fontWeight = FontWeight.SemiBold,
                            color = Color.White
                        )
                    }
                    
                    // Regular image to image inputs
                   // RegularImageToImageInputs(viewModel)
                    
                    // Model Selection Dropdown
                    ExposedDropdownMenuBox(
                        expanded = expanded,
                        onExpandedChange = { expanded = !expanded },
                        modifier = Modifier.fillMaxWidth()
                    ) {
OutlinedTextField(
    readOnly = true,
    value = viewModel.availableModels.find { it.first == viewModel.selectedModel }?.second ?: "Select Model",
    onValueChange = { },
    placeholder = { 
        Text(
            "Choose AI Model...",
            color = Color.White.copy(alpha = 0.5f),
            fontSize = 12.sp
        ) 
    },
    modifier = Modifier
        .fillMaxWidth()
        .menuAnchor(),
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
    leadingIcon = {
        Icon(
            Icons.Outlined.ModelTraining,
            contentDescription = null,
            tint = Color(0xFF6366F1),
            modifier = Modifier.size(18.dp)
        )
    },
    trailingIcon = {
        ExposedDropdownMenuDefaults.TrailingIcon(
            expanded = expanded
        )
    }
)
                        ExposedDropdownMenu(
                            expanded = expanded,
                            onDismissRequest = { expanded = false },
                            modifier = Modifier.background(Color(0xFF1A1F3A))
                        ) {
                            viewModel.availableModels.forEach { model ->
                                DropdownMenuItem(
                                    onClick = {
                                        viewModel.updateSelectedModel(model.first)
                                        expanded = false
                                    },
                                    text = { 
                                        Text(
                                            text = model.second,
                                            color = Color.White,
                                            fontSize = 13.sp
                                        )
                                    },
                                    colors = MenuDefaults.itemColors(
                                        textColor = Color.White
                                    )
                                )
                            }
                        }
                    }
                }
            }
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
    Log.d("ImageDisplay", "Showing URL image: $imageUrl")
    Image(
        painter = rememberAsyncImagePainter(
            ImageRequest.Builder(LocalContext.current)
                .data(imageUrl)
                .crossfade(true)
                .build()
        ),
        contentDescription = "Generated Image",
        modifier = Modifier
            .fillMaxSize()
            .clip(RoundedCornerShape(12.dp)),
        contentScale = ContentScale.Fit
    )
}

// Show bitmap if URL is not available
viewModel.generatedImageBitmap?.let { bitmap ->
    Log.d("ImageDisplay", "Showing bitmap image: ${bitmap.width}x${bitmap.height}")
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
                                    
                                    // Debug: Show a placeholder if no image is available
                                    if (viewModel.generatedImageUrl == null && viewModel.generatedImageBitmap == null) {
                                        Log.d("ImageDisplay", "No image available to display")
                                        Box(
                                            modifier = Modifier.fillMaxSize(),
                                            contentAlignment = Alignment.Center
                                        ) {
                                            Text(
                                                "No Image",
                                                color = Color.White,
                                                fontSize = 12.sp
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
                            
                            // Generation time display
                            val totalTime = viewModel.totalGenerationTimeInSeconds.collectAsState().value
                            if (totalTime != null && totalTime > 0) {
                                Surface(
                                    shape = RoundedCornerShape(12.dp),
                                    color = Color(0xFF10B981).copy(alpha = 0.2f),
                                    modifier = Modifier
                                        .fillMaxWidth()
                                        .padding(top = 8.dp)
                                ) {
                                    Row(
                                        modifier = Modifier
                                            .fillMaxWidth()
                                            .padding(horizontal = 16.dp, vertical = 8.dp),
                                        horizontalArrangement = Arrangement.Center,
                                        verticalAlignment = Alignment.CenterVertically
                                    ) {
                                        Icon(
                                            Icons.Outlined.Timer,
                                            contentDescription = null,
                                            tint = Color(0xFF10B981),
                                            modifier = Modifier.size(16.dp)
                                        )
                                        Spacer(modifier = Modifier.width(6.dp))
                                        Text(
                                            "Generated in ${totalTime}s",
                                            color = Color(0xFF10B981),
                                            fontSize = 14.sp,
                                            fontWeight = FontWeight.Medium
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
                                
                                Row(
                                    horizontalArrangement = Arrangement.spacedBy(8.dp)
                                ) {
                                    // Brush tool button - only show for mask erase and inpaint models
                                    if (viewModel.selectedModel == "stability-ai-mask-erase" || viewModel.selectedModel == "stability-ai-inpaint") {
                                        IconButton(
                                            onClick = { viewModel.toggleMaskingInterface() },
                                            modifier = Modifier
                                                .size(36.dp)
                                                .background(
                                                    Color(0xFFEC4899).copy(alpha = 0.3f),
                                                    CircleShape
                                                )
                                        ) {
                                            Icon(
                                                Icons.Default.Brush,
                                                contentDescription = "Brush Tool",
                                                tint = Color(0xFFEC4899),
                                                modifier = Modifier.size(20.dp)
                                            )
                                        }
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
                                    
                                    // Batch processing option
                                    OutlinedCard(
                                        onClick = { 
                                            // Launch multiple image picker for batch processing
                                            multipleImagePickerLauncher.launch("image/*")
                                        },
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
                                                Icons.Outlined.Collections,
                                                contentDescription = "Batch",
                                                modifier = Modifier.size(24.dp),
                                                tint = Color(0xFFEC4899)
                                            )
                                            Spacer(modifier = Modifier.height(4.dp))
                                            Text(
                                                "Batch",
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
                    
                    // Mask status indicator for mask erase and inpaint models
                    if (viewModel.selectedModel == "stability-ai-mask-erase" || viewModel.selectedModel == "stability-ai-inpaint") {
                        Card(
                            modifier = Modifier
                                .fillMaxWidth()
                                .padding(bottom = 12.dp),
                            colors = CardDefaults.cardColors(
                                containerColor = if (viewModel.maskBitmap != null) 
                                    Color(0xFF10B981).copy(alpha = 0.2f) 
                                else 
                                    Color(0xFFEF4444).copy(alpha = 0.2f)
                            ),
                            shape = RoundedCornerShape(8.dp)
                        ) {
                            Row(
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .padding(12.dp),
                                verticalAlignment = Alignment.CenterVertically
                            ) {
                                Icon(
                                    if (viewModel.maskBitmap != null) 
                                        Icons.Default.CheckCircle 
                                    else 
                                        Icons.Default.ErrorOutline,
                                    contentDescription = null,
                                    tint = if (viewModel.maskBitmap != null) 
                                        Color(0xFF10B981) 
                                    else 
                                        Color(0xFFEF4444),
                                    modifier = Modifier.size(20.dp)
                                )
                                Spacer(modifier = Modifier.width(8.dp))
                                Text(
                                    if (viewModel.maskBitmap != null) {
                                        when (viewModel.selectedModel) {
                                            "stability-ai-mask-erase" -> "Mask created - Ready to erase"
                                            "stability-ai-inpaint" -> "Mask created - Ready to inpaint"
                                            else -> "Mask created - Ready to process"
                                        }
                                    } else {
                                        "Please create a mask using the brush tool"
                                    },
                                    color = Color.White,
                                    fontSize = 14.sp
                                )
                            }
                        }
                    }
                    
                    // Handle different prompt inputs based on selected model
                    when (viewModel.selectedModel) {
                        "stability-ai-sketch" -> {
                            OutlinedTextField(
                                value = viewModel.prompt,
                                onValueChange = { viewModel.prompt = it },
                                placeholder = { 
                                    Text(
                                        "What should your sketch become? (e.g., a medieval castle on a hill)",
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
                                minLines = 2,
                                maxLines = 4,
                                leadingIcon = {
                                    Icon(
                                        Icons.Outlined.Brush,
                                        contentDescription = null,
                                        tint = Color(0xFF6366F1),
                                        modifier = Modifier.size(20.dp)
                                    )
                                }
                            )
                        }
                        "stability-ai-structure" -> {
                            OutlinedTextField(
                                value = viewModel.prompt,
                                onValueChange = { viewModel.prompt = it },
                                placeholder = { 
                                    Text(
                                        "What should this structure become? (e.g., a well manicured shrub in an english garden)",
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
                                minLines = 2,
                                maxLines = 4,
                                leadingIcon = {
                                    Icon(
                                        Icons.Outlined.Architecture,
                                        contentDescription = null,
                                        tint = Color(0xFF6366F1),
                                        modifier = Modifier.size(20.dp)
                                    )
                                }
                            )
                        }
                        "stability-ai-search-replace", "stability-ai-search-recolor" -> {
                        OutlinedTextField(
                            value = viewModel.searchPrompt,
                            onValueChange = { viewModel.searchPrompt = it },
                            placeholder = { 
                                Text(
                                    if (viewModel.selectedModel == "stability-ai-search-recolor") 
                                        "What to select for recoloring..."
                                    else 
                                        "What to search for...",
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
                            maxLines = 1,
                            leadingIcon = {
                                Icon(
                                    Icons.Outlined.Search,
                                    contentDescription = null,
                                    tint = Color(0xFF6366F1),
                                    modifier = Modifier.size(20.dp)
                                )
                            }
                        )
                        OutlinedTextField(
                            value = viewModel.replacePrompt,
                            onValueChange = { viewModel.replacePrompt = it },
                            placeholder = { 
                                Text(
                                    if (viewModel.selectedModel == "stability-ai-search-recolor") 
                                        "New color/appearance..."
                                    else 
                                        "What to replace with...",
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
                            minLines = 2,
                            maxLines = 3,
                            leadingIcon = {
                                Icon(
                                Icons.Outlined.SwapHoriz,
                                    contentDescription = null,
                                    tint = Color(0xFF6366F1),
                                    modifier = Modifier.size(20.dp)
                                )
                            }
                        )
                        }
                        "stability-ai-remove-background" -> {
                            // No prompts needed for background removal
                            Card(
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .padding(bottom = 12.dp),
                                colors = CardDefaults.cardColors(
                                    containerColor = Color(0xFF10B981).copy(alpha = 0.2f)
                                ),
                                shape = RoundedCornerShape(8.dp)
                            ) {
                                Row(
                                    modifier = Modifier
                                        .fillMaxWidth()
                                        .padding(12.dp),
                                    verticalAlignment = Alignment.CenterVertically
                                ) {
                                    Icon(
                                        Icons.Default.CheckCircle,
                                        contentDescription = null,
                                        tint = Color(0xFF10B981),
                                        modifier = Modifier.size(20.dp)
                                    )
                                    Spacer(modifier = Modifier.width(8.dp))
                                    Text(
                                        "Ready to remove background - no prompts needed!",
                                        color = Color.White,
                                        fontSize = 14.sp
                                    )
                                }
                            }
                        }
                        "stability-ai-replace-background-relight" -> {
                            // Background reference image picker
                            Card(
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .padding(bottom = 12.dp)
                                    .clickable { backgroundImagePickerLauncher.launch("image/*") },
                                colors = CardDefaults.cardColors(
                                    containerColor = Color(0xFF0A0E27).copy(alpha = 0.5f)
                                ),
                                shape = RoundedCornerShape(12.dp),
                                border = BorderStroke(
                                    width = 1.dp,
                                    color = if (viewModel.backgroundReferenceUri != null) 
                                        Color(0xFF10B981) else Color.White.copy(alpha = 0.2f)
                                )
                            ) {
                                Column(
                                    modifier = Modifier
                                        .fillMaxWidth()
                                        .padding(16.dp)
                                ) {
                                    Row(
                                        modifier = Modifier.fillMaxWidth(),
                                        horizontalArrangement = Arrangement.SpaceBetween,
                                        verticalAlignment = Alignment.CenterVertically
                                    ) {
                                        Text(
                                            "Background Reference Image (Optional)",
                                            color = Color.White,
                                            fontSize = 14.sp,
                                            fontWeight = FontWeight.Medium
                                        )
                                        if (viewModel.backgroundReferenceUri != null) {
                                            IconButton(
                                                onClick = { viewModel.updateBackgroundReferenceUri(null) },
                                                modifier = Modifier.size(24.dp)
                                            ) {
                                                Icon(
                                                    Icons.Default.Close,
                                                    contentDescription = "Remove background reference",
                                                    tint = Color(0xFFEF4444),
                                                    modifier = Modifier.size(18.dp)
                                                )
                                            }
                                        }
                                    }
                                    
                                    if (viewModel.backgroundReferenceUri != null) {
                                        // Show preview of selected background reference
                                        AsyncImage(
                                            model = viewModel.backgroundReferenceUri,
                                            contentDescription = "Background reference",
                                            modifier = Modifier
                                                .fillMaxWidth()
                                                .height(120.dp)
                                                .padding(top = 8.dp)
                                                .clip(RoundedCornerShape(8.dp)),
                                            contentScale = ContentScale.Crop
                                        )
                                    } else {
                                        // Show upload prompt
                                        Row(
                                            modifier = Modifier
                                                .fillMaxWidth()
                                                .padding(top = 8.dp),
                                            horizontalArrangement = Arrangement.Center,
                                            verticalAlignment = Alignment.CenterVertically
                                        ) {
                                            Icon(
                                                Icons.Outlined.AddPhotoAlternate,
                                                contentDescription = null,
                                                tint = Color(0xFF6366F1),
                                                modifier = Modifier.size(24.dp)
                                            )
                                            Spacer(modifier = Modifier.width(8.dp))
                                            Text(
                                                "Tap to upload reference image",
                                                color = Color.White.copy(alpha = 0.7f),
                                                fontSize = 14.sp
                                            )
                                        }
                                    }
                                }
                            }
                            
                            // Only show text prompt if no background reference image is selected
                            if (viewModel.backgroundReferenceUri == null) {
                                OutlinedTextField(
                                    value = viewModel.prompt,
                                    onValueChange = { viewModel.prompt = it },
                                    placeholder = { 
                                        Text(
                                            "Describe the new background and lighting...",
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
                                    minLines = 2,
                                    maxLines = 4,
                                    leadingIcon = {
                                        Icon(
                                            Icons.Outlined.Landscape,
                                            contentDescription = null,
                                            tint = Color(0xFF6366F1),
                                            modifier = Modifier.size(20.dp)
                                        )
                                    }
                                )
                            } else {
                                // Show info message when background reference is selected
                                Card(
                                    modifier = Modifier
                                        .fillMaxWidth()
                                        .padding(bottom = 12.dp),
                                    colors = CardDefaults.cardColors(
                                        containerColor = Color(0xFF10B981).copy(alpha = 0.2f)
                                    ),
                                    shape = RoundedCornerShape(8.dp)
                                ) {
                                    Row(
                                        modifier = Modifier
                                            .fillMaxWidth()
                                            .padding(12.dp),
                                        verticalAlignment = Alignment.CenterVertically
                                    ) {
                                        Icon(
                                            Icons.Default.CheckCircle,
                                            contentDescription = null,
                                            tint = Color(0xFF10B981),
                                            modifier = Modifier.size(20.dp)
                                        )
                                        Spacer(modifier = Modifier.width(8.dp))
                                        Text(
                                            "Using background reference image",
                                            color = Color.White,
                                            fontSize = 14.sp
                                        )
                                    }
                                }
                            }
                        }
                        else -> {
                            // Main Prompt Input for other models
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
                        }
                    }
                    
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
                            if (viewModel.selectedModel == "stability-ai-sketch" || viewModel.selectedModel == "stability-ai-structure") {
                                Row(
                                    modifier = Modifier.fillMaxWidth(),
                                    horizontalArrangement = Arrangement.SpaceBetween
                                ) {
                                    Text(
                                        "Control Strength",
                                        color = Color.White,
                                        fontSize = 14.sp,
                                        fontWeight = FontWeight.Medium
                                    )
                                    Text(
                                        String.format("%.0f%%", viewModel.controlStrength * 100),
                                        color = Color(0xFF6366F1),
                                        fontSize = 14.sp,
                                        fontWeight = FontWeight.Bold
                                    )
                                }

                                Slider(
                                    value = viewModel.controlStrength,
                                    onValueChange = { viewModel.updateControlStrength(it) },
                                    valueRange = 0.1f..1f,
                                    colors = SliderDefaults.colors(
                                        thumbColor = Color(0xFF6366F1),
                                        activeTrackColor = Color(0xFF6366F1),
                                        inactiveTrackColor = Color.White.copy(alpha = 0.1f)
                                    ),
                                    modifier = Modifier.padding(top = 8.dp)
                                )
                                Text(
                                    if (viewModel.selectedModel == "stability-ai-sketch") 
                                        "Higher values follow your sketch more closely"
                                    else
                                        "Higher values preserve original structure more",
                                    fontSize = 12.sp,
                                    color = Color.White.copy(alpha = 0.6f),
                                    modifier = Modifier.padding(top = 4.dp)
                                )
                            } else {
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
                        
                        // Outpaint Controls - only show for outpaint model
                        if (viewModel.selectedModel == "stability-ai-outpaint") {
                            Spacer(modifier = Modifier.height(20.dp))
                            
                            Text(
                                "Outpaint Settings",
                                color = Color.White,
                                fontSize = 16.sp,
                                fontWeight = FontWeight.SemiBold,
                                modifier = Modifier.padding(bottom = 12.dp)
                            )
                            
                            // Left Outpaint
                            Column(
                                modifier = Modifier.padding(bottom = 16.dp)
                            ) {
                                Row(
                                    modifier = Modifier.fillMaxWidth(),
                                    horizontalArrangement = Arrangement.SpaceBetween
                                ) {
                                    Text(
                                        "Left Extension",
                                        color = Color.White,
                                        fontSize = 14.sp,
                                        fontWeight = FontWeight.Medium
                                    )
                                    Text(
                                        "${viewModel.outpaintLeft}px",
                                        color = Color(0xFF6366F1),
                                        fontSize = 14.sp,
                                        fontWeight = FontWeight.Bold
                                    )
                                }
                                
                                Slider(
                                    value = viewModel.outpaintLeft.toFloat(),
                                    onValueChange = { viewModel.updateOutpaintLeft(it.toInt()) },
                                    valueRange = 0f..512f,
                                    colors = SliderDefaults.colors(
                                        thumbColor = Color(0xFF6366F1),
                                        activeTrackColor = Color(0xFF6366F1),
                                        inactiveTrackColor = Color.White.copy(alpha = 0.1f)
                                    ),
                                    modifier = Modifier.padding(top = 8.dp)
                                )
                            }
                            
                            // Right Outpaint
                            Column(
                                modifier = Modifier.padding(bottom = 16.dp)
                            ) {
                                Row(
                                    modifier = Modifier.fillMaxWidth(),
                                    horizontalArrangement = Arrangement.SpaceBetween
                                ) {
                                    Text(
                                        "Right Extension",
                                        color = Color.White,
                                        fontSize = 14.sp,
                                        fontWeight = FontWeight.Medium
                                    )
                                    Text(
                                        "${viewModel.outpaintRight}px",
                                        color = Color(0xFF6366F1),
                                        fontSize = 14.sp,
                                        fontWeight = FontWeight.Bold
                                    )
                                }
                                
                                Slider(
                                    value = viewModel.outpaintRight.toFloat(),
                                    onValueChange = { viewModel.updateOutpaintRight(it.toInt()) },
                                    valueRange = 0f..512f,
                                    colors = SliderDefaults.colors(
                                        thumbColor = Color(0xFF6366F1),
                                        activeTrackColor = Color(0xFF6366F1),
                                        inactiveTrackColor = Color.White.copy(alpha = 0.1f)
                                    ),
                                    modifier = Modifier.padding(top = 8.dp)
                                )
                            }
                            
                            // Top Outpaint
                            Column(
                                modifier = Modifier.padding(bottom = 16.dp)
                            ) {
                                Row(
                                    modifier = Modifier.fillMaxWidth(),
                                    horizontalArrangement = Arrangement.SpaceBetween
                                ) {
                                    Text(
                                        "Top Extension",
                                        color = Color.White,
                                        fontSize = 14.sp,
                                        fontWeight = FontWeight.Medium
                                    )
                                    Text(
                                        "${viewModel.outpaintTop}px",
                                        color = Color(0xFF6366F1),
                                        fontSize = 14.sp,
                                        fontWeight = FontWeight.Bold
                                    )
                                }
                                
                                Slider(
                                    value = viewModel.outpaintTop.toFloat(),
                                    onValueChange = { viewModel.updateOutpaintTop(it.toInt()) },
                                    valueRange = 0f..512f,
                                    colors = SliderDefaults.colors(
                                        thumbColor = Color(0xFF6366F1),
                                        activeTrackColor = Color(0xFF6366F1),
                                        inactiveTrackColor = Color.White.copy(alpha = 0.1f)
                                    ),
                                    modifier = Modifier.padding(top = 8.dp)
                                )
                            }
                            
                            // Bottom Outpaint
                            Column(
                                modifier = Modifier.padding(bottom = 16.dp)
                            ) {
                                Row(
                                    modifier = Modifier.fillMaxWidth(),
                                    horizontalArrangement = Arrangement.SpaceBetween
                                ) {
                                    Text(
                                        "Bottom Extension",
                                        color = Color.White,
                                        fontSize = 14.sp,
                                        fontWeight = FontWeight.Medium
                                    )
                                    Text(
                                        "${viewModel.outpaintBottom}px",
                                        color = Color(0xFF6366F1),
                                        fontSize = 14.sp,
                                        fontWeight = FontWeight.Bold
                                    )
                                }
                                
                                Slider(
                                    value = viewModel.outpaintBottom.toFloat(),
                                    onValueChange = { viewModel.updateOutpaintBottom(it.toInt()) },
                                    valueRange = 0f..512f,
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
            }
            
            // Generate Button (Single button at bottom)
            Box(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(horizontal = 16.dp, vertical = 16.dp)
                    .height(60.dp)
                    .shadow(
                        elevation = if (!viewModel.isLoading) 12.dp else 0.dp,
                        shape = RoundedCornerShape(16.dp),
                        ambientColor = Color(0xFF6366F1).copy(alpha = 0.5f),
                        spotColor = Color(0xFF6366F1).copy(alpha = 0.5f)
                    )
                    .clip(RoundedCornerShape(16.dp))
                    .background(
                        if (viewModel.isLoading || viewModel.selectedImage == null) {
                            Brush.horizontalGradient(
                                colors = listOf(
                                    Color.Gray.copy(alpha = 0.3f),
                                    Color.Gray.copy(alpha = 0.3f)
                                )
                            )
                        } else {
                            Brush.horizontalGradient(
                                colors = listOf(
                                    Color(0xFF6366F1),
                                    Color(0xFFEC4899)
                                )
                            )
                        }
                    )
                    .clickable(
                        enabled = (!viewModel.isLoading && !viewModel.isBatchProcessing) &&
                                (viewModel.selectedImage != null || 
                                (viewModel.selectedModel.startsWith("batch-") && viewModel.batchImages.isNotEmpty()))
                    ) {
when {
                            viewModel.selectedModel.startsWith("batch-") && viewModel.batchImages.isNotEmpty() -> viewModel.processBatch()
                            else -> viewModel.generateImage()
                        }
                    },
                contentAlignment = Alignment.Center
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
                                modifier = Modifier.size(22.dp),
                                strokeWidth = 2.dp
                            )
                            Spacer(modifier = Modifier.width(12.dp))
                            Text(
                                if (viewModel.selectedModel.startsWith("batch-") && viewModel.isBatchProcessing) {
                                    "Processing Batch... (${viewModel.batchProcessingProgress + 1}/${viewModel.batchProcessingTotal})"
                                } else {
                                    "Generating with ${viewModel.availableModels.find { it.first == viewModel.selectedModel }?.second ?: "AI Model"}..."
                                },
                                fontSize = 16.sp,
                                fontWeight = FontWeight.Medium,
                                color = Color.White
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
                                modifier = Modifier.size(24.dp),
                                tint = Color.White
                            )
                            Spacer(modifier = Modifier.width(12.dp))
                            Column(
                                horizontalAlignment = Alignment.CenterHorizontally
                            ) {
                                Text(
                                    if (viewModel.selectedModel.startsWith("batch-") && viewModel.batchImages.isNotEmpty()) {
                                        "Process Batch (${viewModel.batchImages.size} images)"
                                    } else {
                                        "Generate Image"
                                    },
                                    fontSize = 18.sp,
                                    fontWeight = FontWeight.Bold,
                                    color = Color.White
                                )
                                Text(
                                    "with ${viewModel.availableModels.find { it.first == viewModel.selectedModel }?.second ?: "Selected Model"}",
                                    fontSize = 12.sp,
                                    fontWeight = FontWeight.Medium,
                                    color = Color.White.copy(alpha = 0.8f)
                                )
                            }
                        }
                    }
                }
            }
            
            // Error Message
            // Live timer display during generation
            AnimatedVisibility(
visible = viewModel.isLoading,
enter = fadeIn() + slideInVertically(),
exit = fadeOut() + slideOutVertically()
            ) {
                Card(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(horizontal = 16.dp, vertical = 8.dp),
                    colors = CardDefaults.cardColors(
                        containerColor = Color(0xFF6366F1).copy(alpha = 0.1f)
                    ),
                    shape = RoundedCornerShape(12.dp),
                    border = BorderStroke(
                        width = 1.dp,
                        color = Color(0xFF6366F1).copy(alpha = 0.5f)
                    )
                ) {
                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(16.dp),
                        horizontalArrangement = Arrangement.Center,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Icon(
                            Icons.Outlined.Timer,
                            contentDescription = null,
                            tint = Color(0xFF6366F1),
                            modifier = Modifier.size(20.dp)
                        )
                        Spacer(modifier = Modifier.width(8.dp))
                        Text(
                            "Generating: ${viewModel.elapsedTimeInSeconds.collectAsState().value} sec",
                            color = Color(0xFF6366F1),
                            fontSize = 16.sp,
                            fontWeight = FontWeight.Medium
                        )
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
        
        // Brush mask tool dialog
        if (viewModel.showMaskingInterface && viewModel.selectedImage != null) {
            BrushMaskTool(
                originalImage = viewModel.selectedImage!!,
                onMaskCreated = { maskBitmap ->
                    viewModel.updateMaskBitmap(maskBitmap)
                    viewModel.toggleMaskingInterface()
                },
                onDismiss = { viewModel.toggleMaskingInterface() }
            )
        }
    }
}

// Helper functions for saving and sharing images
private suspend fun saveGeneratedImage(
    context: android.content.Context,
    viewModel: UnifiedImageToImageViewModel
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
    viewModel: UnifiedImageToImageViewModel
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
