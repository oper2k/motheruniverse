import '/flutter_flow/flutter_flow_util.dart';
import 'choose_the_age_widget.dart' show ChooseTheAgeWidget;
import 'package:flutter/material.dart';

class ChooseTheAgeModel extends FlutterFlowModel<ChooseTheAgeWidget> {
  ///  Local state fields for this page.

  bool stillPregnant = false;

  bool conceptionDateIsKnown = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for PregnantSwitch widget.
  bool? pregnantSwitchValue;

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
