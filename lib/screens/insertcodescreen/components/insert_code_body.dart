// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/logIn/components/login_background.dart';
import '../../../utils/components/roundedbutton.dart';
import '../../../utils/components/textfieldcontainer.dart';
import '../../../utils/constants.dart';
import '../../newpassword/new_password_screen.dart';

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
            SizedBox(
              height: size.height * 0.03,
            ),
            Text(
              'Insira o código que recebeu:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            TextFieldContainer(
              child: TextField(
                onChanged: (value) {
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
                  buttonHeight: 0.075,
                  buttonWidth: 0.7,
                  fontSize: 18,
                  text: 'Continuar',
                  onPress: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return NewPasswordScreen();
                    }));
                  }),
          ],
        ),
      ),
    );
  }
}
