package max.ohm.oneai.imagetoimage.ui

import android.net.Uri
import androidx.activity.compose.rememberLauncherForActivityResult
import androidx.activity.result.contract.ActivityResultContracts
import androidx.compose.animation.*
import androidx.compose.animation.core.*
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Add
import androidx.compose.material.icons.filled.Close
import androidx.compose.material.icons.filled.Image
import androidx.compose.material.icons.filled.Link
import androidx.compose.material.icons.filled.Share
import androidx.compose.material.icons.filled.ZoomIn
import androidx.compose.material.icons.outlined.ArrowBack
import androidx.compose.material.icons.outlined.Transform
import androidx.compose.material.icons.outlined.AutoAwesome
import androidx.compose.material.icons.outlined.Psychology
import androidx.compose.material.icons.outlined.Bolt
import androidx.compose.material.icons.filled.CheckCircle
import androidx.compose.material.icons.filled.KeyboardArrowDown
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.ui.draw.shadow
import androidx.compose.ui.graphics.graphicsLayer
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.blur
import androidx.compose.ui.draw.clip
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.compose.ui.window.Dialog
import androidx.compose.ui.window.DialogProperties
import androidx.lifecycle.viewmodel.compose.viewModel
import coil.compose.AsyncImage
import max.ohm.oneai.imagetoimage.viewmodel.ImageToImageViewModel
import max.ohm.oneai.ui.theme.*
import max.ohm.oneai.ui.theme.GlassCard
import max.ohm.oneai.ui.theme.GlassSurface
import max.ohm.oneai.ui.theme.GlassMorphism
import max.ohm.oneai.utils.SetStatusBarColor
import max.ohm.oneai.utils.StatusBarUtils

// Data class for Image-to-Image model choices
data class ImageToImageModelChoice(
    val displayName: String,
    val internalName: String,
    val apiType: String // "stability", "modelslab"
)

@Composable
fun ImageToImageScreen(viewModel: ImageToImageViewModel = viewModel()) {
    val context = LocalContext.current
    val uiState by viewModel.uiState.collectAsState()
    var showUrlInput by remember { mutableStateOf(true) }
    
    // Model selection state
    var modelMenuExpanded by remember { mutableStateOf(false) }
    
    // Define available models for Image-to-Image
    val modelChoices = listOf(
        ImageToImageModelChoice("Stability AI Core", "stability-core", "stability"),
        ImageToImageModelChoice("Stability AI Ultra", "stability-ultra", "stability"),
        ImageToImageModelChoice("ModelsLab Standard", "modelslab-standard", "modelslab"),
        ImageToImageModelChoice("ModelsLab Pro", "modelslab-pro", "modelslab")
    )
    
    val currentSelectedModel = modelChoices.first() // Default to first model
    
    // Set context for the ViewModel
    LaunchedEffect(Unit) {
        viewModel.setContext(context)
    }
    
    val imagePickerLauncher = rememberLauncherForActivityResult(
        contract = ActivityResultContracts.GetContent()
    ) { uri: Uri? ->
        uri?.let { viewModel.updateImageUri(it) }
    }
    
    // Set status bar color
    SetStatusBarColor(StatusBarUtils.ImageGenerationStatusBarColor)
    
    Box(
        modifier = Modifier
            .fillMaxSize()
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
            // Enhanced Top Bar with Glass Morphism Background
            Box(
                modifier = Modifier
                    .fillMaxWidth()
                    .background(
                        brush = Brush.verticalGradient(
                            colors = listOf(
                                Color.Black.copy(alpha = 0.05f),
                                Color.Transparent
                            )
                        )
                    )
            ) {
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(16.dp),
                    verticalAlignment = Alignment.CenterVertically,
                    horizontalArrangement = Arrangement.SpaceBetween
                ) {
                    // App Title
                    Column {
                        Text(
                            text = "Image Transform Studio",
                            fontSize = 20.sp,
                            fontWeight = FontWeight.Bold,
                            color = TextPrimary
                        )
                        Text(
                            text = "Transform Mode",
                            fontSize = 14.sp,
                            color = TextSecondary
                        )
                    }
                    
                    // Back button (optional)
                    IconButton(
                        onClick = { /* Handle back navigation */ },
                        modifier = Modifier
                            .size(40.dp)
                            .background(
                                color = Color.White.copy(alpha = 0.1f),
                                shape = CircleShape
                            )
                    ) {
                        Icon(
                            imageVector = Icons.Outlined.ArrowBack,
                            contentDescription = "Back",
                            tint = TextPrimary,
                            modifier = Modifier.size(20.dp)
                        )
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
                // Transform Area - Glass Card with Transparency
                GlassCard(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(horizontal = 16.dp),
                    backgroundColor = Color.White.copy(alpha = 0.05f),
                    borderColor = GradientCyan.copy(alpha = 0.3f),
                    cornerRadius = 20.dp,
                    contentPadding = PaddingValues(16.dp)
                ) {
                    // Title - Transparent background
                    Row(
                        verticalAlignment = Alignment.CenterVertically,
                        horizontalArrangement = Arrangement.spacedBy(8.dp)
                    ) {
                        Icon(
                            imageVector = Icons.Outlined.Transform,
                            contentDescription = null,
                            tint = GradientCyan,
                            modifier = Modifier.size(24.dp)
                        )
                        Text(
                            text = "Transform Area",
                            fontSize = 18.sp,
                            fontWeight = FontWeight.Bold,
                            color = TextPrimary
                        )
                    }
        
                    // Image Input Selection Tabs
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.spacedBy(8.dp)
                    ) {
                        FilterChip(
                            selected = showUrlInput,
                            onClick = { showUrlInput = true },
                            label = { Text("URL") },
                            leadingIcon = {
                                Icon(
                                    Icons.Default.Link,
                                    contentDescription = null,
                                    modifier = Modifier.size(18.dp)
                                )
                            },
                            modifier = Modifier.weight(1f)
                        )
                        FilterChip(
                            selected = !showUrlInput,
                            onClick = { showUrlInput = false },
                            label = { Text("Upload") },
                            leadingIcon = {
                                Icon(
                                    Icons.Default.Image,
                                    contentDescription = null,
                                    modifier = Modifier.size(18.dp)
                                )
                            },
                            modifier = Modifier.weight(1f)
                        )
                    }
        
                    // Image Input
                    if (showUrlInput) {
                        OutlinedTextField(
                            value = uiState.imageUrl,
                            onValueChange = viewModel::updateImageUrl,
                            label = { Text("Image URL", color = TextSecondary) },
                            placeholder = { Text("Enter image URL here", color = TextSecondary.copy(alpha = 0.6f)) },
                            modifier = Modifier
                                .fillMaxWidth()
                                .border(
                                    width = 1.dp,
                                    brush = Brush.linearGradient(
                                        colors = listOf(
                                            GradientCyan.copy(alpha = 0.6f),
                                            GradientPurple.copy(alpha = 0.4f)
                                        )
                                    ),
                                    shape = RoundedCornerShape(12.dp)
                                ),
                            singleLine = true,
                            enabled = !uiState.isLoading,
                            colors = OutlinedTextFieldDefaults.colors(
                                focusedTextColor = TextPrimary,
                                unfocusedTextColor = TextPrimary,
                                cursorColor = GradientCyan,
                                focusedBorderColor = Color.Transparent,
                                unfocusedBorderColor = Color.Transparent
                            ),
                            shape = RoundedCornerShape(12.dp)
                        )
                    } else {
                        // Image Upload Section
                        Box(
                            modifier = Modifier
                                .fillMaxWidth()
                                .height(200.dp)
                                .clip(RoundedCornerShape(16.dp))
                                .border(
                                    width = 2.dp,
                                    brush = Brush.linearGradient(
                                        colors = listOf(
                                            GradientCyan.copy(alpha = 0.6f),
                                            GradientPurple.copy(alpha = 0.4f)
                                        )
                                    ),
                                    shape = RoundedCornerShape(16.dp)
                                )
                                .clickable { imagePickerLauncher.launch("image/*") },
                            contentAlignment = Alignment.Center
                        ) {
                            if (uiState.imageUri != null) {
                                AsyncImage(
                                    model = uiState.imageUri,
                                    contentDescription = "Selected Image",
                                    modifier = Modifier.fillMaxSize(),
                                    contentScale = ContentScale.Crop
                                )
                            } else {
                                Column(
                                    horizontalAlignment = Alignment.CenterHorizontally,
                                    verticalArrangement = Arrangement.spacedBy(8.dp)
                                ) {
                                    Icon(
                                        Icons.Default.Add,
                                        contentDescription = null,
                                        modifier = Modifier.size(48.dp),
                                        tint = GradientCyan
                                    )
                                    Text(
                                        "Tap to select image",
                                        color = TextPrimary,
                                        fontSize = 14.sp
                                    )
                                }
                            }
                        }
                    }
        
                    // Search and Replace Mode Toggle (only for Stability AI)
                    if (uiState.useStabilityAI) {
                        GlassSurface(
                            modifier = Modifier.fillMaxWidth(),
                            shape = RoundedCornerShape(12.dp),
                            color = Color.White.copy(alpha = 0.08f),
                            borderColor = GradientPurple.copy(alpha = 0.2f)
                        ) {
                            Row(
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .padding(16.dp),
                                horizontalArrangement = Arrangement.SpaceBetween,
                                verticalAlignment = Alignment.CenterVertically
                            ) {
                            Text(
                                text = if (uiState.isSearchAndReplaceMode) "Search & Replace Mode" else "Image-to-Image Mode",
                                color = TextPrimary,
                                fontSize = 14.sp,
                                fontWeight = FontWeight.Medium
                            )
                            Switch(
                                checked = uiState.isSearchAndReplaceMode,
                                onCheckedChange = { viewModel.toggleSearchAndReplaceMode() }
                            )
                            }
                        }
                    }
        
                    // Prompt Input
                    if (uiState.isSearchAndReplaceMode && uiState.useStabilityAI) {
                        // Search and Replace Prompts
                        OutlinedTextField(
                            value = uiState.searchPrompt,
                            onValueChange = viewModel::updateSearchPrompt,
                            label = { Text("Search for", color = TextSecondary) },
                            placeholder = { Text("What to find in the image (e.g., dog, car, person)", color = TextSecondary.copy(alpha = 0.6f)) },
                            modifier = Modifier
                                .fillMaxWidth()
                                .border(
                                    width = 1.dp,
                                    brush = Brush.linearGradient(
                                        colors = listOf(
                                            GradientPink.copy(alpha = 0.6f),
                                            GradientCyan.copy(alpha = 0.4f)
                                        )
                                    ),
                                    shape = RoundedCornerShape(12.dp)
                                ),
                            singleLine = true,
                            enabled = !uiState.isLoading,
                            colors = OutlinedTextFieldDefaults.colors(
                                focusedTextColor = TextPrimary,
                                unfocusedTextColor = TextPrimary,
                                cursorColor = GradientPink,
                                focusedBorderColor = Color.Transparent,
                                unfocusedBorderColor = Color.Transparent
                            ),
                            shape = RoundedCornerShape(12.dp)
                        )
                        
                        OutlinedTextField(
                            value = uiState.replacePrompt,
                            onValueChange = viewModel::updateReplacePrompt,
                            label = { Text("Replace with", color = TextSecondary) },
                            placeholder = { Text("What to replace it with (e.g., golden retriever, blue sports car)", color = TextSecondary.copy(alpha = 0.6f)) },
                            modifier = Modifier
                                .fillMaxWidth()
                                .border(
                                    width = 1.dp,
                                    brush = Brush.linearGradient(
                                        colors = listOf(
                                            GradientPink.copy(alpha = 0.6f),
                                            GradientCyan.copy(alpha = 0.4f)
                                        )
                                    ),
                                    shape = RoundedCornerShape(12.dp)
                                ),
                            minLines = 2,
                            maxLines = 3,
                            enabled = !uiState.isLoading,
                            colors = OutlinedTextFieldDefaults.colors(
                                focusedTextColor = TextPrimary,
                                unfocusedTextColor = TextPrimary,
                                cursorColor = GradientPink,
                                focusedBorderColor = Color.Transparent,
                                unfocusedBorderColor = Color.Transparent
                            ),
                            shape = RoundedCornerShape(12.dp)
                        )
                    } else {
                        // Regular prompt
                        OutlinedTextField(
                            value = uiState.prompt,
                            onValueChange = viewModel::updatePrompt,
                            label = { Text("Transform Prompt", color = TextSecondary) },
                            placeholder = { Text("Describe how you want to transform the image...", color = TextSecondary.copy(alpha = 0.6f)) },
                            modifier = Modifier
                                .fillMaxWidth()
                                .border(
                                    width = 2.dp,
                                    brush = Brush.linearGradient(
                                        colors = listOf(
                                            GradientCyan.copy(alpha = 0.6f),
                                            GradientPurple.copy(alpha = 0.5f),
                                            GradientPink.copy(alpha = 0.4f)
                                        )
                                    ),
                                    shape = RoundedCornerShape(12.dp)
                                ),
                            minLines = 3,
                            maxLines = 5,
                            enabled = !uiState.isLoading,
                            colors = OutlinedTextFieldDefaults.colors(
                                focusedTextColor = TextPrimary,
                                unfocusedTextColor = TextPrimary,
                                cursorColor = GradientCyan,
                                focusedBorderColor = Color.Transparent,
                                unfocusedBorderColor = Color.Transparent
                            ),
                            shape = RoundedCornerShape(12.dp)
                        )
                    }
        
                // Model Selection Card
                ImageToImageModelSelectionCard(
                    currentModel = currentSelectedModel,
                    modelChoices = modelChoices,
                    expanded = modelMenuExpanded,
                    onExpandedChange = { modelMenuExpanded = it },
                    onModelSelected = { model ->
                        // Handle model selection logic here
                        // You can add logic to update viewModel based on selected model
                        modelMenuExpanded = false
                    }
                )
        
                // Generate Button with Glass Morphism
                Button(
                    onClick = { viewModel.generateImage() },
                    enabled = !uiState.isLoading && 
                        (if (uiState.useStabilityAI) uiState.imageUri != null
                        else (uiState.imageUrl.isNotBlank() || uiState.imageUri != null)),
                        modifier = Modifier
                            .fillMaxWidth()
                            .height(56.dp)
                            .border(
                                width = 1.dp,
                                brush = Brush.linearGradient(
                                    colors = listOf(
                                        GradientCyan.copy(alpha = 0.6f),
                                        GradientPurple.copy(alpha = 0.4f),
                                        GradientPink.copy(alpha = 0.4f)
                                    )
                                ),
                                shape = RoundedCornerShape(16.dp)
                            ),
                        shape = RoundedCornerShape(16.dp),
                        colors = ButtonDefaults.buttonColors(
                            containerColor = if (!uiState.isLoading && (if (uiState.useStabilityAI) uiState.imageUri != null else (uiState.imageUrl.isNotBlank() || uiState.imageUri != null))) {
                                Color.White.copy(alpha = 0.1f)
                            } else {
                                Color.White.copy(alpha = 0.05f)
                            },
                            disabledContainerColor = Color.White.copy(alpha = 0.05f)
                        )
                    ) {
                        Row(
                            horizontalArrangement = Arrangement.Center,
                            verticalAlignment = Alignment.CenterVertically,
                            modifier = Modifier.padding(horizontal = 16.dp)
                        ) {
                            if (uiState.isLoading) {
                                CircularProgressIndicator(
                                    modifier = Modifier.size(24.dp),
                                    color = TextPrimary,
                                    strokeWidth = 2.dp
                                )
                            } else {
                                Icon(
                                    imageVector = Icons.Outlined.Transform,
                                    contentDescription = null,
                                    tint = TextPrimary,
                                    modifier = Modifier.size(24.dp)
                                )
                            }
                            Spacer(modifier = Modifier.width(8.dp))
                            Text(
                                text = when {
                                    uiState.isLoading -> "Transforming..."
                                    uiState.useStabilityAI && uiState.isSearchAndReplaceMode -> "Search & Replace"
                                    else -> "Transform Image"
                                },
                                fontSize = 18.sp,
                                fontWeight = FontWeight.Bold,
                                color = TextPrimary
                            )
                        }
                    }
                }
        
                // Loading indicator (transparent background)
                if (uiState.isLoading) {
                    Box(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(vertical = 24.dp),
                        contentAlignment = Alignment.Center
                    ) {
                        Column(
                            horizontalAlignment = Alignment.CenterHorizontally,
                            verticalArrangement = Arrangement.spacedBy(16.dp),
                            modifier = Modifier.padding(32.dp)
                        ) {
                            CircularProgressIndicator(
                                color = GradientCyan,
                                strokeWidth = 3.dp
                            )
                            Text(
                                text = if (uiState.useStabilityAI && uiState.isSearchAndReplaceMode) {
                                    "Searching and replacing..."
                                } else {
                                    "Transforming image..."
                                },
                                color = TextPrimary,
                                fontSize = 16.sp,
                                fontWeight = FontWeight.Medium
                            )
                        }
                    }
                }
        
                // Generated Image (Glass Card with Transparency)
                uiState.generatedImageUrl?.let { imageUrl ->
                    var showFullScreenImage by remember { mutableStateOf(false) }
                    
                    GlassCard(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(horizontal = 16.dp),
                        backgroundColor = Color.White.copy(alpha = 0.05f),
                        borderColor = GradientPink.copy(alpha = 0.3f),
                        cornerRadius = 20.dp,
                        contentPadding = PaddingValues(16.dp)
                    ) {
                        Text(
                            text = "Transformed Result",
                            fontSize = 18.sp,
                            fontWeight = FontWeight.Bold,
                            color = TextPrimary
                        )
                        
                        // Image with transparent background
                        AsyncImage(
                            model = imageUrl,
                            contentDescription = "Generated Image",
                            modifier = Modifier
                                .fillMaxWidth()
                                .heightIn(min = 200.dp, max = 400.dp)
                                .clip(RoundedCornerShape(16.dp))
                                .clickable { showFullScreenImage = true },
                            contentScale = ContentScale.Fit
                        )
                        
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.SpaceBetween,
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Text(
                                text = "Tap image to view full size",
                                fontSize = 12.sp,
                                color = TextSecondary
                            )
                            
                            Row(
                                horizontalArrangement = Arrangement.spacedBy(8.dp)
                            ) {
                                TextButton(
                                    onClick = { showFullScreenImage = true }
                                ) {
                                    Icon(
                                        Icons.Default.ZoomIn,
                                        contentDescription = "View Full Size",
                                        modifier = Modifier.size(16.dp),
                                        tint = GradientPink
                                    )
                                    Spacer(modifier = Modifier.width(4.dp))
                                    Text("View Full", color = GradientPink)
                                }
                                
                                TextButton(
                                    onClick = { 
                                        // TODO: Add share functionality
                                    }
                                ) {
                                    Icon(
                                        Icons.Default.Share,
                                        contentDescription = "Share",
                                        modifier = Modifier.size(16.dp),
                                        tint = GradientPink
                                    )
                                    Spacer(modifier = Modifier.width(4.dp))
                                    Text("Share", color = GradientPink)
                                }
                            }
                        }
                        
                        // Full Screen Image Dialog
                        if (showFullScreenImage) {
                            Dialog(
                                onDismissRequest = { showFullScreenImage = false },
                                properties = DialogProperties(
                                    usePlatformDefaultWidth = false,
                                    decorFitsSystemWindows = false
                                )
                            ) {
                                Box(
                                    modifier = Modifier
                                        .fillMaxSize()
                                        .background(Color.Black.copy(alpha = 0.9f))
                                        .clickable { showFullScreenImage = false }
                                ) {
                                    AsyncImage(
                                        model = imageUrl,
                                        contentDescription = "Full Size Generated Image",
                                        modifier = Modifier
                                            .fillMaxSize()
                                            .padding(16.dp),
                                        contentScale = ContentScale.Fit
                                    )
                                    
                                    // Close button
                                    IconButton(
                                        onClick = { showFullScreenImage = false },
                                        modifier = Modifier
                                            .align(Alignment.TopEnd)
                                            .padding(16.dp)
                                            .background(
                                                Color.Black.copy(alpha = 0.5f),
                                                CircleShape
                                            )
                                    ) {
                                        Icon(
                                            Icons.Default.Close,
                                            contentDescription = "Close",
                                            tint = Color.White
                                        )
                                    }
                                }
                            }
                        }
                    }
                }
                
                Spacer(modifier = Modifier.height(16.dp))

                // Provider Switch (Glass Card)
                GlassCard(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(horizontal = 16.dp),
                    backgroundColor = Color.White.copy(alpha = 0.05f),
                    borderColor = GradientPurple.copy(alpha = 0.3f),
                    cornerRadius = 16.dp,
                    contentPadding = PaddingValues(16.dp)
                ) {
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.SpaceBetween,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Text(
                            text = if (uiState.useStabilityAI) "Using: Stability AI" else "Using: ModelsLab",
                            color = TextPrimary,
                            fontSize = 16.sp,
                            fontWeight = FontWeight.Medium
                        )
                        Switch(
                            checked = uiState.useStabilityAI,
                            onCheckedChange = { viewModel.toggleProvider() }
                        )
                    }
                    
                    Text(
                        text = if (uiState.useStabilityAI)
                            "Stability AI: image upload only, higher quality"
                        else
                            "ModelsLab: URL/upload support, faster processing",
                        color = TextSecondary,
                        fontSize = 12.sp,
                        modifier = Modifier.padding(top = 8.dp)
                    )
                }
        
                // Error Message (Transparent with gradient border)
                uiState.errorMessage?.let { error ->
                    Box(
                        modifier = Modifier
                            .fillMaxWidth()
                            .clip(RoundedCornerShape(16.dp))
                            .border(
                                width = 1.dp,
                                color = Color(0xFFDC2626),
                                shape = RoundedCornerShape(16.dp)
                            )
                            .background(Color(0xFFDC2626).copy(alpha = 0.1f))
                            .padding(16.dp)
                    ) {
                        Text(
                            text = error,
                            color = Color(0xFFDC2626),
                            textAlign = TextAlign.Center,
                            fontSize = 14.sp,
                            fontWeight = FontWeight.Medium
                        )
                    }
                }
            }
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun ImageToImageModelSelectionCard(
    currentModel: ImageToImageModelChoice,
    modelChoices: List<ImageToImageModelChoice>,
    expanded: Boolean,
    onExpandedChange: (Boolean) -> Unit,
    onModelSelected: (ImageToImageModelChoice) -> Unit
) {
    // Animation states
    val rotationAngle by animateFloatAsState(
        targetValue = if (expanded) 180f else 0f,
        animationSpec = tween(300, easing = FastOutSlowInEasing),
        label = "dropdown_rotation"
    )
    
    val borderAlpha by animateFloatAsState(
        targetValue = if (expanded) 0.8f else 0.3f,
        animationSpec = tween(300),
        label = "border_alpha"
    )
    
    // Premium Glass Card for Model Selection
    GlassCard(
        modifier = Modifier
            .fillMaxWidth()
            .animateContentSize(
                animationSpec = spring(
                    dampingRatio = Spring.DampingRatioMediumBouncy,
                    stiffness = Spring.StiffnessLow
                )
            ),
        backgroundColor = Color.White.copy(alpha = 0.05f),
        borderColor = GradientCyan.copy(alpha = 0.3f),
        cornerRadius = 20.dp,
        contentPadding = PaddingValues(20.dp)
    ) {
        Column(
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            // Header with icon and label
            Row(
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                // Animated AI Icon
                Box(
                    modifier = Modifier
                        .size(32.dp)
                        .clip(CircleShape)
                        .background(
                            Brush.linearGradient(
                                colors = listOf(
                                    GradientCyan.copy(alpha = 0.2f),
                                    GradientPurple.copy(alpha = 0.2f)
                                )
                            )
                        ),
                    contentAlignment = Alignment.Center
                ) {
                    Icon(
                        imageVector = Icons.Outlined.Transform,
                        contentDescription = null,
                        tint = GradientCyan,
                        modifier = Modifier.size(20.dp)
                    )
                }
                
                Column {
                    Text(
                        text = "Transform Engine",
                        color = TextSecondary,
                        fontSize = 12.sp,
                        fontWeight = FontWeight.Medium
                    )
                    Text(
                        text = "Select AI transformation model",
                        color = TextSecondary.copy(alpha = 0.6f),
                        fontSize = 10.sp
                    )
                }
            }
            
            // Enhanced Dropdown Button
            Surface(
                modifier = Modifier
                    .fillMaxWidth()
                    .height(56.dp)
                    .border(
                        width = 1.dp,
                        brush = Brush.linearGradient(
                            colors = listOf(
                                GradientCyan.copy(alpha = borderAlpha),
                                GradientPurple.copy(alpha = borderAlpha),
                                GradientPink.copy(alpha = borderAlpha * 0.8f)
                            )
                        ),
                        shape = RoundedCornerShape(16.dp)
                    ),
                shape = RoundedCornerShape(16.dp),
                color = Color(0xFF1A1F3A).copy(alpha = 0.5f),
                onClick = { onExpandedChange(!expanded) }
            ) {
                Row(
                    modifier = Modifier
                        .fillMaxSize()
                        .padding(horizontal = 16.dp),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Row(
                        verticalAlignment = Alignment.CenterVertically,
                        horizontalArrangement = Arrangement.spacedBy(12.dp),
                        modifier = Modifier.weight(1f)
                    ) {
                        // Model Icon with Gradient Background
                        Box(
                            modifier = Modifier
                                .size(36.dp)
                                .clip(RoundedCornerShape(10.dp))
                                .background(
                                    Brush.linearGradient(
                                        colors = when (currentModel.apiType) {
                                            "stability" -> listOf(
                                                Color(0xFF6366F1).copy(alpha = 0.2f),
                                                Color(0xFF8B5CF6).copy(alpha = 0.2f)
                                            )
                                            "modelslab" -> listOf(
                                                Color(0xFF06B6D4).copy(alpha = 0.2f),
                                                Color(0xFF0EA5E9).copy(alpha = 0.2f)
                                            )
                                            else -> listOf(
                                                GradientPurple.copy(alpha = 0.2f),
                                                GradientCyan.copy(alpha = 0.2f)
                                            )
                                        }
                                    )
                                ),
                            contentAlignment = Alignment.Center
                        ) {
                            Icon(
                                imageVector = when (currentModel.apiType) {
                                    "stability" -> Icons.Outlined.AutoAwesome
                                    "modelslab" -> Icons.Outlined.Transform
                                    else -> Icons.Outlined.Psychology
                                },
                                contentDescription = null,
                                tint = when (currentModel.apiType) {
                                    "stability" -> Color(0xFF6366F1)
                                    "modelslab" -> Color(0xFF06B6D4)
                                    else -> GradientPurple
                                },
                                modifier = Modifier.size(20.dp)
                            )
                        }
                        
                        Column(
                            modifier = Modifier.weight(1f)
                        ) {
                            Text(
                                text = currentModel.displayName,
                                color = TextPrimary,
                                fontSize = 15.sp,
                                fontWeight = FontWeight.SemiBold
                            )
                            // Model Type Badge
                            Text(
                                text = when (currentModel.apiType) {
                                    "stability" -> "Stability AI • High Quality"
                                    "modelslab" -> "ModelsLab • Fast Processing"
                                    else -> "Standard • Balanced"
                                },
                                color = when (currentModel.apiType) {
                                    "stability" -> GradientPurple.copy(alpha = 0.9f)
                                    "modelslab" -> GradientCyan.copy(alpha = 0.9f)
                                    else -> TextSecondary.copy(alpha = 0.7f)
                                },
                                fontSize = 11.sp,
                                fontWeight = FontWeight.Normal
                            )
                        }
                    }
                    
                    // Animated Arrow Icon
                    Icon(
                        imageVector = Icons.Default.KeyboardArrowDown,
                        contentDescription = null,
                        tint = GradientCyan,
                        modifier = Modifier
                            .size(24.dp)
                            .graphicsLayer {
                                rotationZ = rotationAngle
                            }
                    )
                }
            }
            
            // Enhanced Dropdown Menu
            AnimatedVisibility(
                visible = expanded,
                enter = expandVertically(
                    animationSpec = spring(
                        dampingRatio = Spring.DampingRatioLowBouncy,
                        stiffness = Spring.StiffnessLow
                    )
                ) + fadeIn(),
                exit = shrinkVertically() + fadeOut()
            ) {
                Column(
                    modifier = Modifier
                        .fillMaxWidth()
                        .clip(RoundedCornerShape(16.dp))
                        .background(
                            Brush.verticalGradient(
                                colors = listOf(
                                    Color(0xFF1A1F3A).copy(alpha = 0.95f),
                                    Color(0xFF0F172A).copy(alpha = 0.98f)
                                )
                            )
                        )
                        .border(
                            width = 1.dp,
                            brush = Brush.linearGradient(
                                colors = listOf(
                                    GradientCyan.copy(alpha = 0.3f),
                                    GradientPurple.copy(alpha = 0.2f)
                                )
                            ),
                            shape = RoundedCornerShape(16.dp)
                        ),
                    verticalArrangement = Arrangement.spacedBy(2.dp)
                ) {
                    modelChoices.forEachIndexed { index, model ->
                        val isSelected = model == currentModel
                        
                        Surface(
                            modifier = Modifier
                                .fillMaxWidth()
                                .padding(
                                    horizontal = 8.dp,
                                    vertical = if (index == 0) 8.dp else 2.dp
                                )
                                .animateContentSize(),
                            color = if (isSelected) {
                                GradientPurple.copy(alpha = 0.1f)
                            } else {
                                Color.Transparent
                            },
                            shape = RoundedCornerShape(12.dp),
                            onClick = {
                                onModelSelected(model)
                                onExpandedChange(false)
                            }
                        ) {
                            Row(
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .padding(12.dp),
                                verticalAlignment = Alignment.CenterVertically,
                                horizontalArrangement = Arrangement.spacedBy(12.dp)
                            ) {
                                // Selection Indicator with Animation
                                Box(
                                    modifier = Modifier.size(20.dp),
                                    contentAlignment = Alignment.Center
                                ) {
                                    if (isSelected) {
                                        Icon(
                                            imageVector = Icons.Default.CheckCircle,
                                            contentDescription = null,
                                            tint = GradientPurple,
                                            modifier = Modifier.size(20.dp)
                                        )
                                    } else {
                                        Box(
                                            modifier = Modifier
                                                .size(20.dp)
                                                .border(
                                                    width = 2.dp,
                                                    color = TextSecondary.copy(alpha = 0.3f),
                                                    shape = CircleShape
                                                )
                                        )
                                    }
                                }
                                
                                // Model Icon
                                Box(
                                    modifier = Modifier
                                        .size(40.dp)
                                        .clip(RoundedCornerShape(10.dp))
                                        .background(
                                            if (isSelected) {
                                                Brush.linearGradient(
                                                    colors = listOf(
                                                        GradientPurple.copy(alpha = 0.2f),
                                                        GradientCyan.copy(alpha = 0.2f)
                                                    )
                                                )
                                            } else {
                                                Brush.linearGradient(
                                                    colors = listOf(
                                                        Color.White.copy(alpha = 0.05f),
                                                        Color.White.copy(alpha = 0.02f)
                                                    )
                                                )
                                            }
                                        ),
                                    contentAlignment = Alignment.Center
                                ) {
                                    Icon(
                                        imageVector = when (model.apiType) {
                                            "stability" -> Icons.Outlined.AutoAwesome
                                            "modelslab" -> Icons.Outlined.Transform
                                            else -> Icons.Outlined.Psychology
                                        },
                                        contentDescription = null,
                                        tint = if (isSelected) {
                                            GradientPurple
                                        } else {
                                            TextSecondary.copy(alpha = 0.7f)
                                        },
                                        modifier = Modifier.size(22.dp)
                                    )
                                }
                                
                                // Model Info
                                Column(
                                    modifier = Modifier.weight(1f),
                                    verticalArrangement = Arrangement.spacedBy(2.dp)
                                ) {
                                    Text(
                                        text = model.displayName,
                                        color = if (isSelected) TextPrimary else TextPrimary.copy(alpha = 0.9f),
                                        fontSize = 14.sp,
                                        fontWeight = if (isSelected) FontWeight.SemiBold else FontWeight.Medium
                                    )
                                    
                                    // Model Features/Tags
                                    Row(
                                        horizontalArrangement = Arrangement.spacedBy(6.dp),
                                        verticalAlignment = Alignment.CenterVertically
                                    ) {
                                        // Quality Badge
                                        val (badgeText, badgeColor) = when (model.apiType) {
                                            "stability" -> "Premium" to GradientPurple
                                            "modelslab" -> "Standard" to GradientCyan
                                            else -> "Basic" to TextSecondary
                                        }
                                        
                                        Surface(
                                            shape = RoundedCornerShape(4.dp),
                                            color = badgeColor.copy(alpha = 0.15f)
                                        ) {
                                            Text(
                                                text = badgeText,
                                                color = badgeColor,
                                                fontSize = 10.sp,
                                                fontWeight = FontWeight.Bold,
                                                modifier = Modifier.padding(horizontal = 6.dp, vertical = 2.dp)
                                            )
                                        }
                                        
                                        // Performance indicator for premium models
                                        if (model.displayName.contains("Ultra") || model.displayName.contains("Pro")) {
                                            Row(
                                                verticalAlignment = Alignment.CenterVertically,
                                                horizontalArrangement = Arrangement.spacedBy(2.dp)
                                            ) {
                                                Icon(
                                                    imageVector = Icons.Outlined.Bolt,
                                                    contentDescription = null,
                                                    tint = Color(0xFFF59E0B),
                                                    modifier = Modifier.size(12.dp)
                                                )
                                                Text(
                                                    text = "Enhanced",
                                                    color = Color(0xFFF59E0B),
                                                    fontSize = 10.sp
                                                )
                                            }
                                        }
                                    }
                                }
                                
                                // Status indicator (if selected)
                                if (isSelected) {
                                    Box(
                                        modifier = Modifier
                                            .size(8.dp)
                                            .clip(CircleShape)
                                            .background(GradientGreen)
                                    )
                                }
                            }
                        }
                        
                        // Add divider except for last item
                        if (index < modelChoices.size - 1) {
                            Divider(
                                color = Color.White.copy(alpha = 0.05f),
                                thickness = 0.5.dp,
                                modifier = Modifier.padding(horizontal = 8.dp)
                            )
                        }
                    }
                    
                    // Bottom padding
                    Spacer(modifier = Modifier.height(8.dp))
                }
            }
        }
    }
}
