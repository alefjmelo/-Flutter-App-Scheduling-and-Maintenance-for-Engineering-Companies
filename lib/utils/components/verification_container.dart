// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/insertcodescreen/insert_code_screen.dart';
import 'package:flutter_application_1/utils/components/roundedbutton.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';

class VerificationContainer extends StatelessWidget {
  final String labelText, methodText;
  const VerificationContainer({
    Key? key,
    required this.labelText,
    required this.methodText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      elevation: 15,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: size.width * 0.8,
        height: size.height * 0.25,
        decoration: BoxDecoration(
            color: grey2, borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                labelText,
                textAlign: TextAlign.center,
                style: GoogleFonts.workSans(fontSize: 15, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: size.height * 0.015,
              ),
              Text(
                methodText,
                style: GoogleFonts.workSans(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: size.height * 0.045,
              ),
              RoundedButton(
                  text: 'Enviar código',
                  onPress: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return InsertCodeScreen();
                    }));
                  },
                  buttonWidth: 0.6,
                  buttonHeight: 0.05,
                  fontSize: 14)
            ],
          ),
        ),
      ),
    );
  }
}
