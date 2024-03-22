import '/flutter_flow/flutter_flow_util.dart';
import 'all_news_page_widget.dart' show AllNewsPageWidget;
import 'package:flutter/material.dart';

class AllNewsPageModel extends FlutterFlowModel<AllNewsPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

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
