import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/bottom_sheet/loyalty_bottom_sheet/filling_trackers_bonus/filling_trackers_bonus_widget.dart';
import '/components/bottom_sheet/profile_bottom_sheet/add_breast_tracker/add_breast_tracker_widget.dart';
import '/components/bottom_sheet/profile_bottom_sheet/chose_tracker_breast/chose_tracker_breast_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'breast_tracker_is_added_widget.dart' show BreastTrackerIsAddedWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BreastTrackerIsAddedModel
    extends FlutterFlowModel<BreastTrackerIsAddedWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
