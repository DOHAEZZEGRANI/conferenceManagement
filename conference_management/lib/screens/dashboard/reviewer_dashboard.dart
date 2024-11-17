import 'package:flutter/material.dart';
import 'package:conference_management/config/api_config.dart';

final url = '${ApiConfig.baseUrl}/users';
class ReviewerDashboard extends StatelessWidget {
  const ReviewerDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reviewer Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ElevatedButton(
            onPressed: () {
              // Navigate to view assigned articles
            },
            child: const Text('Articles assignés'),
          ),
          ElevatedButton(
            onPressed: () {
              // Navigate to submit reviews
            },
            child: const Text('Soumettre des avis'),
          ),
        ],
      ),
    );
  }
}
