// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/newpassword/recover_method_screen.dart';
import 'package:flutter_application_1/utils/http_service.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/components/rounded_input_field.dart';
import '../../../utils/components/roundedbutton.dart';
import '../../../utils/constants.dart';
import '../../logIn/components/login_background.dart';
import '../new_password_screen.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late String cpf;
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
                'Insira seu CPF para continuar:',
                textAlign: TextAlign.center,
                style: GoogleFonts.workSans(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              child: Text(
                'CPF',
                style: GoogleFonts.workSans(
                    fontWeight: FontWeight.bold, fontSize: 17, color: red1),
              ),
              alignment: Alignment.centerLeft,
              width: size.width * 0.7,
            ),
            RoundedInputField(
              hintText: 'Ex.: 000.000.000-00',
              onChanged: (value) {
                setState(() {
                  cpf = value;
                });
              },
            ),
            SizedBox(
              height: size.height * 0.07,
            ),
            RoundedButton(
              buttonHeight: 0.06,
              buttonWidth: 0.6,
              fontSize: 18,
              text: 'Continuar',
              onPress: () {
                HttpService.getCpf(cpf, context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
