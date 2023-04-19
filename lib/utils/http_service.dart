// ignore_for_file: prefer_final_fields, prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/homescreen/home_screen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';

class HttpService {
  static const _loginUrl =
      'https://f5c3-177-200-85-42.sa.ngrok.io/login';

  static login(cpf, password, context) async {
    final response = await http.post(
      Uri.parse(_loginUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{"cpf": cpf, "senha": password}),
    );

    if (response.statusCode == 200) {
      await Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } else {
      //print(response.body);
      await EasyLoading.showError(
          "Error Code : ${response.statusCode.toString()} $cpf $password");
    }
  }
}
