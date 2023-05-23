import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/constants.dart';
import 'components/recover_method_body.dart';

class RecoverMethodScreen extends StatelessWidget {
  final String email, phoneNumber;
  const RecoverMethodScreen({super.key, required this.email, required this.phoneNumber});
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey1,
      body: Body(email: email, phoneNumber: phoneNumber),
    );
  }
}
