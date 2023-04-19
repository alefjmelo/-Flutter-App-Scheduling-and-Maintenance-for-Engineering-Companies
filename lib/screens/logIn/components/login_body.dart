// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, non_constant_identifier_names, unused_field

import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/rest_ds.dart';
import 'package:flutter_application_1/screens/logIn/components/login_background.dart';
import 'package:flutter_application_1/screens/newpassword/insertCPF_screen.dart';
//import 'package:flutter_application_1/components/roundedbutton.dart';
import 'package:flutter_application_1/utils/constants.dart';
import '../../../utils/components/PasswordCheck.dart';
import '../../../utils/components/rounded_input_field.dart';
import '../../../utils/components/rounded_password_field.dart';
import '../../../utils/http_service.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late String cpf;
  late String password;
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
                'Olá querido funcionário, insira suas\ninformações para prosseguir:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              child: Text(
                'CPF',
                style: TextStyle(
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
            Container(
              child: Text(
                'Senha',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 17, color: red1),
              ),
              alignment: Alignment.centerLeft,
              width: size.width * 0.7,
            ),
            RoundedPasswordField(
              hintText: 'Insira sua senha',
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
            ),
            PasswordCheck(
              tap: (BuildContext context) {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return InsertCpfScreen();
                }));
              },
            ),
            Container(
              width: size.width * 0.7,
              height: size.height * 0.075,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(50)),
              child: ElevatedButton(
                onPressed: () async {
                  await HttpService.login(cpf, password, context);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  backgroundColor: red1,
                ),
                child: Text(
                  'Entrar',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18),
                ),
              ),
            ),
            // RoundedButton(
            //     buttonHeight: 0.075,
            //     buttonWidth: 0.7,
            //     fontSize: 18,
            //     text: 'Entrar',
            //     press: () async {
            //       print(password);
            //       print(email);
            //       await HttpService.login(email, password, context);
            //     }),
          ],
        ),
      ),
    );
  }
}
