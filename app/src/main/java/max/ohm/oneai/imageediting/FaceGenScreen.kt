package max.ohm.oneai.imageediting

import androidx.compose.animation.core.*
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.draw.blur
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.lifecycle.viewmodel.compose.viewModel
import coil.compose.AsyncImage
import coil.request.ImageRequest
import max.ohm.oneai.ui.theme.*

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun FaceGenScreen(
    faceGenViewModel: FaceGenViewModel = viewModel()
) {
    val uiState by faceGenViewModel.uiState.collectAsState()
    var showAdvancedOptions by remember { mutableStateOf(false) }
    
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
            modifier = Modifier
                .fillMaxSize()
                .padding(16.dp)
                .verticalScroll(rememberScrollState())
        ) {
            // Header
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(bottom = 24.dp),
                verticalAlignment = Alignment.CenterVertically
            ) {
                Icon(
                    imageVector = Icons.Default.Face,
                    contentDescription = "Face Gen",
                    tint = AccentPurple,
                    modifier = Modifier.size(32.dp)
                )
                Spacer(modifier = Modifier.width(12.dp))
                Text(
                    text = "Face Generation",
                    fontSize = 28.sp,
                    fontWeight = FontWeight.Bold,
                    color = TextPrimary
                )
            }
            
            // Description Card
            Card(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(bottom = 16.dp),
                colors = CardDefaults.cardColors(
                    containerColor = GlassBackground
                ),
                shape = RoundedCornerShape(12.dp)
            ) {
                Column(
                    modifier = Modifier.padding(16.dp)
                ) {
                    Text(
                        text = "Generate AI images with custom faces",
                        color = TextPrimary,
                        fontSize = 16.sp,
                        fontWeight = FontWeight.Medium
                    )
                    Spacer(modifier = Modifier.height(4.dp))
                    Text(
                        text = "Upload a face image and describe your vision to create unique AI-generated images",
                        color = TextSecondary,
                        fontSize = 14.sp
                    )
                }
            }
            
            // Face Image URL Input
            OutlinedTextField(
                value = uiState.faceImageUrl,
                onValueChange = { faceGenViewModel.updateFaceImageUrl(it) },
                label = { Text("Face Image URL") },
                placeholder = { Text("https://example.com/face.jpg") },
                modifier = Modifier.fillMaxWidth(),
                colors = OutlinedTextFieldDefaults.colors(
                    focusedBorderColor = Color.Transparent,
                    unfocusedBorderColor = Color.Transparent,
                    focusedLabelColor = Color(0xFF6200EE),
                    unfocusedLabelColor = Color.White.copy(alpha = 0.7f),
                    focusedTextColor = Color.White,
                    unfocusedTextColor = Color.White
                ),
                leadingIcon = {
                    Icon(
                        imageVector = Icons.Default.Image,
                        contentDescription = "Face Image",
                        tint = Color(0xFF6200EE)
                    )
                },
                singleLine = true
            )
            
            Spacer(modifier = Modifier.height(16.dp))
            
            // Prompt Input
            OutlinedTextField(
                value = uiState.prompt,
                onValueChange = { faceGenViewModel.updatePrompt(it) },
                label = { Text("Prompt") },
                placeholder = { Text("Describe the image you want to generate") },
                modifier = Modifier.fillMaxWidth(),
                colors = OutlinedTextFieldDefaults.colors(
                    focusedBorderColor = Color.Transparent,
                    unfocusedBorderColor = Color.Transparent,
                    focusedLabelColor = Color(0xFF6200EE),
                    unfocusedLabelColor = Color.White.copy(alpha = 0.7f),
                    focusedTextColor = Color.White,
                    unfocusedTextColor = Color.White
                ),
                minLines = 3,
                maxLines = 5
            )
            
            Spacer(modifier = Modifier.height(16.dp))
            
            // Advanced Options Toggle
            Card(
                modifier = Modifier
                    .fillMaxWidth()
                    .clickable { showAdvancedOptions = !showAdvancedOptions },
                colors = CardDefaults.cardColors(
                    containerColor = Color(0xFF2A2A2A)
                ),
                shape = RoundedCornerShape(8.dp)
            ) {
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(16.dp),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text(
                        text = "Advanced Options",
                        color = Color.White,
                        fontSize = 16.sp,
                        fontWeight = FontWeight.Medium
                    )
                    Icon(
                        imageVector = if (showAdvancedOptions) Icons.Default.ExpandLess else Icons.Default.ExpandMore,
                        contentDescription = "Toggle Advanced Options",
                        tint = Color.White.copy(alpha = 0.7f)
                    )
                }
            }
            
            // Advanced Options
            if (showAdvancedOptions) {
                Spacer(modifier = Modifier.height(16.dp))
                
                Card(
                    modifier = Modifier.fillMaxWidth(),
                    colors = CardDefaults.cardColors(
                        containerColor = Color(0xFF2A2A2A)
                    ),
                    shape = RoundedCornerShape(12.dp)
                ) {
                    Column(
                        modifier = Modifier.padding(16.dp)
                    ) {
                        // Negative Prompt
                        OutlinedTextField(
                            value = uiState.negativePrompt,
                            onValueChange = { faceGenViewModel.updateNegativePrompt(it) },
                            label = { Text("Negative Prompt") },
                            modifier = Modifier.fillMaxWidth(),
                            colors = OutlinedTextFieldDefaults.colors(
                                focusedBorderColor = Color.Transparent,
                                unfocusedBorderColor = Color.Transparent,
                                focusedLabelColor = Color(0xFF6200EE),
                                unfocusedLabelColor = Color.White.copy(alpha = 0.7f),
                                focusedTextColor = Color.White,
                                unfocusedTextColor = Color.White
                            ),
                            minLines = 2,
                            maxLines = 3
                        )
                        
                        Spacer(modifier = Modifier.height(12.dp))
                        
                        // Image Dimensions
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.spacedBy(12.dp)
                        ) {
                            OutlinedTextField(
                                value = uiState.width,
                                onValueChange = { faceGenViewModel.updateWidth(it) },
                                label = { Text("Width") },
                                modifier = Modifier.weight(1f),
                                colors = OutlinedTextFieldDefaults.colors(
                                    focusedBorderColor = Color.Transparent,
                                    unfocusedBorderColor = Color.Transparent,
                                    focusedLabelColor = Color(0xFF6200EE),
                                    unfocusedLabelColor = Color.White.copy(alpha = 0.7f),
                                    focusedTextColor = Color.White,
                                    unfocusedTextColor = Color.White
                                ),
                                keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.Number),
                                singleLine = true
                            )
                            
                            OutlinedTextField(
                                value = uiState.height,
                                onValueChange = { faceGenViewModel.updateHeight(it) },
                                label = { Text("Height") },
                                modifier = Modifier.weight(1f),
                                colors = OutlinedTextFieldDefaults.colors(
                                    focusedBorderColor = Color.Transparent,
                                    unfocusedBorderColor = Color.Transparent,
                                    focusedLabelColor = Color(0xFF6200EE),
                                    unfocusedLabelColor = Color.White.copy(alpha = 0.7f),
                                    focusedTextColor = Color.White,
                                    unfocusedTextColor = Color.White
                                ),
                                keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.Number),
                                singleLine = true
                            )
                        }
                        
                        Spacer(modifier = Modifier.height(12.dp))
                        
                        // Guidance Scale
                        Column {
                            Text(
                                text = "Guidance Scale: ${String.format("%.1f", uiState.guidanceScale)}",
                                color = Color.White,
                                fontSize = 14.sp
                            )
                            Slider(
                                value = uiState.guidanceScale.toFloat(),
                                onValueChange = { faceGenViewModel.updateGuidanceScale(it.toDouble()) },
                                valueRange = 1f..20f,
                                modifier = Modifier.fillMaxWidth(),
                                colors = SliderDefaults.colors(
                                    thumbColor = Color(0xFF6200EE),
                                    activeTrackColor = Color(0xFF6200EE),
                                    inactiveTrackColor = Color(0xFF444444)
                                )
                            )
                        }
                        
                        Spacer(modifier = Modifier.height(12.dp))
                        
                        // Inference Steps
                        OutlinedTextField(
                            value = uiState.numInferenceSteps,
                            onValueChange = { faceGenViewModel.updateNumInferenceSteps(it) },
                            label = { Text("Inference Steps") },
                            modifier = Modifier.fillMaxWidth(),
                            colors = OutlinedTextFieldDefaults.colors(
                                focusedBorderColor = Color.Transparent,
                                unfocusedBorderColor = Color.Transparent,
                                focusedLabelColor = Color(0xFF6200EE),
                                unfocusedLabelColor = Color.White.copy(alpha = 0.7f),
                                focusedTextColor = Color.White,
                                unfocusedTextColor = Color.White
                            ),
                            keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.Number),
                            singleLine = true
                        )
                    }
                }
            }
            
            Spacer(modifier = Modifier.height(24.dp))
            
            // Generate Button
            Button(
                onClick = { faceGenViewModel.generateFaceImage() },
                modifier = Modifier
                    .fillMaxWidth()
                    .height(56.dp),
                enabled = !uiState.isLoading,
                shape = RoundedCornerShape(12.dp),
                colors = ButtonDefaults.buttonColors(
                    containerColor = Color(0xFF6200EE)
                )
            ) {
                if (uiState.isLoading) {
                    CircularProgressIndicator(
                        modifier = Modifier.size(24.dp),
                        color = Color.White
                    )
                } else {
                    Icon(
                        imageVector = Icons.Default.AutoAwesome,
                        contentDescription = "Generate",
                        modifier = Modifier.size(24.dp)
                    )
                    Spacer(modifier = Modifier.width(8.dp))
                    Text(
                        text = "Generate Face Image",
                        fontSize = 16.sp,
                        fontWeight = FontWeight.Bold
                    )
                }
            }
            
            // Status/Error Message
            uiState.error?.let { message ->
                Spacer(modifier = Modifier.height(16.dp))
                val isProcessing = message.contains("Processing") || message.contains("processing")
                Card(
                    modifier = Modifier.fillMaxWidth(),
                    colors = CardDefaults.cardColors(
                        containerColor = if (isProcessing) Color(0xFF224422) else Color(0xFF442222)
                    ),
                    shape = RoundedCornerShape(8.dp)
                ) {
                    Row(
                        modifier = Modifier.padding(16.dp),
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        if (isProcessing) {
                            CircularProgressIndicator(
                                modifier = Modifier.size(24.dp),
                                color = Color(0xFF4CAF50),
                                strokeWidth = 2.dp
                            )
                        } else {
                            Icon(
                                imageVector = Icons.Default.Error,
                                contentDescription = "Error",
                                tint = Color(0xFFFF6B6B),
                                modifier = Modifier.size(24.dp)
                            )
                        }
                        Spacer(modifier = Modifier.width(12.dp))
                        Text(
                            text = message,
                            color = Color.White,
                            fontSize = 14.sp
                        )
                    }
                }
            }
            
            // Generated Image
            uiState.generatedImageUrl?.let { imageUrl ->
                Spacer(modifier = Modifier.height(24.dp))
                
                Card(
                    modifier = Modifier.fillMaxWidth(),
                    colors = CardDefaults.cardColors(
                        containerColor = Color(0xFF2A2A2A)
                    ),
                    shape = RoundedCornerShape(12.dp)
                ) {
                    Column(
                        modifier = Modifier.padding(16.dp)
                    ) {
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.SpaceBetween,
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Text(
                                text = "Generated Image",
                                color = Color.White,
                                fontSize = 18.sp,
                                fontWeight = FontWeight.Bold
                            )
                            
                            IconButton(
                                onClick = { faceGenViewModel.clearGeneratedImage() }
                            ) {
                                Icon(
                                    imageVector = Icons.Default.Close,
                                    contentDescription = "Clear",
                                    tint = Color.White.copy(alpha = 0.7f)
                                )
                            }
                        }
                        
                        Spacer(modifier = Modifier.height(12.dp))
                        
                        AsyncImage(
                            model = ImageRequest.Builder(LocalContext.current)
                                .data(imageUrl)
                                .crossfade(true)
                                .build(),
                            contentDescription = "Generated Face Image",
                            modifier = Modifier
                                .fillMaxWidth()
                                .aspectRatio(1f)
                                .clip(RoundedCornerShape(8.dp)),
                            contentScale = ContentScale.Crop
                        )
                        
                        Spacer(modifier = Modifier.height(12.dp))
                        
                        // Download/Share buttons could be added here
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.End
                        ) {
                            TextButton(
                                onClick = { /* TODO: Implement download */ }
                            ) {
                                Icon(
                                    imageVector = Icons.Default.Download,
                                    contentDescription = "Download",
                                    modifier = Modifier.size(20.dp)
                                )
                                Spacer(modifier = Modifier.width(4.dp))
                                Text("Download")
                            }
                            
                            Spacer(modifier = Modifier.width(8.dp))
                            
                            TextButton(
                                onClick = { /* TODO: Implement share */ }
                            ) {
                                Icon(
                                    imageVector = Icons.Default.Share,
                                    contentDescription = "Share",
                                    modifier = Modifier.size(20.dp)
                                )
                                Spacer(modifier = Modifier.width(4.dp))
                                Text("Share")
                            }
                        }
                    }
                }
            }
            
            Spacer(modifier = Modifier.height(24.dp))
        }
    }
}
