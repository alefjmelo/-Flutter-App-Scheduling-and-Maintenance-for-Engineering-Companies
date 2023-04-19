// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import '../constants.dart';

class PasswordCheck extends StatelessWidget {
  final Function tap;
  const PasswordCheck({
    Key? key,
    required this.tap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 30),
      child: GestureDetector(
        onTap: () {
          tap(context);
        },
        child: Text(
          'Esqueceu sua senha?',
          style: TextStyle(color: red1),
        ),
      ),
    );
  }
}
