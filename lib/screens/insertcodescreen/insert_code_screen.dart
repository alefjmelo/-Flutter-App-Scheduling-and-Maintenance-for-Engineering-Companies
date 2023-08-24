// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/constants.dart';

import 'components/insert_code_body.dart';

class InsertCodeScreen extends StatelessWidget {
  final int code;
  final String cpf;
  const InsertCodeScreen({super.key, required this.code, required this.cpf});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey1,
      body: Body(code: code, cpf: cpf),
    );
  }
}