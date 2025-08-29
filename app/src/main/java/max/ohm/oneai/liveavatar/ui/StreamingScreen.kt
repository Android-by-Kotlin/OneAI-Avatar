package max.ohm.oneai.liveavatar.ui

import android.Manifest
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.material3.*
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.compose.ui.viewinterop.AndroidView
import androidx.lifecycle.viewmodel.compose.viewModel
import android.util.Log
import androidx.compose.runtime.DisposableEffect
import androidx.compose.animation.animateColorAsState
import androidx.compose.animation.core.animateFloatAsState
import androidx.activity.compose.rememberLauncherForActivityResult
import androidx.activity.result.contract.ActivityResultContracts
import android.speech.RecognizerIntent
import androidx.compose.ui.draw.scale
import android.app.Activity
import android.content.Intent
import android.view.View
import io.livekit.android.renderer.SurfaceViewRenderer
import livekit.org.webrtc.RendererCommon
import livekit.org.webrtc.EglBase
import androidx.compose.animation.core.*
import androidx.compose.ui.draw.alpha
import androidx.compose.foundation.Canvas
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.drawscope.DrawScope
import kotlin.math.cos
import kotlin.math.sin
import androidx.compose.ui.graphics.Path
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.ui.draw.clip
import androidx.compose.material3.Card
import androidx.compose.material3.CardDefaults
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.platform.LocalContext
import com.google.accompanist.permissions.ExperimentalPermissionsApi
import com.google.accompanist.permissions.rememberMultiplePermissionsState
import max.ohm.oneai.liveavatar.LiveAvatarInit

// Note: Replace this with your actual HeyGen API key
// You can get one from https://app.heygen.com/settings?nav=API

// API keys with fallback support
val API_KEYS = listOf(
    // "YjRmNjQ5OTlkNzk2NDdlMTliNWNmMjg1ZDRiOTIyMDYtMTc1MTk2OTQ3MA==",  // Exhausted API key
    "Yjc2MzUyZDgzM2M4NGEwM2E1MDM3MzcwOTI0NzQ1MGUtMTc0OTQxMTg0MA==",   // Current API key
    "MDQ0NDUyMjViOGQzNGU4ZjgyNjhhNDBiZjE3Y2M0NTUtMTc1MjAxNTI4NA==", // Upcoming API key
    "NDAzMTM1MzRlZGUwNDdlM2E2ZmI3ZTgwMTE1YTQ5NjQtMTc1MjAxNjMxMA=="// Upcoming API key
)

@OptIn(ExperimentalPermissionsApi::class)
@Composable
fun StreamingScreen(
    viewModel: StreamingViewModel = viewModel()
) {
    val context = LocalContext.current
    
    // Handle permissions
    val permissionsState = rememberMultiplePermissionsState(
        permissions = listOf(
            Manifest.permission.CAMERA,
            Manifest.permission.RECORD_AUDIO,
            Manifest.permission.BLUETOOTH,
            Manifest.permission.BLUETOOTH_CONNECT
        )
    )
    
    // Initialize LiveAvatar components when permissions are granted
    LaunchedEffect(permissionsState.allPermissionsGranted) {
        if (permissionsState.allPermissionsGranted) {
            LiveAvatarInit.initialize(context)
        }
    }
    
    // Request permissions if not granted
    LaunchedEffect(Unit) {
        if (!permissionsState.allPermissionsGranted) {
            permissionsState.launchMultiplePermissionRequest()
        }
    }
    
    // Show the actual streaming screen
    if (!viewModel.connected) {
        StartScreen(
            loading = viewModel.loading,
            onStartSession = { viewModel.createSession(API_KEYS) },
            viewModel = viewModel
        )
    } else {
        StreamingRoomScreen(viewModel)
    }
}

@Composable
fun StartScreen(
    loading: Boolean,
    onStartSession: () -> Unit,
    viewModel: StreamingViewModel = viewModel()
) {
    // Animation states
    val infiniteTransition = rememberInfiniteTransition(label = "infinite")
    
    val waveAnimation = infiniteTransition.animateFloat(
        initialValue = 0f,
        targetValue = 360f,
        animationSpec = infiniteRepeatable(
            animation = tween(4000, easing = LinearEasing),
            repeatMode = RepeatMode.Restart
        ),
        label = "wave"
    )
    
    val pulseAnimation = infiniteTransition.animateFloat(
        initialValue = 0.8f,
        targetValue = 1.2f,
        animationSpec = infiniteRepeatable(
            animation = tween(1000, easing = FastOutSlowInEasing),
            repeatMode = RepeatMode.Reverse
        ),
        label = "pulse"
    )
    
    val fadeInAnimation = remember { Animatable(0f) }
    LaunchedEffect(Unit) {
        fadeInAnimation.animateTo(
            targetValue = 1f,
            animationSpec = tween(1500, easing = FastOutSlowInEasing)
        )
    }
    
    Box(
        modifier = Modifier
            .fillMaxSize()
            .background(
                brush = Brush.verticalGradient(
                    colors = listOf(
                        Color(0xFFF8F9FA),
                        Color(0xFFE3F2FD)
                    )
                )
            ),
        contentAlignment = Alignment.Center
    ) {
        // Animated background waves
        Canvas(
            modifier = Modifier.fillMaxSize()
        ) {
            drawWaves(waveAnimation.value, size.width, size.height)
        }
        
        Column(
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.Center,
            modifier = Modifier
                .padding(20.dp)
                .alpha(fadeInAnimation.value)
        ) {
            // Animated logo/icon area
            Box(
                modifier = Modifier
                    .size(120.dp)
                    .clip(CircleShape)
                    .background(
                        brush = Brush.linearGradient(
                            colors = listOf(
                                Color(0xFF2196F3),
                                Color(0xFF64B5F6)
                            )
                        )
                    )
                    .scale(pulseAnimation.value),
                contentAlignment = Alignment.Center
            ) {
                // Keep icon stable by applying inverse scaling
                Icon(
                    imageVector = Icons.Filled.VideoCall,
                    contentDescription = "Avatar",
                    tint = Color.White,
                    modifier = Modifier
                        .size(60.dp)
                        .scale(1f / pulseAnimation.value) // Inverse scale to keep icon stable
                )
            }
            
            Spacer(modifier = Modifier.height(32.dp))
            
            // Title with gradient
            Text(
                text = "AI Avatar Assistant",
                fontSize = 28.sp,
                fontWeight = FontWeight.Bold,
                textAlign = TextAlign.Center,
                modifier = Modifier,
                style = TextStyle(
                    brush = Brush.linearGradient(
                        colors = listOf(
                            Color(0xFF1976D2),
                            Color(0xFF42A5F5)
                        )
                    )
                )
            )
            
            Spacer(modifier = Modifier.height(8.dp))
            
            Text(
                text = "Powered by OneAI",
                fontSize = 16.sp,
                fontWeight = FontWeight.Medium,
                color = Color.Gray.copy(alpha = 0.8f),
                textAlign = TextAlign.Center
            )
            
            // Display current API key status
            if (viewModel.currentApiKeyState.isNotEmpty()) {
                Spacer(modifier = Modifier.height(8.dp))
                Text(
                    text = viewModel.currentApiKeyState,
                    fontSize = 14.sp,
                    fontWeight = FontWeight.Normal,
                    //color = Color(0xFFFF9800), // Orange color for visibility
                    color = Color.Transparent,
                    textAlign = TextAlign.Center
                )
            }
            
            Spacer(modifier = Modifier.height(48.dp))
            
            // Avatar Preview Carousel
            AvatarPreviewCarousel(
                onAvatarSelected = { avatarId, voiceId, avatarName ->
                    // Select the avatar and immediately start the session
                    viewModel.selectAvatar(avatarId, voiceId, avatarName)
                    viewModel.createSession(API_KEYS)
                },
                isLoading = loading,
                selectedAvatarId = viewModel.selectedAvatarId
            )
            
            Spacer(modifier = Modifier.height(32.dp))
            
            // Modern start button
            Button(
                onClick = {
                    if (viewModel.selectedAvatarId != null && viewModel.selectedVoiceId != null) {
                        viewModel.createSession(API_KEYS)
                    } else {
                        onStartSession()
                    }
                },
                enabled = !loading,
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(horizontal = 48.dp)
                    .height(56.dp),
                shape = RoundedCornerShape(28.dp),
                colors = ButtonDefaults.buttonColors(
                    containerColor = Color(0xFF2196F3),
                    disabledContainerColor = Color(0xFF2196F3).copy(alpha = 0.6f)
                ),
                elevation = ButtonDefaults.buttonElevation(
                    defaultElevation = 8.dp,
                    pressedElevation = 12.dp
                )
            ) {
                if (loading) {
                    CircularProgressIndicator(
                        color = Color.White,
                        modifier = Modifier.size(24.dp),
                        strokeWidth = 2.dp
                    )
                } else {
                    Icon(
                        imageVector = Icons.Filled.PlayArrow,
                        contentDescription = "Start",
                        modifier = Modifier.size(24.dp)
                    )
                    Spacer(modifier = Modifier.width(8.dp))
                    Text(
                        text = "Start Session",
                        fontSize = 18.sp,
                        fontWeight = FontWeight.SemiBold
                    )
                }
            }
            
            Spacer(modifier = Modifier.height(24.dp))
            
            // Feature cards
//            Row(
//                modifier = Modifier.fillMaxWidth(),
//                horizontalArrangement = Arrangement.SpaceEvenly
//            ) {
//                FeatureCard(
//                    icon = Icons.Filled.Mic,
//                    text = "Voice Input",
//                    modifier = Modifier.weight(1f).padding(horizontal = 4.dp)
//                )
//                FeatureCard(
//                    icon = Icons.Filled.Person,
//                    text = "AI Avatar",
//                    modifier = Modifier.weight(1f).padding(horizontal = 4.dp)
//                )
//                FeatureCard(
//                    icon = Icons.Filled.Chat,
//                    text = "Real-time",
//                    modifier = Modifier.weight(1f).padding(horizontal = 4.dp)
//                )
//            }
        }
    }
}

@Composable
fun FeatureCard(
    icon: ImageVector,
    text: String,
    modifier: Modifier = Modifier
) {
    Card(
        modifier = modifier,
        shape = RoundedCornerShape(12.dp),
        colors = CardDefaults.cardColors(
            containerColor = Color.White.copy(alpha = 0.9f)
        ),
        elevation = CardDefaults.cardElevation(defaultElevation = 4.dp)
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(12.dp),
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            Icon(
                imageVector = icon,
                contentDescription = text,
                tint = Color(0xFF2196F3),
                modifier = Modifier.size(24.dp)
            )
            Spacer(modifier = Modifier.height(4.dp))
            Text(
                text = text,
                fontSize = 12.sp,
                color = Color.Gray,
                textAlign = TextAlign.Center
            )
        }
    }
}

data class AvatarModel(
    val name: String,
    val role: String,
    val description: String,
    val category: String,
    val backgroundColor: Color,
    val avatarId: String,
    val voiceId: String,
    val imageResId: Int? = null // For local images, we'll use placeholders for now
)

@Composable
fun AvatarPreviewCarousel(
    onAvatarSelected: (String, String, String) -> Unit,
    isLoading: Boolean = false,
    selectedAvatarId: String? = null
) {
    val avatarModels = listOf(
        AvatarModel(
            name = "Elenora",
            role = "Fitness Coach",
            description = "Professional fitness guidance and motivational support for your health journey.",
            category = "FITNESS",
            backgroundColor = Color(0xFF6B5B95),
            avatarId = "Elenora_FitnessCoach_public",
            voiceId = "0c418eab508d4030879c0c3381433806"
        ),
        AvatarModel(
            name = "Josh",
            role = "AI Assistant",
            description = "Professional AI assistant for various tasks and conversations.",
            category = "ASSISTANT",
            backgroundColor = Color(0xFF88B0D3),
            avatarId = "josh_lite3_20230714",
            voiceId = "077ab11b14f04ce0b49b5f6e5cc20979"
        ),
        AvatarModel(
            name = "Anna",
            role = "Business Consultant",
            description = "Expert guidance for business strategy and professional development.",
            category = "BUSINESS",
            backgroundColor = Color(0xFF82B366),
            avatarId = "anna_public_20240108",
            voiceId = "1bd001e7e50f421d891986aad5158bc8"
        ),
        AvatarModel(
            name = "Wayne",
            role = "Tech Expert",
            description = "Technology specialist for coding, development, and technical support.",
            category = "TECHNOLOGY",
            backgroundColor = Color(0xFFD6A4A4),
            avatarId = "Wayne_20240711",
            voiceId = "2d5b0e6cf36f460aa7fc47e3eee4ba54"
        ),
        AvatarModel(
            name = "Tyler",
            role = "Creative Director",
            description = "Creative professional for design, branding, and artistic projects.",
            category = "CREATIVE",
            backgroundColor = Color(0xFFE57373),
            avatarId = "Katya_CasualLook_public",   // girl
            voiceId = "1704ea0565c04c5188d9b67062b31a1a"
        ),
        AvatarModel(
            name = "Monica",
            role = "HR Specialist",
            description = "Human resources expert for recruitment, employee relations, and workplace culture.",
            category = "HR",
            backgroundColor = Color(0xFF9575CD),
            avatarId = "SilasHR_public",  // man
            voiceId = "8661cd40d6c44c709e2d0031c0186ada"
        ),
        AvatarModel(
            name = "Lily",
            role = "Language Teacher",
            description = "Multilingual educator specializing in personalized language learning.",
            category = "EDUCATION",
            backgroundColor = Color(0xFF4FC3F7),
            avatarId = "Anastasia_Chair_Sitting_public",  // girl
            voiceId = "9dd6f10bff1d4e988d10c10f2cb69670"
        ),
        AvatarModel(
            name = "Jack",
            role = "Sales Expert",
            description = "Sales professional helping with pitches, negotiations, and customer engagement.",
            category = "SALES",
            backgroundColor = Color(0xFFFF8A65),
            avatarId = "Silas_CustomerSupport_public",  //man
            voiceId = "98ec920efd144d81b3939296d933fec3"
        ),
        AvatarModel(
            name = "Ann",
            role = "Doctor",
            description = " professional Doctor helping to patient, consultants, makes appointments.",
            category = "Medical",
            backgroundColor = Color(0xFF0E43CE),
            avatarId = "Ann_Doctor_Sitting_public",  //man
            voiceId = "98ec920efd144d81b3939296d933fec3"
        )
    )
    
    LazyRow(
        horizontalArrangement = Arrangement.spacedBy(16.dp),
        contentPadding = PaddingValues(horizontal = 20.dp, vertical = 16.dp),
        modifier = Modifier.fillMaxWidth()
    ) {
        items(avatarModels) { avatar ->
            AvatarPreviewCard(
                avatar = avatar,
                onChatClick = { onAvatarSelected(avatar.avatarId, avatar.voiceId, avatar.role) },
                isLoading = isLoading,
                isSelected = avatar.avatarId == selectedAvatarId
            )
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun AvatarPreviewCard(
    avatar: AvatarModel,
    onChatClick: () -> Unit,
    isLoading: Boolean = false,
    isSelected: Boolean = false
) {
    Card(
        modifier = Modifier
            .width(280.dp)
            .height(420.dp),
        shape = RoundedCornerShape(20.dp),
        colors = CardDefaults.cardColors(
            containerColor = if (isSelected) {
                avatar.backgroundColor
            } else {
                avatar.backgroundColor.copy(alpha = 0.95f)
            }
        ),
        elevation = CardDefaults.cardElevation(
            defaultElevation = 8.dp,
            hoveredElevation = 12.dp
        )
    ) {
        Box(
            modifier = Modifier.fillMaxSize()
        ) {
            // Gradient overlay
            Box(
                modifier = Modifier
                    .fillMaxSize()
                    .background(
                        brush = Brush.verticalGradient(
                            colors = listOf(
                                Color.Transparent,
                                Color.Black.copy(alpha = 0.7f)
                            ),
                            startY = 200f
                        )
                    )
            )
            
            // Category label
            Text(
                text = avatar.category,
                color = Color.White,
                fontSize = 12.sp,
                fontWeight = FontWeight.Bold,
                modifier = Modifier
                    .padding(16.dp)
                    .background(
                        color = Color.Black.copy(alpha = 0.3f),
                        shape = RoundedCornerShape(4.dp)
                    )
                    .padding(horizontal = 8.dp, vertical = 4.dp)
            )
            
            // Avatar display with gradient background
            Box(
                modifier = Modifier
                    .fillMaxWidth()
                    .height(180.dp)
                    .align(Alignment.TopCenter),
                contentAlignment = Alignment.Center
            ) {
                // Gradient circle for avatar
                Box(
                    modifier = Modifier
                        .size(120.dp)
                        .clip(CircleShape)
                        .background(
                            brush = Brush.radialGradient(
                                colors = listOf(
                                    Color.White.copy(alpha = 0.3f),
                                    avatar.backgroundColor.copy(alpha = 0.4f)
                                )
                            )
                        ),
                    contentAlignment = Alignment.Center
                ) {
                    // Avatar initial or icon
                    Text(
                        text = avatar.name.take(1).uppercase(),
                        fontSize = 48.sp,
                        fontWeight = FontWeight.Bold,
                        color = Color.White
                    )
                }
            }
            
            // Content
            Column(
                modifier = Modifier
                    .align(Alignment.BottomStart)
                    .padding(20.dp)
            ) {
                Text(
                    text = avatar.role,
                    color = Color.White,
                    fontSize = 22.sp,
                    fontWeight = FontWeight.Bold,
                    lineHeight = 26.sp
                )
                
                Spacer(modifier = Modifier.height(8.dp))
                
                Text(
                    text = avatar.description,
                    color = Color.White.copy(alpha = 0.9f),
                    fontSize = 13.sp,
                    lineHeight = 18.sp,
                    maxLines = 2,
                    overflow = androidx.compose.ui.text.style.TextOverflow.Ellipsis
                )
                
                Spacer(modifier = Modifier.height(12.dp))
                
                Button(
                    onClick = onChatClick,
                    enabled = !isLoading,
                    modifier = Modifier
                        .fillMaxWidth()
                        .height(48.dp),
                    shape = RoundedCornerShape(25.dp),
                    colors = ButtonDefaults.buttonColors(
                        containerColor = if (isSelected) Color(0xFF2196F3) else Color.White,
                        contentColor = if (isSelected) Color.White else avatar.backgroundColor,
                        disabledContainerColor = Color.White.copy(alpha = 0.6f),
                        disabledContentColor = avatar.backgroundColor.copy(alpha = 0.6f)
                    )
                ) {
                    if (isLoading) {
                        CircularProgressIndicator(
                            color = if (isSelected) Color.White else avatar.backgroundColor,
                            modifier = Modifier.size(16.dp),
                            strokeWidth = 2.dp
                        )
                    } else {
                        if (isSelected) {
                            Icon(
                                imageVector = Icons.Default.Check,
                                contentDescription = "Selected",
                                modifier = Modifier.size(20.dp)
                            )
                            Spacer(modifier = Modifier.width(4.dp))
                        }
                        Text(
                            text = if (isSelected) "Starting..." else "Start Chat",
                            fontWeight = FontWeight.SemiBold
                        )
                        if (!isSelected) {
                            Spacer(modifier = Modifier.width(4.dp))
                            Icon(
                                imageVector = Icons.Filled.PlayArrow,
                                contentDescription = "Start",
                                modifier = Modifier.size(16.dp)
                            )
                        }
                    }
                }
            }
        }
    }
}

// Extension function to draw animated waves
fun DrawScope.drawWaves(animationValue: Float, width: Float, height: Float) {
    val wavePath = Path()
    val amplitude = 50f
    val frequency = 0.01f
    
    wavePath.moveTo(0f, height * 0.7f)
    
    for (x in 0..width.toInt()) {
        val y = height * 0.7f + amplitude * sin((x * frequency + animationValue * 0.02f).toFloat())
        wavePath.lineTo(x.toFloat(), y)
    }
    
    wavePath.lineTo(width, height)
    wavePath.lineTo(0f, height)
    wavePath.close()
    
    drawPath(
        path = wavePath,
        color = Color(0xFF2196F3).copy(alpha = 0.1f)
    )
    
    // Second wave
    val wavePath2 = Path()
    wavePath2.moveTo(0f, height * 0.75f)
    
    for (x in 0..width.toInt()) {
        val y = height * 0.75f + amplitude * 0.7f * cos((x * frequency + animationValue * 0.03f).toFloat())
        wavePath2.lineTo(x.toFloat(), y)
    }
    
    wavePath2.lineTo(width, height)
    wavePath2.lineTo(0f, height)
    wavePath2.close()
    
    drawPath(
        path = wavePath2,
        color = Color(0xFF64B5F6).copy(alpha = 0.08f)
    )
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun StreamingRoomScreen(
    viewModel: StreamingViewModel
) {
    val roomState by viewModel.room.collectAsState()
    val showSpeechDialog by viewModel.showSpeechDialog.collectAsState()
    
    // Speech recognition launcher
    val speechLauncher = rememberLauncherForActivityResult(
        contract = ActivityResultContracts.StartActivityForResult()
    ) { result ->
        if (result.resultCode == Activity.RESULT_OK) {
            val data = result.data
            val results = data?.getStringArrayListExtra(RecognizerIntent.EXTRA_RESULTS)
            if (!results.isNullOrEmpty()) {
                viewModel.onSpeechResult(results[0])
            }
        } else {
            viewModel.dismissSpeechDialog()
        }
    }
    
    // Launch speech dialog when needed
    LaunchedEffect(showSpeechDialog) {
        if (showSpeechDialog) {
            val intent = Intent(RecognizerIntent.ACTION_RECOGNIZE_SPEECH).apply {
                putExtra(RecognizerIntent.EXTRA_LANGUAGE_MODEL, RecognizerIntent.LANGUAGE_MODEL_FREE_FORM)
                putExtra(RecognizerIntent.EXTRA_LANGUAGE, "en-US")
                putExtra(RecognizerIntent.EXTRA_PROMPT, "Speak now...")
            }
            try {
                speechLauncher.launch(intent)
            } catch (e: Exception) {
                Log.e("StreamingScreen", "Speech recognition not available", e)
                //Log.e("StreamingScreen", "", )
                viewModel.dismissSpeechDialog()
            }
        }
    }
    
    Box(
        modifier = Modifier.fillMaxSize()
    ) {
        // Video View
        Box(
            modifier = Modifier
                .fillMaxSize()
                .background(Color.Black)
        ) {
            // Show video when available
            val videoTrack = viewModel.currentVideoTrack
            if (videoTrack != null) {
                DisposableEffect(videoTrack) {
Log.d("StreamingScreen", "Video track available, creating renderer.")
                    Log.d("StreamingScreen", "Video track ID: ${videoTrack.name}")
                    onDispose {
                        Log.d("StreamingScreen", "Disposing video renderer")
                    }
                }
                
                AndroidView(
                    factory = { context ->
                        Log.d("StreamingScreen", "Creating SurfaceViewRenderer")
                        SurfaceViewRenderer(context).apply {
                            // Initialize the renderer with EGL context
                            val eglBase = EglBase.create()
                            init(eglBase.eglBaseContext, null)
                            
                            // Set up the renderer properties
                            setScalingType(RendererCommon.ScalingType.SCALE_ASPECT_FIT)
                            setMirror(false)
                            setEnableHardwareScaler(true)
                            
                            // Make sure the view is visible and on top
                            visibility = View.VISIBLE
                            setZOrderMediaOverlay(true)
                            
                            Log.d("StreamingScreen", "SurfaceViewRenderer created and initialized")
                        }
                    },
                    modifier = Modifier.fillMaxSize(),
                    update = { renderer ->
                        Log.d("StreamingScreen", "AndroidView update called")
                        
                        // Remove any existing renderers first
                        try {
                            videoTrack.removeRenderer(renderer)
                        } catch (e: Exception) {
                            Log.d("StreamingScreen", "No existing renderer to remove")
                        }
                        
                        // Add the renderer to the video track
                        videoTrack.addRenderer(renderer)
                        Log.d("StreamingScreen", "Renderer attached to video track")
                        
                        // Ensure the track is enabled
                        if (!videoTrack.enabled) {
                            Log.d("StreamingScreen", "Video track is disabled, enabling it")
                            videoTrack.enabled = true
                        }
                        
                        // Force visibility
                        renderer.visibility = View.VISIBLE
                        renderer.bringToFront()
                    },
                    onRelease = { renderer ->
                        Log.d("StreamingScreen", "Releasing renderer")
                        try {
                            videoTrack.removeRenderer(renderer)
                            renderer.release()
                        } catch (e: Exception) {
                            Log.e("StreamingScreen", "Error releasing renderer: ${e.message}")
                        }
                    }
                )
            }
            
            if (viewModel.currentVideoTrack == null) {
                Box(
                    modifier = Modifier.fillMaxSize(),
                    contentAlignment = Alignment.Center
                ) {
                    Column(
                        horizontalAlignment = Alignment.CenterHorizontally
                    ) {
                        CircularProgressIndicator(color = Color.White)
                        Spacer(modifier = Modifier.height(16.dp))
                        Text(
                            text = "Waiting for avatar...",
                            color = Color.White,
                            fontSize = 16.sp
                        )
                        if (viewModel.sessionId.isNotEmpty()) {
                            Spacer(modifier = Modifier.height(8.dp))
                            Text(
                                text = "Session: ${viewModel.sessionId.take(8)}...",
                                color = Color.Gray,
                                fontSize = 12.sp
                            )
                        }
                        if (roomState != null) {
                            Spacer(modifier = Modifier.height(4.dp))
                            Text(
                                text = "Room State: ${roomState!!.state}",
                                color = Color.Gray,
                                fontSize = 12.sp
                            )
                            Text(
                                text = "Participants: ${roomState!!.remoteParticipants.size}",
                                color = Color.Gray,
                                fontSize = 12.sp
                            )
                        }
                    }
                }
            }
        }
        
        // API Key Status Display
//        if (viewModel.currentApiKeyState.isNotEmpty()) {
//            Text(
//                text = viewModel.currentApiKeyState,
////                color = Color(0xFFFF9800),
//                color = Color.Transparent,
//                fontSize = 12.sp,
//                fontWeight = FontWeight.Medium,
//                modifier = Modifier
//                    .align(Alignment.TopStart)
//                    .padding(top = 50.dp, start = 20.dp)
//                    .background(
//                        color = Color.Black.copy(alpha = 0.7f),
//                        shape = RoundedCornerShape(4.dp)
//                    )
//                    .padding(horizontal = 8.dp, vertical = 4.dp)
//            )
//        }
        
        // Input Controls
        Column(
            modifier = Modifier
                .align(Alignment.BottomCenter)
                .fillMaxWidth()
                .background(
                    Color.Transparent
                )
                .padding(horizontal = 20.dp)
                .padding(bottom = 0.dp)
        ) {
            // Voice feedback
            val voicePartialResult by viewModel.voicePartialResult.collectAsState()
            val voiceError by viewModel.voiceError.collectAsState()
            val isListening by viewModel.isListening.collectAsState()
val isContinuousMode by viewModel.isContinuousMode.collectAsState()
            
            // Show continuous mode status
            if (isContinuousMode) {
                Row(
                    modifier = Modifier.padding(bottom = 8.dp),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Icon(
                        imageVector = Icons.Filled.Mic,
                        contentDescription = "Microphone Active",
                        tint = Color.Red,
                        modifier = Modifier.size(16.dp)
                    )
                    Spacer(modifier = Modifier.width(4.dp))
                    Text(
                        text = "AI Voice Agent Active - Speak naturally!",
                        color = Color.Red,
                        fontSize = 12.sp,
                        fontWeight = FontWeight.Medium
                    )
                }
            }
            
            // Show partial results when listening
            if (isListening && voicePartialResult.isNotEmpty()) {
                Text(
                    text = "Listening: $voicePartialResult",
                    color = Color.Gray,
                    fontSize = 14.sp,
                    modifier = Modifier.padding(bottom = 8.dp)
                )
            }
            
            // Show error if any (but not the "not available" error)
            voiceError?.let { error ->
                if (!error.contains("not available", ignoreCase = true)) {
                    Text(
                        text = error,
                        color = Color(0xFFD32F2F),
                        fontSize = 12.sp,
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(bottom = 8.dp)
                            .padding(horizontal = 12.dp, vertical = 8.dp)
                    )
                }
            }
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.spacedBy(10.dp),
                verticalAlignment = Alignment.CenterVertically
            ) {
                TextField(
                    value = viewModel.text,
                    onValueChange = { viewModel.text = it },
                    placeholder = { 
                        Text(
                            "Enter text for avatar to speak",
                            fontSize = 14.sp,
                            color = Color.Gray
                        ) 
                    },
                    modifier = Modifier
                        .weight(1f)
                        .height(48.dp),
                    shape = RoundedCornerShape(24.dp),
                    colors = TextFieldDefaults.colors(
                        focusedContainerColor = Color.Transparent,
                        unfocusedContainerColor = Color.Transparent,
                        focusedIndicatorColor = Color.Gray,
                        unfocusedIndicatorColor = Color.Gray.copy(alpha = 0.5f),
                        cursorColor = Color.White,
                        focusedTextColor = Color.White,
                        unfocusedTextColor = Color.White
                    ),
                    singleLine = true,
                    enabled = !viewModel.speaking,
                    textStyle = TextStyle(fontSize = 14.sp, color = Color.White)
                )
                
                Button(
                    onClick = { viewModel.sendText() },
                    enabled = viewModel.text.isNotBlank() && !viewModel.loading && !viewModel.speaking,
                    shape = CircleShape,
                    colors = ButtonDefaults.buttonColors(
                        containerColor = Color(0xFF2196F3)
                    )
                ) {
                    Text(
                        text = if (viewModel.speaking) "Speaking..." else "Send",
                        fontWeight = FontWeight.SemiBold
                    )
                }

                IconButton(
                    onClick = {
                        if (isContinuousMode) {
                            viewModel.stopVoiceInput()
                        } else {
                            viewModel.startVoiceInput()
                        }
                    },
                    enabled = !viewModel.loading && !viewModel.speaking,
                    modifier = Modifier.size(56.dp)
                ) {
                    val micColor by animateColorAsState(
                        targetValue = when {
                            isContinuousMode -> Color.Red
                            isListening -> Color(0xFFFF9800) // Orange for single recognition
                            else -> Color.Gray
                        },
                        label = "mic_color"
                    )
                    val micScale by animateFloatAsState(
                        targetValue = if (isContinuousMode && isListening) 1.1f else 1.0f,
                        label = "mic_scale"
                    )
                    Icon(
                        imageVector = if (isContinuousMode || isListening) Icons.Filled.Mic else Icons.Filled.MicOff,
                        contentDescription = if (isContinuousMode) "Stop Continuous Listening" else "Start Continuous Listening",
                        tint = micColor,
                        modifier = Modifier.scale(micScale)
                    )
                }
                
                // Close/Stop button
                IconButton(
                    onClick = { viewModel.closeSession() },
                    enabled = !viewModel.loading,
                    modifier = Modifier
                        .size(56.dp)
                        .background(
                            color = Color(0xFFFF4444),
                            shape = CircleShape
                        )
                ) {
                    Icon(
                        imageVector = Icons.Filled.Stop,
                        contentDescription = "Close Session",
                        tint = Color.White,
                        modifier = Modifier.size(28.dp)
                    )
                }
            }
        }
    }
}
