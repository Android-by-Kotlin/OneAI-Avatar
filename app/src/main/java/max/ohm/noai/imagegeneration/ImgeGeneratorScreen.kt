package max.ohm.noai.imagegeneration

import android.widget.Toast
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Button
import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.unit.dp
import androidx.lifecycle.viewmodel.compose.viewModel
import coil.compose.AsyncImage


// --- Image Generator Screen Composable ---
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