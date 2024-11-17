import 'package:flutter/material.dart';
import 'package:conference_management/config/api_config.dart';

final url = '${ApiConfig.baseUrl}/users';
class ManageConferencesScreen extends StatelessWidget {
  const ManageConferencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gérer les conférences'),
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
          ListTile(
            title: const Text('Conférence 1'),
            subtitle: const Text('Date: 12/12/2024'),
            trailing: PopupMenuButton<String>(
              onSelected: (value) {
                // Handle actions: edit or delete
              },
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'edit',
                  child: Text('Modifier'),
                ),
                const PopupMenuItem(
                  value: 'delete',
                  child: Text('Supprimer'),
                ),
              ],
            ),
          ),
          // Add more ListTiles dynamically based on conference list
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to add conference page
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
