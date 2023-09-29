import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/bottom_sheet/profile_bottom_sheet/breast_feeding_info/breast_feeding_info_widget.dart';
import '/components/bottom_sheet/profile_bottom_sheet/chose_the_date_of_tracker/chose_the_date_of_tracker_widget.dart';
import '/components/bottom_sheet/profile_bottom_sheet/feeding_info/feeding_info_widget.dart';
import '/components/bottom_sheet/profile_bottom_sheet/sleep_info/sleep_info_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'trackers_list_page_widget.dart' show TrackersListPageWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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

  void initState(BuildContext context) {
    columnController = ScrollController();
    dates = ScrollController();
    navBarModel = createModel(context, () => NavBarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    columnController?.dispose();
    dates?.dispose();
    navBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
