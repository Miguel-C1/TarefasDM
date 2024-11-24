class Pedido {
  final int idProduto;
  final int idCliente;
  final int quantidade;
  final double desconto;

  Pedido({
    required this.idProduto,
    required this.idCliente,
    required this.quantidade,
    required this.desconto,
  });

  Map<String, dynamic> toJson() {
    return {
      'idProduto': idProduto,
      'idCliente': idCliente,
      'quantidade': quantidade,
      'desconto': desconto,
    };
  }
}
