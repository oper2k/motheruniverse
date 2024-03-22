import '/flutter_flow/flutter_flow_util.dart';
import 'entry_to_event_page_widget.dart' show EntryToEventPageWidget;
import 'package:flutter/material.dart';

class EntryToEventPageModel extends FlutterFlowModel<EntryToEventPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameController;
  String? Function(BuildContext, String?)? nameControllerValidator;
  // State field(s) for Phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneController;
  String? Function(BuildContext, String?)? phoneControllerValidator;
  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  // State field(s) for ChildAge widget.
  FocusNode? childAgeFocusNode;
  TextEditingController? childAgeController;
  String? Function(BuildContext, String?)? childAgeControllerValidator;
  // State field(s) for SolvedCase widget.
  FocusNode? solvedCaseFocusNode;
  TextEditingController? solvedCaseController;
  String? Function(BuildContext, String?)? solvedCaseControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    nameFocusNode?.dispose();
    nameController?.dispose();

    phoneFocusNode?.dispose();
    phoneController?.dispose();

    emailFocusNode?.dispose();
    emailController?.dispose();

    childAgeFocusNode?.dispose();
    childAgeController?.dispose();

    solvedCaseFocusNode?.dispose();
    solvedCaseController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
