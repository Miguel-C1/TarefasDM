import 'package:flutter/material.dart';
import './screens/clientes_screen.dart';

void main() {
  runApp(SimuladoProvaApp());
}

class SimuladoProvaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simulado Prova',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ClienteScreen(),
    );
  }
}
