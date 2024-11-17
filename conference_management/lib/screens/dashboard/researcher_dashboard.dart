import 'package:flutter/material.dart';
import 'package:conference_management/config/api_config.dart';

final url = '${ApiConfig.baseUrl}/users';
class ResearcherDashboard extends StatelessWidget {
  const ResearcherDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Researcher Dashboard'),
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
              // Navigate to submit articles
            },
            child: const Text('Soumettre un article'),
          ),
          ElevatedButton(
            onPressed: () {
              // Navigate to track submissions
            },
            child: const Text('Suivre les soumissions'),
          ),
        ],
      ),
    );
  }
}
