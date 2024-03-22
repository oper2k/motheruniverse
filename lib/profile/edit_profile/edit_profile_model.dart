import '/flutter_flow/flutter_flow_util.dart';
import 'edit_profile_widget.dart' show EditProfileWidget;
import 'package:flutter/material.dart';

class EditProfileModel extends FlutterFlowModel<EditProfileWidget> {
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
  FocusNode? nameFocusNode;
  TextEditingController? nameController;
  String? Function(BuildContext, String?)? nameControllerValidator;
  // State field(s) for SecondName widget.
  FocusNode? secondNameFocusNode;
  TextEditingController? secondNameController;
  String? Function(BuildContext, String?)? secondNameControllerValidator;
  // State field(s) for Phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneController;
  String? Function(BuildContext, String?)? phoneControllerValidator;
  // State field(s) for Telegram widget.
  FocusNode? telegramFocusNode;
  TextEditingController? telegramController;
  String? Function(BuildContext, String?)? telegramControllerValidator;
  // State field(s) for Instagram widget.
  FocusNode? instagramFocusNode;
  TextEditingController? instagramController;
  String? Function(BuildContext, String?)? instagramControllerValidator;
  // State field(s) for UserInfo widget.
  FocusNode? userInfoFocusNode;
  TextEditingController? userInfoController;
  String? Function(BuildContext, String?)? userInfoControllerValidator;
  DateTime? datePicked;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    nameFocusNode?.dispose();
    nameController?.dispose();

    secondNameFocusNode?.dispose();
    secondNameController?.dispose();

    phoneFocusNode?.dispose();
    phoneController?.dispose();

    telegramFocusNode?.dispose();
    telegramController?.dispose();

    instagramFocusNode?.dispose();
    instagramController?.dispose();

    userInfoFocusNode?.dispose();
    userInfoController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
