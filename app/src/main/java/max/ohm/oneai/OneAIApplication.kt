package max.ohm.oneai

import android.app.Application
import com.google.firebase.FirebaseApp

class OneAIApplication : Application() {
    override fun onCreate() {
        super.onCreate()
        
        // Initialize Firebase
        FirebaseApp.initializeApp(this)
    }
} 