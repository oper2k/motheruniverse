import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
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
  // State field(s) for GrowthField widget.
  TextEditingController? growthFieldController;
  String? Function(BuildContext, String?)? growthFieldControllerValidator;
  // State field(s) for WeightField widget.
  TextEditingController? weightFieldController;
  String? Function(BuildContext, String?)? weightFieldControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    nameFieldControllerValidator = _nameFieldControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    nameFieldController?.dispose();
    growthFieldController?.dispose();
    weightFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
