import 'package:flutter/material.dart';
import 'package:conference_management/config/api_config.dart';

final url = '${ApiConfig.baseUrl}/users';
class ConferenceCard extends StatelessWidget {
  final String title;
  final String date;
  final String location;

  const ConferenceCard({
    super.key,
    required this.title,
    required this.date,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Date: $date',
              style: const TextStyle(fontSize: 14.0),
            ),
            Text(
              'Lieu: $location',
              style: const TextStyle(fontSize: 14.0),
            ),
          ],
        ),
      ),
    );
  }
}
