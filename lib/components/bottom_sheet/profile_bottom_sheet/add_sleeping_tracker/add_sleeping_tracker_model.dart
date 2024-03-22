import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'add_sleeping_tracker_widget.dart' show AddSleepingTrackerWidget;
import 'package:flutter/material.dart';

class AddSleepingTrackerModel
    extends FlutterFlowModel<AddSleepingTrackerWidget> {
  ///  Local state fields for this component.

  DateTime? startTime;

  DateTime? endTime;

  ///  State fields for stateful widgets in this component.

  InstantTimer? instantTimer;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  TrackersRecord? trackerDoc;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  TrackersRecord? trackerDoc1;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  TrackersRecord? secondDay;

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
