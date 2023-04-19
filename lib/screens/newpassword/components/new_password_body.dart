// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/logIn/components/login_background.dart';

import '../../../utils/components/rounded_password_field.dart';
import '../../../utils/components/roundedbutton.dart';
import '../../../utils/constants.dart';
import '../../logIn/login_screen.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: BackgroundLogin(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/Logo.png',
            width: size.width * 0.32,
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Text(
              'Insira sua nova senha e confirme\npara voltar à página de Login:',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Container(
            child: Text(
              'Nova Senha',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 17, color: red1),
            ),
            alignment: Alignment.centerLeft,
            width: size.width * 0.7,
          ),
          RoundedPasswordField(hintText: '', onChanged: (value) {
            
          },),
          SizedBox(
            height: size.height * 0.02,
          ),
          Container(
            child: Text(
              'Confirmar Nova Senha',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 17, color: red1),
            ),
            alignment: Alignment.centerLeft,
            width: size.width * 0.7,
          ),
          RoundedPasswordField(hintText: '', onChanged: (value) {
            
          },),
          SizedBox(
            height: size.height * 0.04,
          ),
          RoundedButton(
              buttonHeight: 0.075,
              buttonWidth: 0.7,
              fontSize: 18,
              text: 'Confirmar',
              onPress: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return LoginScreen();
                }));
              }),
        ],
      )),
    );
  }
}
