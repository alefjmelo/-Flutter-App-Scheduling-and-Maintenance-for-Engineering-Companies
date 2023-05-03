// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../../models/user_model.dart';
import '../../utils/constants.dart';
import 'components/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  final User user;
  const HomeScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey1,
      body: Body(user: user),
    );
  }
}
