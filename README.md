# PlayLab

A Flutter-based movie streaming application with authentication system, based on the PlayLab documentation.

## Package Configuration

### **📦 Package Details**
- **Package Name**: `playlab`
- **Description**: PlayLab - Cross Platform on Demand Movie Streaming Mobile Application
- **Android Package**: `com.playlab.app`
- **iOS Bundle ID**: `com.playlab.app` (configurable)
- **Version**: 1.0.0+1

### **🔧 Platform Configuration**
- **Android**: 
  - Application ID: `com.playlab.app`
  - App Label: "PlayLab"
  - Namespace: `com.playlab.app`
- **iOS**: 
  - Bundle Identifier: `com.playlab.app`
  - Display Name: "PlayLab"

## Features Implemented

### 🔐 Authentication System
- **Login Screen**: Beautiful dark-themed login interface with email and password validation
- **Signup Screen**: User registration with name, email, password, and confirm password fields
- **Form Validation**: Real-time validation for all input fields
- **Secure Storage**: User data and tokens stored securely using flutter_secure_storage
- **State Management**: Provider pattern for managing authentication state
- **Auto-login**: Users stay logged in between app sessions

### 🎬 Movie Browsing & Search
- **Movie Browse Screen**: Trending carousel, categories (Popular, Latest)
- **Search Functionality**: Real-time search with results
- **Movie Details**: Comprehensive movie information with backdrop images
- **API Integration**: TMDB API ready (with mock data fallback)
- **Image Caching**: Efficient image loading and caching

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
│   ├── user_model.dart       # User data model
│   └── movie_model.dart      # Movie data model
├── providers/
│   ├── auth_provider.dart    # Authentication state management
│   └── movie_provider.dart   # Movie data state management
├── screens/
│   ├── auth/
│   │   ├── login_screen.dart    # Login interface
│   │   └── signup_screen.dart   # Registration interface
│   ├── home_screen.dart      # Welcome screen after login
│   ├── movie_browse_screen.dart # Main movie browsing interface
│   ├── search_screen.dart    # Movie search functionality
│   └── movie_details_screen.dart # Detailed movie view
└── services/
    ├── auth_service.dart     # Authentication business logic
    └── movie_service.dart    # Movie API and data handling
```

## Dependencies

- **provider**: State management
- **shared_preferences**: Local data storage
- **flutter_secure_storage**: Secure token storage
- **google_fonts**: Custom typography
- **flutter_svg**: SVG support
- **lottie**: Animation support
- **http**: API requests
- **cached_network_image**: Image loading and caching
- **shimmer**: Loading placeholders
- **carousel_slider**: Movie carousel

## Authentication Flow

1. **App Launch**: Shows splash screen while checking authentication status
2. **Login/Signup**: Users can create account or login with existing credentials
3. **Validation**: Real-time form validation with helpful error messages
4. **Secure Storage**: User data and tokens stored securely
5. **Auto-login**: Users remain logged in until they explicitly logout

## Movie Browsing Flow

1. **Browse Screen**: Trending carousel + Popular/Latest categories
2. **Search**: Real-time search with results
3. **Movie Details**: Comprehensive movie information
4. **Navigation**: Seamless navigation between screens

## Testing the Application

### Creating a New Account
1. Launch the app
2. Tap "Sign Up" on the login screen
3. Fill in your name, email, and password
4. Tap "Sign Up" button
5. You'll be redirected to the movie browse screen

### Logging In
1. If you have an existing account, enter your email and password
2. Tap "Login" button
3. You'll be redirected to the movie browse screen

### Browsing Movies
1. View trending movies in the carousel
2. Browse Popular and Latest categories
3. Use the search icon to find specific movies
4. Tap any movie to view detailed information

### Logging Out
1. From any screen, tap the logout icon in the app bar
2. You'll be redirected back to the login screen

## Documentation Compliance

This implementation follows the PlayLab documentation specifications:
- ✅ Uses correct app name "PlayLab"
- ✅ Proper package configuration (com.playlab.app)
- ✅ Implements authentication system as documented
- ✅ Uses official app icon from Documentation/assets/AppIcons
- ✅ Follows Flutter best practices
- ✅ Implements proper state management with Provider
- ✅ Secure storage implementation
- ✅ Modern UI/UX design
- ✅ Movie browsing and search functionality

## API Configuration

### TMDB API Integration
The app is configured to work with The Movie Database (TMDB) API:
- **Base URL**: `https://api.themoviedb.org/3`
- **Image Base URL**: `https://image.tmdb.org/t/p/`
- **API Key**: Set in `lib/services/movie_service.dart`

To use real API data:
1. Get a TMDB API key from [themoviedb.org](https://www.themoviedb.org/settings/api)
2. Replace `YOUR_TMDB_API_KEY` in `lib/services/movie_service.dart`
3. The app will automatically use real data instead of mock data

## Next Steps

This authentication and movie browsing system provides a solid foundation for the PlayLab movie streaming app. Next features to implement:

- 🎬 Video player integration
- 🔥 Firebase backend integration
- 👤 User profile management
- 💾 Favorites and watchlist
- 🔍 Advanced search and filtering
- 🌐 Social login (Google, Facebook, LinkedIn)

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

This project is licensed under the MIT License.
