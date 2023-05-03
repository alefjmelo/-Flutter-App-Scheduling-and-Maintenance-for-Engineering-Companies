// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../constants.dart';
import 'textfieldcontainer.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final String hintText;

  const RoundedPasswordField({
    Key? key,
    required this.hintText, required this.onChanged,
  }) : super(key: key);

  @override
  State<RoundedPasswordField> createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  late bool _passwordVisible;
  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  Widget build(BuildContext context) {
    return TextFieldContainer(
      widthSize: 0.8,
      color: grey2,
      borderRadius: 50,
      borderWidth: 0,
      borderColor: transparent,
      heigthSize: 0.065,
      child: TextField(
        obscureText: !_passwordVisible,
        decoration: InputDecoration(
          hintText: widget.hintText,
          icon: Icon(
            Icons.lock,
            color: grey3,
          ),
          suffixIcon: IconButton(
            padding: EdgeInsets.only(bottom: 2.0),
            icon: Icon(
              _passwordVisible ? Icons.visibility : Icons.visibility_off,
              color: grey3,
            ),
            onPressed: () {
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
          ),
          border: InputBorder.none,
        ),
        onChanged: widget.onChanged,
      ),
    );
  }
}
