import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _token = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("Login")),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
             TextField(
              decoration: InputDecoration(labelText: 'Nome'),
            ),
             TextField(
              decoration:  InputDecoration(labelText: 'Senha'),
              obscureText: true,
            ),
             SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}