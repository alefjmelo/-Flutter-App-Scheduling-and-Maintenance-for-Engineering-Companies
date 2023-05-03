// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
// import 'package:flutter_application_1/screens/homescreen/components/profile/profile_screen.dart';
// import 'package:flutter_application_1/screens/homescreen/home_screen.dart';
import 'package:flutter_application_1/screens/welcome/welcome_screen.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      theme: ThemeData(
        primaryColor: grey1,
        backgroundColor: Colors.white,
      ),
      home: WelcomeScreen(),
      builder: EasyLoading.init(),
    );
  }
}
