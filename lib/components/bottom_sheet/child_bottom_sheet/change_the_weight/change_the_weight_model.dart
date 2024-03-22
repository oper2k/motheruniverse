import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'change_the_weight_widget.dart' show ChangeTheWeightWidget;
import 'package:flutter/material.dart';

class ChangeTheWeightModel extends FlutterFlowModel<ChangeTheWeightWidget> {
  ///  Local state fields for this component.

  DateTime? tempDate;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ChildrenRecord? childRead;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
