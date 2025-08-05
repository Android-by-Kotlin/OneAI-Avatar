package max.ohm.oneai.debug

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.lifecycle.viewmodel.compose.viewModel
import androidx.navigation.NavController
import max.ohm.oneai.login.LoginState
import max.ohm.oneai.login.LoginViewModel

@Composable
fun AuthDebugScreen(
    navController: NavController,
    loginViewModel: LoginViewModel = viewModel()
) {
    val loginState by loginViewModel.loginState.collectAsState()
    val currentUser = loginViewModel.firebaseRepository.getCurrentUser()
    
    Column(
        modifier = Modifier
            .fillMaxSize()
            .background(Color.Black)
            .padding(16.dp)
            .verticalScroll(rememberScrollState()),
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        Text(
            text = "Authentication Debug",
            color = Color.White,
            fontSize = 24.sp,
            fontWeight = FontWeight.Bold,
            modifier = Modifier.padding(bottom = 24.dp)
        )
        
        Card(
            modifier = Modifier
                .fillMaxWidth()
                .padding(bottom = 16.dp),
            colors = CardDefaults.cardColors(
                containerColor = Color(0xFF1A1A1A)
            )
        ) {
            Column(
                modifier = Modifier.padding(16.dp)
            ) {
                Text(
                    text = "Login State",
                    color = Color.White,
                    fontSize = 18.sp,
                    fontWeight = FontWeight.Bold,
                    modifier = Modifier.padding(bottom = 8.dp)
                )
                
                val stateText = when (val state = loginState) {
                    is LoginState.Idle -> "Idle"
                    is LoginState.Loading -> "Loading"
                    is LoginState.Success -> "Success - User: ${state.user.email}"
                    is LoginState.Error -> "Error: ${state.message}"
                }
                
                val stateColor = when (loginState) {
                    is LoginState.Success -> Color.Green
                    is LoginState.Error -> Color.Red
                    is LoginState.Loading -> Color.Yellow
                    else -> Color.White
                }
                
                Text(
                    text = stateText,
                    color = stateColor,
                    fontSize = 14.sp
                )
            }
        }
        
        Card(
            modifier = Modifier
                .fillMaxWidth()
                .padding(bottom = 16.dp),
            colors = CardDefaults.cardColors(
                containerColor = Color(0xFF1A1A1A)
            )
        ) {
            Column(
                modifier = Modifier.padding(16.dp)
            ) {
                Text(
                    text = "Current User",
                    color = Color.White,
                    fontSize = 18.sp,
                    fontWeight = FontWeight.Bold,
                    modifier = Modifier.padding(bottom = 8.dp)
                )
                
                if (currentUser != null) {
                    Text(
                        text = "ID: ${currentUser.id}",
                        color = Color.White,
                        fontSize = 12.sp,
                        modifier = Modifier.padding(bottom = 4.dp)
                    )
                    Text(
                        text = "Email: ${currentUser.email}",
                        color = Color.White,
                        fontSize = 12.sp,
                        modifier = Modifier.padding(bottom = 4.dp)
                    )
                    Text(
                        text = "Name: ${currentUser.name}",
                        color = Color.White,
                        fontSize = 12.sp,
                        modifier = Modifier.padding(bottom = 4.dp)
                    )
                } else {
                    Text(
                        text = "No user logged in",
                        color = Color.Red,
                        fontSize = 14.sp
                    )
                }
            }
        }
        
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceEvenly
        ) {
            Button(
                onClick = {
                    navController.navigate("login") {
                        popUpTo("splash") { inclusive = true }
                    }
                },
                colors = ButtonDefaults.buttonColors(
                    containerColor = Color(0xFF9C27B0)
                )
            ) {
                Text("Go to Login")
            }
            
            Button(
                onClick = {
                    navController.navigate("home") {
                        popUpTo("splash") { inclusive = true }
                    }
                },
                colors = ButtonDefaults.buttonColors(
                    containerColor = Color(0xFF9C27B0)
                )
            ) {
                Text("Go to Home")
            }
        }
        
        Spacer(modifier = Modifier.height(16.dp))
        
        Button(
            onClick = {
                loginViewModel.signOut()
            },
            colors = ButtonDefaults.buttonColors(
                containerColor = Color.Red
            )
        ) {
            Text("Sign Out")
        }
    }
}