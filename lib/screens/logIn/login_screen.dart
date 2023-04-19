import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/logIn/components/login_body.dart';
import 'package:flutter_application_1/utils/constants.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey1,
      body: Body(),
    );
  }
}