import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import 'child_info_widget.dart' show ChildInfoWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChildInfoModel extends FlutterFlowModel<ChildInfoWidget> {
  ///  Local state fields for this page.

  bool nameIsUnknown = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for NameField widget.
  FocusNode? nameFieldFocusNode;
  TextEditingController? nameFieldController;
  String? Function(BuildContext, String?)? nameFieldControllerValidator;
  String? _nameFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'Имя слишком короткое';
    }

    if (!RegExp(kTextValidatorUsernameRegex).hasMatch(val)) {
      return 'Неверное имя';
    }
    return null;
  }

  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for GrowthBirthField widget.
  FocusNode? growthBirthFieldFocusNode;
  TextEditingController? growthBirthFieldController;
  String? Function(BuildContext, String?)? growthBirthFieldControllerValidator;
  // State field(s) for WeightBirthField widget.
  FocusNode? weightBirthFieldFocusNode1;
  TextEditingController? weightBirthFieldController1;
  String? Function(BuildContext, String?)? weightBirthFieldController1Validator;
  // State field(s) for GrowtTodayField widget.
  FocusNode? growtTodayFieldFocusNode;
  TextEditingController? growtTodayFieldController;
  String? Function(BuildContext, String?)? growtTodayFieldControllerValidator;
  // State field(s) for WeightBirthField widget.
  FocusNode? weightBirthFieldFocusNode2;
  TextEditingController? weightBirthFieldController2;
  String? Function(BuildContext, String?)? weightBirthFieldController2Validator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChildrenRecord? child;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    nameFieldControllerValidator = _nameFieldControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    nameFieldFocusNode?.dispose();
    nameFieldController?.dispose();

    growthBirthFieldFocusNode?.dispose();
    growthBirthFieldController?.dispose();

    weightBirthFieldFocusNode1?.dispose();
    weightBirthFieldController1?.dispose();

    growtTodayFieldFocusNode?.dispose();
    growtTodayFieldController?.dispose();

    weightBirthFieldFocusNode2?.dispose();
    weightBirthFieldController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
