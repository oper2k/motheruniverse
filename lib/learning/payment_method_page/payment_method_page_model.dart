import '/flutter_flow/flutter_flow_util.dart';
import 'payment_method_page_widget.dart' show PaymentMethodPageWidget;
import 'package:flutter/material.dart';

class PaymentMethodPageModel extends FlutterFlowModel<PaymentMethodPageWidget> {
  ///  Local state fields for this page.

  double totalPrice = 0.0;

  bool useBonuses = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [RevenueCat - Purchase] action in Container widget.
  bool? revenuePurch;
  // State field(s) for Switch widget.
  bool? switchValue;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
