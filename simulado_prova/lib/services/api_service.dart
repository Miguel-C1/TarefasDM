import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const baseUrl = 'http://localhost:3000';

  static Future<List<T>> fetchData<T>(
      String endpoint, Function fromJson) async {
    final response = await http.get(Uri.parse('$baseUrl/$endpoint'));
    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map<T>((json) => fromJson(json)).toList();
    } else {
      throw Exception('Failed to load $endpoint');
    }
  }

  static Future<void> finalizarPedido(Map<String, dynamic> pedido) async {
    final response = await http.post(
      Uri.parse('$baseUrl/finalizar-pedido'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(pedido),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to finalize order');
    }
  }
}
