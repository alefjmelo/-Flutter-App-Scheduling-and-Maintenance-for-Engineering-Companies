// ignore_for_file: prefer_const_constructors, unnecessary_new, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';

import 'selection_box.dart';

class CustomDialogA extends StatelessWidget {
  const CustomDialogA({super.key});

  dialogContent(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: grey1,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: const Offset(0.0, 10.0),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.filter_alt_sharp,
                  color: yellow,
                  size: 30,
                ),
                SizedBox(
                  width: size.width * 0.025,
                ),
                Text(
                  'Opções de Filtro',
                  style: GoogleFonts.workSans(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
            SelectionBox(
              text: 'Em andamento',
            ),
            SelectionBox(text: 'Em atraso'),
            SelectionBox(text: 'Concluidos'),
            SelectionBox(text: 'Cancelados'),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
}
