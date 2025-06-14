# Firebase Setup for OneAI

## Common Issues

If you're seeing the error `Failed to create chat: PERMISSION_DENIED: Missing or insufficient permissions`, it means your Firebase security rules are not properly configured or your authentication is not working correctly.

## Firebase Setup Steps

1. **Create a Firebase Project**:
   - Go to [Firebase Console](https://console.firebase.google.com/)
   - Create a new project or use an existing one
   - Add an Android app to your project with the package name `max.ohm.oneai`

2. **Download Configuration File**:
   - Download the `google-services.json` file
   - Place it in the app/ directory of your project (not in app/src/main/java/...)

3. **Enable Authentication**:
   - Go to Authentication in Firebase Console
   - Enable Email/Password authentication
   - Enable Google authentication (if you want to use it)
   - Set up the OAuth consent screen if needed

4. **Set Up Firestore Database**:
   - Go to Firestore Database in Firebase Console
   - Create a database (start in test mode initially)
   - After testing, update security rules to match those in `assets/firestore.rules`

5. **Deploy Security Rules**:
   - Install Firebase CLI: `npm install -g firebase-tools`
   - Login: `firebase login`
   - Initialize Firebase in your project: `firebase init firestore`
   - Copy the rules from `assets/firestore.rules` to the `firestore.rules` file
   - Deploy rules: `firebase deploy --only firestore:rules`

## Database Structure

The app uses the following database structure:

```
users (Collection)
│
├── {userId} (Document)  👤 Individual User
│   ├── email: "user@example.com"       📧 User Profile Data
│   ├── name: "John Doe"
│   ├── profileImage: "image_url"
│   └── chats (Sub-Collection)          💬 User's Chats
│       │
│       ├── {chatId_1} (Document)       🗨️ Chat 1
│       │   ├── title: "Fixing Activity Not Found"
│       │   ├── createdAt: Timestamp
│       │   ├── updatedAt: Timestamp
│       │   └── messages (Sub-Collection)  📄 Messages in Chat 1
│       │       │
│       │       ├── {messageId_1} (Document)
│       │       │   ├── text: "How do I fix the 'Activity Not Found' error in Android Studio?"
│       │       │   ├── role: "user"
│       │       │   └── timestamp: Timestamp
│       │       │
│       │       ├── {messageId_2} (Document)
│       │       │   ├── text: "The 'Activity Not Found' error usually happens when..."
│       │       │   ├── role: "assistant"
│       │       │   └── timestamp: Timestamp
│       │       │
│       │       └── ... more messages
```

## Troubleshooting

1. **Authentication Issues**:
   - Make sure you're signed in before trying to create chats
   - Check if your Firebase project has authentication enabled
   - Verify the google-services.json file is correctly placed

2. **Permission Denied Errors**:
   - Check your Firestore security rules
   - Ensure you're authenticated before accessing the database
   - Verify the database path structure matches what the app expects

3. **Missing Collections**:
   - Firebase creates collections and documents only when data is written
   - The app will automatically create necessary collections and documents
   - Make sure your security rules allow creating these collections

4. **Google Services JSON Location**:
   - The `google-services.json` file should be in the `app/` directory, not in `app/src/main/java/...`
   - If you have it in the wrong location, move it to the correct location and rebuild the app 