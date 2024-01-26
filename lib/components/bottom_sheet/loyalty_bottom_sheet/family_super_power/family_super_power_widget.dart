import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/bottom_sheet/loyalty_bottom_sheet/loyalty_registration_bonus/loyalty_registration_bonus_widget.dart';
import '/components/bottom_sheet/loyalty_bottom_sheet/welcome_bonus/welcome_bonus_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'family_super_power_model.dart';
export 'family_super_power_model.dart';

class FamilySuperPowerWidget extends StatefulWidget {
  const FamilySuperPowerWidget({super.key});

  @override
  State<FamilySuperPowerWidget> createState() => _FamilySuperPowerWidgetState();
}

class _FamilySuperPowerWidgetState extends State<FamilySuperPowerWidget> {
  late FamilySuperPowerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FamilySuperPowerModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).backgroundMain,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(24.0),
              topRight: Radius.circular(24.0),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: Image.asset(
                        'assets/images/Group_12313.webp',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(1.0, -1.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: 28.0,
                                height: 28.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).grey20,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  FFIcons.kclose3,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 220.0, 0.0, 0.0),
                            child: AutoSizeText(
                              'Family Super Power',
                              maxLines: 1,
                              style: FlutterFlowTheme.of(context).displayLarge,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: AutoSizeText(
                              'Cтановитесь новым участником программы лояльности и вам автоматически будут начислены баллы. Таким образом мы хотим сказать Вам спасибо за то, что Вы присоединились к нам.',
                              textAlign: TextAlign.center,
                              maxLines: 5,
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Inter',
                                    lineHeight: 1.5,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 48.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Вы получите',
                                    style: FlutterFlowTheme.of(context)
                                        .displayMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          lineHeight: 1.5,
                                        ),
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: Image.asset(
                                    'assets/images/Medal.webp',
                                    width: 32.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    '50 баллов',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w600,
                                          lineHeight: 1.25,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 33.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Builder(
                                  builder: (context) {
                                    if (_model.isActive) {
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          setState(() {
                                            _model.isActive = false;
                                          });
                                        },
                                        child: Container(
                                          width: 30.0,
                                          height: 30.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            FFIcons.kcheckMini,
                                            color: Colors.white,
                                            size: 24.0,
                                          ),
                                        ),
                                      );
                                    } else {
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          setState(() {
                                            _model.isActive = true;
                                          });
                                        },
                                        child: Container(
                                          width: 30.0,
                                          height: 30.0,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .grey20,
                                              width: 2.0,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15.0, 0.0, 0.0, 0.0),
                                    child: RichText(
                                      textScaleFactor: MediaQuery.of(context)
                                          .textScaleFactor,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text:
                                                'Я согласен зарегистрироваться в ',
                                            style: FlutterFlowTheme.of(context)
                                                .headlineSmall
                                                .override(
                                                  fontFamily: 'Inter',
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.w500,
                                                  lineHeight: 1.28,
                                                ),
                                          ),
                                          TextSpan(
                                            text: 'программе лояльности ',
                                            style: FlutterFlowTheme.of(context)
                                                .headlineLarge
                                                .override(
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          TextSpan(
                                            text: 'и получить ',
                                            style: FlutterFlowTheme.of(context)
                                                .headlineSmall
                                                .override(
                                                  fontFamily: 'Inter',
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.w500,
                                                  lineHeight: 1.28,
                                                ),
                                          ),
                                          TextSpan(
                                            text: '50 бонусов ',
                                            style: FlutterFlowTheme.of(context)
                                                .headlineLarge
                                                .override(
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                            mouseCursor:
                                                SystemMouseCursors.click,
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () async {
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  barrierColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .botomBack,
                                                  context: context,
                                                  builder: (context) {
                                                    return Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child:
                                                          WelcomeBonusWidget(),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              },
                                          ),
                                          TextSpan(
                                            text: 'за регистрацию',
                                            style: FlutterFlowTheme.of(context)
                                                .headlineSmall
                                                .override(
                                                  fontFamily: 'Inter',
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.w500,
                                                  lineHeight: 1.28,
                                                ),
                                          )
                                        ],
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 29.0, 0.0, 45.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                if (_model.isActive) {
                                  await currentUserReference!
                                      .update(createUsersRecordData(
                                    loyaltyProgramActivated: true,
                                    loyaltyBonuses: 50.0,
                                    firstBonusIsClaimed: true,
                                  ));
                                  Navigator.pop(context);
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    barrierColor:
                                        FlutterFlowTheme.of(context).botomBack,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: LoyaltyRegistrationBonusWidget(),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                }
                              },
                              text: 'Присоединиться к Family Super Power',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 56.0,
                                padding: EdgeInsets.all(0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle:
                                    FlutterFlowTheme.of(context).displaySmall,
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              showLoadingIndicator: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
