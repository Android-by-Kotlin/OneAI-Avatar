package max.ohm.oneai.chatbot

/**
 * Demo examples showing how to format bot responses
 */
object FormattedResponseDemo {
    
    // Example 1: Building an app with Jetpack Compose
    val composeBuildGuideResponse = """
# Building an app in Jetpack Compose with Kotlin

Great! Building an app in Jetpack Compose with Kotlin is a modern, efficient way to make Android applications. Let me guide you through a step-by-step approach.

✅ Prerequisites
• Android Studio (Hedgehog or later)
• Kotlin knowledge (even basic is fine)
• Enable Jetpack Compose in your project

Step 1: Create a New Compose Project

Open Android Studio and select "New Project". Choose "Empty Compose Activity" template.

Step 2: Project Structure

Here's the basic Compose project file structure:

```kotlin
@Composable
fun MainScreen() {
    Surface(
        modifier = Modifier.fillMaxSize(),
        color = MaterialTheme.colorScheme.background
    ) {
        Greeting("Android")
    }
}

@Composable
fun Greeting(name: String, modifier: Modifier = Modifier) {
    Text(
        text = "Hello ${'$'}name!",
        modifier = modifier
    )
}
```

Step 3: Understand the MainActivity.kt File

```kotlin
class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            MyAppTheme {
                MainScreen()
            }
        }
    }
}
```

Step 4: Add a Composable UI

Let's create a simple login form:

```kotlin
@Composable
fun LoginScreen() {
    var username by remember { mutableStateOf("") }
    var password by remember { mutableStateOf("") }
    
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        TextField(
            value = username,
            onValueChange = { username = it },
            label = { Text("Username") },
            modifier = Modifier.fillMaxWidth()
        )
        
        Spacer(modifier = Modifier.height(8.dp))
        
        TextField(
            value = password,
            onValueChange = { password = it },
            label = { Text("Password") },
            visualTransformation = PasswordVisualTransformation(),
            modifier = Modifier.fillMaxWidth()
        )
        
        Spacer(modifier = Modifier.height(16.dp))
        
        Button(
            onClick = { /* Handle login */ },
            modifier = Modifier.fillMaxWidth()
        ) {
            Text("Login")
        }
    }
}
```

💡 Next Steps (Optional)
Once the basics are done, you can enhance your app with:
• Navigation using Jetpack Navigation Compose
• State management with ViewModel
• Network calls with Retrofit
• Database with Room

Would you like me to explain any specific part in more detail or help you build a specific type of app (e.g., AI, chat, or media app)?
""".trimIndent()

    // Example 2: Compose Kotlin App Guidance
    val kotlinAppGuidanceResponse = """
# Compose Kotlin App Guidance

I want to build an app in jetpack compose environment to make this app.

Step 1: Set Up Your Development Environment

Physical Android Studio Artist Fox (Fox is the latest)
• Choose "Empty Compose Activity"
• Language: Kotlin
• Minimum SDK: API 21+

Step 2: Build Your First Composable Example - Simple Counter App

```kotlin
@Composable
fun CounterApp() {
    var count by remember { mutableStateOf(0) }
    
    Column(
        modifier = Modifier.fillMaxSize(),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        Text(
            text = "Count: ${'$'}count",
            style = MaterialTheme.typography.headlineLarge
        )
        
        Spacer(modifier = Modifier.height(16.dp))
        
        Row {
            Button(
                onClick = { count-- },
                modifier = Modifier.padding(8.dp)
            ) {
                Text("-")
            }
            
            Button(
                onClick = { count++ },
                modifier = Modifier.padding(8.dp)
            ) {
                Text("+")
            }
        }
    }
}
```

Step 3: Design Your UI

Use Material Design components like Column, Row, Card for common UI elements.

⚠️ Important considerations:
Remember, in Compose everything is a @Composable function!

Step 4: Manage State

Use `remember` and `mutableStateOf` for local state. For complex state, consider using ViewModel with LiveData/StateFlow.

```kotlin
class MainViewModel : ViewModel() {
    private val _uiState = MutableStateFlow(UiState())
    val uiState: StateFlow<UiState> = _uiState.asStateFlow()
    
    fun updateData(newData: String) {
        _uiState.update { currentState ->
            currentState.copy(data = newData)
        }
    }
}
```

Step 5: Add More Features

I'll help you with:
• Navigation setup
• Database integration (Room)
• Network calls (Retrofit/Ktor)
• Permissions handling

What type of app would you like to build? Let me know, and I can help with specific code and step-by-step guidance!
""".trimIndent()

    // Example 3: Next Steps response
    val nextStepsResponse = """
# Next Steps

Once the basics are done, you can add these features to enhance your app:

• Add navigation → `implementation "androidx.navigation:navigation-compose:2.7.5"`
• State management → Use ViewModel with StateFlow/LiveData
• Network calls → Retrofit/Ktor for API calls
• Local database → Room Database
• Authentication → Firebase Auth
• Push notifications → Firebase Cloud Messaging

Example Projects You Can Try:
• Todo List App
• Weather App (API)
• Chat App
• Expense Tracker
• Notes App with Room Database

Would you like me to generate the full code with folders or help you build a specific feature in your app (e.g., AI, chat, social media app)?
""".trimIndent()

    // Example 4: Response with all section types
    val allSectionTypesResponse = """
# Complete Guide to Building a Chat App

I'll help you build a complete chat application using Jetpack Compose and Kotlin.

✅ Prerequisites
• Android Studio installed
• Basic Kotlin knowledge
• Understanding of Compose basics
• Firebase account for backend

Step 1: Project Setup

Create a new Jetpack Compose project and add the necessary dependencies:

```gradle
dependencies {
    // Compose BOM
    implementation platform('androidx.compose:compose-bom:2023.10.01')
    
    // Firebase
    implementation 'com.google.firebase:firebase-auth-ktx'
    implementation 'com.google.firebase:firebase-firestore-ktx'
    
    // Navigation
    implementation "androidx.navigation:navigation-compose:2.7.5"
    
    // ViewModel
    implementation "androidx.lifecycle:lifecycle-viewmodel-compose:2.6.2"
}
```

Step 2: Create the Chat UI

Here's a basic chat screen composable:

```kotlin
@Composable
fun ChatScreen(
    viewModel: ChatViewModel = viewModel()
) {
    val messages by viewModel.messages.collectAsState()
    val currentMessage by viewModel.currentMessage.collectAsState()
    
    Column(
        modifier = Modifier.fillMaxSize()
    ) {
        // Messages list
        LazyColumn(
            modifier = Modifier.weight(1f),
            reverseLayout = true
        ) {
            items(messages) { message ->
                MessageBubble(message)
            }
        }
        
        // Input field
        ChatInputField(
            value = currentMessage,
            onValueChange = viewModel::updateMessage,
            onSend = viewModel::sendMessage
        )
    }
}
```

💡 Pro tip: Use `reverseLayout = true` in LazyColumn to automatically scroll to the latest message at the bottom.

Step 3: Implement Real-time Updates

For real-time chat functionality:

• Use Firebase Firestore for message storage
• Implement SnapshotListener for real-time updates
• Handle offline caching with Firestore

⚠️ Security Warning: Never expose your Firebase credentials in your code. Use Firebase security rules to protect your data.

Additional Features to Consider:

• Message encryption
• Image/file sharing
• Voice messages
• Read receipts
• Typing indicators
• Push notifications

Would you like me to dive deeper into any specific feature or help you implement the complete chat functionality?
""".trimIndent()

    // Function to get a demo response based on type
    fun getDemoResponse(type: String): String {
        return when (type) {
            "compose_build" -> composeBuildGuideResponse
            "kotlin_guidance" -> kotlinAppGuidanceResponse
            "next_steps" -> nextStepsResponse
            "all_sections" -> allSectionTypesResponse
            else -> composeBuildGuideResponse
        }
    }
}
