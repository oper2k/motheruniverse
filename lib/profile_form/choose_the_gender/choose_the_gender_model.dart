import '/flutter_flow/flutter_flow_util.dart';
import 'choose_the_gender_widget.dart' show ChooseTheGenderWidget;
import 'package:flutter/material.dart';

class ChooseTheGenderModel extends FlutterFlowModel<ChooseTheGenderWidget> {
  ///  Local state fields for this page.

  bool malePicked = false;

  bool femalePicked = false;

  bool genderSelected = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Switch widget.
  bool? switchValue;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
