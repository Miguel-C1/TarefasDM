import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provadm/url.dart';

class TelaNotas extends StatefulWidget {
  final String token;

  const TelaNotas({super.key, required this.token});

  @override
  _TelaNotasState createState() => _TelaNotasState();
}

class _TelaNotasState extends State<TelaNotas> {
  List<dynamic> _alunos = [];
  List<dynamic> _alunosFiltrados = [];

  @override
  void initState() {
    super.initState();
    _recuperarNotas();
  }

  Future<void> _recuperarNotas() async {
    final response = await http.get(Uri.parse('${ApiEndpoint.mockableBaseUrl.url}nota'));

    if (response.statusCode == 200) {
      setState(() {
        _alunos = json.decode(response.body);
        _alunosFiltrados = _alunos; // Mostrar todos os alunos por padrão
      });
    }
  }

  void _filtrarAlunos(int criterio) {
    setState(() {
      if (criterio == 0) {
        _alunosFiltrados = _alunos.where((aluno) => aluno['nota'] < 60).toList();
      } else if (criterio == 1) {
        _alunosFiltrados = _alunos.where((aluno) => aluno['nota'] >= 60 && aluno['nota'] < 100).toList();
      } else {
        _alunosFiltrados = _alunos.where((aluno) => aluno['nota'] == 100).toList();
      }
    });
  }

  Color _getBackgroundColor(int nota) {
    if (nota == 100) {
      return Colors.green;
    } else if (nota >= 60) {
      return Colors.blue;
    } else {
      return Colors.yellow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notas dos Alunos | TOKEN: ${widget.token}")),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => _filtrarAlunos(0),
                child: const Text("Nota < 60"),
              ),
              ElevatedButton(
                onPressed: () => _filtrarAlunos(1),
                child: const Text("Nota >= 60"),
              ),
              ElevatedButton(
                onPressed: () => _filtrarAlunos(2),
                child: const Text("Nota = 100"),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _alunosFiltrados.length,
              itemBuilder: (context, index) {
                final aluno = _alunosFiltrados[index];
                return Container(
                  color: _getBackgroundColor(aluno['nota']),
                  child: ListTile(
                    title: Text(aluno['nome']),
                    subtitle: Text("Matrícula: ${aluno['matricula']}"),
                    trailing: Text("Nota: ${aluno['nota']}"),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
