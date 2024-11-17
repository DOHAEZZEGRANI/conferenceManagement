import 'package:conference_management/config/api_config.dart';

final url = '${ApiConfig.baseUrl}/users';
class AppConstants {
  static const String appName = 'Conference Management';
  static const String apiBaseUrl = 'https://api.conference-management.com';

  // Role constants
  static const String roleAdmin = 'Admin';
  static const String roleChair = 'Chair';
  static const String roleReviewer = 'Reviewer';
  static const String roleResearcher = 'Researcher';
}
