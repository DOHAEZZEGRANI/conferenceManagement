import 'package:conference_management/config/api_config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<User>> fetchUsers() async {
  final response = await http.get(Uri.parse('http://localhost:8080/api/users'));

  if (response.statusCode == 200) {
    // Si la réponse est correcte, parsez les données JSON
    List<dynamic> jsonResponse = json.decode(response.body);
    return jsonResponse.map((user) => User.fromJson(user)).toList();
  } else {
    throw Exception('Failed to load users');
  }
}

final url = '${ApiConfig.baseUrl}/users';
class User {
  final int id;
  final String name;
  final String email;
  final String password;
  final String role; // 'admin', 'chair', 'reviewer', 'researcher'

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'role': role,
    };
  }
}
