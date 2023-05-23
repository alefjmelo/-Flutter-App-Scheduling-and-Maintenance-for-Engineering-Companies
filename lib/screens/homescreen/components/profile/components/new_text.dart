// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewText extends StatelessWidget {
  final color;
  final fontWeight;
  final double fontSize;
  final String label;
  const NewText({
    super.key,
    required this.color,
    required this.fontWeight,
    required this.fontSize,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: GoogleFonts.workSans(
          color: color, fontWeight: fontWeight, fontSize: fontSize),
    );
  }
}
