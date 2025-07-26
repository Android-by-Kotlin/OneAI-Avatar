package max.ohm.oneai.chatbot

import android.graphics.Paint
import android.graphics.Typeface
import androidx.compose.animation.core.Animatable
import androidx.compose.animation.core.LinearEasing
import androidx.compose.animation.core.RepeatMode
import androidx.compose.animation.core.animateFloat
import androidx.compose.animation.core.infiniteRepeatable
import androidx.compose.animation.core.rememberInfiniteTransition
import androidx.compose.animation.core.tween
import androidx.compose.foundation.Canvas
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.drawscope.DrawScope
import androidx.compose.ui.graphics.nativeCanvas
import androidx.compose.ui.graphics.toArgb
import androidx.compose.ui.platform.LocalConfiguration
import androidx.compose.ui.platform.LocalDensity
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.drawText
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.rememberTextMeasurer
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch
import kotlin.math.abs
import kotlin.math.pow
import kotlin.random.Random

/**
 * A Matrix-style hacking animation effect that displays falling green characters
 * with "ONEAI" text in the center at 60 FPS.
 */
@Composable
fun MatrixHackEffect(
    modifier: Modifier = Modifier,
    alpha: Float = 0.7f,
    backgroundColor: Color = Color.Black.copy(alpha = 0.95f)
) {
    val screenWidth = LocalConfiguration.current.screenWidthDp.dp
    val screenHeight = LocalConfiguration.current.screenHeightDp.dp
    val density = LocalDensity.current
    val textMeasurer = rememberTextMeasurer()
    
    // Character size for matrix rain
    val charSize = with(density) { 14.dp.toPx() }
    val columnWidth = charSize * 0.8f
    val columns = (with(density) { screenWidth.toPx() } / columnWidth).toInt()
    
    // Matrix rain columns
    val matrixColumns = remember {
        List(columns) { columnIndex ->
            MatrixColumn(
                x = columnIndex * columnWidth,
                speed = Random.nextFloat() * 2f + 1f, // Faster speeds for smoother effect
                length = Random.nextInt(20, 30),
                delay = Random.nextLong(0, 2000)
            )
        }
    }

    // Character set for Matrix effect
    val matrixChars = remember {
        "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789@#$%^&*()_+-=[]{}|;:,.<>?"
    }

    // Paint objects for matrix rain
    val paints = remember {
        mapOf(
            "bright" to Paint().apply {
                textSize = charSize
                isAntiAlias = true
                typeface = Typeface.MONOSPACE
                setShadowLayer(6f, 0f, 0f, Color(0xFF00FF00).toArgb())
            },
            "normal" to Paint().apply {
                textSize = charSize
                isAntiAlias = true
                typeface = Typeface.MONOSPACE
            },
            "glow" to Paint().apply {
                textSize = charSize * 1.1f
                isAntiAlias = true
                typeface = Typeface.MONOSPACE
                setShadowLayer(10f, 0f, 0f, Color(0xFFFFFFFF).toArgb())
            }
        )
    }
    
    // Paint for ONEAI text - COMMENTED OUT
//    val oneaiPaint = remember {
//        Paint().apply {
//            textSize = with(density) { 72.sp.toPx() }
//            isAntiAlias = true
//            typeface = Typeface.create(Typeface.MONOSPACE, Typeface.BOLD)
//            textAlign = Paint.Align.CENTER
//        }
//    }
//
//    // Animation for ONEAI text glow
//    val infiniteTransition = rememberInfiniteTransition(label = "oneai_glow")
//    val glowAlpha by infiniteTransition.animateFloat(
//        initialValue = 0.6f,
//        targetValue = 1f,
//        animationSpec = infiniteRepeatable(
//            animation = tween(2000, easing = LinearEasing),
//            repeatMode = RepeatMode.Reverse
//        ),
//        label = "glow_alpha"
//    )

    // 60 FPS animation ticker
    var frameTime by remember { mutableStateOf(0L) }
    LaunchedEffect(Unit) {
        while (true) {
            frameTime = System.currentTimeMillis()
            delay(16) // 60 FPS = ~16.67ms per frame
        }
    }

    Box(
        modifier = modifier
            .fillMaxSize()
            .background(backgroundColor),
        contentAlignment = Alignment.Center
    ) {
        Canvas(
            modifier = Modifier.fillMaxSize()
        ) {
            val canvasHeight = size.height
            val canvasWidth = size.width
            
            // Update and draw matrix columns at 60 FPS
            matrixColumns.forEach { column ->
                // Update column position based on frame time
                column.y += column.speed * charSize / 60f * 3f // Adjust speed for 60 FPS
                
                // Reset when column goes off screen
                if (column.y > canvasHeight + column.length * charSize) {
                    column.y = -column.length * charSize
                    // Generate new random characters
                    column.chars = List(column.length) { matrixChars.random() }
                }
                
                // Draw the column
                drawMatrixColumn(
                    column = column,
                    canvasHeight = canvasHeight,
                    charSize = charSize,
                    matrixChars = matrixChars,
                    paints = paints,
                    ticker = frameTime,
                    alpha = alpha
                )
            }
            
            // Draw ONEAI text in the center with glow effect - COMMENTED OUT
//            drawContext.canvas.nativeCanvas.apply {
//                // Draw multiple layers for glow effect
//                for (i in 5 downTo 1) {
//                    oneaiPaint.apply {
//                        color = Color(0xFF00FF00).copy(alpha = glowAlpha * 0.15f * i).toArgb()
//                        setShadowLayer(20f * i, 0f, 0f, Color(0xFF00FF00).copy(alpha = 0.3f).toArgb())
//                    }
//                    drawText(
//                        "ONEAI",
//                        canvasWidth / 2f,
//                        canvasHeight / 2f + with(density) { 24.dp.toPx() },
//                        oneaiPaint
//                    )
//                }
//                
//                // Draw main ONEAI text
//                oneaiPaint.apply {
//                    color = Color(0xFF33FF33).copy(alpha = glowAlpha).toArgb()
//                    setShadowLayer(15f, 0f, 0f, Color(0xFF00FF00).toArgb())
//                }
//                drawText(
//                    "ONEAI",   // ONEAI background text
//                    canvasWidth / 2f,
//                    canvasHeight / 2f + with(density) { 24.dp.toPx() },
//                    oneaiPaint
//                )
//            }
        }
    }
}

data class MatrixColumn(
    val x: Float,
    val speed: Float,
    val length: Int,
    val delay: Long,
    var y: Float = 0f,
    var chars: List<Char> = emptyList()
)

private fun DrawScope.drawMatrixColumn(
    column: MatrixColumn,
    canvasHeight: Float,
    charSize: Float,
    matrixChars: String,
    paints: Map<String, Paint>,
    ticker: Long,
    alpha: Float
) {
    // Initialize characters if empty
    if (column.chars.isEmpty()) {
        column.chars = List(column.length) { matrixChars.random() }
    }
    
    // Draw each character in the column
    column.chars.forEachIndexed { index, char ->
        val charY = column.y + index * charSize
        
        // Only draw if on screen
        if (charY > 0 && charY < canvasHeight) {
            val distance = index.toFloat() / column.length
            
            // Calculate opacity based on position in trail
            val charAlpha = when {
                index == column.length - 1 -> 1.0f // Leading character is brightest
                index == column.length - 2 -> 0.9f
                index > column.length - 5 -> 0.7f
                else -> (1.0f - distance.pow(2)) * 0.6f
            }
            
            // Occasionally change character for flickering effect
            val displayChar = if (ticker % 3 == 0L && Random.nextFloat() < 0.1f) {
                matrixChars.random()
            } else {
                char
            }
            
            drawContext.canvas.nativeCanvas.apply {
                val paint = when {
                    index == column.length - 1 && Random.nextFloat() < 0.3f -> paints["glow"]!!
                    index >= column.length - 2 -> paints["bright"]!!
                    else -> paints["normal"]!!
                }
                
                // Adjust color based on position
                paint.color = when {
                    index == column.length - 1 -> Color(0xFFFFFFFF) // White for leading edge
                    index >= column.length - 3 -> Color(0xFF33FF33) // Bright green
                    else -> Color(0xFF00CC00) // Standard Matrix green
                }.copy(alpha = charAlpha * alpha).toArgb()
                
                drawText(
                    displayChar.toString(),
                    column.x,
                    charY,
                    paint
                )
            }
        }
    }
}
