import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/constants.dart';

class SelectionBox extends StatefulWidget {
  final String text;
  const SelectionBox({
    super.key,
    required this.text,
  });

  @override
  State<SelectionBox> createState() => _SelectionBoxState();
}

class _SelectionBoxState extends State<SelectionBox> {
  bool _boxCheck = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {setState(() {
            _boxCheck = !_boxCheck;
          });},
          icon: Icon(
            _boxCheck ? Icons.check_box_rounded : Icons.check_box_outline_blank,
            color: _boxCheck ? yellow : grey3,
            size: _boxCheck ? 22.5 : 26,
          ),
        ),
        Text(widget.text),
      ],
    );
  }
}
