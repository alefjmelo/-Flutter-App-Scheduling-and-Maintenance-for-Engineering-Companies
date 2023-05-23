// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/homescreen/components/profile/components/new_text.dart';
import 'package:flutter_application_1/screens/insertcodescreen/insert_code_screen.dart';
import 'package:flutter_application_1/utils/components/roundedbutton.dart';
import 'package:flutter_application_1/utils/components/textfieldcontainer.dart';
import 'package:flutter_application_1/utils/constants.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../utils/http_service.dart';

class CustomDialogC extends StatefulWidget {
  final String maskedEmail, email;
  const CustomDialogC({
    super.key,
    required this.maskedEmail,
    required this.email,
  });

  @override
  State<CustomDialogC> createState() => _CustomDialogCState();
}

class _CustomDialogCState extends State<CustomDialogC> {
  dialogContent(BuildContext context) {
    String? emailTyped;
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: grey1,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: const Offset(0.0, 10.0),
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              constraints: BoxConstraints(
                  maxHeight: double.infinity, minWidth: double.infinity),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: grey2,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: NewText(
                        color: black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        label: 'Confirmar email'),
                  ),
                ),
              ),
            ),
            Container(
              constraints: BoxConstraints(
                  maxHeight: double.infinity, minWidth: double.infinity),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: grey1,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      NewText(
                        color: black,
                        fontWeight: null,
                        fontSize: 15.0,
                        label: 'Por favor, confirme o email abaixo:',
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      NewText(
                        color: grey4,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        label: widget.maskedEmail,
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      TextFieldContainer(
                        widthSize: 0.7,
                        heigthSize: 0.05,
                        color: transparent,
                        borderRadius: 15,
                        borderWidth: 2,
                        borderColor: red1,
                        child: TextField(
                          onChanged: (value) {
                            emailTyped = value;
                          },
                          decoration: InputDecoration(border: InputBorder.none),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.035,
                      ),
                      RoundedButton(
                        text: 'Continuar',
                        onPress: () async {
                          if (emailTyped != widget.email) {
                            EasyLoading.showError(
                                'Email inserido está incorreto');
                          } else {
                            await HttpService.sendCodeEmail(
                                emailTyped, context,);
                          }
                        },
                        buttonWidth: 0.5,
                        buttonHeight: 0.055,
                        fontSize: 15.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
}
