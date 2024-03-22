import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_feeding_tracker_widget.dart' show AddFeedingTrackerWidget;
import 'package:flutter/material.dart';

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

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    feedingNameFocusNode?.dispose();
    feedingNameController?.dispose();

    amountFocusNode?.dispose();
    amountController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
