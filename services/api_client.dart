import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myapplication_khnoh/utils/app_exception.dart';

class ApiClient {
  Future<dynamic> get(String url) async {
    final res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      return json.decode(res.body);
    }
    throw AppException("GET failed: ${res.statusCode}");
  }

  Future<dynamic> post(String url, Map<String, dynamic> body) async {
    final res = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: json.encode(body),
    );

    if (res.statusCode == 200) {
      return json.decode(res.body);
    }
    throw AppException("POST failed: ${res.statusCode}");
  }
}
