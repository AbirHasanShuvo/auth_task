import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {
  Future<Map<String, dynamic>> post(
      String url,
      Map<String, dynamic> body,
      ) async {
    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode(body),
      headers: {
        "Content-Type": "application/json",
      },
    );

    final data = jsonDecode(response.body);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return data;
    } else {
      throw Exception(data["message"] ?? "Something went wrong");
    }
  }
}