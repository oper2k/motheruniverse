import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/bottom_sheet/loyalty_bottom_sheet/profile_is_filled/profile_is_filled_widget.dart';
import '/components/bottom_sheet/profile_bottom_sheet/change_password/change_password_widget.dart';
import '/components/bottom_sheet/profile_bottom_sheet/delete_account/delete_account_widget.dart';
import '/components/bottom_sheet/profile_bottom_sheet/delete_photo/delete_photo_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditProfileModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  DateTime? birthday;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for Name widget.
  TextEditingController? nameController;
  String? Function(BuildContext, String?)? nameControllerValidator;
  // State field(s) for SecondName widget.
  TextEditingController? secondNameController;
  String? Function(BuildContext, String?)? secondNameControllerValidator;
  // State field(s) for Phone widget.
  TextEditingController? phoneController;
  String? Function(BuildContext, String?)? phoneControllerValidator;
  // State field(s) for Telegram widget.
  TextEditingController? telegramController;
  String? Function(BuildContext, String?)? telegramControllerValidator;
  // State field(s) for Instagram widget.
  TextEditingController? instagramController;
  String? Function(BuildContext, String?)? instagramControllerValidator;
  // State field(s) for UserInfo widget.
  TextEditingController? userInfoController;
  String? Function(BuildContext, String?)? userInfoControllerValidator;
  DateTime? datePicked;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    nameController?.dispose();
    secondNameController?.dispose();
    phoneController?.dispose();
    telegramController?.dispose();
    instagramController?.dispose();
    userInfoController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
