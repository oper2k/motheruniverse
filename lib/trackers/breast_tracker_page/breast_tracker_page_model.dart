import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/bottom_sheet/profile_bottom_sheet/add_breast_tracker/add_breast_tracker_widget.dart';
import '/components/bottom_sheet/profile_bottom_sheet/chose_tracker_breast/chose_tracker_breast_widget.dart';
import '/components/bottom_sheet/profile_bottom_sheet/reset_breast_tracker/reset_breast_tracker_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'breast_tracker_page_widget.dart' show BreastTrackerPageWidget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    timerLeftController.dispose();
    timerRightController.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
