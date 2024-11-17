import 'package:flutter/material.dart';

import '../admin/ManageConferencesScreen.dart';
import '../admin/ManageUsersScreen.dart';
import '../admin/ViewStatisticsScreen.dart';
import 'package:conference_management/config/api_config.dart';

final url = '${ApiConfig.baseUrl}/users';
class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
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
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const ManageUsersScreen()),
    );
    },
      child: const Text('Gérer les utilisateurs'),
    ),
    ElevatedButton(
    onPressed: () {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const ViewStatisticsScreen()),
    );
    },
    child: const Text('Voir les statistiques'),
    ),
    ElevatedButton(
    onPressed: () {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const ManageConferencesScreen()),
    );
    },
    child: const Text('Gérer les conférences'),
    ),

])
    );
  }
}
