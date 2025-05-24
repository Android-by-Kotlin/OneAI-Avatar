package max.ohm.noai.navigationsystem

import androidx.compose.runtime.Composable
import androidx.lifecycle.viewmodel.compose.viewModel
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import max.ohm.noai.chatbot.ChatBotScreen
import max.ohm.noai.homescreen.HomeScreen
import max.ohm.noai.imagegeneration.ImageGeneratorScreen
import max.ohm.noai.imagegeneration.MainViewModel

// --- Navigation ---
@Composable
fun AppNavigation() {
    val navController = rememberNavController()
    NavHost(navController = navController, startDestination = "home") {
        composable("home") {
            HomeScreen(navController = navController)
        }
        composable("imageGenerator") {
            val viewModel: MainViewModel = viewModel()
            ImageGeneratorScreen(viewModel = viewModel)
        }
        composable("chatbot") { // Add chatbot destination
            ChatBotScreen()
        }
        // Add other destinations here (translator)
    }
}