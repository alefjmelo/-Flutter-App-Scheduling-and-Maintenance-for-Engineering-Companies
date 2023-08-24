// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/homescreen/components/missions/missions/missions_details_screen.dart';
import 'package:flutter_application_1/screens/homescreen/components/profile/components/new_text.dart';
import 'package:flutter_application_1/utils/components/roundedbutton.dart';
import 'package:flutter_application_1/utils/constants.dart';

import '../../../../../models/project_model.dart';

class ProjectTile extends StatefulWidget {
  final Project project;
  final Color cardColor;

  ProjectTile({required this.project, this.cardColor = grey2});

  @override
  _ProjectTileState createState() => _ProjectTileState();
}

class _ProjectTileState extends State<ProjectTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide.none,
      ),
      margin: EdgeInsets.all(10.0),
      child: ExpansionPanelList(
        elevation: 0,
        expandedHeaderPadding: EdgeInsets.all(12.0),
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            _isExpanded = !isExpanded;
          });
        },
        children: [
          ExpansionPanel(
            backgroundColor: transparent,
            isExpanded: _isExpanded,
            headerBuilder: (BuildContext context, bool isExpanded) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListTile(
                  leading: Container(
                    width: 75,
                    height: 75,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                  ),
                  title: NewText(
                    label: widget.project.title,
                    color: red1,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            },
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: RoundedButton(
                text: 'Mais detalhes',
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MissionDetailsScreen(widgetTitle: widget.project.title,)),
                  );
                },
                buttonWidth: 0.42,
                buttonHeight: 0.06,
                fontSize: 15.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
