import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiService {
  final String baseUrl = 'http://localhost:8080/api';
  final storage = const FlutterSecureStorage();

  // Xử lý response chung
  dynamic _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return json.decode(response.body);
    } else {
      throw Exception('Error: ${response.statusCode} - ${response.body}');
    }
  }

  // Lấy token từ secure storage
  Future<String?> _getToken() async {
    return await storage.read(key: 'token');
  }

  // Headers với token
  Future<Map<String, String>> _getHeaders() async {
    final token = await _getToken();
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  // API calls
  Future<Map<String, dynamic>> getStudentDashboard() async {
    try {
      final headers = await _getHeaders();
      final response = await http.get(
        Uri.parse('$baseUrl/student/dashboard'),
        headers: headers,
      );
      return _handleResponse(response);
    } catch (e) {
      throw Exception('Failed to load dashboard: $e');
    }
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );
      final data = _handleResponse(response);
      if (data['token'] != null) {
        await storage.write(key: 'token', value: data['token']);
      }
      return data;
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }

  Future<void> logout() async {
    await storage.delete(key: 'token');
  }

  // Thêm các API calls khác tùy nhu cầu
} 