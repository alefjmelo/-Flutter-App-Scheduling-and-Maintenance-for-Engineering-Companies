// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/constants.dart';

import '../../profile/components/new_text.dart';

class MissionDetailsScreen extends StatelessWidget {
  final widgetTitle;
  const MissionDetailsScreen({super.key, required this.widgetTitle});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<String> employees = ['employee 1', 'employee 2'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: red1,
        elevation: 2.0,
        title: NewText(
          label: widgetTitle,
          color: grey1,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        color: grey2,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: size.width * 1,
                padding: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: red1,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Center(
                  child: NewText(
                    label: 'Funcionários',
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.008,
              ),
              Container(
                child: Expanded(
                  child: ListView.builder(
                    itemCount: employees.length,
                    itemBuilder: (context, index) {
                      final employee = employees[index];

                      return ListTile(
                        title: Center(
                          child: NewText(
                            color: black,
                            fontWeight: null,
                            fontSize: 18.0,
                            label: employee
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Container(
                width: size.width * 1,
                padding: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: red1,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Center(
                  child: NewText(
                    label: 'Fases do Projeto',
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
