import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:provadm/url.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _token = "";

  Future<void> _login() async {
    final response = await http.post(
      Uri.parse('${ApiEndpoint.mockableBaseUrl.url}login'), // Substituir pelo endpoint correto
      body: json.encode({
        'username': _nameController.text,
        'password': _passwordController.text,
      }),
    );

    if (response.statusCode == 200) {
      setState(() {
        _token = json.decode(response.body)['token'];
      });

      // Navegar para a Tela 2 e passar o token
    if (mounted) {
        Navigator.pushReplacementNamed(context, '/nota', arguments: _token);
      }
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Senha'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: const Text("Login"),
            ),
            if (_token.isNotEmpty) Text("Token: $_token"),
          ],
        ),
      ),
    );
  }
}
