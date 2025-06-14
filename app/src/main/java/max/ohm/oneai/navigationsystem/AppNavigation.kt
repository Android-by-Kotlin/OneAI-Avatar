package max.ohm.oneai.navigationsystem

import androidx.compose.runtime.Composable
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
import max.ohm.oneai.chatbot.UnifiedChatBotViewModel
import max.ohm.oneai.homescreen.SimpleHomeScreen
import max.ohm.oneai.imagegeneration.ImageGeneratorScreen
import max.ohm.oneai.imagegeneration.UnifiedImageViewModel
import max.ohm.oneai.login.LoginSignupScreen
import max.ohm.oneai.login.LoginViewModel
import max.ohm.oneai.splash.SplashScreen
import max.ohm.oneai.videogeneration.VideoGenerationScreen

// --- Navigation ---
@Composable
fun AppNavigation() {
    val navController = rememberNavController()
    
    // Create a shared LoginViewModel instance to prevent recreation during navigation
    val loginViewModel: LoginViewModel = viewModel()
    
    NavHost(navController = navController, startDestination = "splash") {
        composable("splash") {
            SplashScreen(navController = navController)
        }
        composable("login") {
            LoginSignupScreen(navController = navController)
        }
        composable("home") {
            SimpleHomeScreen(navController = navController)
        }
        composable(
            "imageGenerator?model={modelType}",
            arguments = listOf(navArgument("modelType") {
                type = NavType.StringType
                nullable = true
                defaultValue = "flux.1.1-pro" // Default to the original model
            })
        ) { backStackEntry ->
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
            val modelType = backStackEntry.arguments?.getString("modelType")
            val unifiedChatBotViewModel: UnifiedChatBotViewModel = viewModel() // Use UnifiedChatBotViewModel
            ChatBotScreen(unifiedChatBotViewModel = unifiedChatBotViewModel, initialModelType = modelType)
        }
        composable(
            "openRouter?model={modelType}", // Route for OpenRouter screen
            arguments = listOf(navArgument("modelType") {
                type = NavType.StringType
                nullable = true
                defaultValue = "google/gemini-2.0-flash" // Default model
            })
        ) { backStackEntry ->
            val modelType = backStackEntry.arguments?.getString("modelType")
            val openRouterViewModel: OpenRouterViewModel = viewModel()
            OpenRouterScreen(openRouterViewModel = openRouterViewModel, initialModelType = modelType)
        }
        composable("videoGeneration") { // Add AI video generation destination
            VideoGenerationScreen()
        }
        composable("aiTalk") { // Add AI Talk destination
            val aiTalkViewModel: AiTalkViewModel = viewModel()
            AiTalkScreen(aiTalkViewModel = aiTalkViewModel)
        }
        composable("tts") { // Add Text-to-Speech destination
            val ttsViewModel: TtsViewModel = viewModel()
            TtsScreen(ttsViewModel = ttsViewModel)
        }
        composable("aiConversation") { // Add AI Conversation destination
            val aiConversationViewModel: AiConversationViewModel = viewModel()
            AiConversationScreen(aiConversationViewModel = aiConversationViewModel)
        }

        // Add other destinations here (translator)
    }
}


