package max.ohm.oneai.login

import android.util.Log
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.launch

class LoginViewModel : ViewModel() {
    private val _loginState = MutableStateFlow<LoginState>(LoginState.Idle)
    val loginState: StateFlow<LoginState> = _loginState

    init {
        // Initialize the ViewModel
        Log.d(TAG, "LoginViewModel initialized")
    }

    fun loginWithGoogle() {
        Log.d(TAG, "Login with Google initiated")
        _loginState.value = LoginState.Loading
        viewModelScope.launch {
            try {
                // Simulate authentication
                // In a real app, implement Google Sign-In SDK integration
                _loginState.value = LoginState.Success("Google Login")
            } catch (e: Exception) {
                Log.e(TAG, "Google login failed", e)
                _loginState.value = LoginState.Error("Failed to login with Google: ${e.message}")
            }
        }
    }

    fun loginWithFacebook() {
        Log.d(TAG, "Login with Facebook initiated")
        _loginState.value = LoginState.Loading
        viewModelScope.launch {
            try {
                // Simulate authentication
                // In a real app, implement Facebook Login SDK integration
                _loginState.value = LoginState.Success("Facebook Login")
            } catch (e: Exception) {
                Log.e(TAG, "Facebook login failed", e)
                _loginState.value = LoginState.Error("Failed to login with Facebook: ${e.message}")
            }
        }
    }

    fun loginWithEmail() {
        Log.d(TAG, "Login with Email initiated")
        _loginState.value = LoginState.Loading
        viewModelScope.launch {
            try {
                // Simulate authentication
                // In a real app, implement email authentication flow
                _loginState.value = LoginState.Success("Email Login")
            } catch (e: Exception) {
                Log.e(TAG, "Email login failed", e)
                _loginState.value = LoginState.Error("Failed to login with Email: ${e.message}")
            }
        }
    }

    companion object {
        private const val TAG = "LoginViewModel"
    }
}

sealed class LoginState {
    object Idle : LoginState()
    object Loading : LoginState()
    data class Success(val user: String) : LoginState()
    data class Error(val message: String) : LoginState()
} 
