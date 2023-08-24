// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/homescreen/components/home_background.dart';
import 'package:flutter_application_1/screens/homescreen/components/missions/custom_dialog_a.dart';
import 'package:flutter_application_1/screens/homescreen/components/missions/missions/project_tile_widget.dart';
import 'package:flutter_application_1/utils/constants.dart';

import '../../../../../models/project_model.dart';

class MissoesScreen extends StatefulWidget {
  const MissoesScreen({super.key});

  @override
  State<MissoesScreen> createState() => _MissoesScreenState();
}

class _MissoesScreenState extends State<MissoesScreen> {
  List<Project> projects = [
    Project(title: 'Project 1', description: 'Description for Project 1'),
    Project(title: 'Project 2', description: 'Description for Project 2'),
    // Add more projects as needed
  ];

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
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return ProjectTile(
                  project: projects[index],
                  cardColor: grey2,
                );
              },
              itemCount: projects.length,
            ),
          ),
        ],
      ),
    );
  }
}
