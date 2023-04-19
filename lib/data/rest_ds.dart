// ignore_for_file: constant_identifier_names

import 'dart:async';

import '../models/user.dart';
import '../utils/network_util.dart';

class RestDataSource {
  final NetworkUtil _netUtil = NetworkUtil();
  static const BASE_URL = "https://f5c3-177-200-85-42.sa.ngrok.io";
  static const LOGIN_URL = "$BASE_URL/login";
  //static final _API_KEY = "somerandomkey";

  Future<User> login(String cpf, String password) {
    return _netUtil.post(
      LOGIN_URL,
      body: {
        //"token": _API_KEY,
        "cpf": cpf,
        "senha": password
      },
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    ).then((dynamic res) {
      if (res["error"]) throw Exception(res["error_msg"]);
      return User.map(res["user"]);
    });
  }
}
