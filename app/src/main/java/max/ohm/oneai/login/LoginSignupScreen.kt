package max.ohm.oneai.login

import android.app.Activity
import androidx.activity.compose.rememberLauncherForActivityResult
import androidx.activity.result.contract.ActivityResultContracts
import androidx.compose.animation.AnimatedVisibility
import androidx.compose.animation.core.tween
import androidx.compose.animation.fadeIn
import androidx.compose.animation.fadeOut
import androidx.compose.animation.slideInVertically
import androidx.compose.animation.slideOutVertically
import androidx.compose.foundation.BorderStroke
import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Email
import androidx.compose.material.icons.filled.Lock
import androidx.compose.material.icons.filled.Person
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.input.ImeAction
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.lifecycle.viewmodel.compose.viewModel
import androidx.navigation.NavController
import com.google.android.gms.auth.api.signin.GoogleSignIn
import max.ohm.oneai.R

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun LoginSignupScreen(
    navController: NavController,
    loginViewModel: LoginViewModel = viewModel()
) {
    var showRegistration by remember { mutableStateOf(false) }
    var email by remember { mutableStateOf("") }
    var password by remember { mutableStateOf("") }
    var confirmPassword by remember { mutableStateOf("") }
    var name by remember { mutableStateOf("") }
    var showPassword by remember { mutableStateOf(false) }
    var showConfirmPassword by remember { mutableStateOf(false) }
    
    // Loading state
    var isLoading by remember { mutableStateOf(false) }
    
    // Error state
    var errorMessage by remember { mutableStateOf<String?>(null) }
    
    // Context for Google Sign-In
    val context = LocalContext.current
    
    // Google Sign-In launcher
    val googleSignInLauncher = rememberLauncherForActivityResult(
        contract = ActivityResultContracts.StartActivityForResult()
    ) { result ->
        if (result.resultCode == Activity.RESULT_OK) {
            val task = GoogleSignIn.getSignedInAccountFromIntent(result.data)
            loginViewModel.handleGoogleSignInResult(task)
        }
    }
    
    // Collect login state
    val loginState by loginViewModel.loginState.collectAsState()
    
    // Handle login state changes
    LaunchedEffect(loginState) {
        when (loginState) {
            is LoginState.Loading -> {
                isLoading = true
                errorMessage = null
            }
            is LoginState.Success -> {
                isLoading = false
                errorMessage = null
                // Navigate to home screen with proper navigation
                navController.navigate("home") {
                    popUpTo("splash") { inclusive = true }
                    launchSingleTop = true
                }
            }
            is LoginState.Error -> {
                isLoading = false
                errorMessage = (loginState as LoginState.Error).message
            }
            is LoginState.Idle -> {
                isLoading = false
            }
        }
    }

    // Modern gradient background
    Box(
        modifier = Modifier
            .fillMaxSize()
            .background(
                Brush.verticalGradient(
                    colors = listOf(
                        Color(0xFF0F0F23),
                        Color(0xFF1A1A2E),
                        Color(0xFF16213E)
                    )
                )
            )
    ) {
        // Background decorative elements
        Box(
            modifier = Modifier
                .fillMaxSize()
                .background(
                    Brush.radialGradient(
                        colors = listOf(
                            Color(0xFF6366F1).copy(alpha = 0.1f),
                            Color.Transparent
                        ),
                        radius = 800f
                    )
                )
        )
        
        Column(
            modifier = Modifier
                .fillMaxSize()
                .verticalScroll(rememberScrollState())
                .padding(24.dp),
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.Center
        ) {
            // Login Form
            AnimatedVisibility(
                visible = !showRegistration,
                enter = fadeIn(animationSpec = tween(600)) + slideInVertically(
                    animationSpec = tween(600),
                    initialOffsetY = { it / 4 }
                ),
                exit = fadeOut(animationSpec = tween(400)) + slideOutVertically(
                    animationSpec = tween(400),
                    targetOffsetY = { -it / 4 }
                )
            ) {
                LoginForm(
                    email = email,
                    password = password,
                    showPassword = showPassword,
                    isLoading = isLoading,
                    errorMessage = errorMessage,
                    onEmailChange = { email = it },
                    onPasswordChange = { password = it },
                    onPasswordVisibilityChange = { showPassword = !showPassword },
                    onLogin = {
                        if (email.isNotBlank() && password.isNotBlank()) {
                            loginViewModel.loginWithEmail(email, password)
                        } else {
                            errorMessage = "Please fill in all fields"
                        }
                    },
                    onGoogleSignIn = {
                        if (!isLoading) {
                            try {
                                // Clear any existing error message
                                errorMessage = null
                                // Get Google Sign-In client (which will sign out existing user to force account selection)
                                val googleSignInClient = loginViewModel.firebaseRepository.getGoogleSignInClient(context)
                                // Launch the sign-in intent
                                googleSignInLauncher.launch(googleSignInClient.signInIntent)
                            } catch (e: Exception) {
                                errorMessage = "Failed to start Google Sign-In: ${e.message}"
                            }
                        }
                    },
                    onShowRegistration = {
                        showRegistration = true
                        // Clear form data
                        email = ""
                        password = ""
                        errorMessage = null
                    }
                )
            }
            
            // Registration Form
            AnimatedVisibility(
                visible = showRegistration,
                enter = fadeIn(animationSpec = tween(600)) + slideInVertically(
                    animationSpec = tween(600),
                    initialOffsetY = { it / 4 }
                ),
                exit = fadeOut(animationSpec = tween(400)) + slideOutVertically(
                    animationSpec = tween(400),
                    targetOffsetY = { -it / 4 }
                )
            ) {
                SignUpForm(
                    name = name,
                    email = email,
                    password = password,
                    confirmPassword = confirmPassword,
                    showPassword = showPassword,
                    showConfirmPassword = showConfirmPassword,
                    isLoading = isLoading,
                    errorMessage = errorMessage,
                    onNameChange = { name = it },
                    onEmailChange = { email = it },
                    onPasswordChange = { password = it },
                    onConfirmPasswordChange = { confirmPassword = it },
                    onPasswordVisibilityChange = { showPassword = !showPassword },
                    onConfirmPasswordVisibilityChange = { showConfirmPassword = !showConfirmPassword },
                    onSignUp = {
                        if (name.isNotBlank() && email.isNotBlank() && password.isNotBlank() && confirmPassword.isNotBlank()) {
                            if (password == confirmPassword) {
                                loginViewModel.signUpWithEmail(email, password, name)
                            } else {
                                errorMessage = "Passwords do not match"
                            }
                        } else {
                            errorMessage = "Please fill in all fields"
                        }
                    },
                    onGoogleSignIn = {
                        if (!isLoading) {
                            try {
                                // Clear any existing error message
                                errorMessage = null
                                // Get Google Sign-In client (which will sign out existing user to force account selection)
                                val googleSignInClient = loginViewModel.firebaseRepository.getGoogleSignInClient(context)
                                // Launch the sign-in intent
                                googleSignInLauncher.launch(googleSignInClient.signInIntent)
                            } catch (e: Exception) {
                                errorMessage = "Failed to start Google Sign-In: ${e.message}"
                            }
                        }
                    },
                    onShowLogin = {
                        showRegistration = false
                        // Clear form data
                        name = ""
                        email = ""
                        password = ""
                        confirmPassword = ""
                        errorMessage = null
                    }
                )
            }
        }
    }
}

@Composable
private fun LoginForm(
    email: String,
    password: String,
    showPassword: Boolean,
    isLoading: Boolean,
    errorMessage: String?,
    onEmailChange: (String) -> Unit,
    onPasswordChange: (String) -> Unit,
    onPasswordVisibilityChange: () -> Unit,
    onLogin: () -> Unit,
    onGoogleSignIn: () -> Unit,
    onShowRegistration: () -> Unit
) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = 8.dp),
        shape = RoundedCornerShape(28.dp),
        colors = CardDefaults.cardColors(
            containerColor = Color(0xFF1E1E2E).copy(alpha = 0.95f)
        ),
        elevation = CardDefaults.cardElevation(
            defaultElevation = 20.dp
        )
    ) {
        Column(
            horizontalAlignment = Alignment.CenterHorizontally,
            modifier = Modifier.padding(32.dp)
        ) {
            // Logo and branding
            Box(
                modifier = Modifier
                    .size(80.dp)
                    .clip(RoundedCornerShape(20.dp)),
                contentAlignment = Alignment.Center
            ) {
                Image(
                    painter = painterResource(id = R.drawable.brain_logo_black),
                    contentDescription = "OneAI Brain Logo",
                    contentScale = ContentScale.Fit,
                    modifier = Modifier.fillMaxSize()
                )
            }
            
            Spacer(modifier = Modifier.height(24.dp))
            
            Text(
                text = "Welcome Back",
                color = Color.White,
                fontSize = 28.sp,
                fontWeight = FontWeight.Bold
            )
            
            Text(
                text = "Sign in to continue to OneAI",
                color = Color.White.copy(alpha = 0.7f),
                fontSize = 16.sp,
                modifier = Modifier.padding(bottom = 32.dp)
            )
            
            // Error message
            if (errorMessage != null) {
                Card(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(bottom = 16.dp),
                    colors = CardDefaults.cardColors(
                        containerColor = Color(0xFFFF5252).copy(alpha = 0.1f)
                    ),
                    shape = RoundedCornerShape(12.dp)
                ) {
                    Text(
                        text = errorMessage,
                        color = Color(0xFFFF5252),
                        fontSize = 14.sp,
                        textAlign = TextAlign.Center,
                        modifier = Modifier.padding(12.dp)
                    )
                }
            }
            
            // Email field with icon
            ModernTextField(
                value = email,
                onValueChange = onEmailChange,
                label = "Email Address",
                icon = Icons.Default.Email,
                keyboardOptions = KeyboardOptions(
                    keyboardType = KeyboardType.Email,
                    imeAction = ImeAction.Next
                )
            )
            
            Spacer(modifier = Modifier.height(16.dp))
            
            // Password field with icon and visibility toggle
            ModernTextField(
                value = password,
                onValueChange = onPasswordChange,
                label = "Password",
                icon = Icons.Default.Lock,
                isPassword = true,
                showPassword = showPassword,
                onPasswordVisibilityChange = onPasswordVisibilityChange,
                keyboardOptions = KeyboardOptions(
                    keyboardType = KeyboardType.Password,
                    imeAction = ImeAction.Done
                )
            )
            
            // Forgot Password
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(top = 8.dp, bottom = 24.dp),
                horizontalArrangement = Arrangement.End
            ) {
                Text(
                    text = "Forgot Password?",
                    color = Color(0xFF6366F1),
                    fontSize = 14.sp,
                    fontWeight = FontWeight.Medium,
                    modifier = Modifier.clickable { /* Handle forgot password */ }
                )
            }
            
            // Login Button
            Button(
                onClick = onLogin,
                modifier = Modifier
                    .fillMaxWidth()
                    .height(56.dp),
                shape = RoundedCornerShape(16.dp),
                colors = ButtonDefaults.buttonColors(
                    containerColor = Color(0xFF6366F1)
                ),
                enabled = !isLoading
            ) {
                if (isLoading) {
                    CircularProgressIndicator(
                        color = Color.White,
                        modifier = Modifier.size(24.dp),
                        strokeWidth = 2.dp
                    )
                } else {
                    Text(
                        text = "Sign In",
                        fontSize = 16.sp,
                        fontWeight = FontWeight.SemiBold,
                        color = Color.White
                    )
                }
            }
            
            Spacer(modifier = Modifier.height(24.dp))
            
            // Divider
            Row(
                verticalAlignment = Alignment.CenterVertically,
                modifier = Modifier.fillMaxWidth()
            ) {
                HorizontalDivider(
                    modifier = Modifier.weight(1f),
                    color = Color.White.copy(alpha = 0.2f)
                )
                Text(
                    text = "  or continue with  ",
                    color = Color.White.copy(alpha = 0.6f),
                    fontSize = 14.sp
                )
                HorizontalDivider(
                    modifier = Modifier.weight(1f),
                    color = Color.White.copy(alpha = 0.2f)
                )
            }
            
            Spacer(modifier = Modifier.height(24.dp))
            
            // Google Sign-In Button
            OutlinedButton(
                onClick = onGoogleSignIn,
                modifier = Modifier
                    .fillMaxWidth()
                    .height(56.dp),
                shape = RoundedCornerShape(16.dp),
                border = BorderStroke(1.dp, Color.White.copy(alpha = 0.2f)),
                colors = ButtonDefaults.outlinedButtonColors(
                    containerColor = Color(0xFF2A2A3A).copy(alpha = 0.5f)
                ),
                enabled = !isLoading
            ) {
                Row(
                    verticalAlignment = Alignment.CenterVertically,
                    horizontalArrangement = Arrangement.Center
                ) {
                    Image(
                        painter = painterResource(id = R.drawable.google),
                        contentDescription = "Google",
                        modifier = Modifier.size(24.dp)
                    )
                    Spacer(modifier = Modifier.width(12.dp))
                    Text(
                        text = "Continue with Google",
                        color = Color.White,
                        fontSize = 16.sp,
                        fontWeight = FontWeight.Medium
                    )
                }
            }
            
            Spacer(modifier = Modifier.height(32.dp))
            
            // Sign Up Link
            Row(
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.Center
            ) {
                Text(
                    text = "Don't have an account? ",
                    color = Color.White.copy(alpha = 0.7f),
                    fontSize = 15.sp
                )
                
                Text(
                    text = "Sign Up",
                    color = Color(0xFF6366F1),
                    fontSize = 15.sp,
                    fontWeight = FontWeight.SemiBold,
                    modifier = Modifier.clickable { onShowRegistration() }
                )
            }
        }
    }
}

@Composable
private fun SignUpForm(
    name: String,
    email: String,
    password: String,
    confirmPassword: String,
    showPassword: Boolean,
    showConfirmPassword: Boolean,
    isLoading: Boolean,
    errorMessage: String?,
    onNameChange: (String) -> Unit,
    onEmailChange: (String) -> Unit,
    onPasswordChange: (String) -> Unit,
    onConfirmPasswordChange: (String) -> Unit,
    onPasswordVisibilityChange: () -> Unit,
    onConfirmPasswordVisibilityChange: () -> Unit,
    onSignUp: () -> Unit,
    onGoogleSignIn: () -> Unit,
    onShowLogin: () -> Unit
) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = 8.dp),
        shape = RoundedCornerShape(28.dp),
        colors = CardDefaults.cardColors(
            containerColor = Color(0xFF1E1E2E).copy(alpha = 0.95f)
        ),
        elevation = CardDefaults.cardElevation(
            defaultElevation = 20.dp
        )
    ) {
        Column(
            horizontalAlignment = Alignment.CenterHorizontally,
            modifier = Modifier.padding(32.dp)
        ) {
            // Logo and branding
            Box(
                modifier = Modifier
                    .size(80.dp)
                    .clip(RoundedCornerShape(20.dp)),
                contentAlignment = Alignment.Center
            ) {
                Image(
                    painter = painterResource(id = R.drawable.brain_logo_black),
                    contentDescription = "OneAI Brain Logo",
                    contentScale = ContentScale.Fit,
                    modifier = Modifier.fillMaxSize()
                )
            }
            
            Spacer(modifier = Modifier.height(24.dp))
            
            Text(
                text = "Create Account",
                color = Color.White,
                fontSize = 28.sp,
                fontWeight = FontWeight.Bold
            )
            
            Text(
                text = "Join OneAI and unlock AI possibilities",
                color = Color.White.copy(alpha = 0.7f),
                fontSize = 16.sp,
                modifier = Modifier.padding(bottom = 32.dp)
            )
            
            // Error message
            if (errorMessage != null) {
                Card(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(bottom = 16.dp),
                    colors = CardDefaults.cardColors(
                        containerColor = Color(0xFFFF5252).copy(alpha = 0.1f)
                    ),
                    shape = RoundedCornerShape(12.dp)
                ) {
                    Text(
                        text = errorMessage,
                        color = Color(0xFFFF5252),
                        fontSize = 14.sp,
                        textAlign = TextAlign.Center,
                        modifier = Modifier.padding(12.dp)
                    )
                }
            }
            
            // Name field
            ModernTextField(
                value = name,
                onValueChange = onNameChange,
                label = "Full Name",
                icon = Icons.Default.Person,
                keyboardOptions = KeyboardOptions(
                    keyboardType = KeyboardType.Text,
                    imeAction = ImeAction.Next
                )
            )
            
            Spacer(modifier = Modifier.height(16.dp))
            
            // Email field
            ModernTextField(
                value = email,
                onValueChange = onEmailChange,
                label = "Email Address",
                icon = Icons.Default.Email,
                keyboardOptions = KeyboardOptions(
                    keyboardType = KeyboardType.Email,
                    imeAction = ImeAction.Next
                )
            )
            
            Spacer(modifier = Modifier.height(16.dp))
            
            // Password field
            ModernTextField(
                value = password,
                onValueChange = onPasswordChange,
                label = "Password",
                icon = Icons.Default.Lock,
                isPassword = true,
                showPassword = showPassword,
                onPasswordVisibilityChange = onPasswordVisibilityChange,
                keyboardOptions = KeyboardOptions(
                    keyboardType = KeyboardType.Password,
                    imeAction = ImeAction.Next
                )
            )
            
            Spacer(modifier = Modifier.height(16.dp))
            
            // Confirm Password field
            ModernTextField(
                value = confirmPassword,
                onValueChange = onConfirmPasswordChange,
                label = "Confirm Password",
                icon = Icons.Default.Lock,
                isPassword = true,
                showPassword = showConfirmPassword,
                onPasswordVisibilityChange = onConfirmPasswordVisibilityChange,
                keyboardOptions = KeyboardOptions(
                    keyboardType = KeyboardType.Password,
                    imeAction = ImeAction.Done
                )
            )
            
            Spacer(modifier = Modifier.height(24.dp))
            
            // Sign Up Button
            Button(
                onClick = onSignUp,
                modifier = Modifier
                    .fillMaxWidth()
                    .height(56.dp),
                shape = RoundedCornerShape(16.dp),
                colors = ButtonDefaults.buttonColors(
                    containerColor = Color(0xFF6366F1)
                ),
                enabled = !isLoading
            ) {
                if (isLoading) {
                    CircularProgressIndicator(
                        color = Color.White,
                        modifier = Modifier.size(24.dp),
                        strokeWidth = 2.dp
                    )
                } else {
                    Text(
                        text = "Create Account",
                        fontSize = 16.sp,
                        fontWeight = FontWeight.SemiBold,
                        color = Color.White
                    )
                }
            }
            
            Spacer(modifier = Modifier.height(24.dp))
            
            // Divider
            Row(
                verticalAlignment = Alignment.CenterVertically,
                modifier = Modifier.fillMaxWidth()
            ) {
                HorizontalDivider(
                    modifier = Modifier.weight(1f),
                    color = Color.White.copy(alpha = 0.2f)
                )
                Text(
                    text = "  or continue with  ",
                    color = Color.White.copy(alpha = 0.6f),
                    fontSize = 14.sp
                )
                HorizontalDivider(
                    modifier = Modifier.weight(1f),
                    color = Color.White.copy(alpha = 0.2f)
                )
            }
            
            Spacer(modifier = Modifier.height(24.dp))
            
            // Google Sign-In Button
            OutlinedButton(
                onClick = onGoogleSignIn,
                modifier = Modifier
                    .fillMaxWidth()
                    .height(56.dp),
                shape = RoundedCornerShape(16.dp),
                border = BorderStroke(1.dp, Color.White.copy(alpha = 0.2f)),
                colors = ButtonDefaults.outlinedButtonColors(
                    containerColor = Color(0xFF2A2A3A).copy(alpha = 0.5f)
                ),
                enabled = !isLoading
            ) {
                Row(
                    verticalAlignment = Alignment.CenterVertically,
                    horizontalArrangement = Arrangement.Center
                ) {
                    Image(
                        painter = painterResource(id = R.drawable.google),
                        contentDescription = "Google",
                        modifier = Modifier.size(24.dp)
                    )
                    Spacer(modifier = Modifier.width(12.dp))
                    Text(
                        text = "Continue with Google",
                        color = Color.White,
                        fontSize = 16.sp,
                        fontWeight = FontWeight.Medium
                    )
                }
            }
            
            Spacer(modifier = Modifier.height(32.dp))
            
            // Login Link
            Row(
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.Center
            ) {
                Text(
                    text = "Already have an account? ",
                    color = Color.White.copy(alpha = 0.7f),
                    fontSize = 15.sp
                )
                
                Text(
                    text = "Sign In",
                    color = Color(0xFF6366F1),
                    fontSize = 15.sp,
                    fontWeight = FontWeight.SemiBold,
                    modifier = Modifier.clickable { onShowLogin() }
                )
            }
        }
    }
}