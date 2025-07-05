package max.ohm.oneai.navigationsystem

import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
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
import max.ohm.oneai.imagegeneration.ImageGeneratorScreen
import max.ohm.oneai.imagegeneration.UnifiedImageViewModel
import max.ohm.oneai.login.LoginSignupScreen
import max.ohm.oneai.login.LoginState
import max.ohm.oneai.login.LoginViewModel
import max.ohm.oneai.profile.ProfileScreen
import max.ohm.oneai.splash.SplashScreen
import max.ohm.oneai.videogeneration.VideoGenerationScreen

// --- Navigation ---
@Composable
fun AppNavigation() {
    val navController = rememberNavController()
    
    // Create a shared LoginViewModel instance to prevent recreation during navigation
    val loginViewModel: LoginViewModel = viewModel()
    val loginState by loginViewModel.loginState.collectAsState()
    
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
            SimpleHomeScreen(navController = navController, loginViewModel = loginViewModel)
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
            VideoGenerationScreen()
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

        // Add other destinations here (translator)
    }
}


