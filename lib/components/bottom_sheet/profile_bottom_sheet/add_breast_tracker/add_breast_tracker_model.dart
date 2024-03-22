import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'add_breast_tracker_widget.dart' show AddBreastTrackerWidget;
import 'package:flutter/material.dart';

class AddBreastTrackerModel extends FlutterFlowModel<AddBreastTrackerWidget> {
  ///  Local state fields for this component.

  DateTime? time;

  bool leftIsLast = true;

  ///  State fields for stateful widgets in this component.

  InstantTimer? instantTimer;
  DateTime? datePicked;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  TrackersRecord? trackerDoc;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  TrackersRecord? trackerDoc1;

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
