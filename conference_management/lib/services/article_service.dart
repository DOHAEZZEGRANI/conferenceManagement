import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/article.dart';
import 'package:conference_management/config/api_config.dart';

final url = '${ApiConfig.baseUrl}/users';
class ArticleService {
  final String baseUrl = 'https://api.conference-management.com'; // Remplacez par l'URL de votre API.

  Future<List<Article>> getArticlesByConference(int conferenceId) async {
    final url = Uri.parse('$baseUrl/conferences/$conferenceId/articles');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Article.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch articles');
    }
  }

  Future<void> submitArticle(Article article) async {
    final url = Uri.parse('$baseUrl/articles');
    final response = await http.post(
      url,
      body: json.encode(article.toJson()),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to submit article');
    }
  }

  Future<void> updateArticle(int id, Article article) async {
    final url = Uri.parse('$baseUrl/articles/$id');
    final response = await http.put(
      url,
      body: json.encode(article.toJson()),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update article');
    }
  }
}
