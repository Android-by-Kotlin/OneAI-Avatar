package max.ohm.oneai.videogeneration

import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import androidx.lifecycle.viewmodel.compose.viewModel
import kotlinx.coroutines.launch
import androidx.navigation.NavController

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun NewVideoGenerationScreen(navController: NavController) {
    val viewModel: NewVideoGenerationViewModel = viewModel()
    val state = viewModel.state.collectAsState().value
    val scope = rememberCoroutineScope()
    val snackbarHostState = remember { SnackbarHostState() }
    var prompt by remember { mutableStateOf("") }

    Scaffold(
        snackbarHost = { SnackbarHost(snackbarHostState) }
    ) { paddingValues ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
                .padding(16.dp),
            verticalArrangement = Arrangement.Center
        ) {
            OutlinedTextField(
                value = prompt,
                onValueChange = { prompt = it },
                label = { Text("Enter Video Prompt") },
                modifier = Modifier.fillMaxWidth()
            )

            Spacer(modifier = Modifier.height(16.dp))

            Button(
                onClick = {
                    viewModel.generateVideo(prompt)
                },
                modifier = Modifier.fillMaxWidth(),
                enabled = !state.isLoading
            ) {
                Text("Generate Video")
            }

            if (state.isLoading) {
                Spacer(modifier = Modifier.height(16.dp))
                CircularProgressIndicator(modifier = Modifier.align(Alignment.CenterHorizontally))
            }

            if (state.videoUrl != null) {
                LaunchedEffect(state.videoUrl) {
                    // Navigate to video player screen or display the video
                    navController.navigate("videoPlayer?videoUrl=${state.videoUrl}")
                }
            }

            if (state.error != null) {
                LaunchedEffect(state.error) {
                    scope.launch {
                        snackbarHostState.showSnackbar(state.error)
                        viewModel.clearError()
                    }
                }
            }
        }
    }
}
