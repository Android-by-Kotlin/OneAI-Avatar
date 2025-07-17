package max.ohm.oneai.stabilityai.ui

import android.net.Uri
import androidx.activity.compose.rememberLauncherForActivityResult
import androidx.activity.result.contract.ActivityResultContracts
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
import androidx.compose.material.icons.filled.Share
import androidx.compose.material.icons.filled.ZoomIn
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.window.Dialog
import androidx.compose.ui.window.DialogProperties
import androidx.lifecycle.viewmodel.compose.viewModel
import coil.compose.AsyncImage
import max.ohm.oneai.stabilityai.viewmodel.StabilityImageToImageViewModel

@Composable
fun StabilityImageToImageScreen(
    viewModel: StabilityImageToImageViewModel = viewModel()
) {
    val context = LocalContext.current
    val uiState by viewModel.uiState.collectAsState()
    
    // Set context for the ViewModel
    LaunchedEffect(Unit) {
        viewModel.setContext(context)
    }
    
    val imagePickerLauncher = rememberLauncherForActivityResult(
        contract = ActivityResultContracts.GetContent()
    ) { uri: Uri? ->
        uri?.let { viewModel.updateImageUri(it) }
    }
    
    Surface(
        modifier = Modifier.fillMaxSize(),
        color = MaterialTheme.colorScheme.background
    ) {
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(16.dp)
                .verticalScroll(rememberScrollState()),
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            // Title
            Text(
                text = "Stability AI Image-to-Image",
                style = MaterialTheme.typography.headlineMedium,
                modifier = Modifier.padding(vertical = 8.dp)
            )
            
            // Mode Toggle
            Card(
                modifier = Modifier.fillMaxWidth(),
                colors = CardDefaults.cardColors(
                    containerColor = MaterialTheme.colorScheme.secondaryContainer
                )
            ) {
                Column(
                    modifier = Modifier.padding(16.dp)
                ) {
                    Text(
                        text = "Mode Selection",
                        style = MaterialTheme.typography.titleMedium,
                        modifier = Modifier.padding(bottom = 8.dp)
                    )
                    
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.SpaceBetween,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Text(
                            text = if (uiState.isSearchAndReplaceMode) "Search & Replace" else "Image-to-Image",
                            style = MaterialTheme.typography.bodyLarge,
                            fontWeight = FontWeight.Bold
                        )
                        Switch(
                            checked = uiState.isSearchAndReplaceMode,
                            onCheckedChange = { viewModel.toggleSearchAndReplaceMode() }
                        )
                    }
                    
                    Text(
                        text = if (uiState.isSearchAndReplaceMode) {
                            "Search for objects in the image and replace them with new content"
                        } else {
                            "Transform the entire image based on a prompt"
                        },
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant,
                        modifier = Modifier.padding(top = 4.dp)
                    )
                }
            }
            
            // Info Card
            Card(
                modifier = Modifier.fillMaxWidth(),
                colors = CardDefaults.cardColors(
                    containerColor = MaterialTheme.colorScheme.primaryContainer
                )
            ) {
                Text(
                    text = "Upload an image and provide a prompt to transform it using Stability AI's advanced image-to-image model.",
                    style = MaterialTheme.typography.bodyMedium,
                    color = MaterialTheme.colorScheme.onPrimaryContainer,
                    modifier = Modifier.padding(16.dp),
                    textAlign = TextAlign.Center
                )
            }
            
            // Image Upload Section
            Box(
                modifier = Modifier
                    .fillMaxWidth()
                    .height(250.dp)
                    .clip(RoundedCornerShape(12.dp))
                    .border(
                        width = 2.dp,
                        color = if (uiState.imageUri != null) MaterialTheme.colorScheme.primary 
                                else MaterialTheme.colorScheme.outline,
                        shape = RoundedCornerShape(12.dp)
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
                        verticalArrangement = Arrangement.spacedBy(12.dp)
                    ) {
                        Icon(
                            Icons.Default.Add,
                            contentDescription = null,
                            modifier = Modifier.size(64.dp),
                            tint = MaterialTheme.colorScheme.primary
                        )
                        Text(
                            "Tap to select image",
                            style = MaterialTheme.typography.bodyLarge,
                            color = MaterialTheme.colorScheme.primary
                        )
                        Text(
                            "Supports JPG, PNG formats",
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                }
            }
            
            // Prompt Input Section
            Card(
                modifier = Modifier.fillMaxWidth(),
                colors = CardDefaults.cardColors(
                    containerColor = MaterialTheme.colorScheme.surfaceVariant
                )
            ) {
                Column(
                    modifier = Modifier.padding(16.dp)
                ) {
                    Text(
                        text = if (uiState.isSearchAndReplaceMode) "Search & Replace Prompts" else "Transformation Prompt",
                        style = MaterialTheme.typography.titleMedium,
                        modifier = Modifier.padding(bottom = 16.dp)
                    )
                    
                    if (uiState.isSearchAndReplaceMode) {
                        // Search Prompt Field
                        OutlinedTextField(
                            value = uiState.searchPrompt,
                            onValueChange = viewModel::updateSearchPrompt,
                            label = { Text("Search for (what to replace)") },
                            placeholder = { Text("e.g., dog, cat, car, person") },
                            modifier = Modifier.fillMaxWidth(),
                            maxLines = 2,
                            enabled = !uiState.isLoading
                        )
                        
                        Spacer(modifier = Modifier.height(12.dp))
                        
                        // Replace Prompt Field
                        OutlinedTextField(
                            value = uiState.prompt,
                            onValueChange = viewModel::updatePrompt,
                            label = { Text("Replace with (new content)") },
                            placeholder = { Text("e.g., golden retriever, blue sports car") },
                            modifier = Modifier.fillMaxWidth(),
                            minLines = 2,
                            maxLines = 4,
                            enabled = !uiState.isLoading
                        )
                        
                        // Output Format Selection
                        Spacer(modifier = Modifier.height(12.dp))
                        Text(
                            text = "Output Format",
                            style = MaterialTheme.typography.bodyMedium,
                            modifier = Modifier.padding(bottom = 4.dp)
                        )
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.spacedBy(8.dp)
                        ) {
                            FilterChip(
                                onClick = { viewModel.updateOutputFormat("webp") },
                                label = { Text("WebP") },
                                selected = uiState.outputFormat == "webp"
                            )
                            FilterChip(
                                onClick = { viewModel.updateOutputFormat("png") },
                                label = { Text("PNG") },
                                selected = uiState.outputFormat == "png"
                            )
                        }
                    } else {
                        // Regular transformation prompt
                        OutlinedTextField(
                            value = uiState.prompt,
                            onValueChange = viewModel::updatePrompt,
                            label = { Text("Transformation Prompt") },
                            placeholder = { Text("Describe how you want to transform the image") },
                            modifier = Modifier.fillMaxWidth(),
                            minLines = 3,
                            maxLines = 6,
                            enabled = !uiState.isLoading
                        )
                    }
                }
            }
            
            // Advanced Settings (Optional)
            var showAdvanced by remember { mutableStateOf(false) }
            
            TextButton(
                onClick = { showAdvanced = !showAdvanced }
            ) {
                Text(if (showAdvanced) "Hide Advanced Settings" else "Show Advanced Settings")
            }
            
            if (showAdvanced) {
                Card(
                    modifier = Modifier.fillMaxWidth(),
                    colors = CardDefaults.cardColors(
                        containerColor = MaterialTheme.colorScheme.surfaceVariant
                    )
                ) {
                    Column(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(16.dp),
                        verticalArrangement = Arrangement.spacedBy(8.dp)
                    ) {
                        Text(
                            "Advanced Settings",
                            style = MaterialTheme.typography.titleMedium
                        )
                        
                        // Image Strength Slider
                        Text("Image Strength: ${uiState.imageStrength}")
                        Slider(
                            value = uiState.imageStrength,
                            onValueChange = viewModel::updateImageStrength,
                            valueRange = 0.1f..1.0f,
                            steps = 18
                        )
                        
                        // Steps
                        Text("Steps: ${uiState.steps}")
                        Slider(
                            value = uiState.steps.toFloat(),
                            onValueChange = { viewModel.updateSteps(it.toInt()) },
                            valueRange = 10f..50f,
                            steps = 8
                        )
                        
                        // CFG Scale
                        Text("CFG Scale: ${uiState.cfgScale}")
                        Slider(
                            value = uiState.cfgScale.toFloat(),
                            onValueChange = { viewModel.updateCfgScale(it.toInt()) },
                            valueRange = 1f..20f,
                            steps = 19
                        )
                    }
                }
            }
            
            // Generate Button
            Button(
                onClick = { viewModel.generateImage() },
                modifier = Modifier
                    .fillMaxWidth()
                    .height(56.dp),
                enabled = !uiState.isLoading && uiState.imageUri != null,
                shape = RoundedCornerShape(12.dp)
            ) {
                if (uiState.isLoading) {
                    CircularProgressIndicator(
                        modifier = Modifier.size(24.dp),
                        color = MaterialTheme.colorScheme.onPrimary,
                        strokeWidth = 2.dp
                    )
                } else {
                    Text(
                        text = if (uiState.isSearchAndReplaceMode) {
                            "Search & Replace with Stability AI"
                        } else {
                            "Transform Image with Stability AI"
                        },
                        style = MaterialTheme.typography.labelLarge
                    )
                }
            }
            
            // Loading indicators
            if (uiState.isLoading) {
                Card(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(vertical = 24.dp),
                    colors = CardDefaults.cardColors(
                        containerColor = MaterialTheme.colorScheme.surfaceVariant
                    )
                ) {
                    Box(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(32.dp),
                        contentAlignment = Alignment.Center
                    ) {
                        Column(
                            horizontalAlignment = Alignment.CenterHorizontally,
                            verticalArrangement = Arrangement.spacedBy(16.dp)
                        ) {
                            CircularProgressIndicator()
                            Text(
                                text = if (uiState.isSearchAndReplaceMode) {
                                    "Searching and replacing with Stability AI..."
                                } else {
                                    "Transforming image with Stability AI..."
                                },
                                style = MaterialTheme.typography.bodyMedium
                            )
                            Text(
                                text = "This may take 30-60 seconds",
                                style = MaterialTheme.typography.bodySmall,
                                color = MaterialTheme.colorScheme.onSurfaceVariant
                            )
                        }
                    }
                }
            }
            
            // Generated Image - Use comparison view
            uiState.generatedImageUrl?.let { imageUrl ->
                ImageComparisonView(
                    originalImageUri = uiState.imageUri,
                    generatedImageUrl = imageUrl,
                    onShareClick = {
                        // TODO: Implement share functionality
                    }
                )
            }
            
            // Error Message
            uiState.errorMessage?.let { error ->
                Card(
                    modifier = Modifier.fillMaxWidth(),
                    colors = CardDefaults.cardColors(
                        containerColor = MaterialTheme.colorScheme.errorContainer
                    )
                ) {
                    Text(
                        text = error,
                        color = MaterialTheme.colorScheme.onErrorContainer,
                        textAlign = TextAlign.Center,
                        modifier = Modifier.padding(16.dp),
                        style = MaterialTheme.typography.bodyMedium
                    )
                }
            }
        }
    }
}
