package max.ohm.oneai.navigation

import androidx.compose.foundation.layout.padding
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.ui.Modifier
import androidx.navigation.NavController
import androidx.navigation.compose.currentBackStackEntryAsState
import max.ohm.oneai.components.BottomNavigationBar

@Composable
fun MainScaffold(
    navController: NavController,
    content: @Composable () -> Unit
) {
    val navBackStackEntry by navController.currentBackStackEntryAsState()
    val currentRoute = navBackStackEntry?.destination?.route
    
    // Define routes that should show the bottom navigation
    val bottomNavRoutes = listOf(
        "home",
        "chatbot",
        "videogeneration", 
        "imageToImage",
        "liveAvatar",
        "enhancedImageGenerator"
    )
    
    // Check if we should show the bottom navigation
    val shouldShowBottomNav = currentRoute in bottomNavRoutes
    
    Scaffold(
        bottomBar = {
            if (shouldShowBottomNav) {
                BottomNavigationBar(navController = navController)
            }
        }
    ) { paddingValues ->
        Surface(
            modifier = Modifier.padding(paddingValues)
        ) {
            content()
        }
    }
}
