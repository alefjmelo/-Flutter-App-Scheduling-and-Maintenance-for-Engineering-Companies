// ignore_for_file: constant_identifier_names, avoid_print

import 'dart:convert';
//import 'package:flutter_application_1/models/user_model.dart';
import 'package:http/http.dart' as http;

class HttpService {
  static const BASE_URL = "https://059f-186-249-214-216.ngrok.io";
  static const LOGIN_URL = "$BASE_URL/login";
  static const USER_URL = "$BASE_URL/Listafuncionarios";

  static Future<dynamic> login(cpf, password) async {
    final response = await http.post(
      Uri.parse(LOGIN_URL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({"cpf": cpf, "senha": password}),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Error at loading User ID');
    }
  }
}

void main() {
  HttpService.login('61308649304', '1234567');
}
