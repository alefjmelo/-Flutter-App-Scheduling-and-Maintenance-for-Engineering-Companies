import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import 'components/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey1,
      body: Body(),
    );
  }
}
