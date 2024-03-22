import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'trackers_page_widget.dart' show TrackersPageWidget;
import 'package:flutter/material.dart';

class TrackersPageModel extends FlutterFlowModel<TrackersPageWidget> {
  ///  Local state fields for this page.

  int pickedDayIndex = 15;

  int childIndex = 0;

  DateTime? pickedDate;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Column widget.
  ScrollController? columnController1;
  // State field(s) for Column widget.
  ScrollController? columnController2;
  // State field(s) for Dates widget.
  ScrollController? dates;
  // Stores action output result for [Bottom Sheet - ChoseTheDateOfTracker] action in Row widget.
  DateTime? pickedDateOutput;
  // Model for NavBar component.
  late NavBarModel navBarModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    columnController1 = ScrollController();
    columnController2 = ScrollController();
    dates = ScrollController();
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    columnController1?.dispose();
    columnController2?.dispose();
    dates?.dispose();
    navBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
