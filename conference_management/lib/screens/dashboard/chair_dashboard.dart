import 'package:flutter/material.dart';
import 'package:conference_management/config/api_config.dart';

final url = '${ApiConfig.baseUrl}/users';
class ChairDashboard extends StatelessWidget {
  const ChairDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chair Dashboard'),
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
              // Navigate to assign articles
            },
            child: const Text('Attribuer des articles'),
          ),
          ElevatedButton(
            onPressed: () {
              // Navigate to manage decisions
            },
            child: const Text('Gérer les décisions'),
          ),
          ElevatedButton(
            onPressed: () {
              // Navigate to view conferences
            },
            child: const Text('Suivre les conférences'),
          ),
        ],
      ),
    );
  }
}
