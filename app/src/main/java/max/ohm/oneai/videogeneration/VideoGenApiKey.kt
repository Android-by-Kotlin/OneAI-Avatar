package max.ohm.oneai.videogeneration

import android.util.Log

object VideoGenApiKey {
    const val API_KEY = "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJHcm91cE5hbWUiOiJPbSBNYW5kYWwiLCJVc2VyTmFtZSI6Ik9tIE1hbmRhbCIsIkFjY291bnQiOiIiLCJTdWJqZWN0SUQiOiIxOTI3MzQyMTkzNjcyOTgzMDE2IiwiUGhvbmUiOiIiLCJHcm91cElEIjoiMTkyNzM0MjE5MzY2ODc4ODcxMiIsIlBhZ2VOYW1lIjoiIiwiTWFpbCI6Im1heG9obTI0QGdtYWlsLmNvbSIsIkNyZWF0ZVRpbWUiOiIyMDI1LTA1LTI5IDE3OjIyOjMyIiwiVG9rZW5UeXBlIjoxLCJpc3MiOiJtaW5pbWF4In0.f46QK1qY7kgcFXv7vbYmTjmxItmAOweMls6e9UBBtGSOS4l5r6s6WhE-Nlz2dEDJvm1eG0FWXoTDpJ0bPszwArSF0DWGHM75SaeuJMz_YUr26s_jPYxSxsHvOqGDXqNza0hE0VGz8PcU0L5hpmKMb2ywm-gTecIbHal_m0TIuzhZ981lnZV_0zUIgWEiMPwlsV-FUdO40-Tu1uMLOVX2QZgtFfK4hCi3iMe9-tPgHVAj01haTQ9sRYMXhoMhyGVgsBYB1G2d62qzGbX8T4KDRAW0RQS_p887wKijoZ4gJYMUli50U7twJafO9xLZoPMHtKf7big_zez9A2krtKdcOw" // To be provided by the user
    const val GROUP_ID = "1927342193668788712" // To be provided by the user
    
    // Helper function to validate credentials
    fun validateCredentials(): Boolean {
        val isApiKeyValid = API_KEY.isNotBlank() && API_KEY.length > 50 // JWT tokens are typically long
        val isGroupIdValid = GROUP_ID.isNotBlank() && GROUP_ID.matches(Regex("\\d+")) // Group ID should be numeric
        
        if (!isApiKeyValid) {
            Log.e("VideoGenApiKey", "API key appears to be invalid or missing")
        }
        
        if (!isGroupIdValid) {
            Log.e("VideoGenApiKey", "Group ID appears to be invalid or missing")
        }
        
        return isApiKeyValid && isGroupIdValid
    }
}

