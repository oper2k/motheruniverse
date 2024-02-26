import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'entry_to_event_page_widget.dart' show EntryToEventPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
