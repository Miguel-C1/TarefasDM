import 'package:flutter/material.dart';

class Pedido extends StatelessWidget {
  const Pedido({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final String product = args['product']!;
    final String quantity = args['quantity']!;

    return Scaffold(
      appBar: AppBar(title: const Text('Página de Pedido')),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Produto: $product'),
            const SizedBox(height: 16.0),
            Text('Quantidade: $quantity'),
            ElevatedButton(onPressed: () {
                Navigator.pushReplacementNamed(context, '/listprod');
              },
              child: const Text('Voltar'),)
          ],
        )
        ,
      ),
    );
  }
}
