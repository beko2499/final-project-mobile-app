// lib/services/auth_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final String baseUrl;

  AuthService({required this.baseUrl});

  Future<Map<String,dynamic>> signup(String username, String email, String password) async {
    final resp = await http.post(
      Uri.parse('$baseUrl/signup'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'email': email, 'password': password}),
    );
    if (resp.statusCode == 201) {
      final data = jsonDecode(resp.body);
      await _saveToken(data['token']);
      return {'success': true, 'data': data};
    } else {
      return {'success': false, 'message': resp.body};
    }
  }

  Future<Map<String,dynamic>> login(String email, String password) async {
    final resp = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );
    if (resp.statusCode == 200) {
      final data = jsonDecode(resp.body);
      await _saveToken(data['token']);
      return {'success': true, 'data': data};
    } else {
      return {'success': false, 'message': resp.body};
    }
  }

  Future<void> _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }
}
