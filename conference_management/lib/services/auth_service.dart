import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:conference_management/config/api_config.dart';

class AuthService {
  final String baseUrl = ApiConfig.baseUrl;

  // Method for registering a user
  Future<bool> register(String email, String password, String name) async {
    final url = '$baseUrl/users/register';
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': email,
          'password': password,
          'name': name,
        }),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        return true;
      } else {
        print('Registration failed: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error during registration: $e');
      return false;
    }
  }

  // Method for logging in a user
  Future<bool> login(String email, String password) async {
    final url = '$baseUrl/users/login'; // URL for login
    try {
      // Prepare the data to send in the request
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        // Login successful
        print('Login successful');
        return true;
      } else {
        // Handle failure (e.g., incorrect credentials)
        print('Failed to login: ${response.statusCode}');
        print('Response body: ${response.body}');
        return false;
      }
    } catch (e) {
      // Handle errors like network issues or server errors
      print('Error during login: $e');
      return false;
    }
  }

  // Method to retrieve the user's role after login (you can adapt this based on your backend response)
  Future<String?> getUserRole(String email, String password) async {
    final url = '$baseUrl/users/login'; // URL for getting user role
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        // Assuming the backend returns a role field in the response body
        final responseData = json.decode(response.body);
        final role = responseData['role'];  // Replace with the correct key for the role in your API response
        return role;
      } else {
        print('Failed to get user role: ${response.body}');
        return null;
      }
    } catch (e) {
      print('Error during getting user role: $e');
      return null;
    }
  }
}
