// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user_model.dart';
import 'package:flutter_application_1/utils/components/roundedbutton.dart';
import 'package:flutter_application_1/utils/components/textfieldcontainer.dart';
import 'package:flutter_application_1/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/new_text.dart';

class CustomDialogB extends StatefulWidget {
  final User user;
  const CustomDialogB({super.key, required this.user});

  @override
  State<CustomDialogB> createState() => _CustomDialogBState();
}

class _CustomDialogBState extends State<CustomDialogB> {
  late bool enableEmail, enablePnumber;
  @override
  void initState() {
    super.initState();
    enableEmail = false;
    enablePnumber = false;
  }

  dialogContent(BuildContext context) {
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
                  child: Text(
                    'Atualizar Dados',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.workSans(
                      fontSize: 18.5,
                      fontWeight: FontWeight.w500,
                    ),
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
                        fontSize: 17.0,
                        label: 'Alterar Email',
                      ),
                      SomeSpace(
                        size: size,
                        heightSize: 0.01,
                        widthSize: 0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextFieldContainer(
                            widthSize: 0.6,
                            heigthSize: 0.055,
                            color: transparent,
                            borderRadius: 15,
                            borderWidth: 2,
                            borderColor: red1,
                            child: TextField(
                              enabled: enableEmail,
                              onChanged: (value) {},
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: widget.user.email,
                                hintStyle: GoogleFonts.workSans(
                                  color: enableEmail ? grey3 : grey4,
                                  fontWeight:
                                      enableEmail ? null : FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: size.width * 0.1,
                            height: size.height * 0.1,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: red1,
                            ),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  enableEmail = !enableEmail;
                                });
                              },
                              icon: Icon(
                                enableEmail ? Icons.done : Icons.edit,
                                color: grey1,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SomeSpace(
                        size: size,
                        heightSize: 0.025,
                        widthSize: 0,
                      ),
                      NewText(
                        color: black,
                        fontWeight: null,
                        fontSize: 17.0,
                        label: 'Alterar Telefone',
                      ),
                      SomeSpace(
                        size: size,
                        heightSize: 0.01,
                        widthSize: 0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextFieldContainer(
                            widthSize: 0.6,
                            heigthSize: 0.055,
                            color: transparent,
                            borderRadius: 15,
                            borderWidth: 2,
                            borderColor: red1,
                            child: TextField(
                              enabled: enablePnumber,
                              onChanged: (value) {},
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: widget.user.phoneNumber,
                                hintStyle: GoogleFonts.workSans(
                                  color: enablePnumber ? grey3 : grey4,
                                  fontWeight:
                                      enablePnumber ? null : FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: size.width * 0.1,
                            height: size.height * 0.1,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: red1,
                            ),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  enablePnumber = !enablePnumber;
                                });
                              },
                              icon: Icon(
                                enablePnumber ? Icons.done : Icons.edit,
                                color: grey1,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SomeSpace(
                        size: size,
                        heightSize: 0.03,
                        widthSize: 0,
                      ),
                      RoundedButton(
                        text: 'Salvar',
                        onPress: () {},
                        buttonWidth: 0.25,
                        buttonHeight: 0.06,
                        fontSize: 18,
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

class SomeSpace extends StatelessWidget {
  final double heightSize, widthSize;
  const SomeSpace({
    super.key,
    required this.size,
    required this.heightSize,
    required this.widthSize,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * heightSize,
      width: size.width * widthSize,
    );
  }
}
