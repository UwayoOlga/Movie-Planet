import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';

class AuthService {
  static const FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  static const String _userKey = 'user_data';
  static const String _tokenKey = 'auth_token';

  // Simulated user database (in real app, this would be an API)
  static final Map<String, User> _users = {};

  // Login user
  Future<AuthResult> login(String email, String password) async {
    try {
      // Simulate API delay
      await Future.delayed(const Duration(seconds: 1));

      // Check if user exists
      final user = _users.values.firstWhere(
        (user) => user.email.toLowerCase() == email.toLowerCase(),
        orElse: () => throw Exception('User not found'),
      );

      // In a real app, you would verify the password hash here
      // For demo purposes, we'll accept any password for existing users

      // Generate a simple token (in real app, this would come from your backend)
      final token = _generateToken(user.id);

      // Save user data and token
      await _saveUserData(user);
      await _saveToken(token);

      return AuthResult.success(user);
    } catch (e) {
      return AuthResult.error(e.toString());
    }
  }

  // Sign up user
  Future<AuthResult> signUp(String name, String email, String password) async {
    try {
      // Simulate API delay
      await Future.delayed(const Duration(seconds: 1));

      // Check if user already exists
      if (_users.values.any(
        (user) => user.email.toLowerCase() == email.toLowerCase(),
      )) {
        return AuthResult.error('User with this email already exists');
      }

      // Validate password
      if (password.length < 6) {
        return AuthResult.error('Password must be at least 6 characters long');
      }

      // Create new user
      final newUser = User(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        email: email,
        name: name,
        createdAt: DateTime.now(),
      );

      // Add to simulated database
      _users[newUser.id] = newUser;

      // Generate token
      final token = _generateToken(newUser.id);

      // Save user data and token
      await _saveUserData(newUser);
      await _saveToken(token);

      return AuthResult.success(newUser);
    } catch (e) {
      return AuthResult.error(e.toString());
    }
  }

  // Logout user
  Future<void> logout() async {
    await _secureStorage.delete(key: _userKey);
    await _secureStorage.delete(key: _tokenKey);
    await SharedPreferences.getInstance().then((prefs) {
      prefs.remove(_userKey);
    });
  }

  // Check if user is logged in
  Future<User?> getCurrentUser() async {
    try {
      final userData = await _secureStorage.read(key: _userKey);
      if (userData != null) {
        final userMap = json.decode(userData);
        return User.fromJson(userMap);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  // Get auth token
  Future<String?> getToken() async {
    return await _secureStorage.read(key: _tokenKey);
  }

  // Save user data
  Future<void> _saveUserData(User user) async {
    final userData = json.encode(user.toJson());
    await _secureStorage.write(key: _userKey, value: userData);
    await SharedPreferences.getInstance().then((prefs) {
      prefs.setString(_userKey, userData);
    });
  }

  // Save auth token
  Future<void> _saveToken(String token) async {
    await _secureStorage.write(key: _tokenKey, value: token);
  }

  // Generate simple token (in real app, this would come from your backend)
  String _generateToken(String userId) {
    return 'token_${userId}_${DateTime.now().millisecondsSinceEpoch}';
  }
}

class AuthResult {
  final bool isSuccess;
  final User? user;
  final String? error;

  AuthResult.success(this.user) : isSuccess = true, error = null;

  AuthResult.error(this.error) : isSuccess = false, user = null;
}
