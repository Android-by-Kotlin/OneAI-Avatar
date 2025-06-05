package max.ohm.noai.aiconversation.llm

import android.widget.Toast
import androidx.compose.foundation.BorderStroke
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Send
import androidx.compose.material.icons.filled.Settings
import androidx.compose.material3.Button
import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.material3.DropdownMenu
import androidx.compose.material3.DropdownMenuItem
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.LocalContentColor
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.OutlinedButton
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.material3.TopAppBar
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.lifecycle.viewmodel.compose.viewModel
import max.ohm.noai.chatbot.MessageBubble

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun OpenRouterScreen(
    openRouterViewModel: OpenRouterViewModel = viewModel(),
    initialModelType: String? = null
) {
    val context = LocalContext.current
    val messages = openRouterViewModel.messages
    val inputText = openRouterViewModel.inputText
    val isLoading = openRouterViewModel.isLoading
    val errorMessage = openRouterViewModel.errorMessage
    val selectedModel = openRouterViewModel.selectedModel
    
    var showModelDropdown by remember { mutableStateOf(false) }
    
    val availableModels = listOf(
        "deepseek/deepseek-r1-0528:free",
        "meta-llama/llama-3-70b-instruct:free",
        "google/gemini-1.5-pro:free",
        "anthropic/claude-3-sonnet:free"
    )
    
    LaunchedEffect(initialModelType) {
        initialModelType?.let {
            openRouterViewModel.updateSelectedModel(it)
        }
    }
    
    // Show Toast when errorMessage changes
    LaunchedEffect(errorMessage) {
        errorMessage?.let {
            Toast.makeText(context, it, Toast.LENGTH_LONG).show()
            openRouterViewModel.clearErrorMessage() // Clear message after showing
        }
    }
    
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("OpenRouter AI Chat") },
                actions = {
                    IconButton(onClick = { showModelDropdown = true }) {
                        Icon(Icons.Filled.Settings, contentDescription = "Select Model")
                    }
                    DropdownMenu(
                        expanded = showModelDropdown,
                        onDismissRequest = { showModelDropdown = false }
                    ) {
                        availableModels.forEach { model ->
                            val modelName = model.substringAfterLast('/').substringBefore(':')
                            val isSelected = model == selectedModel
                            
                            DropdownMenuItem(
                                text = { 
                                    Text(
                                        text = modelName,
                                        fontWeight = if (isSelected) FontWeight.Bold else FontWeight.Normal,
                                        color = if (isSelected) MaterialTheme.colorScheme.primary else Color.Unspecified
                                    ) 
                                },
                                onClick = {
                                    openRouterViewModel.updateSelectedModel(model)
                                    showModelDropdown = false
                                }
                            )
                        }
                    }
                }
            )
        },
        bottomBar = {
            Column(modifier = Modifier.padding(8.dp)) {
                // Model indicator
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.Center
                ) {
                    Text(
                        text = "Using: ${selectedModel.substringAfterLast('/').substringBefore(':')}",
                        color = MaterialTheme.colorScheme.primary,
                        fontWeight = FontWeight.Bold,
                        modifier = Modifier.padding(bottom = 8.dp)
                    )
                }
                
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    OutlinedTextField(
                        value = inputText,
                        onValueChange = { openRouterViewModel.updateInputText(it) },
                        label = { Text("Type a prompt") },
                        modifier = Modifier.weight(1f),
                        singleLine = false,
                        maxLines = 5,
                        enabled = !isLoading,
                        shape = RoundedCornerShape(45.dp)
                    )
                    
                    Spacer(modifier = Modifier.width(8.dp))
                    
                    Button(
                        onClick = { openRouterViewModel.sendMessage() },
                        enabled = !isLoading && inputText.text.isNotBlank(),
                        shape = RoundedCornerShape(50),
                        contentPadding = PaddingValues(12.dp)
                    ) {
                        if (isLoading) {
                            CircularProgressIndicator(
                                modifier = Modifier.size(24.dp),
                                color = LocalContentColor.current,
                                strokeWidth = 2.dp
                            )
                        } else {
                            Icon(Icons.Filled.Send, contentDescription = "Send")
                        }
                    }
                }
            }
        }
    ) { paddingValues ->
        LazyColumn(
            modifier = Modifier
                .padding(paddingValues)
                .padding(horizontal = 8.dp)
                .fillMaxSize(),
            reverseLayout = true
        ) {
            items(messages.reversed(), key = { message -> message.hashCode() + message.text.hashCode() }) { message ->
                MessageBubble(message = message)
                Spacer(modifier = Modifier.height(8.dp))
            }
        }
    }
} 