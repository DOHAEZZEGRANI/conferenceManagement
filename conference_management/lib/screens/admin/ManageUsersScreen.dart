import 'package:flutter/material.dart';
import 'package:conference_management/config/api_config.dart';

final url = '${ApiConfig.baseUrl}/users';
class ManageUsersScreen extends StatelessWidget {
  const ManageUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gérer les utilisateurs'),
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
            title: const Text('Utilisateur 1'),
            subtitle: const Text('Role: Admin'),
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
          // Add more ListTiles dynamically based on user list
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to add user page
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
