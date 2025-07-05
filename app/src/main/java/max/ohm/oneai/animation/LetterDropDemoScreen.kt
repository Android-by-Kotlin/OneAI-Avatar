package max.ohm.oneai.animation

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import kotlinx.coroutines.delay

/**
 * Demo screen showcasing various letter drop animations at 60 FPS
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun LetterDropDemoScreen() {
    var currentAnimation by remember { mutableStateOf(0) }
    var animationKey by remember { mutableStateOf(0) }
    
    Scaffold(
        topBar = {
            TopAppBar(
                title = { 
                    Text(
                        "Letter Drop Animation Demo",
                        fontWeight = FontWeight.Bold
                    )
                },
                colors = TopAppBarDefaults.topAppBarColors(
                    containerColor = MaterialTheme.colorScheme.primaryContainer,
                    titleContentColor = MaterialTheme.colorScheme.onPrimaryContainer
                )
            )
        }
    ) { paddingValues ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
                .verticalScroll(rememberScrollState()),
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            // Animation selector
            Card(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(16.dp),
                colors = CardDefaults.cardColors(
                    containerColor = MaterialTheme.colorScheme.surfaceVariant
                )
            ) {
                Column(
                    modifier = Modifier.padding(16.dp),
                    horizontalAlignment = Alignment.CenterHorizontally
                ) {
                    Text(
                        "Select Animation Type",
                        style = MaterialTheme.typography.titleMedium,
                        modifier = Modifier.padding(bottom = 8.dp)
                    )
                    
                    Row(
                        horizontalArrangement = Arrangement.spacedBy(8.dp)
                    ) {
                        FilterChip(
                            selected = currentAnimation == 0,
                            onClick = { 
                                currentAnimation = 0
                                animationKey++
                            },
                            label = { Text("Basic") }
                        )
                        FilterChip(
                            selected = currentAnimation == 1,
                            onClick = { 
                                currentAnimation = 1
                                animationKey++
                            },
                            label = { Text("Bouncing") }
                        )
                        FilterChip(
                            selected = currentAnimation == 2,
                            onClick = { 
                                currentAnimation = 2
                                animationKey++
                            },
                            label = { Text("Wave") }
                        )
                    }
                }
            }
            
            // Animation showcase area
            Card(
                modifier = Modifier
                    .fillMaxWidth()
                    .height(200.dp)
                    .padding(horizontal = 16.dp),
                colors = CardDefaults.cardColors(
                    containerColor = Color(0xFFF5F5F5)
                )
            ) {
                Box(
                    modifier = Modifier.fillMaxSize(),
                    contentAlignment = Alignment.Center
                ) {
                    when (currentAnimation) {
                        0 -> BasicDropDemo(key = animationKey)
                        1 -> BouncingDropDemo(key = animationKey)
                        2 -> WaveDropDemo(key = animationKey)
                    }
                }
            }
            
            Spacer(modifier = Modifier.height(24.dp))
            
            // Examples section
            Text(
                "Animation Examples",
                style = MaterialTheme.typography.headlineMedium,
                fontWeight = FontWeight.Bold,
                modifier = Modifier.padding(16.dp)
            )
            
            // Example 1: Welcome message
            AnimationExample(
                title = "Welcome Message",
                description = "Perfect for splash screens"
            ) {
                LetterDropAnimation(
                    text = "Welcome to OneAI",
                    textStyle = TextStyle(
                        fontSize = 28.sp,
                        fontWeight = FontWeight.Bold,
                        color = MaterialTheme.colorScheme.primary
                    ),
                    dropHeight = 400f,
                    staggerDelay = 60
                )
            }
            
            // Example 2: Loading text
            AnimationExample(
                title = "Loading Animation",
                description = "Great for loading states"
            ) {
                var loadingText by remember { mutableStateOf("Loading") }
                
                LaunchedEffect(Unit) {
                    while (true) {
                        delay(2000)
                        loadingText = when (loadingText) {
                            "Loading" -> "Processing"
                            "Processing" -> "Almost Done"
                            else -> "Loading"
                        }
                    }
                }
                
                BouncingLetterDropAnimation(
                    text = loadingText,
                    fontSize = 20.sp,
                    color = MaterialTheme.colorScheme.secondary,
                    dropHeight = 300f
                )
            }
            
            // Example 3: Success message
            AnimationExample(
                title = "Success Message",
                description = "For completion states"
            ) {
                WaveLetterDropAnimation(
                    text = "✓ Success!",
                    textStyle = TextStyle(
                        fontSize = 24.sp,
                        fontWeight = FontWeight.Medium,
                        color = Color(0xFF4CAF50)
                    ),
                    waveAmplitude = 150f
                )
            }
            
            Spacer(modifier = Modifier.height(32.dp))
            
            // Performance note
            Card(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(16.dp),
                colors = CardDefaults.cardColors(
                    containerColor = MaterialTheme.colorScheme.tertiaryContainer
                )
            ) {
                Column(
                    modifier = Modifier.padding(16.dp)
                ) {
                    Text(
                        "Performance Note",
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.Bold,
                        color = MaterialTheme.colorScheme.onTertiaryContainer
                    )
                    Spacer(modifier = Modifier.height(8.dp))
                    Text(
                        "These animations run at 60 FPS using Compose's animation APIs. " +
                        "The animations are hardware-accelerated and optimized for smooth performance.",
                        style = MaterialTheme.typography.bodyMedium,
                        color = MaterialTheme.colorScheme.onTertiaryContainer
                    )
                }
            }
            
            Spacer(modifier = Modifier.height(16.dp))
        }
    }
}

@Composable
private fun BasicDropDemo(key: Int) {
    LetterDropAnimation(
        text = "Hello World!",
        textStyle = TextStyle(
            fontSize = 32.sp,
            fontWeight = FontWeight.Normal,
            color = Color.Black
        ),
        dropHeight = 350f,
        staggerDelay = 50,
        animationDuration = 800
    )
}

@Composable
private fun BouncingDropDemo(key: Int) {
    BouncingLetterDropAnimation(
        text = "Bouncing Text",
        fontSize = 30.sp,
        fontWeight = FontWeight.Medium,
        color = MaterialTheme.colorScheme.primary,
        dropHeight = 400f,
        staggerDelay = 40
    )
}

@Composable
private fun WaveDropDemo(key: Int) {
    WaveLetterDropAnimation(
        text = "Wave Effect",
        textStyle = TextStyle(
            fontSize = 34.sp,
            fontWeight = FontWeight.Bold,
            color = MaterialTheme.colorScheme.tertiary
        ),
        waveAmplitude = 120f
    )
}

@Composable
private fun AnimationExample(
    title: String,
    description: String,
    content: @Composable () -> Unit
) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = 16.dp, vertical = 8.dp)
    ) {
        Column(
            modifier = Modifier.padding(16.dp),
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            Text(
                title,
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.Bold
            )
            Text(
                description,
                style = MaterialTheme.typography.bodySmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant,
                modifier = Modifier.padding(bottom = 16.dp)
            )
            
            Box(
                modifier = Modifier
                    .fillMaxWidth()
                    .height(80.dp)
                    .background(
                        color = MaterialTheme.colorScheme.surface,
                        shape = MaterialTheme.shapes.small
                    ),
                contentAlignment = Alignment.Center
            ) {
                content()
            }
        }
    }
}
