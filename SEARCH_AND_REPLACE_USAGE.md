# Stability AI Search and Replace Feature

## Overview
The new Search and Replace feature allows you to selectively replace objects in an image using Stability AI's `v2beta/stable-image/edit/search-and-replace` API endpoint.

## How to Use

### 1. Access the Feature
- Open the Stability AI Image-to-Image screen
- Toggle the "Search & Replace" switch to enable the new mode

### 2. Configure the Search and Replace
- **Search for**: Enter what you want to find and replace (e.g., "dog", "car", "person")
- **Replace with**: Enter what you want to replace it with (e.g., "golden retriever", "blue sports car")
- **Output Format**: Choose between WebP (recommended) or PNG

### 3. Upload Image
- Select an image containing the object you want to replace
- The image should clearly show the object you're searching for

### 4. Generate
- Click "Search & Replace with Stability AI"
- The system will process the image and replace the specified object

## Example Usage

### Replace a Dog with a Golden Retriever
- **Search for**: "dog"
- **Replace with**: "golden retriever in a field"
- **Output Format**: WebP

### Replace a Car with a Different Vehicle
- **Search for**: "car"
- **Replace with**: "blue sports car"
- **Output Format**: PNG

## API Details

The feature uses the following endpoint:
```
POST https://api.stability.ai/v2beta/stable-image/edit/search-and-replace
```

With these parameters:
- `image`: The input image file
- `prompt`: What to replace the found object with
- `search_prompt`: What to search for in the image
- `output_format`: Output format (webp or png)

## Code Structure

### New Files/Components Added:
1. **API Service**: Updated `StabilityApiService.kt` with `searchAndReplace()` method
2. **Data Models**: Added `SearchAndReplaceRequest` and `SearchAndReplaceResponse` in `StabilityModels.kt`
3. **Repository**: Added `searchAndReplace()` method in `StabilityRepository.kt`
4. **ViewModel**: Enhanced `StabilityImageToImageViewModel` with search-and-replace state and logic
5. **UI**: Updated `StabilityImageToImageScreen.kt` with mode toggle and search prompt fields

### Key Features:
- Mode toggle between regular image-to-image and search-and-replace
- Separate input fields for search and replace prompts
- Output format selection (WebP/PNG)
- Proper error handling and loading states
- Maintains backward compatibility with existing image-to-image functionality

## Technical Implementation

The implementation follows the cURL example provided:
```bash
curl -f -sS "https://api.stability.ai/v2beta/stable-image/edit/search-and-replace" \
  -H "authorization: Bearer sk-MYAPIKEY" \
  -H "accept: image/*" \
  -F image=@"./husky-in-a-field.png" \
  -F prompt="golden retriever in a field" \
  -F search_prompt="dog" \
  -F output_format="webp" \
  -o "./golden-retriever-in-a-field.webp"
```

This is seamlessly integrated into the existing Android Kotlin codebase using Retrofit and OkHttp.
