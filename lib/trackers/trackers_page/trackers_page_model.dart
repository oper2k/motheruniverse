import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/bottom_sheet/profile_bottom_sheet/chose_the_date_of_tracker/chose_the_date_of_tracker_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'trackers_page_widget.dart' show TrackersPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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

  void initState(BuildContext context) {
    columnController1 = ScrollController();
    columnController2 = ScrollController();
    dates = ScrollController();
    navBarModel = createModel(context, () => NavBarModel());
  }

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
