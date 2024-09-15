import 'package:flutter/material.dart';
import 'dart:convert'; // Para converter a resposta JSON
import 'package:http/http.dart' as http; // Dependência http para fazer a requisição

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Users List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const UsersScreen(),
    );
  }
}

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  List users = [];

  // Função para pegar os dados da API
  Future<void> fetchUsers() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      setState(() {
        users = json.decode(response.body); // Converte JSON para lista
      });
    } else {
      throw Exception('Falha ao carregar os usuários');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUsers(); // Chama a função ao inicializar o estado
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Usuários'),
      ),
      body: users.isEmpty
          ? const Center(child: CircularProgressIndicator()) // Mostra um indicador de carregamento enquanto os dados não são carregados
          : ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                // Alterna as cores de fundo
                final backgroundColor = index % 2 == 0 ? Colors.grey[300] : Colors.white;

                return Container(
                  color: backgroundColor,
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user['name'],
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text('Email: ${user['email']}'),
                      Text('Telefone: ${user['phone']}'),
                      Text('Website: ${user['website']}'),
                      const SizedBox(height: 8),
                      const Text('Endereço:', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('${user['address']['street']}, ${user['address']['city']}'),
                      const SizedBox(height: 8),
                      const Text('Empresa:', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('${user['company']['name']}'),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
