import 'package:flutter/material.dart';
import '../model/produto.dart';

class PedidoProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _itens = [];

  List<Map<String, dynamic>> get itens => _itens;

  void adicionarProduto(Produto produto, int quantidade, double desconto) {
    _itens.add({
      'idProduto': produto.id,
      'nome': produto.nome,
      'quantidade': quantidade,
      'desconto': desconto,
      'valor': produto.preco,
    });
    notifyListeners();
  }

  void limparCarrinho() {
    _itens.clear();
    notifyListeners();
  }
}
