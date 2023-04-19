// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/constants.dart';

import 'components/insert_code_body.dart';

class InsertCodeScreen extends StatelessWidget {
  const InsertCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey1,
      body: Body(),
    );
  }
}