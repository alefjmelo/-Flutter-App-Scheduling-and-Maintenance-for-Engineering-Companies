// ignore_for_file: prefer_final_fields, prefer_const_constructors, constant_identifier_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/homescreen/home_screen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../models/user_model.dart';

class HttpService {
  static const BASE_URL = "https://06da-186-249-213-223.ngrok.io";
  static const LOGIN_URL = "$BASE_URL/login";
  static const GET_PROFILE_PHOTO = "$BASE_URL/sendImagePerfil";

  static Future<User> login(cpf, password, context) async {
    final response = await http.post(
      Uri.parse(LOGIN_URL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({"cpf": cpf, "senha": password}),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      final user = User.fromJson(data);
      await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen(user: user)),
      );
      return user;
    } else {
      await EasyLoading.showError(
          "Error Code : ${response.statusCode.toString()}");
    }
    throw Exception('Failed to load user');
  }

  static Future<Image> getProfileImg(int id) async {
    final response = await http.post(
      Uri.parse(GET_PROFILE_PHOTO),
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonEncode({'id': id}),
    );
    if (response.statusCode == 200) {
      final bytes = response.bodyBytes;
      final img = Image.memory(bytes);
      return img;
    } else {
      await EasyLoading.showError(
          "Error Code : ${response.statusCode.toString()}");
    }
    throw Exception('Failed to load image');
  }
}
