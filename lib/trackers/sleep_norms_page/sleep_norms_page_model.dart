import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'sleep_norms_page_widget.dart' show SleepNormsPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SleepNormsPageModel extends FlutterFlowModel<SleepNormsPageWidget> {
  ///  Local state fields for this page.

  int currentMonthIndex = 0;

  int pickedMonthIndex = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for Months widget.
  ScrollController? months;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    columnController = ScrollController();
    months = ScrollController();
  }

  void dispose() {
    unfocusNode.dispose();
    columnController?.dispose();
    months?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
