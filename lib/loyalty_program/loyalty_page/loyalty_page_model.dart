import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/bottom_sheet/loyalty_bottom_sheet/birthday_bonus/birthday_bonus_widget.dart';
import '/components/bottom_sheet/loyalty_bottom_sheet/buying_bonuses/buying_bonuses_widget.dart';
import '/components/bottom_sheet/loyalty_bottom_sheet/counting_system/counting_system_widget.dart';
import '/components/bottom_sheet/loyalty_bottom_sheet/feedback_bonus/feedback_bonus_widget.dart';
import '/components/bottom_sheet/loyalty_bottom_sheet/fill_profile_bonus/fill_profile_bonus_widget.dart';
import '/components/bottom_sheet/loyalty_bottom_sheet/loyalty_registration_bonus/loyalty_registration_bonus_widget.dart';
import '/components/bottom_sheet/loyalty_bottom_sheet/using_trackers_bonus/using_trackers_bonus_widget.dart';
import '/components/bottom_sheet/loyalty_bottom_sheet/welcome_bonus/welcome_bonus_widget.dart';
import '/components/bottom_sheet/loyalty_bottom_sheet/where_spend_bonuses/where_spend_bonuses_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'loyalty_page_widget.dart' show LoyaltyPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoyaltyPageModel extends FlutterFlowModel<LoyaltyPageWidget> {
  ///  Local state fields for this page.

  bool isAgree = false;

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
