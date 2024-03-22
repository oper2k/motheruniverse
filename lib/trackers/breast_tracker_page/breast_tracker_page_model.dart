import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'breast_tracker_page_widget.dart' show BreastTrackerPageWidget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';

class BreastTrackerPageModel extends FlutterFlowModel<BreastTrackerPageWidget> {
  ///  Local state fields for this page.

  bool leftIsActive = false;

  bool rightIsActive = false;

  bool timerStarted = false;

  DateTime? startTime;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TimerLeft widget.
  int timerLeftMilliseconds = 0;
  String timerLeftValue = StopWatchTimer.getDisplayTime(
    0,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerLeftController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countUp));

  // State field(s) for TimerRight widget.
  int timerRightMilliseconds = 0;
  String timerRightValue = StopWatchTimer.getDisplayTime(
    0,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerRightController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countUp));

  // Stores action output result for [Bottom Sheet - ResetBreastTracker] action in Reset widget.
  bool? reset;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  TrackersRecord? trackerDoc;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  TrackersRecord? trackerDoc1;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    timerLeftController.dispose();
    timerRightController.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
