// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/logIn/components/login_background.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utils/components/verification_container.dart';
import 'custom_dialog_c.dart';

class Body extends StatefulWidget {
  final String email, phoneNumber;

  const Body({
    Key? key,
    required this.email,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final String maskedPhone =
        '${widget.phoneNumber.substring(0, widget.phoneNumber.length - 4)}****';
    final String maskedEmail = widget.email.replaceRange(
        widget.email.indexOf('@') - 4, widget.email.indexOf('@'), '****');
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
              style: GoogleFonts.workSans(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          VerificationContainer(
            labelText: 'Email: um código será enviado\npara o seguinte email:',
            methodText: maskedEmail,
            onPress: () {
              showDialog(
                context: context,
                builder: (context) {
                  return CustomDialogC(maskedEmail: maskedEmail, email: widget.email);
                },
              );
            },
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          VerificationContainer(
            labelText: 'SMS: Um código será enviado\npara o seguinte número',
            methodText: maskedPhone,
            onPress: () {},
          ),
        ],
      ),
    );
  }
}
