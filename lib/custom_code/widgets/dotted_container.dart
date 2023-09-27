// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

//import '/custom_code/actions/index.dart'; // Imports custom actions

import 'package:dotted_decoration/dotted_decoration.dart';

class DottedContainer extends StatefulWidget {
  const DottedContainer({
    Key? key,
    this.width,
    this.height,
    required this.colorDecoration,
    required this.intDash,
    required this.intSpase,
    required this.doubleStrokeWidth,
    required this.doubleRadius,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Color colorDecoration;
  final int intDash;
  final int intSpase;
  final double doubleStrokeWidth;
  final double doubleRadius;

  @override
  _DottedContainerState createState() => _DottedContainerState();
}

class _DottedContainerState extends State<DottedContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width,
        height: widget.height,
        decoration: DottedDecoration(
          dash: <int>[widget.intDash, widget.intSpase],
          strokeWidth: widget.doubleStrokeWidth,
          color: widget.colorDecoration,
          shape: Shape.box,
          borderRadius: BorderRadius.circular(widget.doubleRadius),
        ));
  }
}
// Set your widget name, define your parameter, and then add the
// boilerplate code using the button on the right!
