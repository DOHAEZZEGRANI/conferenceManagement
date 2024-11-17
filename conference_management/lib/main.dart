import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/register_screen.dart';
import 'screens/dashboard/admin_dashboard.dart';
import 'screens/dashboard/chair_dashboard.dart';
import 'screens/dashboard/reviewer_dashboard.dart';
import 'screens/dashboard/researcher_dashboard.dart';
import 'screens/admin/ManageConferencesScreen.dart';
import 'screens/admin/ManageUsersScreen.dart';
import 'screens/admin/ViewStatisticsScreen.dart';


// Configuration du routing sans `#` pour Flutter Web
void main() {
  setUrlStrategy(PathUrlStrategy()); // Flutter Web sans `#`
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
        '/': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/admin-dashboard': (context) => const AdminDashboard(),
        '/chair-dashboard': (context) => const ChairDashboard(),
        '/reviewer-dashboard': (context) => const ReviewerDashboard(),
        '/researcher-dashboard': (context) => const ResearcherDashboard(),
        '/manage-users': (context) => const ManageUsersScreen(),
        '/view-statistics': (context) => const ViewStatisticsScreen(),
        '/manage-conferences': (context) => const ManageConferencesScreen(),
      },
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    void handleLogin() {
      final email = emailController.text.trim();
      final password = passwordController.text.trim();

      // Validation des champs
      if (email.isEmpty || password.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Veuillez remplir tous les champs')),
        );
        return;
      }
      if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
          .hasMatch(email)) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Veuillez entrer un email valide')),
        );
        return;
      }
      if (password.length < 6) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text(
                  'Le mot de passe doit contenir au moins 6 caractères')),
        );
        return;
      }

      // Simulation de connexion et redirection selon le rôle
      const String userRole = 'admin'; // Exemple de rôle

      emailController.clear();
      passwordController.clear();

      switch (userRole) {
        case 'admin':
          Navigator.pushNamed(context, '/admin-dashboard');
          break;
        case 'chair':
          Navigator.pushNamed(context, '/chair-dashboard');
          break;
        case 'reviewer':
          Navigator.pushNamed(context, '/reviewer-dashboard');
          break;
        case 'researcher':
          Navigator.pushNamed(context, '/researcher-dashboard');
          break;
        default:
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Rôle inconnu')),
          );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: handleLogin,
              child: const Text('Login'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: const Text('Créer un compte'),
            ),
          ],
        ),
      ),
    );
  }
}
