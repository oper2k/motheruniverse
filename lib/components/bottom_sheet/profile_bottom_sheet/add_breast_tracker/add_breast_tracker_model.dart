import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddBreastTrackerModel extends FlutterFlowModel {
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

  void initState(BuildContext context) {}

  void dispose() {
    instantTimer?.cancel();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
