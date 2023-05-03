// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPress;
  final Color color, textColor;
  final double buttonWidth, buttonHeight, fontSize;

  const RoundedButton({
    Key? key,
    required this.text,
    required this.onPress,
    this.color = red1,
    this.textColor = Colors.white,
    required this.buttonWidth,
    required this.buttonHeight,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * buttonWidth,
      height: size.height * buttonHeight,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          backgroundColor: color,
        ),
        child: Text(
          text,
          style: GoogleFonts.workSans(
              fontWeight: FontWeight.bold,
              color: textColor,
              fontSize: fontSize),
        ),
      ),
    );
  }
}
