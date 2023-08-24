// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/logIn/components/login_background.dart';
import 'package:flutter_application_1/utils/http_service.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utils/components/rounded_password_field.dart';
import '../../../utils/components/roundedbutton.dart';
import '../../../utils/constants.dart';

class Body extends StatelessWidget {
  final String cpf;
  const Body({super.key, required this.cpf});

  @override
  Widget build(BuildContext context) {
    String? passwordTyped1, passwordTyped2;
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
              style: GoogleFonts.workSans(
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
              style: GoogleFonts.workSans(
                  fontWeight: FontWeight.bold, fontSize: 17, color: red1),
            ),
            alignment: Alignment.centerLeft,
            width: size.width * 0.7,
          ),
          RoundedPasswordField(
            hintText: '',
            onChanged: (value) {
              passwordTyped1 = value;
            },
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Container(
            child: Text(
              'Confirmar Nova Senha',
              style: GoogleFonts.workSans(
                  fontWeight: FontWeight.bold, fontSize: 17, color: red1),
            ),
            alignment: Alignment.centerLeft,
            width: size.width * 0.7,
          ),
          RoundedPasswordField(
            hintText: '',
            onChanged: (value) {
              passwordTyped2 = value;
            },
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
          RoundedButton(
            buttonHeight: 0.06,
            buttonWidth: 0.6,
            fontSize: 18,
            text: 'Confirmar',
            onPress: () async {
              if(passwordTyped1 != passwordTyped2){
                EasyLoading.showError('Senhas não combinam!');
              } else{
                await HttpService.newPassword(cpf, passwordTyped1, context);
              }
            },
          ),
        ],
      )),
    );
  }
}
