import 'package:flutter/material.dart';

class Compra extends StatelessWidget{
  const Compra({super.key});

  @override
  Widget build(BuildContext context){
    final TextEditingController quantidadeController = TextEditingController();
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final String product = args['product']!;

    return Scaffold(
      appBar: AppBar(title: const Text('Página de Compra')),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            const Text("Página de Compra"),
            const SizedBox(height: 16.0),
            Text('Produto: $product'),
            const SizedBox(height: 16.0),
            TextFieldCompra(controller: quantidadeController),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(
                  context, 
                  '/pedido', 
                  arguments: {
                    'product': product,
                    'quantity': quantidadeController.text,
                  },
                );
              },
              child: const Text('Comprar!'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/listprod');
              },
              child: const Text('Ir para a Lista de Produtos'),
            ),
          ],
        ),
      ),
    );
  }
}



class TextFieldCompra extends StatelessWidget {
  final TextEditingController controller;
  const TextFieldCompra({super.key, required this.controller});

  @override
  Widget build(BuildContext context){
    return TextField(
      controller: controller,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Quantidade',
      ),
    );
  }
}
