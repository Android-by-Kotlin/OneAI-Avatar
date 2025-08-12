package max.ohm.oneai.utils

/**
 * Content Filter for detecting and filtering adult/NSFW content
 * This helps ensure the app complies with Play Store policies
 */
object ContentFilter {
    
    // List of keywords that indicate adult/NSFW content
    private val adultKeywords = listOf(
        // Explicit sexual terms
        "nude", "naked", "nsfw", "porn", "sex", "sexual", "xxx", 
        "erotic", "adult", "18+", "explicit", "uncensored",
        
        // Body parts (explicit context)
        "breast", "boob", "nipple", "genital", "penis", "vagina",
        "buttocks", "butt", "ass", "topless", "bottomless",
        
        // Sexual acts and references
        "intercourse", "masturbat", "orgasm", "arousal", "seduc",
        "strip", "lingerie", "underwear", "bdsm", "fetish",
        "prostitut", "escort", "hooker", "stripper",
        
        // Violence and gore (also restricted)
        "gore", "blood", "violence", "murder", "kill", "dead body",
        "corpse", "mutilat", "torture", "abuse",
        
        // Drug references
        "drug", "cocaine", "heroin", "meth", "marijuana", "weed",
        
        // Other inappropriate content
        "hentai", "lewd", "suggestive", "provocative", "sensual",
        "intimate", "bedroom", "shower scene", "bath scene",
        "revealing", "transparent clothes", "see through",
        "bikini", "swimsuit", "undress", "unclothed"
    )
    
    // Additional phrases that might indicate inappropriate content
    private val adultPhrases = listOf(
        "without clothes", "no clothes", "taking off", "take off clothes",
        "in bed", "on bed", "making love", "hot scene", "steamy",
        "barely covered", "scantily clad", "revealing outfit"
    )
    
    // Safe negative prompts to add to all generations
    private val safetyNegativePrompts = listOf(
        "nsfw", "nude", "naked", "explicit", "adult content",
        "sexual", "gore", "violence", "inappropriate",
        "revealing clothes", "suggestive pose", "18+"
    )
    
    /**
     * Check if a prompt contains adult/NSFW content
     * @param prompt The user's input prompt
     * @return true if adult content is detected, false otherwise
     */
    fun containsAdultContent(prompt: String): Boolean {
        val lowerPrompt = prompt.lowercase().trim()
        
        // Check for exact keyword matches
        for (keyword in adultKeywords) {
            if (lowerPrompt.contains(keyword)) {
                return true
            }
        }
        
        // Check for phrase matches
        for (phrase in adultPhrases) {
            if (lowerPrompt.contains(phrase)) {
                return true
            }
        }
        
        // Check for variations and common misspellings
        if (checkVariations(lowerPrompt)) {
            return true
        }
        
        return false
    }
    
    /**
     * Check for variations and attempts to bypass filters
     */
    private fun checkVariations(prompt: String): Boolean {
        // Check for l33t speak or character substitutions
        val variations = mapOf(
            "n4k3d" to true, "n@ked" to true, "nud3" to true,
            "s3x" to true, "s*x" to true, "p0rn" to true,
            "xxx" to true, "pr0n" to true, "fap" to true
        )
        
        for ((variant, _) in variations) {
            if (prompt.contains(variant)) {
                return true
            }
        }
        
        // Check for spacing tricks (n a k e d, n u d e)
        val spacedPatterns = listOf("n a k e d", "n u d e", "s e x")
        for (pattern in spacedPatterns) {
            if (prompt.contains(pattern)) {
                return true
            }
        }
        
        return false
    }
    
    /**
     * Get a safe version of the prompt with negative prompts added
     * @param originalPrompt The user's original prompt
     * @return A sanitized prompt with safety measures
     */
    fun getSafePrompt(originalPrompt: String): String {
        // If the prompt contains adult content, replace it entirely
        if (containsAdultContent(originalPrompt)) {
            return "A beautiful landscape with mountains and trees, family-friendly, safe for work"
        }
        
        // Return original prompt if it's clean
        return originalPrompt
    }
    
    /**
     * Get negative prompts to append to the API request
     * These help the AI avoid generating inappropriate content
     */
    fun getNegativePrompts(): String {
        return safetyNegativePrompts.joinToString(", ")
    }
    
    /**
     * Get a user-friendly warning message for inappropriate content
     */
    fun getWarningMessage(): String {
        return "This prompt may generate inappropriate content that violates Play Store policies. " +
               "Please use family-friendly prompts only. Your prompt has been modified for safety."
    }
    
    /**
     * Sanitize prompt for logging (remove any sensitive content)
     */
    fun sanitizeForLogging(prompt: String): String {
        return if (containsAdultContent(prompt)) {
            "[FILTERED: Inappropriate content detected]"
        } else {
            prompt
        }
    }
}
