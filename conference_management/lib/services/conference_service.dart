import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/conference.dart';
import 'package:conference_management/config/api_config.dart';

final url = '${ApiConfig.baseUrl}/users';
class ConferenceService {
  final String baseUrl = 'https://api.conference-management.com'; // Remplacez par l'URL de votre API.

  Future<List<Conference>> getConferences() async {
    final url = Uri.parse('$baseUrl/conferences');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Conference.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch conferences');
    }
  }

  Future<void> createConference(Conference conference) async {
    final url = Uri.parse('$baseUrl/conferences');
    final response = await http.post(
      url,
      body: json.encode(conference.toJson()),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to create conference');
    }
  }

  Future<void> updateConference(int id, Conference conference) async {
    final url = Uri.parse('$baseUrl/conferences/$id');
    final response = await http.put(
      url,
      body: json.encode(conference.toJson()),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update conference');
    }
  }
}
