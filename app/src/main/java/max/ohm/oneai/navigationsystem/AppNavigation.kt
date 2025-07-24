package max.ohm.oneai.navigationsystem

import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.runtime.remember
import androidx.lifecycle.viewmodel.compose.viewModel
import androidx.navigation.NavType
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import androidx.navigation.navArgument
import max.ohm.oneai.aiconversation.conversation.AiConversationScreen
import max.ohm.oneai.aiconversation.conversation.AiConversationViewModel
import max.ohm.oneai.aiconversation.llm.OpenRouterScreen
import max.ohm.oneai.aiconversation.llm.OpenRouterViewModel
import max.ohm.oneai.aiconversation.tts.TtsScreen
import max.ohm.oneai.aiconversation.tts.TtsViewModel
import max.ohm.oneai.aitalk.AiTalkScreen
import max.ohm.oneai.aitalk.AiTalkViewModel
import max.ohm.oneai.chatbot.ChatBotScreen
import max.ohm.oneai.chatbot.ResponsiveTestScreen
import max.ohm.oneai.chatbot.UnifiedChatBotViewModel
import max.ohm.oneai.homescreen.SimpleHomeScreen
import max.ohm.oneai.homescreen.EnhancedHomeScreen
import max.ohm.oneai.imagegeneration.ImageGeneratorScreen
import max.ohm.oneai.imagegeneration.EnhancedImageGeneratorScreen
import max.ohm.oneai.imagegeneration.UnifiedImageViewModel
import max.ohm.oneai.login.LoginSignupScreen
import max.ohm.oneai.login.LoginState
import max.ohm.oneai.login.LoginViewModel
import max.ohm.oneai.profile.ProfileScreen
import max.ohm.oneai.splash.SplashScreen
import max.ohm.oneai.videogeneration.VideoGenerationScreen
import max.ohm.oneai.videogeneration.NewVideoGenerationScreen
import max.ohm.oneai.videogeneration.EnhancedVideoGenerationScreen
import max.ohm.oneai.videogeneration.NewVideoGenerationViewModel
import max.ohm.oneai.videogeneration.VideoPlayerScreen
import max.ohm.oneai.liveavatar.ui.StreamingScreen
import max.ohm.oneai.liveavatar.ui.StreamingViewModel
import max.ohm.oneai.imageediting.FaceGenScreen
import max.ohm.oneai.imageediting.FaceGenViewModel
import max.ohm.oneai.imagetoimage.ImageToImageScreen
import max.ohm.oneai.imagetoimage.UnifiedImageToImageViewModel
import max.ohm.oneai.imagetoimage.GalleryScreen
import max.ohm.oneai.stabilityai.ui.StabilityImageToImageScreen
import max.ohm.oneai.stabilityai.viewmodel.StabilityImageToImageViewModel
import max.ohm.oneai.stabilityai.ui.SketchToImageScreen
import max.ohm.oneai.stabilityai.viewmodel.SketchToImageViewModel
import androidx.navigation.NavBackStackEntry
import max.ohm.oneai.navigation.MainScaffold

// --- Navigation ---
@Composable
fun AppNavigation() {
    val navController = rememberNavController()
    
    // Create a shared LoginViewModel instance to prevent recreation during navigation
    val loginViewModel: LoginViewModel = viewModel()
    val loginState by loginViewModel.loginState.collectAsState()
    
    MainScaffold(navController = navController) {
        NavHost(navController = navController, startDestination = "splash") {
        composable("splash") {
            SplashScreen(navController = navController)
        }
        composable("login") {
            LoginSignupScreen(navController = navController, loginViewModel = loginViewModel)
        }
        composable("home") {
            // Check if user is logged in
            LaunchedEffect(loginState) {
                if (loginState !is LoginState.Success) {
                    navController.navigate("login") {
                        popUpTo("splash") { inclusive = true }
                    }
                }
            }
            // Use the new EnhancedHomeScreen with beautiful UI
            EnhancedHomeScreen(navController = navController, loginViewModel = loginViewModel)
        }
        composable("profile") {
            // Check if user is logged in
            LaunchedEffect(loginState) {
                if (loginState !is LoginState.Success) {
                    navController.navigate("login") {
                        popUpTo("splash") { inclusive = true }
                    }
                }
            }
            ProfileScreen(navController = navController, loginViewModel = loginViewModel)
        }
        composable(
            "imageGenerator?model={modelType}",
            arguments = listOf(navArgument("modelType") {
                type = NavType.StringType
                nullable = true
                defaultValue = "flux.1.1-pro" // Default to the original model
            })
        ) { backStackEntry ->
            // Check if user is logged in
            LaunchedEffect(loginState) {
                if (loginState !is LoginState.Success) {
                    navController.navigate("login") {
                        popUpTo("splash") { inclusive = true }
                    }
                }
            }
            val modelType = backStackEntry.arguments?.getString("modelType")
            val unifiedImageViewModel: UnifiedImageViewModel = viewModel()
            ImageGeneratorScreen(unifiedImageViewModel = unifiedImageViewModel, initialModelType = modelType)
        }
        composable(
            "enhancedImageGenerator?model={modelType}",
            arguments = listOf(navArgument("modelType") {
                type = NavType.StringType
                nullable = true
                defaultValue = "flux.1-schnell"
            })
        ) { backStackEntry ->
            // Check if user is logged in
            LaunchedEffect(loginState) {
                if (loginState !is LoginState.Success) {
                    navController.navigate("login") {
                        popUpTo("splash") { inclusive = true }
                    }
                }
            }
            val modelType = backStackEntry.arguments?.getString("modelType")
            val unifiedImageViewModel: UnifiedImageViewModel = viewModel()
            EnhancedImageGeneratorScreen(unifiedImageViewModel = unifiedImageViewModel, initialModelType = modelType)
        }
        composable(
            "chatbot?model={modelType}", // Updated route to accept modelType
            arguments = listOf(navArgument("modelType") {
                type = NavType.StringType
                nullable = true
                defaultValue = "gemini-2.0-flash" // Default to Gemini Flash
            })
        ) { backStackEntry ->
            // Check if user is logged in
            LaunchedEffect(loginState) {
                if (loginState !is LoginState.Success) {
                    navController.navigate("login") {
                        popUpTo("splash") { inclusive = true }
                    }
                }
            }
            val modelType = backStackEntry.arguments?.getString("modelType")
            val unifiedChatBotViewModel: UnifiedChatBotViewModel = viewModel() // Use UnifiedChatBotViewModel
            // Set the initial model type in the view model
            LaunchedEffect(modelType) {
                modelType?.let {
                    unifiedChatBotViewModel.updateSelectedModel(it)
                }
            }
            ChatBotScreen(unifiedChatBotViewModel = unifiedChatBotViewModel)
        }
        composable(
            "openRouter?model={modelType}", // Route for OpenRouter screen
            arguments = listOf(navArgument("modelType") {
                type = NavType.StringType
                nullable = true
                defaultValue = "google/gemini-2.0-flash" // Default model
            })
        ) { backStackEntry ->
            // Check if user is logged in
            LaunchedEffect(loginState) {
                if (loginState !is LoginState.Success) {
                    navController.navigate("login") {
                        popUpTo("splash") { inclusive = true }
                    }
                }
            }
            val modelType = backStackEntry.arguments?.getString("modelType")
            val openRouterViewModel: OpenRouterViewModel = viewModel()
            OpenRouterScreen(openRouterViewModel = openRouterViewModel, initialModelType = modelType)
        }
        composable("videoGeneration") { // Add AI video generation destination
            // Check if user is logged in
            LaunchedEffect(loginState) {
                if (loginState !is LoginState.Success) {
                    navController.navigate("login") {
                        popUpTo("splash") { inclusive = true }
                    }
                }
            }
            EnhancedVideoGenerationScreen(navController = navController)
        }
        composable("aiTalk") { // Add AI Talk destination
            // Check if user is logged in
            LaunchedEffect(loginState) {
                if (loginState !is LoginState.Success) {
                    navController.navigate("login") {
                        popUpTo("splash") { inclusive = true }
                    }
                }
            }
            val aiTalkViewModel: AiTalkViewModel = viewModel()
            AiTalkScreen(aiTalkViewModel = aiTalkViewModel)
        }
        composable("tts") { // Add Text-to-Speech destination
            // Check if user is logged in
            LaunchedEffect(loginState) {
                if (loginState !is LoginState.Success) {
                    navController.navigate("login") {
                        popUpTo("splash") { inclusive = true }
                    }
                }
            }
            val ttsViewModel: TtsViewModel = viewModel()
            TtsScreen(ttsViewModel = ttsViewModel)
        }
        composable("aiConversation") { // Add AI Conversation destination
            // Check if user is logged in
            LaunchedEffect(loginState) {
                if (loginState !is LoginState.Success) {
                    navController.navigate("login") {
                        popUpTo("splash") { inclusive = true }
                    }
                }
            }
            val aiConversationViewModel: AiConversationViewModel = viewModel()
            AiConversationScreen(aiConversationViewModel = aiConversationViewModel)
        }
        composable("responsiveTest") { // Add Responsive Test destination
            // Check if user is logged in
            LaunchedEffect(loginState) {
                if (loginState !is LoginState.Success) {
                    navController.navigate("login") {
                        popUpTo("splash") { inclusive = true }
                    }
                }
            }
            ResponsiveTestScreen()
        }
        
        composable("liveAvatar") { // Add Live Avatar destination
            // Check if user is logged in
            LaunchedEffect(loginState) {
                if (loginState !is LoginState.Success) {
                    navController.navigate("login") {
                        popUpTo("splash") { inclusive = true }
                    }
                }
            }
            val streamingViewModel: StreamingViewModel = viewModel()
            StreamingScreen(viewModel = streamingViewModel)
        }
        
        composable("faceGen") { // Add Face Gen destination
            // Check if user is logged in
            LaunchedEffect(loginState) {
                if (loginState !is LoginState.Success) {
                    navController.navigate("login") {
                        popUpTo("splash") { inclusive = true }
                    }
                }
            }
            val faceGenViewModel: FaceGenViewModel = viewModel()
            FaceGenScreen(faceGenViewModel = faceGenViewModel)
        }
        
        composable("imageToImage") { backStackEntry ->
            // Check if user is logged in
            LaunchedEffect(loginState) {
                if (loginState !is LoginState.Success) {
                    navController.navigate("login") {
                        popUpTo("splash") { inclusive = true }
                    }
                }
            }
            // Get parent entry to share ViewModel
            val parentEntry = remember(backStackEntry) {
                navController.getBackStackEntry("imageToImage")
            }
            val imageToImageViewModel: UnifiedImageToImageViewModel = viewModel(parentEntry)
            ImageToImageScreen(
                viewModel = imageToImageViewModel,
                onNavigateToGallery = {
                    navController.navigate("imageToImageGallery")
                }
            )
        }
        
        composable("imageToImageGallery") { backStackEntry -> // Add Gallery destination
            // Check if user is logged in
            LaunchedEffect(loginState) {
                if (loginState !is LoginState.Success) {
                    navController.navigate("login") {
                        popUpTo("splash") { inclusive = true }
                    }
                }
            }
            // Get parent entry to share ViewModel
            val parentEntry = remember(backStackEntry) {
                navController.getBackStackEntry("imageToImage")
            }
            val imageToImageViewModel: UnifiedImageToImageViewModel = viewModel(parentEntry)
            GalleryScreen(
                viewModel = imageToImageViewModel,
                onBack = {
                    navController.popBackStack()
                }
            )
        }
        
        composable("stabilityAI") { // Add Stability AI destination
            // Check if user is logged in
            LaunchedEffect(loginState) {
                if (loginState !is LoginState.Success) {
                    navController.navigate("login") {
                        popUpTo("splash") { inclusive = true }
                    }
                }
            }
            val stabilityViewModel: StabilityImageToImageViewModel = viewModel()
            StabilityImageToImageScreen(viewModel = stabilityViewModel)
        }
        
        composable("sketchToImage") { // Add Sketch to Image destination
            // Check if user is logged in
            LaunchedEffect(loginState) {
                if (loginState !is LoginState.Success) {
                    navController.navigate("login") {
                        popUpTo("splash") { inclusive = true }
                    }
                }
            }
            val sketchToImageViewModel: SketchToImageViewModel = viewModel()
            SketchToImageScreen(
                onBackClick = { navController.popBackStack() },
                viewModel = sketchToImageViewModel
            )
        }
        
        composable("newVideoGeneration") { // Add new video generation destination
            // Check if user is logged in
            LaunchedEffect(loginState) {
                if (loginState !is LoginState.Success) {
                    navController.navigate("login") {
                        popUpTo("splash") { inclusive = true }
                    }
                }
            }
            NewVideoGenerationScreen(navController = navController)
        }
        
        composable("styledVideoGeneration") { // Add styled video generation destination
            // Check if user is logged in
            LaunchedEffect(loginState) {
                if (loginState !is LoginState.Success) {
                    navController.navigate("login") {
                        popUpTo("splash") { inclusive = true }
                    }
                }
            }
            EnhancedVideoGenerationScreen(navController = navController)
        }
        
        composable(
            "videoPlayer?videoUrl={videoUrl}",
            arguments = listOf(navArgument("videoUrl") {
                type = NavType.StringType
            })
        ) { backStackEntry ->
            // Check if user is logged in
            LaunchedEffect(loginState) {
                if (loginState !is LoginState.Success) {
                    navController.navigate("login") {
                        popUpTo("splash") { inclusive = true }
                    }
                }
            }
            val videoUrl = backStackEntry.arguments?.getString("videoUrl") ?: ""
            VideoPlayerScreen(navController = navController, videoUrl = videoUrl)
        }

        // Add other destinations here (translator)
        }
    }
}


