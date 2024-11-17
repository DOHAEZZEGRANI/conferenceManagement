import 'package:flutter/material.dart';
import 'package:conference_management/config/api_config.dart';

final url = '${ApiConfig.baseUrl}/users';
class NotificationTile extends StatelessWidget {
  final String message;
  final String time;

  const NotificationTile({
    super.key,
    required this.message,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.notifications, color: Colors.blue),
      title: Text(
        message,
        style: const TextStyle(fontSize: 16.0),
      ),
      subtitle: Text(
        time,
        style: const TextStyle(fontSize: 12.0, color: Colors.grey),
      ),
    );
  }
}
