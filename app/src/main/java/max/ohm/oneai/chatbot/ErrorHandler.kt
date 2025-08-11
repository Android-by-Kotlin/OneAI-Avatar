package max.ohm.oneai.chatbot

import android.util.Log

/**
 * Custom error types for chatbot API failures
 */
enum class ApiErrorType {
    RATE_LIMIT_EXCEEDED,
    QUOTA_EXCEEDED,
    MODEL_OVERLOADED,
    AUTHENTICATION_FAILED,
    NETWORK_ERROR,
    INVALID_REQUEST,
    SERVER_ERROR,
    UNKNOWN_ERROR
}

/**
 * Data class to hold error information with suggested actions
 */
data class ApiError(
    val type: ApiErrorType,
    val message: String,
    val userFriendlyMessage: String,
    val suggestedModel: String? = null,
    val retryable: Boolean = true,
    val retryAfterSeconds: Int? = null
)

/**
 * Model configuration with fallback options
 */
data class ModelConfig(
    val modelId: String,
    val displayName: String,
    val provider: String,
    val priority: Int, // Lower number = higher priority
    val isAvailable: Boolean = true,
    val apiKey: String? = null
)

/**
 * Error handler for chatbot API failures with automatic model switching
 */
class ChatBotErrorHandler {
    private val TAG = "ChatBotErrorHandler"
    
    // Available models with their configurations and fallback priority
    private val availableModels = mutableListOf(
        ModelConfig(
            modelId = "gemini-2.0-flash",
            displayName = "Gemini Flash (Primary)",
            provider = "google",
            priority = 1,
            apiKey = GEMINI_API_KEY
        ),
        ModelConfig(
            modelId = "a4f-gpt-4.1-nano",
            displayName = "GPT-4.1-Nano",
            provider = "a4f",
            priority = 2,
            apiKey = "ddc-a4f-2e9bee7f17d640d7bcba8fb26cf48d46"
        ),
        ModelConfig(
            modelId = "provider-3/kimi-k2",
            displayName = "Kimi K2",
            provider = "a4f",
            priority = 3,
            apiKey = "ddc-a4f-2e9bee7f17d640d7bcba8fb26cf48d46"
        ),
        ModelConfig(
            modelId = "provider-1/deepseek-r1-0528",
            displayName = "DeepSeek R1",
            provider = "a4f",
            priority = 4,
            apiKey = "ddc-a4f-2e9bee7f17d640d7bcba8fb26cf48d46"
        ),
        ModelConfig(
            modelId = "provider-6/r1-1776",
            displayName = "R1-1776",
            provider = "a4f",
            priority = 5,
            apiKey = "ddc-a4f-2e9bee7f17d640d7bcba8fb26cf48d46"
        ),
        ModelConfig(
            modelId = "provider-2/qwen-3-235b",
            displayName = "Qwen 3 235B",
            provider = "a4f",
            priority = 6,
            apiKey = "ddc-a4f-2e9bee7f17d640d7bcba8fb26cf48d46"
        ),
        ModelConfig(
            modelId = "provider-6/horizon-beta",
            displayName = "Horizon Beta",
            provider = "a4f",
            priority = 7,
            apiKey = "ddc-a4f-2e9bee7f17d640d7bcba8fb26cf48d46"
        ),
        ModelConfig(
            modelId = "provider-3/gpt-5-nano",
            displayName = "GPT-5 Nano",
            provider = "a4f",
            priority = 8,
            apiKey = "ddc-a4f-2e9bee7f17d640d7bcba8fb26cf48d46"
        ),
        ModelConfig(
            modelId = "provider-6/gpt-4o",
            displayName = "GPT-4o",
            provider = "a4f",
            priority = 9,
            apiKey = "ddc-a4f-2e9bee7f17d640d7bcba8fb26cf48d46"
        ),
        ModelConfig(
            modelId = "provider-6/gemini-2.5-flash",
            displayName = "Gemini 2.5 Flash",
            provider = "a4f",
            priority = 10,
            apiKey = "ddc-a4f-2e9bee7f17d640d7bcba8fb26cf48d46"
        ),
        ModelConfig(
            modelId = "gemini-1.5-pro",
            displayName = "Gemini Pro (Fallback)",
            provider = "google",
            priority = 11,
            apiKey = GEMINI_API_KEY
        ),
        // Add OpenRouter models as fallback
        ModelConfig(
            modelId = "openrouter-mixtral",
            displayName = "Mixtral (OpenRouter)",
            provider = "openrouter",
            priority = 12,
            apiKey = "YOUR_OPENROUTER_KEY" // User needs to configure this
        ),
        // Add more providers as needed
        ModelConfig(
            modelId = "claude-instant",
            displayName = "Claude Instant (Anthropic)",
            provider = "anthropic",
            priority = 13,
            apiKey = "YOUR_ANTHROPIC_KEY" // User needs to configure this
        )
    )
    
    // Track failed models to avoid retry loops
    private val failedModels = mutableSetOf<String>()
    
    // Track rate limit timestamps
    private val rateLimitTimestamps = mutableMapOf<String, Long>()
    
    /**
     * Parse error response and determine error type
     */
    fun parseError(
        exception: Exception?,
        responseCode: Int? = null,
        responseBody: String? = null,
        currentModel: String
    ): ApiError {
        Log.e(TAG, "Parsing error for model: $currentModel", exception)
        
        // Check response code first
        when (responseCode) {
            429 -> {
                // Rate limit exceeded
                val retryAfter = extractRetryAfter(responseBody)
                recordRateLimit(currentModel)
                return ApiError(
                    type = ApiErrorType.RATE_LIMIT_EXCEEDED,
                    message = "Rate limit exceeded for $currentModel",
                    userFriendlyMessage = "🚦 The AI model is experiencing heavy traffic. Switching to backup model...",
                    suggestedModel = getNextAvailableModel(currentModel),
                    retryable = true,
                    retryAfterSeconds = retryAfter
                )
            }
            402, 403 -> {
                // Payment required or quota exceeded
                return ApiError(
                    type = ApiErrorType.QUOTA_EXCEEDED,
                    message = "API quota exceeded or payment required",
                    userFriendlyMessage = "💳 API credits exhausted for this model. Switching to alternative model...",
                    suggestedModel = getNextAvailableModel(currentModel),
                    retryable = true
                )
            }
            401 -> {
                // Authentication failed
                return ApiError(
                    type = ApiErrorType.AUTHENTICATION_FAILED,
                    message = "Authentication failed for $currentModel",
                    userFriendlyMessage = "🔐 Authentication failed. Please check API configuration.",
                    suggestedModel = getNextAvailableModel(currentModel),
                    retryable = false
                )
            }
            500, 502, 503, 504 -> {
                // Server errors
                return ApiError(
                    type = ApiErrorType.SERVER_ERROR,
                    message = "Server error: $responseCode",
                    userFriendlyMessage = "⚠️ The AI service is temporarily unavailable. Trying backup model...",
                    suggestedModel = getNextAvailableModel(currentModel),
                    retryable = true,
                    retryAfterSeconds = 30
                )
            }
        }
        
        // Check exception message for specific errors
        val errorMessage = exception?.message?.lowercase() ?: responseBody?.lowercase() ?: ""
        
        return when {
            errorMessage.contains("quota") || errorMessage.contains("limit") || errorMessage.contains("exceeded") -> {
                ApiError(
                    type = ApiErrorType.QUOTA_EXCEEDED,
                    message = exception?.message ?: "Quota exceeded",
                    userFriendlyMessage = "📊 Usage limit reached. Switching to backup AI model...",
                    suggestedModel = getNextAvailableModel(currentModel),
                    retryable = true
                )
            }
            errorMessage.contains("overload") || errorMessage.contains("capacity") || errorMessage.contains("busy") -> {
                ApiError(
                    type = ApiErrorType.MODEL_OVERLOADED,
                    message = exception?.message ?: "Model overloaded",
                    userFriendlyMessage = "🔄 The AI model is currently overloaded. Switching to alternative...",
                    suggestedModel = getNextAvailableModel(currentModel),
                    retryable = true,
                    retryAfterSeconds = 60
                )
            }
            errorMessage.contains("network") || errorMessage.contains("timeout") || errorMessage.contains("connection") -> {
                ApiError(
                    type = ApiErrorType.NETWORK_ERROR,
                    message = exception?.message ?: "Network error",
                    userFriendlyMessage = "📡 Network connection issue. Please check your internet and try again.",
                    suggestedModel = null,
                    retryable = true
                )
            }
            errorMessage.contains("invalid") || errorMessage.contains("bad request") -> {
                ApiError(
                    type = ApiErrorType.INVALID_REQUEST,
                    message = exception?.message ?: "Invalid request",
                    userFriendlyMessage = "❌ Invalid request format. Please try rephrasing your message.",
                    suggestedModel = null,
                    retryable = false
                )
            }
            else -> {
                ApiError(
                    type = ApiErrorType.UNKNOWN_ERROR,
                    message = exception?.message ?: "Unknown error",
                    userFriendlyMessage = "⚠️ An unexpected error occurred. Trying alternative model...",
                    suggestedModel = getNextAvailableModel(currentModel),
                    retryable = true
                )
            }
        }
    }
    
    /**
     * Get the next available model based on priority
     */
    fun getNextAvailableModel(failedModel: String): String? {
        // Mark the current model as failed
        failedModels.add(failedModel)
        
        // Check if model is rate limited
        val now = System.currentTimeMillis()
        
        // Filter and sort available models
        val availableModel = availableModels
            .filter { model ->
                // Exclude failed models
                !failedModels.contains(model.modelId) &&
                // Exclude rate-limited models (wait at least 60 seconds)
                (rateLimitTimestamps[model.modelId]?.let { timestamp ->
                    (now - timestamp) > 60000
                } ?: true) &&
                // Check if model is marked as available
                model.isAvailable &&
                // Check if API key is configured
                !model.apiKey.isNullOrBlank() &&
                model.apiKey != "YOUR_API_KEY_HERE"
            }
            .sortedBy { it.priority }
            .firstOrNull()
        
        Log.d(TAG, "Next available model: ${availableModel?.modelId}")
        return availableModel?.modelId
    }
    
    /**
     * Reset failed models list (call after successful response)
     */
    fun resetFailedModels() {
        failedModels.clear()
    }
    
    /**
     * Record rate limit timestamp for a model
     */
    private fun recordRateLimit(modelId: String) {
        rateLimitTimestamps[modelId] = System.currentTimeMillis()
    }
    
    /**
     * Extract retry-after value from response
     */
    private fun extractRetryAfter(responseBody: String?): Int {
        // Try to extract retry-after from response
        // This is a simplified version - adjust based on actual API response format
        return try {
            responseBody?.let {
                val regex = Regex("retry[_-]?after[\"':\\s]+(\\d+)", RegexOption.IGNORE_CASE)
                regex.find(it)?.groupValues?.get(1)?.toIntOrNull()
            } ?: 60 // Default to 60 seconds
        } catch (e: Exception) {
            60
        }
    }
    
    /**
     * Check if a model is currently available
     */
    fun isModelAvailable(modelId: String): Boolean {
        val now = System.currentTimeMillis()
        
        // Check if model is rate limited
        rateLimitTimestamps[modelId]?.let { timestamp ->
            if ((now - timestamp) < 60000) {
                return false
            }
        }
        
        // Check if model has failed recently
        if (failedModels.contains(modelId)) {
            return false
        }
        
        // Check model configuration
        val model = availableModels.find { it.modelId == modelId }
        return model?.isAvailable == true && 
               !model.apiKey.isNullOrBlank() && 
               model.apiKey != "YOUR_API_KEY_HERE"
    }
    
    /**
     * Get list of all available models for UI display
     */
    fun getAvailableModelsForDisplay(): List<Pair<String, String>> {
        return availableModels
            .filter { isModelAvailable(it.modelId) }
            .sortedBy { it.priority }
            .map { it.modelId to it.displayName }
    }
    
    /**
     * Update model availability status
     */
    fun updateModelAvailability(modelId: String, isAvailable: Boolean) {
        availableModels.find { it.modelId == modelId }?.let { model ->
            val index = availableModels.indexOf(model)
            availableModels[index] = model.copy(isAvailable = isAvailable)
        }
    }
    
    /**
     * Generate a friendly error message with recovery suggestions
     */
    fun generateRecoveryMessage(error: ApiError): String {
        val baseMessage = error.userFriendlyMessage
        
        val recoveryTips = when (error.type) {
            ApiErrorType.RATE_LIMIT_EXCEEDED -> {
                if (error.suggestedModel != null) {
                    "\n\n✅ Automatically switching to ${getModelDisplayName(error.suggestedModel)}..."
                } else {
                    "\n\n⏳ Please wait ${error.retryAfterSeconds ?: 60} seconds before trying again."
                }
            }
            ApiErrorType.QUOTA_EXCEEDED -> {
                if (error.suggestedModel != null) {
                    "\n\n✅ Switching to ${getModelDisplayName(error.suggestedModel)}..."
                } else {
                    "\n\n💡 All API credits exhausted. Please contact support or wait for quota reset."
                }
            }
            ApiErrorType.MODEL_OVERLOADED -> {
                "\n\n🔄 Retrying with alternative model..."
            }
            ApiErrorType.NETWORK_ERROR -> {
                "\n\n📡 Please check your internet connection and try again."
            }
            ApiErrorType.AUTHENTICATION_FAILED -> {
                "\n\n🔑 Please verify your API keys in settings."
            }
            else -> {
                if (error.retryable) {
                    "\n\n🔄 Retrying with alternative configuration..."
                } else {
                    "\n\n❌ Please try again with a different message."
                }
            }
        }
        
        return baseMessage + recoveryTips
    }
    
    /**
     * Get display name for a model ID
     */
    private fun getModelDisplayName(modelId: String): String {
        return availableModels.find { it.modelId == modelId }?.displayName ?: modelId
    }
}
