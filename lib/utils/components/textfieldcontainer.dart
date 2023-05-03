// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  final color, borderColor;
  final double borderRadius, borderWidth, widthSize, heigthSize;
  final Widget child;
  const TextFieldContainer({
    Key? key,
    required this.widthSize,  required this.heigthSize, required this.color, required this.borderRadius, required this.borderWidth, required this.borderColor, required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width*widthSize,
      height: size.height*heigthSize,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: borderWidth),
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: child,
    );
  }
}
