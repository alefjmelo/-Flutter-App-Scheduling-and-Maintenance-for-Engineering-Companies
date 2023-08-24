import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/constants.dart';
import 'components/new_password_body.dart';

class NewPasswordScreen extends StatelessWidget {
  final String cpf;
  const NewPasswordScreen({super.key, required this.cpf});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey1,
      body: Body(cpf: cpf),
    );
  }
}