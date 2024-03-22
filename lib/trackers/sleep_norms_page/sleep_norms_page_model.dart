import '/flutter_flow/flutter_flow_util.dart';
import 'sleep_norms_page_widget.dart' show SleepNormsPageWidget;
import 'package:flutter/material.dart';

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

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    months = ScrollController();
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    columnController?.dispose();
    months?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
