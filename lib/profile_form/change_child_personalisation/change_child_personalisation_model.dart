import '/flutter_flow/flutter_flow_util.dart';
import 'change_child_personalisation_widget.dart'
    show ChangeChildPersonalisationWidget;
import 'package:flutter/material.dart';

class ChangeChildPersonalisationModel
    extends FlutterFlowModel<ChangeChildPersonalisationWidget> {
  ///  Local state fields for this page.

  bool leftImageIsChanging = false;

  bool rightImageIsChanging = false;

  String? rightPhoto;

  String? leftPhoto;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

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
