import 'package:http/http.dart' as http;

class ApiClient {
  final String baseUrl;
  final http.Client _httpClient;

  ApiClient(this.baseUrl) : _httpClient = http.Client();

  Future<http.Response> get(String endpoint) async {
    final response = await _httpClient.get(Uri.parse('$baseUrl/$endpoint'));
    return response;
  }

  Future<http.Response> post(String endpoint, Map<String, dynamic> body) async {
    final response = await _httpClient.post(
      Uri.parse('$baseUrl/$endpoint'),
      body: body,
    );
    return response;
  }

  // Add other HTTP methods as needed
}
