import 'package:flutter/material.dart';

class EntradaDadosScreen extends StatefulWidget {
  final Map<String, dynamic> produto;
  final int clienteId;
  final Function(Map<String, dynamic>) adicionarAoCarrinho;

  EntradaDadosScreen({
    required this.produto,
    required this.clienteId,
    required this.adicionarAoCarrinho,
  });

  @override
  _EntradaDadosScreenState createState() => _EntradaDadosScreenState();
}

class _EntradaDadosScreenState extends State<EntradaDadosScreen> {
  int quantidade = 1;
  double desconto = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do Produto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Produto: ${widget.produto['nome']}'),
            Text('Preço: R\$ ${widget.produto['preco']}'),
            TextField(
              decoration: InputDecoration(labelText: 'Quantidade'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  quantidade = int.tryParse(value) ?? 1;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Desconto (%)'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  desconto = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final item = {
                  'id': widget.produto['id'],
                  'nome': widget.produto['nome'],
                  'quantidade': quantidade,
                  'desconto': desconto,
                  'valor': widget.produto['preco'] * quantidade * (1 - desconto / 100),
                };
                widget.adicionarAoCarrinho(item);
                Navigator.pop(context);
              },
              child: Text('Adicionar ao Carrinho'),
            ),
          ],
        ),
      ),
    );
  }
}
