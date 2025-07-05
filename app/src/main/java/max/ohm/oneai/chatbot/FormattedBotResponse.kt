package max.ohm.oneai.chatbot

import androidx.compose.animation.animateContentSize
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.horizontalScroll
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Check
import androidx.compose.material.icons.filled.ContentCopy
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.LocalClipboardManager
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.AnnotatedString
import androidx.compose.ui.text.SpanStyle
import androidx.compose.ui.text.buildAnnotatedString
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.withStyle
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import android.widget.Toast

// Colors matching the dark theme
private val BackgroundDark = Color(0xFF1A1A1A)
private val SurfaceDark = Color(0xFF2D2D2D)
private val CodeBlockBg = Color(0xFF0D1117)
private val TextPrimary = Color(0xFFE0E0E0)
private val TextSecondary = Color(0xFFB0B0B0)
private val AccentGreen = Color(0xFF4CAF50)
private val AccentBlue = Color(0xFF2196F3)
private val AccentOrange = Color(0xFFFF9800)
private val CheckmarkGreen = Color(0xFF00C853)

// JARVIS-style colors
private val JarvisBlue = Color(0xFF00B4D8)
private val JarvisLightBlue = Color(0xFF48CAE4)
private val JarvisDarkBlue = Color(0xFF023E8A)

data class ResponseSection(
    val type: SectionType,
    val content: String,
    val title: String? = null,
    val language: String? = null,
    val items: List<String>? = null
)

enum class SectionType {
    TITLE,
    PARAGRAPH,
    PREREQUISITES,
    STEP,
    CODE_BLOCK,
    BULLET_LIST,
    NOTE,
    WARNING
}

@Composable
fun FormattedBotResponse(
    sections: List<ResponseSection>,
    modifier: Modifier = Modifier
) {
    Column(
        modifier = modifier
            .animateContentSize()
            .padding(vertical = 8.dp),
        verticalArrangement = Arrangement.spacedBy(12.dp)
    ) {
        sections.forEach { section ->
            when (section.type) {
                SectionType.TITLE -> TitleSection(section.content)
                SectionType.PARAGRAPH -> ParagraphSection(section.content)
                SectionType.PREREQUISITES -> PrerequisitesSection(section.items ?: emptyList())
                SectionType.STEP -> StepSection(section.title ?: "", section.content)
                SectionType.CODE_BLOCK -> CodeBlockSection(
                    code = section.content,
                    language = section.language ?: "plaintext"
                )
                SectionType.BULLET_LIST -> BulletListSection(section.items ?: emptyList())
                SectionType.NOTE -> NoteSection(section.content)
                SectionType.WARNING -> WarningSection(section.content)
            }
        }
    }
}

@Composable
private fun TitleSection(title: String) {
    Text(
        text = title,
        color = JarvisLightBlue,
        fontSize = 20.sp,
        fontWeight = FontWeight.Bold,
        fontFamily = FontFamily.Monospace,
        modifier = Modifier.padding(vertical = 4.dp)
    )
}

@Composable
private fun ParagraphSection(text: String) {
    Text(
        text = text,
        color = JarvisLightBlue.copy(alpha = 0.9f),
        fontSize = 15.sp,
        lineHeight = 22.sp,
        fontFamily = FontFamily.Monospace,
        modifier = Modifier.padding(vertical = 2.dp)
    )
}

@Composable
private fun PrerequisitesSection(items: List<String>) {
    Card(
        modifier = Modifier.fillMaxWidth(),
        colors = CardDefaults.cardColors(
            containerColor = SurfaceDark
        ),
        shape = RoundedCornerShape(8.dp)
    ) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Text(
                text = "✅ Prerequisites",
                color = AccentGreen,
                fontSize = 16.sp,
                fontWeight = FontWeight.SemiBold,
                modifier = Modifier.padding(bottom = 8.dp)
            )
            items.forEach { item ->
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(vertical = 4.dp),
                    horizontalArrangement = Arrangement.Start,
                    verticalAlignment = Alignment.Top
                ) {
                    Icon(
                        imageVector = Icons.Default.Check,
                        contentDescription = null,
                        tint = CheckmarkGreen,
                        modifier = Modifier
                            .size(18.dp)
                            .padding(top = 2.dp)
                    )
                    Spacer(modifier = Modifier.width(8.dp))
                    Text(
                        text = item,
                        color = TextPrimary,
                        fontSize = 14.sp,
                        lineHeight = 20.sp
                    )
                }
            }
        }
    }
}

@Composable
private fun StepSection(stepTitle: String, content: String) {
    Column(
        modifier = Modifier.fillMaxWidth()
    ) {
        Text(
            text = stepTitle,
            color = AccentBlue,
            fontSize = 16.sp,
            fontWeight = FontWeight.SemiBold,
            modifier = Modifier.padding(bottom = 6.dp)
        )
        Text(
            text = content,
            color = TextPrimary,
            fontSize = 14.sp,
            lineHeight = 21.sp
        )
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun CodeBlockSection(
    code: String,
    language: String
) {
    val clipboardManager = LocalClipboardManager.current
    val context = LocalContext.current
    var copied by remember { mutableStateOf(false) }

    Card(
        modifier = Modifier.fillMaxWidth(),
        colors = CardDefaults.cardColors(
            containerColor = CodeBlockBg
        ),
        shape = RoundedCornerShape(8.dp)
    ) {
        Column {
            // Header with language and copy button
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .background(Color(0xFF161B22))
                    .padding(horizontal = 12.dp, vertical = 8.dp),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text(
                    text = language,
                    color = TextSecondary,
                    fontSize = 12.sp,
                    fontFamily = FontFamily.Monospace
                )
                
                Row(
                    verticalAlignment = Alignment.CenterVertically,
                    modifier = Modifier
                        .clip(RoundedCornerShape(4.dp))
                        .clickable {
                            clipboardManager.setText(AnnotatedString(code))
                            copied = true
                            Toast.makeText(context, "Code copied!", Toast.LENGTH_SHORT).show()
                        }
                        .padding(horizontal = 8.dp, vertical = 4.dp)
                ) {
                    Icon(
                        imageVector = if (copied) Icons.Default.Check else Icons.Default.ContentCopy,
                        contentDescription = "Copy code",
                        tint = if (copied) CheckmarkGreen else TextSecondary,
                        modifier = Modifier.size(16.dp)
                    )
                    Spacer(modifier = Modifier.width(4.dp))
                    Text(
                        text = if (copied) "Copied!" else "Copy code",
                        color = if (copied) CheckmarkGreen else TextSecondary,
                        fontSize = 12.sp
                    )
                }
            }
            
            // Code content with syntax highlighting
            Box(
                modifier = Modifier
                    .fillMaxWidth()
                    .horizontalScroll(rememberScrollState())
                    .padding(16.dp)
            ) {
                Text(
                    text = highlightCode(code, language),
                    fontFamily = FontFamily.Monospace,
                    fontSize = 13.sp,
                    lineHeight = 20.sp
                )
            }
        }
    }
    
    // Reset copied state after delay
    LaunchedEffect(copied) {
        if (copied) {
            kotlinx.coroutines.delay(2000)
            copied = false
        }
    }
}

@Composable
private fun highlightCode(code: String, language: String): AnnotatedString {
    return buildAnnotatedString {
        when (language.lowercase()) {
            "kotlin", "java" -> highlightJavaKotlin(code)
            "python" -> highlightPython(code)
            "javascript", "js", "typescript", "ts" -> highlightJavaScript(code)
            "xml", "html" -> highlightXml(code)
            "json" -> highlightJson(code)
            else -> {
                withStyle(SpanStyle(color = TextPrimary)) {
                    append(code)
                }
            }
        }
    }
}

private fun AnnotatedString.Builder.highlightJavaKotlin(code: String) {
    val keywords = setOf(
        "fun", "val", "var", "if", "else", "when", "for", "while", "do",
        "return", "break", "continue", "class", "interface", "object",
        "package", "import", "private", "public", "protected", "internal",
        "override", "companion", "const", "lateinit", "lazy", "suspend",
        "inline", "reified", "sealed", "data", "enum", "annotation",
        "void", "int", "float", "double", "boolean", "char", "byte", "short", "long"
    )
    
    val lines = code.lines()
    lines.forEachIndexed { index, line ->
        var i = 0
        while (i < line.length) {
            when {
                // Comments
                line.startsWith("//", i) -> {
                    withStyle(SpanStyle(color = Color(0xFF6A9955))) {
                        append(line.substring(i))
                    }
                    i = line.length
                }
                // Strings
                line[i] == '"' -> {
                    val end = line.indexOf('"', i + 1)
                    if (end != -1) {
                        withStyle(SpanStyle(color = Color(0xFFCE9178))) {
                            append(line.substring(i, end + 1))
                        }
                        i = end + 1
                    } else {
                        append(line[i])
                        i++
                    }
                }
                // Numbers
                line[i].isDigit() -> {
                    var j = i
                    while (j < line.length && (line[j].isDigit() || line[j] == '.')) j++
                    withStyle(SpanStyle(color = Color(0xFFB5CEA8))) {
                        append(line.substring(i, j))
                    }
                    i = j
                }
                // Keywords
                line[i].isLetter() -> {
                    var j = i
                    while (j < line.length && (line[j].isLetterOrDigit() || line[j] == '_')) j++
                    val word = line.substring(i, j)
                    if (word in keywords) {
                        withStyle(SpanStyle(color = Color(0xFF569CD6))) {
                            append(word)
                        }
                    } else {
                        withStyle(SpanStyle(color = TextPrimary)) {
                            append(word)
                        }
                    }
                    i = j
                }
                else -> {
                    withStyle(SpanStyle(color = TextPrimary)) {
                        append(line[i])
                    }
                    i++
                }
            }
        }
        if (index < lines.lastIndex) append("\n")
    }
}

private fun AnnotatedString.Builder.highlightPython(code: String) {
    // Simplified - add full implementation as needed
    withStyle(SpanStyle(color = TextPrimary)) {
        append(code)
    }
}

private fun AnnotatedString.Builder.highlightJavaScript(code: String) {
    // Simplified - add full implementation as needed
    withStyle(SpanStyle(color = TextPrimary)) {
        append(code)
    }
}

private fun AnnotatedString.Builder.highlightXml(code: String) {
    // Simplified - add full implementation as needed
    withStyle(SpanStyle(color = TextPrimary)) {
        append(code)
    }
}

private fun AnnotatedString.Builder.highlightJson(code: String) {
    // Simplified - add full implementation as needed
    withStyle(SpanStyle(color = TextPrimary)) {
        append(code)
    }
}

@Composable
private fun BulletListSection(items: List<String>) {
    Column(
        modifier = Modifier.fillMaxWidth(),
        verticalArrangement = Arrangement.spacedBy(4.dp)
    ) {
        items.forEach { item ->
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.Start
            ) {
                Text(
                    text = "•",
                    color = AccentBlue,
                    fontSize = 16.sp,
                    modifier = Modifier.padding(end = 8.dp)
                )
                Text(
                    text = item,
                    color = TextPrimary,
                    fontSize = 14.sp,
                    lineHeight = 20.sp
                )
            }
        }
    }
}

@Composable
private fun NoteSection(content: String) {
    Card(
        modifier = Modifier.fillMaxWidth(),
        colors = CardDefaults.cardColors(
            containerColor = Color(0xFF1E3A5F).copy(alpha = 0.3f)
        ),
        shape = RoundedCornerShape(8.dp),
        border = CardDefaults.outlinedCardBorder().copy(
            width = 1.dp,
            brush = androidx.compose.ui.graphics.SolidColor(AccentBlue.copy(alpha = 0.5f))
        )
    ) {
        Row(
            modifier = Modifier.padding(12.dp),
            horizontalArrangement = Arrangement.Start
        ) {
            Text(
                text = "💡",
                fontSize = 16.sp,
                modifier = Modifier.padding(end = 8.dp)
            )
            Text(
                text = content,
                color = TextPrimary,
                fontSize = 14.sp,
                lineHeight = 20.sp
            )
        }
    }
}

@Composable
private fun WarningSection(content: String) {
    Card(
        modifier = Modifier.fillMaxWidth(),
        colors = CardDefaults.cardColors(
            containerColor = Color(0xFF5F3A1E).copy(alpha = 0.3f)
        ),
        shape = RoundedCornerShape(8.dp),
        border = CardDefaults.outlinedCardBorder().copy(
            width = 1.dp,
            brush = androidx.compose.ui.graphics.SolidColor(AccentOrange.copy(alpha = 0.5f))
        )
    ) {
        Row(
            modifier = Modifier.padding(12.dp),
            horizontalArrangement = Arrangement.Start
        ) {
            Text(
                text = "⚠️",
                fontSize = 16.sp,
                modifier = Modifier.padding(end = 8.dp)
            )
            Text(
                text = content,
                color = TextPrimary,
                fontSize = 14.sp,
                lineHeight = 20.sp
            )
        }
    }
}
