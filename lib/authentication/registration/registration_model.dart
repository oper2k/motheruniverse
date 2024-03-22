import '/flutter_flow/flutter_flow_util.dart';
import 'registration_widget.dart' show RegistrationWidget;
import 'package:flutter/material.dart';

class RegistrationModel extends FlutterFlowModel<RegistrationWidget> {
  ///  Local state fields for this page.

  String? password = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for EmailField widget.
  FocusNode? emailFieldFocusNode;
  TextEditingController? emailFieldController;
  String? Function(BuildContext, String?)? emailFieldControllerValidator;
  String? _emailFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Заполнены не все поля';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Неверный формат';
    }
    return null;
  }

  // State field(s) for PassField widget.
  FocusNode? passFieldFocusNode;
  TextEditingController? passFieldController;
  late bool passFieldVisibility;
  String? Function(BuildContext, String?)? passFieldControllerValidator;
  String? _passFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Заполнены не все поля';
    }

    if (val.length < 6) {
      return 'Минимум 6 символов';
    }

    return null;
  }

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    emailFieldControllerValidator = _emailFieldControllerValidator;
    passFieldVisibility = false;
    passFieldControllerValidator = _passFieldControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    emailFieldFocusNode?.dispose();
    emailFieldController?.dispose();

    passFieldFocusNode?.dispose();
    passFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
