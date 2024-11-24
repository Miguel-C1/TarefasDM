import 'package:flutter/material.dart';
import '../services/api_service.dart';

class CarrinhoScreen extends StatelessWidget {
  final int clienteId;
  final List<Map<String, dynamic>> carrinho;

  CarrinhoScreen({required this.clienteId, required this.carrinho});

  Future<void> finalizarPedido() async {
    try {
      final pedido = {
        'clienteId': clienteId,
        'itens': carrinho.map((item) {
          return {
            'idProduto': item['id'],
            'quantidade': item['quantidade'],
            'desconto': item['desconto'],
            'valor': item['valor'],
          };
        }).toList(),
      };
      await ApiService.finalizarPedido(pedido);
      print('Pedido finalizado com sucesso!');
    } catch (error) {
      print('Erro ao finalizar pedido: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: carrinho.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(carrinho[index]['nome']),
                  subtitle: Text(
                    'Quantidade: ${carrinho[index]['quantidade']}, '
                    'Desconto: ${carrinho[index]['desconto']}%, '
                    'Valor: R\$ ${carrinho[index]['valor'].toStringAsFixed(2)}',
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: finalizarPedido,
            child: Text('Finalizar Pedido'),
          ),
        ],
      ),
    );
  }
}
