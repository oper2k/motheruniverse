import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/bottom_sheet/loyalty_bottom_sheet/loyalty_registration_bonus/loyalty_registration_bonus_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'choose_the_gender_model.dart';
export 'choose_the_gender_model.dart';

class ChooseTheGenderWidget extends StatefulWidget {
  const ChooseTheGenderWidget({Key? key}) : super(key: key);

  @override
  _ChooseTheGenderWidgetState createState() => _ChooseTheGenderWidgetState();
}

class _ChooseTheGenderWidgetState extends State<ChooseTheGenderWidget> {
  late ChooseTheGenderModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChooseTheGenderModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (valueOrDefault<bool>(
          currentUserDocument?.loyaltyProgramActivated, false)) {
        if (!valueOrDefault<bool>(
            currentUserDocument?.firstBonusIsClaimed, false)) {
          await showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            barrierColor: FlutterFlowTheme.of(context).botomBack,
            context: context,
            builder: (context) {
              return GestureDetector(
                onTap: () => _model.unfocusNode.canRequestFocus
                    ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                    : FocusScope.of(context).unfocus(),
                child: Padding(
                  padding: MediaQuery.viewInsetsOf(context),
                  child: LoyaltyRegistrationBonusWidget(),
                ),
              );
            },
          ).then((value) => safeSetState(() {}));

          await currentUserReference!.update(createUsersRecordData(
            firstBonusIsClaimed: true,
            loyaltyBonuses: 50.0,
          ));
        }
      }
      setState(() {
        FFAppState().tempChild = ChildStruct();
      });
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).backgroundMain,
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 45.0, 20.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                height: 38.0,
                decoration: BoxDecoration(),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.safePop();
                      },
                      child: Container(
                        width: 30.0,
                        height: 38.0,
                        decoration: BoxDecoration(),
                        child: Icon(
                          FFIcons.kleft,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 30.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 8.0, 0.0),
                              child: Container(
                                width: 48.0,
                                height: 4.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).primary,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 8.0, 0.0),
                              child: Container(
                                width: 48.0,
                                height: 4.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).divider,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                            Container(
                              width: 48.0,
                              height: 4.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).divider,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: Text(
                  'Выберите пол ребенка',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).displayLarge,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: AutoSizeText(
                  'Точнее расчитаем корректные значения для роста, веса и других показателей',
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        lineHeight: 1.5,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                child: Stack(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.00, 0.00),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (!_model.switchValue!) {
                            setState(() {
                              _model.femalePicked = false;
                              _model.malePicked = true;
                              _model.genderSelected = true;
                            });
                            setState(() {
                              FFAppState().updateTempChildStruct(
                                (e) => e
                                  ..gender = 'male'
                                  ..genderIsUnknown = false
                                  ..childIsBorn = true,
                              );
                            });
                          }
                        },
                        child: Container(
                          width: 140.0,
                          height: 140.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).grey20,
                              width: 2.0,
                            ),
                          ),
                          alignment: AlignmentDirectional(0.00, 0.00),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                FFIcons.kman,
                                color: _model.malePicked
                                    ? FlutterFlowTheme.of(context).primary
                                    : FlutterFlowTheme.of(context)
                                        .secondaryText,
                                size: 48.0,
                              ),
                              Text(
                                'Мальчик',
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: 'Inter',
                                      lineHeight: 1.5,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    if (_model.malePicked)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            104.0, 104.0, 0.0, 0.0),
                        child: Container(
                          width: 36.0,
                          height: 36.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).grey20,
                              width: 2.0,
                            ),
                          ),
                          child: Icon(
                            FFIcons.kcheck,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 24.0,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: Stack(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.00, 0.00),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (!_model.switchValue!) {
                            setState(() {
                              _model.malePicked = false;
                              _model.femalePicked = true;
                              _model.genderSelected = true;
                            });
                            setState(() {
                              FFAppState().updateTempChildStruct(
                                (e) => e
                                  ..gender = 'female'
                                  ..genderIsUnknown = false
                                  ..childIsBorn = true,
                              );
                            });
                          }
                        },
                        child: Container(
                          width: 140.0,
                          height: 140.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).grey20,
                              width: 2.0,
                            ),
                          ),
                          alignment: AlignmentDirectional(0.00, 0.00),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                FFIcons.kwoman,
                                color: _model.femalePicked
                                    ? FlutterFlowTheme.of(context).primary
                                    : FlutterFlowTheme.of(context)
                                        .secondaryText,
                                size: 48.0,
                              ),
                              Text(
                                'Девочка',
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: 'Inter',
                                      lineHeight: 1.5,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    if (_model.femalePicked)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            104.0, 104.0, 0.0, 0.0),
                        child: Container(
                          width: 36.0,
                          height: 36.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).grey20,
                              width: 2.0,
                            ),
                          ),
                          child: Icon(
                            FFIcons.kcheck,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 24.0,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Не знаю пол ребенка',
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                lineHeight: 1.25,
                              ),
                    ),
                    Switch.adaptive(
                      value: _model.switchValue ??= false,
                      onChanged: (newValue) async {
                        setState(() => _model.switchValue = newValue!);
                        if (newValue!) {
                          setState(() {
                            FFAppState().updateTempChildStruct(
                              (e) => e
                                ..childIsBorn = false
                                ..genderIsUnknown = true
                                ..gender = 'unknown',
                            );
                          });
                          setState(() {
                            _model.malePicked = false;
                            _model.femalePicked = false;
                            _model.genderSelected = true;
                          });
                        } else {
                          setState(() {
                            _model.genderSelected = false;
                          });
                          setState(() {
                            FFAppState().updateTempChildStruct(
                              (e) => e..childIsBorn = true,
                            );
                          });
                        }
                      },
                      activeColor: FlutterFlowTheme.of(context).primary,
                      activeTrackColor: FlutterFlowTheme.of(context).tertiary,
                      inactiveTrackColor: FlutterFlowTheme.of(context).grey20,
                      inactiveThumbColor:
                          FlutterFlowTheme.of(context).alternate,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 45.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    if (_model.genderSelected) {
                      setState(() {
                        FFAppState().customPickerItemIndex1 =
                            functions.getCurrentDateIndex();
                        FFAppState().customPickerItemIndex2 =
                            functions.getCurrentMonthIndex();
                        FFAppState().customPickerItemIndex3 = 19;
                      });

                      context.pushNamed(
                        'ChooseTheAge',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    }
                  },
                  text: 'Продолжить',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 56.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: _model.genderSelected
                        ? FlutterFlowTheme.of(context).primary
                        : FlutterFlowTheme.of(context).grey20,
                    textStyle:
                        FlutterFlowTheme.of(context).displaySmall.override(
                              fontFamily: 'Inter',
                              color: _model.genderSelected
                                  ? Colors.white
                                  : FlutterFlowTheme.of(context).grey60,
                            ),
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
      ),
    );
  }
}
