import '/flutter_flow/flutter_flow_util.dart';
import 'edit_child_info_page_widget.dart' show EditChildInfoPageWidget;
import 'package:flutter/material.dart';

class EditChildInfoPageModel extends FlutterFlowModel<EditChildInfoPageWidget> {
  ///  Local state fields for this page.

  String? tempPhoto;

  DateTime? conceptionDate;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  DateTime? datePicked;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
