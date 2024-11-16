import 'package:flutter/material.dart';
import 'screens/login_screen.dart'; // Import your LoginScreen
import 'screens/dashboard_screen.dart'; // Import your DashboardScreen (if created)

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Conference Management',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
    '/': (context) => const LoginScreen(), // Ensure LoginScreen is defined
    '/dashboard': (context) => const DashboardScreen(), // Placeholder for dashboard
    },
        );
    }
}