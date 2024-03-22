import '/flutter_flow/flutter_flow_util.dart';
import 'fill_profile_widget.dart' show FillProfileWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

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
