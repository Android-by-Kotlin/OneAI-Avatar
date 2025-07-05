package max.ohm.oneai.chatbot

import java.util.regex.Pattern

/**
 * Parser to convert bot response text into structured sections
 */
object ResponseParser {
    
    fun parseResponse(response: String): List<ResponseSection> {
        val sections = mutableListOf<ResponseSection>()
        val lines = response.lines()
        var currentIndex = 0
        
        while (currentIndex < lines.size) {
            val line = lines[currentIndex].trim()
            
            when {
                // Check for title (lines starting with # or bold text)
                line.startsWith("# ") -> {
                    sections.add(ResponseSection(
                        type = SectionType.TITLE,
                        content = line.substring(2).trim()
                    ))
                    currentIndex++
                }
                
                // Check for prerequisites section
                line.contains("Prerequisites", ignoreCase = true) && 
                (line.contains("✅") || line.contains("☑") || line.startsWith("**Prerequisites")) -> {
                    val items = mutableListOf<String>()
                    currentIndex++
                    
                    // Collect prerequisite items
                    while (currentIndex < lines.size) {
                        val itemLine = lines[currentIndex].trim()
                        if (itemLine.isEmpty() || 
                            (!itemLine.startsWith("•") && 
                             !itemLine.startsWith("-") && 
                             !itemLine.startsWith("*") &&
                             !itemLine.startsWith("✓") &&
                             !itemLine.startsWith("☑"))) {
                            break
                        }
                        
                        val item = itemLine
                            .removePrefix("•").removePrefix("-")
                            .removePrefix("*").removePrefix("✓")
                            .removePrefix("☑").trim()
                        if (item.isNotEmpty()) {
                            items.add(item)
                        }
                        currentIndex++
                    }
                    
                    if (items.isNotEmpty()) {
                        sections.add(ResponseSection(
                            type = SectionType.PREREQUISITES,
                            content = "",
                            items = items
                        ))
                    }
                }
                
                // Check for step sections
                line.matches(Regex("^(Step \\d+:|\\d+\\.|###).*")) -> {
                    val stepTitle = line
                        .removePrefix("###").trim()
                        .removePrefix("Step ").trim()
                    
                    val contentLines = mutableListOf<String>()
                    currentIndex++
                    
                    // Collect step content
                    while (currentIndex < lines.size) {
                        val contentLine = lines[currentIndex]
                        if (contentLine.trim().isEmpty()) {
                            if (contentLines.isNotEmpty()) {
                                break
                            }
                        } else if (isNewSection(contentLine)) {
                            break
                        } else {
                            contentLines.add(contentLine)
                        }
                        currentIndex++
                    }
                    
                    sections.add(ResponseSection(
                        type = SectionType.STEP,
                        title = stepTitle,
                        content = contentLines.joinToString("\n").trim()
                    ))
                }
                
                // Check for code blocks
                line.startsWith("```") -> {
                    val language = line.removePrefix("```").trim().ifEmpty { "plaintext" }
                    val codeLines = mutableListOf<String>()
                    currentIndex++
                    
                    // Collect code until closing ```
                    while (currentIndex < lines.size && !lines[currentIndex].trim().startsWith("```")) {
                        codeLines.add(lines[currentIndex])
                        currentIndex++
                    }
                    
                    if (currentIndex < lines.size) {
                        currentIndex++ // Skip closing ```
                    }
                    
                    sections.add(ResponseSection(
                        type = SectionType.CODE_BLOCK,
                        content = codeLines.joinToString("\n"),
                        language = language
                    ))
                }
                
                // Check for bullet lists
                (line.startsWith("•") || line.startsWith("-") || line.startsWith("*")) && 
                !line.contains("Prerequisites", ignoreCase = true) -> {
                    val items = mutableListOf<String>()
                    
                    // Collect list items
                    while (currentIndex < lines.size) {
                        val itemLine = lines[currentIndex].trim()
                        if (!itemLine.startsWith("•") && 
                            !itemLine.startsWith("-") && 
                            !itemLine.startsWith("*")) {
                            break
                        }
                        
                        val item = itemLine
                            .removePrefix("•").removePrefix("-")
                            .removePrefix("*").trim()
                        if (item.isNotEmpty()) {
                            items.add(item)
                        }
                        currentIndex++
                    }
                    
                    if (items.isNotEmpty()) {
                        sections.add(ResponseSection(
                            type = SectionType.BULLET_LIST,
                            content = "",
                            items = items
                        ))
                    }
                }
                
                // Check for note sections
                line.startsWith("Note:") || line.startsWith("💡") || line.startsWith("ℹ️") -> {
                    val noteContent = line
                        .removePrefix("Note:").removePrefix("💡")
                        .removePrefix("ℹ️").trim()
                    
                    sections.add(ResponseSection(
                        type = SectionType.NOTE,
                        content = noteContent
                    ))
                    currentIndex++
                }
                
                // Check for warning sections
                line.startsWith("Warning:") || line.startsWith("⚠️") || line.startsWith("❗") -> {
                    val warningContent = line
                        .removePrefix("Warning:").removePrefix("⚠️")
                        .removePrefix("❗").trim()
                    
                    sections.add(ResponseSection(
                        type = SectionType.WARNING,
                        content = warningContent
                    ))
                    currentIndex++
                }
                
                // Empty line - skip
                line.isEmpty() -> {
                    currentIndex++
                }
                
                // Default to paragraph
                else -> {
                    val paragraphLines = mutableListOf<String>()
                    
                    // Collect paragraph lines
                    while (currentIndex < lines.size) {
                        val paragraphLine = lines[currentIndex].trim()
                        if (paragraphLine.isEmpty() || isNewSection(lines[currentIndex])) {
                            break
                        }
                        paragraphLines.add(paragraphLine)
                        currentIndex++
                    }
                    
                    if (paragraphLines.isNotEmpty()) {
                        sections.add(ResponseSection(
                            type = SectionType.PARAGRAPH,
                            content = paragraphLines.joinToString(" ")
                        ))
                    }
                }
            }
        }
        
        return sections
    }
    
    private fun isNewSection(line: String): Boolean {
        val trimmedLine = line.trim()
        return trimmedLine.startsWith("```") ||
               trimmedLine.startsWith("# ") ||
               trimmedLine.matches(Regex("^(Step \\d+:|\\d+\\.|###).*")) ||
               trimmedLine.contains("Prerequisites", ignoreCase = true) ||
               trimmedLine.startsWith("Note:") ||
               trimmedLine.startsWith("Warning:") ||
               trimmedLine.startsWith("💡") ||
               trimmedLine.startsWith("⚠️")
    }
    
    /**
     * Parse a simple response that might not have markdown formatting
     */
    fun parseSimpleResponse(response: String): List<ResponseSection> {
        // First try normal parsing
        val sections = parseResponse(response)
        
        // If we only got paragraphs, try to detect structure
        if (sections.all { it.type == SectionType.PARAGRAPH }) {
            return parseStructuredText(response)
        }
        
        return sections
    }
    
    private fun parseStructuredText(response: String): List<ResponseSection> {
        val sections = mutableListOf<ResponseSection>()
        val lines = response.lines()
        
        for (line in lines) {
            val trimmedLine = line.trim()
            if (trimmedLine.isEmpty()) continue
            
            // Detect if line looks like a title (short, possibly numbered)
            if (trimmedLine.length < 50 && 
                (trimmedLine.endsWith(":") || 
                 trimmedLine.matches(Regex("^\\d+\\.\\s+.*")) ||
                 trimmedLine.all { it.isUpperCase() || it.isWhitespace() })) {
                sections.add(ResponseSection(
                    type = SectionType.TITLE,
                    content = trimmedLine.removeSuffix(":").trim()
                ))
            } else {
                // Check if it's already been added as part of a previous section
                if (sections.isEmpty() || sections.last().type == SectionType.TITLE) {
                    sections.add(ResponseSection(
                        type = SectionType.PARAGRAPH,
                        content = trimmedLine
                    ))
                }
            }
        }
        
        return sections
    }
}
