package max.ohm.oneai.imagegeneration.modelslab

import android.util.Log
import kotlinx.coroutines.runBlocking

/**
 * Example demonstrating how to use the ModelsLab nano-banana model
 * This corresponds to the curl command:
 * 
 * curl -X POST "https://modelslab.com/api/v7/images/text-to-image" \
 *   -H "key: 0TZLnFEqdrVZ3QlDT7KwcAaJv99OFGrmVBphSNTz5qUcWXWcUJQ58kQbxhxx" \
 *   -H "Content-Type: application/json" \
 *   -d '{
 *     "key": "<API_KEY>",
 *     "prompt": "A spooky Halloween-themed burger...",
 *     "model_id": "nano-banana"
 *   }'
 */
object NanoBananaModelExample {
    
    /**
     * Example function showing how to generate an image using the nano-banana model
     */
    suspend fun generateHalloweenBurger(): ModelsLabTextToImageService.TextToImageResponse {
        val service = ModelsLabTextToImageService()
        
        val request = ModelsLabTextToImageService.TextToImageRequest(
            prompt = "A spooky Halloween-themed burger designed with a carved jack-o'-lantern pumpkin as the bun, glowing with fiery light inside. The burger contains multiple juicy beef patties, melted glowing cheese resembling fire, and fresh lettuce. Dark moody background with glowing orange bokeh lights, a wine glass, and a bottle adding to the eerie Halloween atmosphere. Highly detailed, cinematic, dramatic lighting, photorealistic style.",
            modelId = ModelsLabTextToImageService.MODEL_NANO_BANANA, // Using the new nano-banana model
            negativePrompt = "low quality, blurry, distorted, ugly",
            width = 768,
            height = 1024,
            guidanceScale = 7.5,
            numInferenceSteps = 31,
            steps = 21,
            samples = 1,
            seed = 0,
            safetyChecker = true,
            enhancePrompt = false,
            useKarrasSigmas = true,
            clipSkip = 1,
            tomesd = true,
            base64 = false // Get URL response
        )
        
        Log.d("NanoBananaExample", "Generating Halloween burger with nano-banana model...")
        
        return service.generateImage(request)
    }
    
    /**
     * Example function showing how to generate a simple image using nano-banana model
     */
    suspend fun generateSimpleImage(prompt: String): ModelsLabTextToImageService.TextToImageResponse {
        val service = ModelsLabTextToImageService()
        
        val request = ModelsLabTextToImageService.TextToImageRequest(
            prompt = prompt,
            modelId = ModelsLabTextToImageService.MODEL_NANO_BANANA,
            negativePrompt = "low quality, blurry, distorted",
            width = 768,
            height = 1024,
            guidanceScale = 7.5,
            numInferenceSteps = 31,
            steps = 21,
            samples = 1,
            seed = 0,
            safetyChecker = true,
            enhancePrompt = true, // Enable prompt enhancement for better results
            useKarrasSigmas = true,
            clipSkip = 1,
            tomesd = true,
            base64 = false
        )
        
        Log.d("NanoBananaExample", "Generating image with prompt: $prompt")
        
        return service.generateImage(request)
    }
    
    /**
     * Usage example in your ViewModel:
     * 
     * To use the nano-banana model in your UnifiedImageViewModel,
     * set the selectedModel to "modelslab/nano-banana":
     * 
     * viewModel.updateSelectedModel("modelslab/nano-banana")
     * 
     * Then call generateImage() as usual with your prompt.
     */
}
