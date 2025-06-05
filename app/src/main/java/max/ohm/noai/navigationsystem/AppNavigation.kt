package max.ohm.noai.navigationsystem

import androidx.compose.runtime.Composable
import androidx.lifecycle.viewmodel.compose.viewModel
import androidx.navigation.NavType
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import androidx.navigation.navArgument
import max.ohm.noai.aiconversation.conversation.AiConversationScreen
import max.ohm.noai.aiconversation.conversation.AiConversationViewModel
import max.ohm.noai.aiconversation.llm.OpenRouterScreen
import max.ohm.noai.aiconversation.llm.OpenRouterViewModel
import max.ohm.noai.aiconversation.tts.TtsScreen
import max.ohm.noai.aiconversation.tts.TtsViewModel
import max.ohm.noai.aitalk.AiTalkScreen
import max.ohm.noai.aitalk.AiTalkViewModel
import max.ohm.noai.chatbot.ChatBotScreen
import max.ohm.noai.chatbot.UnifiedChatBotViewModel
import max.ohm.noai.homescreen.HomeScreen
import max.ohm.noai.imagegeneration.ImageGeneratorScreen
import max.ohm.noai.imagegeneration.UnifiedImageViewModel
import max.ohm.noai.musicgeneration.MusicGeneratorScreen
import max.ohm.noai.musicgeneration.MusicViewModel
import max.ohm.noai.videogeneration.VideoGenerationScreen

// --- Navigation ---
@Composable
fun AppNavigation() {
    val navController = rememberNavController()
    NavHost(navController = navController, startDestination = "home") {
        composable("home") {
            HomeScreen(navController = navController)
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
                defaultValue = "deepseek/deepseek-r1-0528:free" // Default model
            })
        ) { backStackEntry ->
            val modelType = backStackEntry.arguments?.getString("modelType")
            val openRouterViewModel: OpenRouterViewModel = viewModel()
            OpenRouterScreen(openRouterViewModel = openRouterViewModel, initialModelType = modelType)
        }
        composable("aiMusic") { // Add AI music generator destination
            val musicViewModel: MusicViewModel = viewModel()
            MusicGeneratorScreen(viewModel = musicViewModel)
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
