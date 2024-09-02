import 'package:flutter/material.dart';
import 'package:projetotest/listaprod.dart';
import 'package:projetotest/login.dart';
import 'package:projetotest/compra.dart';
import 'package:projetotest/pedido.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Login(),
        '/listprod': (context) => const Listaprod(title: 'title', description: 'description'),
        '/compra': (context) => const Compra(),
        '/pedido': (context) => const Pedido(),
      },
    );
  }
}

