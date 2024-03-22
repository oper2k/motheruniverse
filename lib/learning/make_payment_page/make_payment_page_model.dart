import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'make_payment_page_widget.dart' show MakePaymentPageWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MakePaymentPageModel extends FlutterFlowModel<MakePaymentPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  final textFieldMask1 = MaskTextInputFormatter(mask: '#### #### #### ####');
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  final textFieldMask2 = MaskTextInputFormatter(mask: '##/##');
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  final textFieldMask3 = MaskTextInputFormatter(mask: '###');
  String? Function(BuildContext, String?)? textController3Validator;
  // Stores action output result for [Custom Action - validateCardNumber] action in Button widget.
  bool? validateCartNumber;
  // Stores action output result for [Custom Action - validateCardExpireDate] action in Button widget.
  bool? validateCardDate;
  // Stores action output result for [Custom Action - returnStringCardCryptogramForCloudpayments] action in Button widget.
  String? cryptogramCard;
  // Stores action output result for [Backend Call - API (Pay by card)] action in Button widget.
  ApiCallResponse? apiResult2li;
  // Stores action output result for [Custom Action - check3DSCloudPayments] action in Button widget.
  List<String>? check3DS;
  // Stores action output result for [Backend Call - API (CheckDS)] action in Button widget.
  ApiCallResponse? apiResult5ny;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
