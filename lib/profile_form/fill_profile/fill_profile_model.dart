import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/bottom_sheet/loyalty_bottom_sheet/welcome_bonus/welcome_bonus_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'fill_profile_widget.dart' show FillProfileWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class FillProfileModel extends FlutterFlowModel<FillProfileWidget> {
  ///  Local state fields for this page.

  bool userAgrees = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for NameField widget.
  FocusNode? nameFieldFocusNode;
  TextEditingController? nameFieldController;
  String? Function(BuildContext, String?)? nameFieldControllerValidator;
  String? _nameFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Введите имя';
    }

    if (val.length < 2) {
      return 'Имя слишком короткое';
    }

    return null;
  }

  // State field(s) for SecondNameField widget.
  FocusNode? secondNameFieldFocusNode;
  TextEditingController? secondNameFieldController;
  String? Function(BuildContext, String?)? secondNameFieldControllerValidator;
  String? _secondNameFieldControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Введите фамилию';
    }

    if (val.length < 2) {
      return 'Фамилия слишком короткая';
    }

    return null;
  }

  // State field(s) for PhoneNumberField widget.
  FocusNode? phoneNumberFieldFocusNode;
  TextEditingController? phoneNumberFieldController;
  final phoneNumberFieldMask =
      MaskTextInputFormatter(mask: '+7(###)-###-##-##');
  String? Function(BuildContext, String?)? phoneNumberFieldControllerValidator;
  String? _phoneNumberFieldControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Номер телефона неверный';
    }

    return null;
  }

  // State field(s) for Telegram widget.
  FocusNode? telegramFocusNode;
  TextEditingController? telegramController;
  String? Function(BuildContext, String?)? telegramControllerValidator;
  // State field(s) for Instagram widget.
  FocusNode? instagramFocusNode;
  TextEditingController? instagramController;
  String? Function(BuildContext, String?)? instagramControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    nameFieldControllerValidator = _nameFieldControllerValidator;
    secondNameFieldControllerValidator = _secondNameFieldControllerValidator;
    phoneNumberFieldControllerValidator = _phoneNumberFieldControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    nameFieldFocusNode?.dispose();
    nameFieldController?.dispose();

    secondNameFieldFocusNode?.dispose();
    secondNameFieldController?.dispose();

    phoneNumberFieldFocusNode?.dispose();
    phoneNumberFieldController?.dispose();

    telegramFocusNode?.dispose();
    telegramController?.dispose();

    instagramFocusNode?.dispose();
    instagramController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
