# A4F Flux Kontext Dev Image Editing Integration

## Overview

The A4F Flux Kontext Dev model has been successfully integrated into the StabilityUI app as a new image editing option in the Image-to-Image section. This model uses the A4F (All4Free) API to provide advanced image editing capabilities using the Flux Kontext Dev model.

## Features

- **Advanced Image Editing**: Transform images based on text prompts using the Flux Kontext Dev model
- **High-Quality Output**: Leverages the power of the Flux model for superior image generation
- **Easy Integration**: Seamlessly integrated into the existing Image-to-Image interface

## How to Use

1. **Open the Image-to-Image Section**
   - Launch the StabilityUI app
   - Navigate to the Image-to-Image screen

2. **Select the Model**
   - In the model selection dropdown, look for "✨ A4F Flux Kontext Dev Edit"
   - Select this option from the list

3. **Upload an Image**
   - Choose an image from your gallery or take a new photo
   - The image will be displayed in the preview area

4. **Enter Your Prompt**
   - In the prompt field, describe the changes you want to make to the image
   - Be specific and descriptive for better results
   - Example prompts:
     - "Add a cute hat to the subject"
     - "Change the background to a sunset beach"
     - "Make the image look like a watercolor painting"
     - "Add dramatic lighting and shadows"

5. **Generate**
   - Tap the "Generate" button
   - The app will process your request using the A4F API
   - Wait for the transformed image to appear

## API Configuration

The A4F API key is already configured in the app:

```kotlin
// Located in: app/src/main/java/max/ohm/oneai/a4f/A4FClient.kt
object A4FClient {
    const val A4F_API_KEY = "ddc-a4f-2e9bee7f17d640d7bcba8fb26cf48d46"
    const val A4F_BASE_URL = "https://api.a4f.co/v1/"
}
```

## Technical Details

### API Endpoint
- **URL**: `https://api.a4f.co/v1/images/edits`
- **Method**: POST (multipart/form-data)
- **Headers**: 
  - `Authorization: Bearer YOUR_A4F_API_KEY`

### Request Parameters
- `image`: The input image file (converted from base64)
- `prompt`: The text description of desired changes
- `model`: "provider-3/flux-kontext-dev"

### Response Format
```json
{
  "data": [
    {
      "url": "https://generated-image-url.com/image.png"
    }
  ]
}
```

## Implementation Details

The implementation is located in `UnifiedImageToImageViewModel.kt`:

```kotlin
private suspend fun performA4FFluxKontextDev(base64Image: String) = withContext(Dispatchers.IO) {
    // Check API key
    if (A4F_API_KEY == "YOUR_A4F_API_KEY_HERE" || A4F_API_KEY.isBlank()) {
        errorMessage = "Please set your A4F API Key"
        return@withContext
    }
    
    // Create multipart request
    val requestBody = MultipartBody.Builder()
        .setType(MultipartBody.FORM)
        .addFormDataPart("image", "image.png", base64ToRequestBody(base64Image))
        .addFormDataPart("prompt", prompt)
        .addFormDataPart("model", "provider-3/flux-kontext-dev")
        .build()
    
    // Make API call
    val request = Request.Builder()
        .url("https://api.a4f.co/v1/images/edits")
        .addHeader("Authorization", "Bearer $A4F_API_KEY")
        .post(requestBody)
        .build()
    
    // Process response
    // ...
}
```

## Troubleshooting

### Common Issues

1. **"Please set your A4F API Key" error**
   - Ensure the API key is properly set in `A4FClient.kt`
   - The current key should work: `ddc-a4f-2e9bee7f17d640d7bcba8fb26cf48d46`

2. **Network errors**
   - Check your internet connection
   - Ensure the A4F API service is available

3. **Image processing fails**
   - Try with a different image format (PNG/JPEG)
   - Ensure the image isn't too large (resize if needed)
   - Make sure your prompt is clear and descriptive

## Best Practices

1. **Image Quality**
   - Use high-quality input images for better results
   - Images are automatically resized if needed to optimize processing

2. **Prompt Writing**
   - Be specific about what you want to change
   - Describe the style, mood, or specific elements
   - Avoid overly complex or contradictory instructions

3. **Performance**
   - Processing may take 10-30 seconds depending on the complexity
   - The app shows a loading indicator during processing

## Future Enhancements

- Add support for batch processing
- Implement image history/gallery for A4F edits
- Add preset prompts for common transformations
- Support for additional A4F models

## Support

For issues or questions:
- Check the error messages in the app
- Review the Android Studio logs for detailed error information
- Ensure your A4F API key is valid and has sufficient credits
