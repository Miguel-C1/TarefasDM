import 'package:flutter/material.dart';
import 'entrada_dados_screen.dart';
import 'carrinho_screen.dart';
import '../services/api_service.dart';

class ProdutoScreen extends StatefulWidget {
  final int clienteId;

  ProdutoScreen({required this.clienteId});

  @override
  _ProdutoScreenState createState() => _ProdutoScreenState();
}

class _ProdutoScreenState extends State<ProdutoScreen> {
  List<dynamic> produtos = [];
  List<Map<String, dynamic>> carrinho = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchProdutos();
  }

  Future<void> fetchProdutos() async {
    try {
      final data = await ApiService.fetchData('produtos', (json) => json);
      setState(() {
        produtos = data;
        isLoading = false;
      });
    } catch (error) {
      print('Erro ao carregar produtos: $error');
      setState(() {
        isLoading = false;
      });
    }
  }

  void adicionarAoCarrinho(Map<String, dynamic> item) {
    setState(() {
      carrinho.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Produtos'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CarrinhoScreen(
                    clienteId: widget.clienteId,
                    carrinho: carrinho,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: produtos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(produtos[index]['nome']),
                  subtitle: Text('R\$ ${produtos[index]['preco']}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EntradaDadosScreen(
                          produto: produtos[index],
                          clienteId: widget.clienteId,
                          adicionarAoCarrinho: adicionarAoCarrinho,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
