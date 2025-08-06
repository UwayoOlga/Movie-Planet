# PlayLab

A Flutter-based movie streaming application with authentication system, based on the PlayLab documentation.

## Features Implemented

### 🔐 Authentication System
- **Login Screen**: Beautiful dark-themed login interface with email and password validation
- **Signup Screen**: User registration with name, email, password, and confirm password fields
- **Form Validation**: Real-time validation for all input fields
- **Secure Storage**: User data and tokens stored securely using flutter_secure_storage
- **State Management**: Provider pattern for managing authentication state
- **Auto-login**: Users stay logged in between app sessions

### 🎨 UI/UX Features
- **Modern Dark Theme**: Beautiful gradient backgrounds and modern design
- **Responsive Design**: Works on all screen sizes
- **Loading States**: Smooth loading indicators during authentication
- **Error Handling**: User-friendly error messages
- **Google Fonts**: Custom typography using Poppins font family
- **App Icon**: Uses the official PlayLab app icon from documentation

## Getting Started

### Prerequisites
- Flutter SDK (^3.8.1)
- Dart SDK
- Android Studio / VS Code

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd Movie-Planet
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the application**
   ```bash
   flutter run
   ```

## Project Structure

```
lib/
├── main.dart                 # App entry point with Provider setup
├── models/
│   └── user_model.dart       # User data model
├── providers/
│   └── auth_provider.dart    # Authentication state management
├── screens/
│   ├── auth/
│   │   ├── login_screen.dart    # Login interface
│   │   └── signup_screen.dart   # Registration interface
│   └── home_screen.dart      # Main app screen after login
└── services/
    └── auth_service.dart     # Authentication business logic
```

## Dependencies

- **provider**: State management
- **shared_preferences**: Local data storage
- **flutter_secure_storage**: Secure token storage
- **google_fonts**: Custom typography
- **flutter_svg**: SVG support
- **lottie**: Animation support

## Authentication Flow

1. **App Launch**: Shows splash screen while checking authentication status
2. **Login/Signup**: Users can create account or login with existing credentials
3. **Validation**: Real-time form validation with helpful error messages
4. **Secure Storage**: User data and tokens stored securely
5. **Auto-login**: Users remain logged in until they explicitly logout

## Testing the Authentication

### Creating a New Account
1. Launch the app
2. Tap "Sign Up" on the login screen
3. Fill in your name, email, and password
4. Tap "Sign Up" button
5. You'll be redirected to the home screen

### Logging In
1. If you have an existing account, enter your email and password
2. Tap "Login" button
3. You'll be redirected to the home screen

### Logging Out
1. From the home screen, tap the logout icon in the app bar
2. You'll be redirected back to the login screen

## Documentation Compliance

This implementation follows the PlayLab documentation specifications:
- ✅ Uses correct app name "PlayLab"
- ✅ Implements authentication system as documented
- ✅ Uses official app icon from Documentation/assets/AppIcons
- ✅ Follows Flutter best practices
- ✅ Implements proper state management with Provider
- ✅ Secure storage implementation
- ✅ Modern UI/UX design

## Next Steps

This authentication system provides a solid foundation for the PlayLab movie streaming app. Next features to implement:

- 🎬 Movie browsing and search
- 📺 Video player integration
- 🎭 Movie details and reviews
- 👤 User profile management
- 💾 Favorites and watchlist
- 🔍 Advanced search and filtering
- 🔥 Firebase integration (as per documentation)

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

This project is licensed under the MIT License.
