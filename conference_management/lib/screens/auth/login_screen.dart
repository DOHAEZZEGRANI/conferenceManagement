import 'package:flutter/material.dart';
import '../../services/auth_service.dart';
import 'package:conference_management/config/api_config.dart';

final url = '${ApiConfig.baseUrl}/users';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final AuthService _authService = AuthService(); // Instance de AuthService
  final _formKey = GlobalKey<FormState>();

  void _login() async {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();

      // Appel de la méthode de connexion
      final success = await _authService.login(email, password);

      if (success) {
        // Redirection après la connexion réussie
        Navigator.pushReplacementNamed(context, '/admin-dashboard');
      } else {
        // Affichage du message d'erreur
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Échec de la connexion')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: (value) => value!.isEmpty
                      ? 'Veuillez entrer votre email'
                      : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'Mot de passe'),
                  validator: (value) => value!.isEmpty
                      ? 'Veuillez entrer votre mot de passe'
                      : null,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _login,
                  child: const Text('Se connecter'),
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
        ),
      ),
    );
  }
}