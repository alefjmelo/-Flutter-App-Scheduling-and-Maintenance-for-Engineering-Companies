// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/logIn/login_screen.dart';

import '../../../utils/components/roundedbutton.dart';
import 'welcome_background.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(35.0),
            child: Image.asset(
              'assets/images/Logo.png',
              width: size.width * 0.55,
            ),
          ),
          RoundedButton(
            buttonHeight: 0.06,
            buttonWidth: 0.65,
            fontSize: 18,
            text: 'Entrar',
            onPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
        ],
      ),
    ));
  }
}
