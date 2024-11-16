import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "http://localhost:8080/api";

  Future<List<dynamic>> getConferences() async {
    final response = await http.get(Uri.parse('$baseUrl/conferences'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load conferences');
    }
  }

  Future<bool> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/login'),
      body: jsonEncode({"email": email, "password": password}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      // Store token securely (e.g., with flutter_secure_storage)
      return true;
    } else {
      return false;
    }
  }
}