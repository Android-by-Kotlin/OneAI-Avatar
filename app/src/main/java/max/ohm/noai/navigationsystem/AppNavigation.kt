package max.ohm.noai.navigationsystem

import androidx.compose.runtime.Composable
import androidx.lifecycle.viewmodel.compose.viewModel
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import max.ohm.noai.chatbot.ChatBotScreen
import max.ohm.noai.homescreen.HomeScreen
import max.ohm.noai.imagegeneration.ImageGeneratorScreen
import max.ohm.noai.imagegeneration.UnifiedImageViewModel // Import the new ViewModel
import max.ohm.noai.ai_music.AiMusicScreen
import max.ohm.noai.ai_music.AiMusicViewModel
import max.ohm.noai.musicgeneration.MusicGeneratorScreen
import max.ohm.noai.musicgeneration.MusicViewModel
import max.ohm.noai.chatbot.UnifiedChatBotViewModel // Import the new UnifiedChatBotViewModel
import androidx.navigation.NavType
import androidx.navigation.navArgument

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
                defaultValue = "gemini-flash" // Default to Gemini Flash
            })
        ) { backStackEntry ->
            val modelType = backStackEntry.arguments?.getString("modelType")
            val unifiedChatBotViewModel: UnifiedChatBotViewModel = viewModel() // Use UnifiedChatBotViewModel
            ChatBotScreen(unifiedChatBotViewModel = unifiedChatBotViewModel, initialModelType = modelType)
        }
        composable("aiMusic") { // Add AI music generator destination
//            val aiMusicViewModel: AiMusicViewModel = AiMusicViewModel()
//            AiMusicScreen(viewModel = aiMusicViewModel)
            val musicViewModel: MusicViewModel = viewModel()
            MusicGeneratorScreen(viewModel = musicViewModel)
        }
        // Add other destinations here (translator)
    }
}
