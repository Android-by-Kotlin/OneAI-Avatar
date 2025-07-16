# Stability AI Integration - Image to Image Feature

## Overview
This document describes the implementation of Stability AI's image-to-image feature in the OneAI application.

## Features Implemented

### 1. **New Package Structure**
- Created `stabilityai` package with organized subpackages:
  - `api/` - API service interfaces
  - `data/` - Data models and DTOs
  - `repository/` - Repository layer for API calls
  - `ui/` - UI components
  - `viewmodel/` - ViewModels for business logic

### 2. **Stability AI API Integration**
- **API Key**: Configured with provided API key `sk-NMx82Z8DzBf4W7mo6LSx4HZGYVTGJbReIFEUu8nx9gvtyyFP`
- **Endpoint**: `https://api.stability.ai/v1/generation/stable-diffusion-v1-6/image-to-image`
- **Authentication**: Bearer token authentication
- **Request Format**: Multipart form data with image upload

### 3. **API Configuration**
Following the curl example provided:
```bash
curl -f -sS -X POST "$URL" \
  -H 'Content-Type: multipart/form-data' \
  -H 'Accept: image/png' \
  -H "Authorization: Bearer $STABILITY_API_KEY" \
  -F 'init_image=@"../init_image.png"' \
  -F 'init_image_mode=IMAGE_STRENGTH' \
  -F 'image_strength=0.35' \
  -F 'text_prompts[0][text]=A galactic dog in space' \
  -F 'cfg_scale=7' \
  -F 'samples=1' \
  -F 'steps=30'
```

### 4. **UI Components**

#### **Enhanced ImageToImage Screen**
- Added provider toggle switch between Stability AI and ModelsLab
- Dynamic UI based on selected provider
- Information cards explaining each provider's capabilities
- Conditional button enabling based on provider requirements

#### **Dedicated Stability AI Screen**
- Specialized UI for Stability AI only
- Image upload with visual feedback
- Advanced settings panel with sliders for:
  - Image Strength (0.1-1.0)
  - Steps (10-50)
  - CFG Scale (1-20)
- Enhanced loading states and error handling

### 5. **Navigation Integration**
- Added new route: `"stabilityAI"`
- Integrated into home screen with dedicated button
- Proper authentication checks and state management

### 6. **Key Files Created/Modified**

#### **New Files:**
1. `stabilityai/StabilityApiKey.kt` - API key configuration
2. `stabilityai/data/StabilityModels.kt` - Data models
3. `stabilityai/api/StabilityApiService.kt` - API service interface
4. `stabilityai/repository/StabilityRepository.kt` - Repository implementation
5. `stabilityai/ui/StabilityImageToImageScreen.kt` - Dedicated UI screen
6. `stabilityai/viewmodel/StabilityImageToImageViewModel.kt` - ViewModel

#### **Modified Files:**
1. `ImagetoImage/viewmodel/ImageToImageViewModel.kt` - Added dual provider support
2. `ImagetoImage/ui/ImageToImageScreen.kt` - Added provider toggle UI
3. `navigationsystem/AppNavigation.kt` - Added new route
4. `homescreen/SimpleHomeScreen.kt` - Added Stability AI button

### 7. **Technical Implementation Details**

#### **API Request Flow:**
1. User selects image from device
2. Image is temporarily stored in app cache
3. Multipart request created with image and parameters
4. API response handled (binary image data)
5. Response saved to cache and displayed

#### **Error Handling:**
- Network error handling
- API error response parsing
- User-friendly error messages
- Loading states and progress indicators

#### **Security:**
- API key stored as constant (for development)
- Proper authentication headers
- Secure file handling

### 8. **User Experience Features**

#### **Provider Selection:**
- Toggle between Stability AI and ModelsLab
- Clear information about each provider's capabilities
- Conditional UI elements based on provider

#### **Advanced Settings:**
- Collapsible advanced settings panel
- Real-time parameter adjustment with sliders
- Default values optimized for best results

#### **Visual Feedback:**
- Loading animations with descriptive text
- Progress indicators for long operations
- Success/error states with appropriate messaging

### 9. **Default Configuration**
- **Prompt**: "A galactic dog in space" (as per API example)
- **Image Strength**: 0.35
- **Steps**: 30
- **CFG Scale**: 7
- **Samples**: 1
- **Init Image Mode**: IMAGE_STRENGTH

### 10. **Testing**
- Compilation successful
- All dependencies properly configured
- Navigation routes working
- UI components properly integrated

## Usage Instructions

### **Access Methods:**
1. **From Home Screen**: Tap "Stability AI" button
2. **From Image-to-Image Screen**: Toggle provider switch to Stability AI

### **Steps to Use:**
1. Navigate to Stability AI screen
2. Tap to select/upload an image
3. Enter transformation prompt
4. (Optional) Adjust advanced settings
5. Tap "Transform Image with Stability AI"
6. Wait for processing (30-60 seconds)
7. View generated result

### **Provider Comparison:**
- **Stability AI**: Higher quality, requires image upload only, slower processing
- **ModelsLab**: Faster processing, supports URL and upload, multiple models

## Future Enhancements

### **Potential Improvements:**
1. **Image History**: Save and manage generated images
2. **Batch Processing**: Process multiple images simultaneously
3. **Style Presets**: Predefined transformation styles
4. **Share Functionality**: Share generated images directly
5. **Cloud Storage**: Save images to cloud storage
6. **API Key Management**: Secure API key storage
7. **Performance Optimization**: Image compression and caching

### **Advanced Features:**
1. **Model Selection**: Support for different Stability AI models
2. **Aspect Ratio Control**: Custom image dimensions
3. **Negative Prompts**: Advanced prompt engineering
4. **Seed Control**: Reproducible generation
5. **Upscaling**: Post-generation image enhancement

## Dependencies
- Retrofit for API calls
- OkHttp for HTTP client
- Coil for image loading
- Jetpack Compose for UI
- Coroutines for async operations
- Material3 for design components

## Security Notes
- API key is currently stored as a constant for development
- In production, consider using encrypted storage or environment variables
- Implement proper authentication and rate limiting
- Handle sensitive data appropriately

## Performance Considerations
- Image processing is intensive and may take 30-60 seconds
- Temporary files are created in app cache
- Network requests have appropriate timeouts
- Loading states prevent user confusion during processing

This implementation provides a robust foundation for Stability AI image-to-image functionality with room for future enhancements and optimizations.
