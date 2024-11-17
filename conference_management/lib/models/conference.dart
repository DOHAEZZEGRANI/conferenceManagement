import 'package:conference_management/config/api_config.dart';

final url = '${ApiConfig.baseUrl}/users';
class Conference {
  final int id;
  final String title;
  final String description;
  final DateTime startDate;
  final DateTime endDate;
  final String status; // 'open', 'closed', 'ongoing'

  Conference({
    required this.id,
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.status,
  });

  factory Conference.fromJson(Map<String, dynamic> json) {
    return Conference(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'status': status,
    };
  }
}
