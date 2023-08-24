// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/logIn/components/login_background.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utils/components/roundedbutton.dart';
import '../../../utils/components/textfieldcontainer.dart';
import '../../../utils/constants.dart';
import '../../newpassword/new_password_screen.dart';

class Body extends StatelessWidget {
  final int code;
  final String cpf;
  const Body({super.key, required this.code, required this.cpf});

  @override
  Widget build(BuildContext context) {
    int? codeCheck;
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
            SizedBox(
              height: size.height * 0.03,
            ),
            Text(
              'Insira o código que recebeu:',
              style: GoogleFonts.workSans(
                  fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            TextFieldContainer(
              widthSize: 0.8,
              color: grey2,
              borderRadius: 50,
              borderWidth: 0,
              borderColor: transparent,
              heigthSize: 0.07,
              child: TextField(
                onChanged: (value) {
                  codeCheck = int.parse(value);
                },
                decoration: InputDecoration(
                  icon: Icon(Icons.password, color: grey3),
                  hintText: '',
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            RoundedButton(
              buttonHeight: 0.055,
              buttonWidth: 0.7,
              fontSize: 18,
              text: 'Continuar',
              onPress: () {
                if (codeCheck != code) {
                  EasyLoading.showError('Código Inválido');
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NewPasswordScreen(cpf: cpf)),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
