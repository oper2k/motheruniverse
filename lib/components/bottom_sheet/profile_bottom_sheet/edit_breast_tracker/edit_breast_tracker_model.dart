import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'edit_breast_tracker_widget.dart' show EditBreastTrackerWidget;
import 'package:flutter/material.dart';

class EditBreastTrackerModel extends FlutterFlowModel<EditBreastTrackerWidget> {
  ///  Local state fields for this component.

  DateTime? time;

  bool leftIsLast = true;

  ///  State fields for stateful widgets in this component.

  InstantTimer? instantTimer;
  DateTime? datePicked;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
