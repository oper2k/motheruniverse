import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/bottom_sheet/profile_bottom_sheet/add_sleeping_tracker/add_sleeping_tracker_widget.dart';
import '/components/bottom_sheet/profile_bottom_sheet/chose_tracker_sleeping/chose_tracker_sleeping_widget.dart';
import '/components/bottom_sheet/profile_bottom_sheet/reset_sleep_tracker/reset_sleep_tracker_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'sleep_tracker_page_widget.dart' show SleepTrackerPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
