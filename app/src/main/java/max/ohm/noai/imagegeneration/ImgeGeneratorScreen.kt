package max.ohm.noai.imagegeneration

import android.widget.Toast
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.BorderStroke
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Row
import androidx.compose.material3.Button
import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.material3.OutlinedButton
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.unit.dp
import androidx.lifecycle.viewmodel.compose.viewModel
import coil.compose.AsyncImage


// --- Image Generator Screen Composable ---
@Composable
fun ImageGeneratorScreen(
    unifiedImageViewModel: UnifiedImageViewModel = viewModel(),
    initialModelType: String? = null
) {
    val context = LocalContext.current
    val prompt = unifiedImageViewModel.prompt
    val generatedImageData = unifiedImageViewModel.generatedImageData
    val imageUrl = unifiedImageViewModel.imageUrl
    val isLoading = unifiedImageViewModel.isLoading
    val errorMessage = unifiedImageViewModel.errorMessage
    val selectedModel = unifiedImageViewModel.selectedModel

    LaunchedEffect(initialModelType) {
        initialModelType?.let {
            unifiedImageViewModel.updateSelectedModel(it)
        }
    }

    // Show Toast when errorMessage changes
    LaunchedEffect(errorMessage) {
        errorMessage?.let {
            Toast.makeText(context, it, Toast.LENGTH_LONG).show()
            unifiedImageViewModel.clearErrorMessage() // Clear message after showing
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
            } else if (imageUrl != null) {
                // Use Coil's AsyncImage to load the URL
                AsyncImage(
                    model = imageUrl,
                    contentDescription = "Generated Image",
                    modifier = Modifier.fillMaxSize(), // Fill the box
                    contentScale = ContentScale.Fit // Fit within bounds, maintain aspect ratio
                )
            } else {
                // Placeholder or initial state text
                Text("Enter a prompt and click Generate")
            }
        }

        // Model Selection Bar
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceAround,
            verticalAlignment = Alignment.CenterVertically
        ) {
            OutlinedButton(
                onClick = { unifiedImageViewModel.updateSelectedModel("flux.1.1-pro") },
                border = if (selectedModel == "flux.1.1-pro") BorderStroke(2.dp, Color.Blue) else BorderStroke(1.dp, Color.Gray)
            ) {
                Text("flux.1.1-pro")
            }
            OutlinedButton(
                onClick = { unifiedImageViewModel.updateSelectedModel("flux.1-schnell") },
                border = if (selectedModel == "flux.1-schnell") BorderStroke(2.dp, Color.Blue) else BorderStroke(1.dp, Color.Gray)
            ) {
                Text("flux.1-schnell")
            }
        }
        Spacer(modifier = Modifier.height(16.dp))

        // Input Field
        OutlinedTextField(
            value = prompt,
            onValueChange = { unifiedImageViewModel.updatePrompt(it) },
            label = { Text("Enter Prompt") },
            modifier = Modifier.fillMaxWidth(),
            singleLine = true,
            enabled = !isLoading
        )

        Spacer(modifier = Modifier.height(16.dp))

        // Generate Button
        Button(
            onClick = { unifiedImageViewModel.generateImage() },
            enabled = !isLoading && prompt.text.isNotBlank(),
            modifier = Modifier.fillMaxWidth()
        ) {
            Text(if (isLoading) "Generating..." else "Generate")
        }
    }
}
