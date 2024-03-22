import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'trackers_list_page_widget.dart' show TrackersListPageWidget;
import 'package:flutter/material.dart';

class TrackersListPageModel extends FlutterFlowModel<TrackersListPageWidget> {
  ///  Local state fields for this page.

  int pickedDayIndex = 15;

  DateTime? showedInfoDate;

  int childIndex = 0;

  DateTime? date;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for Dates widget.
  ScrollController? dates;
  // Stores action output result for [Bottom Sheet - ChoseTheDateOfTracker] action in Row widget.
  DateTime? pickedDateOutput;
  // Model for NavBar component.
  late NavBarModel navBarModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    dates = ScrollController();
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    columnController?.dispose();
    dates?.dispose();
    navBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
