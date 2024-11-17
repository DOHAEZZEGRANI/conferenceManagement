import 'package:flutter/material.dart';
import 'package:conference_management/config/api_config.dart';

final url = '${ApiConfig.baseUrl}/users';
class ViewStatisticsScreen extends StatelessWidget {
  const ViewStatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Voir les statistiques'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Statistiques globales',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Card(
              child: ListTile(
                title: const Text('Nombre total d’utilisateurs'),
                trailing: const Text('150'),
              ),
            ),
            Card(
              child: ListTile(
                title: const Text('Conférences en cours'),
                trailing: const Text('12'),
              ),
            ),
            Card(
              child: ListTile(
                title: const Text('Articles soumis'),
                trailing: const Text('78'),
              ),
            ),
            // Add more statistics here
          ],
        ),
      ),
    );
  }
}
