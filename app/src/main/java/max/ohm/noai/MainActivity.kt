package max.ohm.noai

import android.os.Bundle
import android.util.Base64
import android.widget.Toast
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.input.TextFieldValue
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import androidx.lifecycle.viewmodel.compose.viewModel
import coil.compose.AsyncImage
import kotlinx.coroutines.launch
import max.ohm.noai.network.ApiClient
import max.ohm.noai.network.ImageGenerationRequest
import max.ohm.noai.ui.theme.NoAITheme
import java.lang.Exception


const val NEBIUS_API_KEY = "eyJhbGciOiJIUzI1NiIsImtpZCI6IlV6SXJWd1h0dnprLVRvdzlLZWstc0M1akptWXBvX1VaVkxUZlpnMDRlOFUiLCJ0eXAiOiJKV1QifQ.eyJzdWIiOiJnb29nbGUtb2F1dGgyfDExNzMzMjc0NDkyMTc2NTUzNzU3NyIsInNjb3BlIjoib3BlbmlkIG9mZmxpbmVfYWNjZXNzIiwiaXNzIjoiYXBpX2tleV9pc3N1ZXIiLCJhdWQiOlsiaHR0cHM6Ly9uZWJpdXMtaW5mZXJlbmNlLmV1LmF1dGgwLmNvbS9hcGkvdjIvIl0sImV4cCI6MTkwMzQyNTY0OCwidXVpZCI6IjczMjQwMTAzLTgxOGEtNGZjZi1iNDkxLWIxOGI3NGNjMzgzZiIsIm5hbWUiOiJOb3RBaSIsImV4cGlyZXNfYXQiOiIyMDMwLTA0LTI2VDA5OjIwOjQ4KzAwMDAifQ.R_RBh9AdEQV8EHRtYXD364EevZV6HR8dCh2TKORTztE"

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            NoAITheme {
                Surface(
                    modifier = Modifier.fillMaxSize(),
                    color = MaterialTheme.colorScheme.background
                ) {
                    ImageGeneratorScreen()
                }
            }
        }
    }
}

// --- ViewModel ---
class MainViewModel : ViewModel() {
    var prompt by mutableStateOf(TextFieldValue(""))
        private set // Allow external read but only internal write

    var generatedImageData by mutableStateOf<ByteArray?>(null)
        private set

    var isLoading by mutableStateOf(false)
        private set

    var errorMessage by mutableStateOf<String?>(null) // For showing Toast
        private set

    fun onPromptChange(newPrompt: TextFieldValue) {
        prompt = newPrompt
    }

    fun clearErrorMessage() {
        errorMessage = null
    }

    fun generateImage() {
        if (NEBIUS_API_KEY == "YOUR_NEBIUS_API_KEY_HERE") {
            errorMessage = "Please replace 'YOUR_NEBIUS_API_KEY_HERE' in MainActivity.kt"
            return
        }
        if (prompt.text.isBlank()) {
            errorMessage = "Please enter a prompt"
            return
        }

        isLoading = true
        generatedImageData = null // Clear previous image
        errorMessage = null

        viewModelScope.launch {
            try {
                val request = ImageGenerationRequest(prompt = prompt.text)
                // Add the "Bearer " prefix to the API key for the Authorization header
                val apiKeyHeader = "Bearer $NEBIUS_API_KEY"
                val response = ApiClient.instance.generateImage(apiKeyHeader, request)

                if (response.isSuccessful && response.body() != null) {
                    val responseBody = response.body()!!
                    if (responseBody.data.isNotEmpty()) {
                        // Decode Base64 image data
                        val base64String = responseBody.data[0].base64Json
                        generatedImageData = Base64.decode(base64String, Base64.DEFAULT)
                    } else {
                        errorMessage = "API returned no image data."
                    }
                } else {
                    // Handle API error (e.g., invalid key, server error)
                    val errorBody = response.errorBody()?.string() ?: "Unknown API error"
                    errorMessage = "API Error: ${response.code()} - $errorBody"
                    System.err.println("API Error: ${response.code()} - $errorBody") // Log error
                }

            } catch (e: Exception) {
                errorMessage = "Network or other error: ${e.localizedMessage}"
                e.printStackTrace() // Log the full stack trace
            } finally {
                isLoading = false
            }
        }
    }
}


// --- Composable UI ---
@Composable
fun ImageGeneratorScreen(viewModel: MainViewModel = viewModel()) {
    val context = LocalContext.current
    val prompt = viewModel.prompt
    val generatedImageData = viewModel.generatedImageData
    val isLoading = viewModel.isLoading
    val errorMessage = viewModel.errorMessage

    // Show Toast when errorMessage changes
    LaunchedEffect(errorMessage) {
        errorMessage?.let {
            Toast.makeText(context, it, Toast.LENGTH_LONG).show()
            viewModel.clearErrorMessage() // Clear message after showing
        }
    }

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp),
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        // Image Display Area
        Box(
            modifier = Modifier
                .fillMaxWidth()
                .weight(1f) // Takes up available space
                .padding(bottom = 16.dp),
            contentAlignment = Alignment.Center
        ) {
            if (isLoading) {
                CircularProgressIndicator()
            } else if (generatedImageData != null) {
                // Use Coil's AsyncImage to load the ByteArray
                 AsyncImage(
                    model = generatedImageData,
                    contentDescription = "Generated Image",
                    modifier = Modifier.fillMaxSize(), // Fill the box
                    contentScale = ContentScale.Fit // Fit within bounds, maintain aspect ratio
                )
            } else {
                // Placeholder or initial state text
                Text("Enter a prompt and click Generate")
            }
        }

        // Input Field
        OutlinedTextField(
            value = prompt,
            onValueChange = { viewModel.onPromptChange(it) },
            label = { Text("Enter Prompt") },
            modifier = Modifier.fillMaxWidth(),
            singleLine = true,
            enabled = !isLoading
        )

        Spacer(modifier = Modifier.height(16.dp))

        // Generate Button
        Button(
            onClick = { viewModel.generateImage() },
            enabled = !isLoading && prompt.text.isNotBlank(),
            modifier = Modifier.fillMaxWidth()
        ) {
            Text(if (isLoading) "Generating..." else "Generate")
        }
    }
}

@Preview(showBackground = true)
@Composable
fun DefaultPreview() {
    NoAITheme {
        ImageGeneratorScreen()
    }
}
