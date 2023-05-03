// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/components/textfieldcontainer.dart';

import '../constants.dart';

class RoundedInputField extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<RoundedInputField> createState() => _RoundedInputFieldState();
}

class _RoundedInputFieldState extends State<RoundedInputField> {
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      widthSize: 0.8,
      color: grey2,
      borderRadius: 50,
      borderWidth: 0,
      borderColor: transparent,
      heigthSize: 0.065,
      child: TextField(
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          icon: Icon(Icons.person, color: grey3),
          hintText: widget.hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
