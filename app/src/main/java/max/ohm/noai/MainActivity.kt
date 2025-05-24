package max.ohm.noai

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import max.ohm.noai.navigationsystem.AppNavigation
import max.ohm.noai.ui.theme.NoAITheme


class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            NoAITheme {
                AppNavigation()
            }
        }
    }
}








