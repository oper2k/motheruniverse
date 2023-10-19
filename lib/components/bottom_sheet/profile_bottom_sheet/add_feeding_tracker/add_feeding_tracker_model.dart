import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'add_feeding_tracker_widget.dart' show AddFeedingTrackerWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddFeedingTrackerModel extends FlutterFlowModel<AddFeedingTrackerWidget> {
  ///  Local state fields for this component.

  bool isGramm = true;

  DateTime? time;

  ///  State fields for stateful widgets in this component.

  DateTime? datePicked;
  // State field(s) for FeedingName widget.
  FocusNode? feedingNameFocusNode;
  TextEditingController? feedingNameController;
  String? Function(BuildContext, String?)? feedingNameControllerValidator;
  // State field(s) for Amount widget.
  FocusNode? amountFocusNode;
  TextEditingController? amountController;
  String? Function(BuildContext, String?)? amountControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  TrackersRecord? feedingTrack;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  TrackersRecord? feedingTrack1;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    feedingNameFocusNode?.dispose();
    feedingNameController?.dispose();

    amountFocusNode?.dispose();
    amountController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
