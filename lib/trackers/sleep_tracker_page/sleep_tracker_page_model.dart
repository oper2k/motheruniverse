import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'sleep_tracker_page_widget.dart' show SleepTrackerPageWidget;
import 'package:flutter/material.dart';

class SleepTrackerPageModel extends FlutterFlowModel<SleepTrackerPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  InstantTimer? instantTimer;
  // Stores action output result for [Bottom Sheet - ResetSleepTracker] action in Reset widget.
  bool? reset;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  TrackersRecord? trackerDoc;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  TrackersRecord? trackerDoc1;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  TrackersRecord? secondDay;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    instantTimer?.cancel();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
