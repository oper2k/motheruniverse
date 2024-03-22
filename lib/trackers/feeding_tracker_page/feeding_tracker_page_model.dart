import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'feeding_tracker_page_widget.dart' show FeedingTrackerPageWidget;
import 'package:flutter/material.dart';

class FeedingTrackerPageModel
    extends FlutterFlowModel<FeedingTrackerPageWidget> {
  ///  Local state fields for this page.

  bool isGrams = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for FeedingName widget.
  FocusNode? feedingNameFocusNode;
  TextEditingController? feedingNameController;
  String? Function(BuildContext, String?)? feedingNameControllerValidator;
  // State field(s) for Amount widget.
  FocusNode? amountFocusNode;
  TextEditingController? amountController;
  String? Function(BuildContext, String?)? amountControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // Stores action output result for [Bottom Sheet - ResetFeedingTracker] action in Reset widget.
  bool? reset;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  TrackersRecord? feedingTrack;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  TrackersRecord? feedingTrack1;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    feedingNameFocusNode?.dispose();
    feedingNameController?.dispose();

    amountFocusNode?.dispose();
    amountController?.dispose();

    textFieldFocusNode?.dispose();
    textController3?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
