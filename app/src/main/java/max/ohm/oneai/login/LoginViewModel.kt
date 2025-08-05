package max.ohm.oneai.login

import android.content.Intent
import android.util.Log
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.google.android.gms.auth.api.signin.GoogleSignInAccount
import com.google.android.gms.common.api.ApiException
import com.google.android.gms.tasks.Task
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.launch
import max.ohm.oneai.data.model.User
import max.ohm.oneai.data.repository.FirebaseRepository

class LoginViewModel : ViewModel() {
    private val _loginState = MutableStateFlow<LoginState>(LoginState.Idle)
    val loginState: StateFlow<LoginState> = _loginState
    
    val firebaseRepository = FirebaseRepository()

    init {
        // Check if user is already logged in
        val currentUser = firebaseRepository.getCurrentUser()
        if (currentUser != null) {
            _loginState.value = LoginState.Success(currentUser)
        }
        Log.d(TAG, "LoginViewModel initialized")
    }

    fun handleGoogleSignInResult(task: Task<GoogleSignInAccount>) {
        viewModelScope.launch {
            try {
                Log.d(TAG, "Starting Google sign-in process")
                _loginState.value = LoginState.Loading
                
                val account = task.getResult(ApiException::class.java)
                Log.d(TAG, "Google account retrieved: ${account?.email}")
                
                val idToken = account?.idToken ?: throw Exception("ID token is null")
                Log.d(TAG, "ID token obtained successfully")
                
                val result = firebaseRepository.signInWithGoogle(idToken)
                
                result.fold(
                    onSuccess = {
                        Log.d(TAG, "Firebase authentication successful")
                        val user = firebaseRepository.getCurrentUser()
                        if (user != null) {
                            Log.d(TAG, "User data retrieved: ${user.email}")
                            _loginState.value = LoginState.Success(user)
                        } else {
                            Log.e(TAG, "Failed to get user data after successful authentication")
                            _loginState.value = LoginState.Error("Failed to get user data")
                        }
                    },
                    onFailure = {
                        Log.e(TAG, "Google sign-in failed", it)
                        _loginState.value = LoginState.Error("Failed to login with Google: ${it.message}")
                    }
                )
            } catch (e: ApiException) {
                Log.e(TAG, "Google sign-in API exception: ${e.statusCode}", e)
                _loginState.value = LoginState.Error("Google sign-in failed: ${e.statusCode}")
            } catch (e: Exception) {
                Log.e(TAG, "Google sign-in general exception", e)
                _loginState.value = LoginState.Error("Failed to login with Google: ${e.message}")
            }
        }
    }

    fun loginWithEmail(email: String, password: String) {
        Log.d(TAG, "Login with Email initiated")
        _loginState.value = LoginState.Loading
        viewModelScope.launch {
            try {
                val result = firebaseRepository.signInWithEmail(email, password)
                
                result.fold(
                    onSuccess = {
                        val user = firebaseRepository.getCurrentUser()
                        if (user != null) {
                            _loginState.value = LoginState.Success(user)
                        } else {
                            _loginState.value = LoginState.Error("Failed to get user data")
                        }
                    },
                    onFailure = {
                        Log.e(TAG, "Email login failed", it)
                        _loginState.value = LoginState.Error("Failed to login with Email: ${it.message}")
                    }
                )
            } catch (e: Exception) {
                Log.e(TAG, "Email login failed", e)
                _loginState.value = LoginState.Error("Failed to login with Email: ${e.message}")
            }
        }
    }
    
    fun signUpWithEmail(email: String, password: String, name: String) {
        Log.d(TAG, "Sign up with Email initiated")
        _loginState.value = LoginState.Loading
        viewModelScope.launch {
            try {
                val result = firebaseRepository.signUpWithEmail(email, password, name)
                
                result.fold(
                    onSuccess = {
                        val user = firebaseRepository.getCurrentUser()
                        if (user != null) {
                            _loginState.value = LoginState.Success(user)
                        } else {
                            _loginState.value = LoginState.Error("Failed to get user data")
                        }
                    },
                    onFailure = {
                        Log.e(TAG, "Email sign up failed", it)
                        _loginState.value = LoginState.Error("Failed to sign up with Email: ${it.message}")
                    }
                )
            } catch (e: Exception) {
                Log.e(TAG, "Email sign up failed", e)
                _loginState.value = LoginState.Error("Failed to sign up with Email: ${e.message}")
            }
        }
    }
    
    fun signOut() {
        firebaseRepository.signOut()
        _loginState.value = LoginState.Idle
    }

    companion object {
        private const val TAG = "LoginViewModel"
    }
}

sealed class LoginState {
    object Idle : LoginState()
    object Loading : LoginState()
    data class Success(val user: User) : LoginState()
    data class Error(val message: String) : LoginState()
} 
