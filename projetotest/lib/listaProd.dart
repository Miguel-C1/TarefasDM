import 'package:flutter/material.dart';

class Listaprod extends StatelessWidget {
  final String title;
  final String description;
  const Listaprod({super.key, required this.title, required this.description});

 @override
Widget build(BuildContext context) {
  String selectedProduct = 'Produto 1';

  return Scaffold(
    appBar: AppBar(title: const Text('Página de Lista de Produtos')),
    body: Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          const Text("Lista de Produtos"),
          DropdownButtonCompra(
            onProductSelected: (value) {
                selectedProduct = value;
              }),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/compra', arguments: {
                'product': selectedProduct,
              });
            },
            child: const Text('Ir para o Carrinho de Compras'),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
            child: const Text('Logout'),
          ),
          
        ],
      ),
    ),
  );
}
}

class DropdownButtonCompra extends StatefulWidget {
  final Function(String) onProductSelected;
  const DropdownButtonCompra({super.key, required this.onProductSelected});

  @override
  State<DropdownButtonCompra> createState() =>  _DropdownButtonCompraState();
}

class _DropdownButtonCompraState extends State<DropdownButtonCompra> {
  String dropdownValue = 'Produto 1';

  @override
  Widget build(BuildContext context){
    final List<String> products = <String>[
      'Produto 1',
      'Produto 2',
      'Produto 3',
      'Produto 4',
      'Produto 5',
    ];
    
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        setState(() {
          dropdownValue = value!;
        });
        widget.onProductSelected(dropdownValue);
      },
      items: products.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}