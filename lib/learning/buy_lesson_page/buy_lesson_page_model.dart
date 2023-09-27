import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BuyLessonPageModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  List<LearningRecord> references = [];
  void addToReferences(LearningRecord item) => references.add(item);
  void removeFromReferences(LearningRecord item) => references.remove(item);
  void removeAtIndexFromReferences(int index) => references.removeAt(index);
  void updateReferencesAtIndex(int index, Function(LearningRecord) updateFn) =>
      references[index] = updateFn(references[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
