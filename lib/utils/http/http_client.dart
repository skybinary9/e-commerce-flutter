import 'dart:convert';
import 'package:http/http.dart' as http;

class MegartHttpHelper {
  static const String _baseUrl = 'https://your-api-base-url.com';

  // Helper GET request method
  static Future<Map<String, dynamic>> getRequest(String endpoint) async {
    final response = await http.get(Uri.parse('$_baseUrl$endpoint'));
    return handleResponse(response);
  }

  // Helper POST request method
  static Future<Map<String, dynamic>> post(String endpoint, dynamic data) async {
    final response = await http.post(
      Uri.parse('$_baseUrl$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );
    return handleResponse(response);
  }

  // Helper PUT request method
  static Future<Map<String, dynamic>> put(String endpoint, dynamic data) async {
    final response = await http.put(
      Uri.parse('$_baseUrl$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );
    return handleResponse(response);
  }

  // Helper DELETE request method
  static Future<Map<String, dynamic>> delete(String endpoint) async {
    final response = await http.delete(Uri.parse('$_baseUrl$endpoint'));
    return handleResponse(response);
  }

  // Handle the http response
  static dynamic handleResponse(http.Response response) {
    final statusCode = response.statusCode;
    final body = response.body;

    if (statusCode >= 200 && statusCode < 300) {
      return jsonDecode(body);
    } else {
      throw Exception('HTTP Error: $statusCode, Body: $body');
    }
  }
}
