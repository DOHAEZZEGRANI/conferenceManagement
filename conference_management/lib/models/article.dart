import 'package:conference_management/config/api_config.dart';

final url = '${ApiConfig.baseUrl}/users';
class Article {
  final int id;
  final String title;
  final String summary;
  final List<String> authors;
  final String fileUrl; // Path or URL to the file
  final String status; // 'submitted', 'reviewed', 'accepted', 'rejected'
  final int conferenceId;

  Article({
    required this.id,
    required this.title,
    required this.summary,
    required this.authors,
    required this.fileUrl,
    required this.status,
    required this.conferenceId,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      title: json['title'],
      summary: json['summary'],
      authors: List<String>.from(json['authors']),
      fileUrl: json['fileUrl'],
      status: json['status'],
      conferenceId: json['conferenceId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'summary': summary,
      'authors': authors,
      'fileUrl': fileUrl,
      'status': status,
      'conferenceId': conferenceId,
    };
  }
}
