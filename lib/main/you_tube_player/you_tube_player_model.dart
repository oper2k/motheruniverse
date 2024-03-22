import '/flutter_flow/flutter_flow_util.dart';
import 'you_tube_player_widget.dart' show YouTubePlayerWidget;
import 'package:flutter/material.dart';

class YouTubePlayerModel extends FlutterFlowModel<YouTubePlayerWidget> {
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
