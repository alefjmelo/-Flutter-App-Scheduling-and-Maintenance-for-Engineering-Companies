// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/homescreen/components/home_background.dart';
import 'package:flutter_application_1/screens/homescreen/components/missoes/custom_dialog_a.dart';
import 'package:flutter_application_1/utils/constants.dart';

class MissoesScreen extends StatefulWidget {
  const MissoesScreen({super.key});

  @override
  State<MissoesScreen> createState() => _MissoesScreenState();
}

class _MissoesScreenState extends State<MissoesScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return HomeBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: size.width * 0.7,
                height: size.height * 0.055,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: red1, width: size.width * 0.005),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.search,
                        color: yellow,
                      ),
                      onPressed: () {
                        print('icon pressed');
                      },
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(12),
                  ),
                ),
              ),
              SizedBox(
                width: size.width * 0.05,
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return CustomDialogA();
                          });
                    },
                    icon: Icon(
                      Icons.filter_alt_sharp,
                      color: yellow,
                    ),
                  ),
                  Text('Filtro'),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
