package max.ohm.oneai.imagetoimage.ui

import android.graphics.Bitmap
import android.graphics.Canvas
import android.graphics.Paint
import android.graphics.Path as AndroidPath
import androidx.compose.foundation.Canvas
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.gestures.detectDragGestures
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Brush
import androidx.compose.material.icons.filled.Clear
import androidx.compose.material.icons.filled.Done
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.graphics.*
import androidx.compose.ui.graphics.drawscope.DrawScope
import androidx.compose.ui.graphics.drawscope.Stroke
import androidx.compose.ui.input.pointer.pointerInput
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.platform.LocalDensity
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.compose.ui.window.Dialog
import androidx.compose.ui.window.DialogProperties
import coil.compose.AsyncImage
import kotlinx.coroutines.launch

data class PathData(
    val path: Path,
    val color: Color,
    val strokeWidth: Float
)

@Composable
fun BrushMaskTool(
    originalImage: Bitmap,
    onMaskCreated: (Bitmap) -> Unit,
    onDismiss: () -> Unit
) {
    var paths by remember { mutableStateOf(listOf<PathData>()) }
    var currentPath by remember { mutableStateOf(Path()) }
    var brushSize by remember { mutableStateOf(20f) }
    var isDrawing by remember { mutableStateOf(false) }
    var showBrushControls by remember { mutableStateOf(false) }
    
    // Track the actual display dimensions
    var displayWidth by remember { mutableStateOf(0f) }
    var displayHeight by remember { mutableStateOf(0f) }
    
    val density = LocalDensity.current
    
    Dialog(
        onDismissRequest = onDismiss,
        properties = DialogProperties(
            usePlatformDefaultWidth = false,
            decorFitsSystemWindows = false
        )
    ) {
        Surface(
            modifier = Modifier.fillMaxSize(),
            color = Color.Black.copy(alpha = 0.9f)
        ) {
            Column(
                modifier = Modifier.fillMaxSize()
            ) {
                // Header with controls
                Card(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(16.dp),
                    colors = CardDefaults.cardColors(
                        containerColor = Color(0xFF1A1F3A).copy(alpha = 0.95f)
                    ),
                    shape = RoundedCornerShape(16.dp)
                ) {
                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(16.dp),
                        horizontalArrangement = Arrangement.SpaceBetween,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Text(
                            "Draw Mask Area",
                            color = Color.White,
                            fontSize = 18.sp,
                            fontWeight = FontWeight.Bold
                        )
                        
                        Row(
                            horizontalArrangement = Arrangement.spacedBy(8.dp)
                        ) {
                            // Brush size toggle
                            IconButton(
                                onClick = { showBrushControls = !showBrushControls },
                                modifier = Modifier
                                    .size(40.dp)
                                    .background(
                                        Color(0xFF6366F1).copy(alpha = 0.2f),
                                        CircleShape
                                    )
                            ) {
                                Icon(
                                    Icons.Default.Brush,
                                    contentDescription = "Brush Size",
                                    tint = Color(0xFF6366F1)
                                )
                            }
                            
                            // Clear button
                            IconButton(
                                onClick = { 
                                    paths = listOf()
                                    currentPath = Path()
                                },
                                modifier = Modifier
                                    .size(40.dp)
                                    .background(
                                        Color(0xFFEF4444).copy(alpha = 0.2f),
                                        CircleShape
                                    )
                            ) {
                                Icon(
                                    Icons.Default.Clear,
                                    contentDescription = "Clear",
                                    tint = Color(0xFFEF4444)
                                )
                            }
                            
                            // Done button
                            IconButton(
                                onClick = { 
                                    // Create mask bitmap and call onMaskCreated
                                    val maskBitmap = createMaskBitmap(
                                        originalImage, 
                                        paths, 
                                        density, 
                                        displayWidth, 
                                        displayHeight
                                    )
                                    onMaskCreated(maskBitmap)
                                },
                                modifier = Modifier
                                    .size(40.dp)
                                    .background(
                                        Color(0xFF10B981).copy(alpha = 0.2f),
                                        CircleShape
                                    )
                            ) {
                                Icon(
                                    Icons.Default.Done,
                                    contentDescription = "Done",
                                    tint = Color(0xFF10B981)
                                )
                            }
                        }
                    }
                    
                    // Brush size control
                    if (showBrushControls) {
                        Column(
                            modifier = Modifier
                                .fillMaxWidth()
                                .padding(horizontal = 16.dp, vertical = 8.dp)
                        ) {
                            Text(
                                "Brush Size: ${brushSize.toInt()}px",
                                color = Color.White,
                                fontSize = 14.sp
                            )
                            
                            Slider(
                                value = brushSize,
                                onValueChange = { brushSize = it },
                                valueRange = 5f..50f,
                                colors = SliderDefaults.colors(
                                    thumbColor = Color(0xFF6366F1),
                                    activeTrackColor = Color(0xFF6366F1),
                                    inactiveTrackColor = Color.White.copy(alpha = 0.3f)
                                )
                            )
                        }
                    }
                }
                
                // Drawing area
                Box(
                    modifier = Modifier
                        .fillMaxWidth()
                        .weight(1f)
                        .padding(16.dp)
                        .clip(RoundedCornerShape(16.dp))
                        .border(
                            2.dp,
                            Color(0xFF6366F1).copy(alpha = 0.5f),
                            RoundedCornerShape(16.dp)
                        )
                ) {
                    // Background image
                    AsyncImage(
                        model = originalImage,
                        contentDescription = "Original Image",
                        modifier = Modifier.fillMaxSize(),
                        contentScale = ContentScale.Fit
                    )
                    
                    // Drawing canvas overlay
                    Canvas(
                        modifier = Modifier
                            .fillMaxSize()
                            .pointerInput(Unit) {
                                // Capture the size for coordinate mapping
                                displayWidth = size.width.toFloat()
                                displayHeight = size.height.toFloat()
                                detectDragGestures(
                                    onDragStart = { offset ->
                                        currentPath = Path()
                                        currentPath.moveTo(offset.x, offset.y)
                                        isDrawing = true
                                    },
                                    onDrag = { change, _ ->
                                        if (isDrawing) {
                                            currentPath.lineTo(change.position.x, change.position.y)
                                        }
                                    },
                                    onDragEnd = {
                                        paths = paths + PathData(
                                            path = currentPath,
                                            color = Color.Red.copy(alpha = 0.5f),
                                            strokeWidth = brushSize
                                        )
                                        isDrawing = false
                                        currentPath = Path()
                                    }
                                )
                            }
                    ) {
                        // Draw completed paths
                        paths.forEach { pathData ->
                            drawPath(
                                path = pathData.path,
                                color = pathData.color,
                                style = Stroke(
                                    width = pathData.strokeWidth,
                                    cap = StrokeCap.Round,
                                    join = StrokeJoin.Round
                                )
                            )
                        }
                        
                        // Draw current path being drawn
                        if (isDrawing) {
                            drawPath(
                                path = currentPath,
                                color = Color.Red.copy(alpha = 0.5f),
                                style = Stroke(
                                    width = brushSize,
                                    cap = StrokeCap.Round,
                                    join = StrokeJoin.Round
                                )
                            )
                        }
                    }
                }
                
                // Instructions
                Card(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(16.dp),
                    colors = CardDefaults.cardColors(
                        containerColor = Color(0xFF1A1F3A).copy(alpha = 0.8f)
                    ),
                    shape = RoundedCornerShape(12.dp)
                ) {
                    Text(
                        "Draw on the areas you want to modify. The marked areas will be processed using AI.",
                        color = Color.White.copy(alpha = 0.8f),
                        fontSize = 14.sp,
                        modifier = Modifier.padding(16.dp)
                    )
                }
            }
        }
    }
}

private fun createMaskBitmap(
    originalImage: Bitmap,
    paths: List<PathData>,
    density: androidx.compose.ui.unit.Density,
    displayWidth: Float,
    displayHeight: Float
): Bitmap {
    val maskBitmap = Bitmap.createBitmap(
        originalImage.width,
        originalImage.height,
        Bitmap.Config.ARGB_8888
    )
    
    val canvas = Canvas(maskBitmap)
    
    // Fill with transparent background
    canvas.drawColor(android.graphics.Color.TRANSPARENT)
    
    // Early return if no paths to draw
    if (paths.isEmpty()) {
        return maskBitmap
    }
    
    // Fallback dimensions if display dimensions are not captured
    val safeDisplayWidth = if (displayWidth > 0) displayWidth else 400f
    val safeDisplayHeight = if (displayHeight > 0) displayHeight else 400f
    
    // Set up paint for drawing mask
    val paint = Paint().apply {
        color = android.graphics.Color.WHITE
        style = Paint.Style.STROKE
        strokeCap = Paint.Cap.ROUND
        strokeJoin = Paint.Join.ROUND
        isAntiAlias = true
    }
    
    // Calculate the actual scale factor based on the image display dimensions
    // We need to account for how the image is actually displayed in the UI
    val imageAspectRatio = originalImage.width.toFloat() / originalImage.height.toFloat()
    val displayAspectRatio = safeDisplayWidth / safeDisplayHeight
    
    // Calculate how the image is actually scaled within the display area (ContentScale.Fit)
    val actualScaleX: Float
    val actualScaleY: Float
    val offsetX: Float
    val offsetY: Float
    
    if (imageAspectRatio > displayAspectRatio) {
        // Image is wider than display - scaled by width, centered vertically
        actualScaleX = originalImage.width.toFloat() / safeDisplayWidth
        actualScaleY = actualScaleX
        offsetX = 0f
        offsetY = (safeDisplayHeight - originalImage.height.toFloat() / actualScaleY) / 2f
    } else {
        // Image is taller than display - scaled by height, centered horizontally
        actualScaleY = originalImage.height.toFloat() / safeDisplayHeight
        actualScaleX = actualScaleY
        offsetX = (safeDisplayWidth - originalImage.width.toFloat() / actualScaleX) / 2f
        offsetY = 0f
    }
    
    // Debug logging
    android.util.Log.d("BrushMaskTool", "Creating mask bitmap...")
    android.util.Log.d("BrushMaskTool", "Original image: ${originalImage.width}x${originalImage.height}")
    android.util.Log.d("BrushMaskTool", "Display dimensions: ${safeDisplayWidth}x${safeDisplayHeight}")
    android.util.Log.d("BrushMaskTool", "Paths to draw: ${paths.size}")
    android.util.Log.d("BrushMaskTool", "Scale factors: X=$actualScaleX, Y=$actualScaleY")
    android.util.Log.d("BrushMaskTool", "Offsets: X=$offsetX, Y=$offsetY")
    
    // Draw paths on mask
    paths.forEach { pathData ->
        paint.strokeWidth = pathData.strokeWidth * actualScaleX.coerceAtMost(actualScaleY)
        
        // Create scaled path with offset adjustment
        val scaledPath = android.graphics.Path()
        val matrix = android.graphics.Matrix().apply {
            // First translate to account for the offset from centering
            postTranslate(-offsetX, -offsetY)
            // Then scale to bitmap coordinates
            postScale(actualScaleX, actualScaleY)
        }
        pathData.path.asAndroidPath().transform(matrix, scaledPath)
        
        canvas.drawPath(scaledPath, paint)
    }
    
    return maskBitmap
}
