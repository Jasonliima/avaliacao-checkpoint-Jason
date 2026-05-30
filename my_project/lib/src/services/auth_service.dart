import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  AuthService._internal();
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;

  final _storage = const FlutterSecureStorage();
  final String _baseUrl = 'https://fakestoreapi.com';

  Future<void> login(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/auth/login'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'username': username,
          'password': password,
        }),
      ).timeout(const Duration(seconds: 10));

      // Aceita 200 (OK) e 201 (Created) como sucesso
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = json.decode(response.body);
        final String? token = data['token'];
        
        if (token != null) {
          await _storage.write(key: 'jwt_token', value: token);
          return;
        }
      } 
      
      if (response.statusCode == 401) {
        throw Exception('Credenciais Inválidas: A API não reconheceu este usuário/senha.');
      } else {
        throw Exception('Erro na API (${response.statusCode}): ${response.body}');
      }
    } catch (e) {
      if (e is http.ClientException || e.toString().contains('SocketException')) {
        throw Exception('Sem conexão. Verifique sua internet.');
      }
      rethrow;
    }
  }

  Future<String?> getToken() async => await _storage.read(key: 'jwt_token');
  Future<void> logout() async => await _storage.delete(key: 'jwt_token');
}
