import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/bottom_sheet/profile_bottom_sheet/add_feeding_tracker/add_feeding_tracker_widget.dart';
import '/components/bottom_sheet/profile_bottom_sheet/chose_tracker_feeding/chose_tracker_feeding_widget.dart';
import '/components/bottom_sheet/profile_bottom_sheet/reset_feeding_tracker/reset_feeding_tracker_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FeedingTrackerPageModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool isGrams = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for FeedingName widget.
  TextEditingController? feedingNameController;
  String? Function(BuildContext, String?)? feedingNameControllerValidator;
  // State field(s) for Amount widget.
  TextEditingController? amountController;
  String? Function(BuildContext, String?)? amountControllerValidator;
  // State field(s) for TextField widget.
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // Stores action output result for [Bottom Sheet - ResetFeedingTracker] action in Reset widget.
  bool? reset;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  TrackersRecord? feedingTrack;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  TrackersRecord? feedingTrack1;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    feedingNameController?.dispose();
    amountController?.dispose();
    textController3?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
