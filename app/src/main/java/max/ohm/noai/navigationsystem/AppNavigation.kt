package max.ohm.noai.navigationsystem

import androidx.compose.runtime.Composable
import androidx.lifecycle.viewmodel.compose.viewModel
import androidx.navigation.NavType
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import androidx.navigation.navArgument
import max.ohm.noai.chatbot.ChatBotScreen
import max.ohm.noai.chatbot.UnifiedChatBotViewModel
import max.ohm.noai.homescreen.HomeScreen
import max.ohm.noai.imagegeneration.ImageGeneratorScreen
import max.ohm.noai.imagegeneration.UnifiedImageViewModel
import max.ohm.noai.llama4mavrick.LlamaMaverickChatScreen
import max.ohm.noai.llama4mavrick.LlamaMaverickViewModel
import max.ohm.noai.musicgeneration.MusicGeneratorScreen
import max.ohm.noai.musicgeneration.MusicViewModel

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
         composable("llamaMaverick") { // Add Llama Maverick destination
             val llamaMaverickViewModel: LlamaMaverickViewModel = viewModel()
             LlamaMaverickChatScreen(viewModel = llamaMaverickViewModel)
        }
        // Add other destinations here (translator)
    }
    }



