import 'package:flutter/material.dart';
import './produtos_screen.dart';
import '../services/api_service.dart';

class ClienteScreen extends StatefulWidget {
  @override
  _ClienteScreenState createState() => _ClienteScreenState();
}

class _ClienteScreenState extends State<ClienteScreen> {
  List<dynamic> clientes = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchClientes();
  }

  Future<void> fetchClientes() async {
    try {
      final data = await ApiService.fetchData('clientes', (json) => json);
      setState(() {
        clientes = data;
        isLoading = false;
      });
    } catch (error) {
      print('Erro ao carregar clientes: $error');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seleção de Cliente'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: clientes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(clientes[index]['nome']),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProdutoScreen(clienteId: clientes[index]['id']),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
