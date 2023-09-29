import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'registration_widget.dart' show RegistrationWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegistrationModel extends FlutterFlowModel<RegistrationWidget> {
  ///  Local state fields for this page.

  String? password = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for EmailField widget.
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

  void initState(BuildContext context) {
    emailFieldControllerValidator = _emailFieldControllerValidator;
    passFieldVisibility = false;
    passFieldControllerValidator = _passFieldControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    emailFieldController?.dispose();
    passFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
