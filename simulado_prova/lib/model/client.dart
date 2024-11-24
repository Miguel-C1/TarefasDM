class Cliente {
  final int id;
  final String nome;

  Cliente({required this.id, required this.nome});

  factory Cliente.fromJson(Map<String, dynamic> json) {
    return Cliente(
      id: json['id'],
      nome: json['nome'],
    );
  }
}
