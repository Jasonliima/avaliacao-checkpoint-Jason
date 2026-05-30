import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class ProductService {
  ProductService._internal();
  static final ProductService _instance = ProductService._internal();
  factory ProductService() => _instance;

  final String _baseUrl = 'https://fakestoreapi.com';

  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/products'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) {
          return ProductModel.fromJson(json);
        }).toList();
      } else {
        throw Exception('Falha ao carregar produtos (Status: ${response.statusCode})');
      }
    } catch (e) {
      throw Exception('Erro ao buscar produtos: $e');
    }
  }

  Future<List<ProductModel>> getPromotions() async {
    final products = await getProducts();
    return products.take(5).toList();
  }
}
