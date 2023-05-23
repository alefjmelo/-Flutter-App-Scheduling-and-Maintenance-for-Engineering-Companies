// ignore_for_file: prefer_final_fields, prefer_const_constructors, constant_identifier_names

import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/homescreen/home_screen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../models/user_model.dart';
import '../screens/insertcodescreen/insert_code_screen.dart';
import '../screens/newpassword/recover_method_screen.dart';

class HttpService {
  static const BASE_URL = "https://8b7b-186-249-214-234.ngrok-free.app";
  static const LOGIN_URL = "$BASE_URL/login";
  static const GET_PROFILE_PHOTO = "$BASE_URL/sendImagePerfil";
  static const GET_EMAIL_SMS = "$BASE_URL/pega_email_sms";
  static const SEND_CODE_EMAIL = "$BASE_URL/envia_email";

  static Future<void> sendCodeEmail(email, context) async {
    var random = Random();
    int code = random.nextInt(99999);

    final response = await http.post(Uri.parse(SEND_CODE_EMAIL),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({"email": email, "codigo": code}));

    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => InsertCodeScreen(code: code)),
      );
    }
  }

  static Future<void> getCpf(cpf, context) async {
    final response = await http.post(Uri.parse(GET_EMAIL_SMS),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({"cpf": cpf}));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      final String phoneNumber = data['telefone'];
      final String email = data['email'];

      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              RecoverMethodScreen(phoneNumber: phoneNumber, email: email),
        ),
      );
    }
  }

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
