// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/logIn/components/login_background.dart';
import 'package:flutter_application_1/utils/components/roundedbutton.dart';
import 'package:flutter_application_1/utils/constants.dart';

import '../../../utils/components/verification_container.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BackgroundLogin(
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
              'Escolha a forma como deseja recuperar seu acesso:',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          VerificationContainer(
              labelText:
                  'Email: um código será enviado\npara o seguinte email:',
              methodText: 'rr******@gmail.com'),
          SizedBox(
            height: size.height * 0.05,
          ),
          VerificationContainer(
            labelText: 'SMS: Um código será enviado\npara o seguinte número',
            methodText: '(00) 00***-**00',
          ),
        ],
      ),
    );
  }
}
