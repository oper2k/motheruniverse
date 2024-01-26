import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'choose_the_age_model.dart';
export 'choose_the_age_model.dart';

class ChooseTheAgeWidget extends StatefulWidget {
  const ChooseTheAgeWidget({super.key});

  @override
  State<ChooseTheAgeWidget> createState() => _ChooseTheAgeWidgetState();
}

class _ChooseTheAgeWidgetState extends State<ChooseTheAgeWidget> {
  late ChooseTheAgeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChooseTheAgeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
                                  color: FlutterFlowTheme.of(context).primary,
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
                  'Выберите возраст ребенка',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).displayLarge,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: AutoSizeText(
                  'Подстроим графики и покажем нормальные значения для возраста',
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        lineHeight: 1.5,
                      ),
                ),
              ),
              Builder(
                builder: (context) {
                  if (_model.pregnantSwitchValue! && !_model.switchValue!) {
                    return Container(
                      width: double.infinity,
                      height: 220.0,
                      child: custom_widgets.CustomPickerWeeks(
                        width: double.infinity,
                        height: 220.0,
                        horizontalPadding: 0.0,
                        backgroundColor:
                            FlutterFlowTheme.of(context).backgroundMain,
                        lineColor: Colors.transparent,
                        textColor: FlutterFlowTheme.of(context).secondaryText,
                        initialItemIndexFirst: 0,
                        initialItemIndexSecond: 0,
                        initialItemIndexThird: 0,
                        itemExtent: 30.0,
                        borderRadius: 0.0,
                        textSizeItem1: 22.0,
                        textSizeItem2: 22.0,
                        textSizeItem3: 22.0,
                        items1: functions.getWeeksList(),
                        items2: functions.nullList(),
                        items3: functions.nullList(),
                      ),
                    );
                  } else {
                    return Container(
                      width: double.infinity,
                      height: 220.0,
                      child: custom_widgets.CustomPicker(
                        width: double.infinity,
                        height: 220.0,
                        horizontalPadding: 0.0,
                        backgroundColor:
                            FlutterFlowTheme.of(context).backgroundMain,
                        lineColor: Colors.transparent,
                        textColor: FlutterFlowTheme.of(context).secondaryText,
                        initialItemIndexFirst:
                            FFAppState().customPickerItemIndex1,
                        initialItemIndexSecond:
                            FFAppState().customPickerItemIndex2,
                        initialItemIndexThird:
                            FFAppState().customPickerItemIndex3,
                        itemExtent: 30.0,
                        borderRadius: 0.0,
                        textSizeItem1: 19.0,
                        textSizeItem2: 19.0,
                        textSizeItem3: 19.0,
                        items1: functions.listOf31Days(),
                        items3: functions.getLastTwentyYears(),
                        items2: FFAppState().monthsList,
                      ),
                    );
                  }
                },
              ),
              Spacer(),
              if (_model.pregnantSwitchValue ?? true)
                Container(
                  height: 55.0,
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Я знаю дату зачатия',
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
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
                                _model.conceptionDateIsKnown = true;
                              });
                              setState(() {
                                FFAppState().customPickerItemIndex1 =
                                    functions.getCurrentDateIndex();
                              });
                            } else {
                              setState(() {
                                _model.conceptionDateIsKnown = false;
                              });
                            }
                          },
                          activeColor: FlutterFlowTheme.of(context).primary,
                          activeTrackColor:
                              FlutterFlowTheme.of(context).tertiary,
                          inactiveTrackColor:
                              FlutterFlowTheme.of(context).grey20,
                          inactiveThumbColor:
                              FlutterFlowTheme.of(context).alternate,
                        ),
                      ],
                    ),
                  ),
                ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                child: Container(
                  height: 55.0,
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Я еще беременна',
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                lineHeight: 1.25,
                              ),
                        ),
                        Switch.adaptive(
                          value: _model.pregnantSwitchValue ??=
                              FFAppState().tempChild.genderIsUnknown,
                          onChanged: (newValue) async {
                            setState(
                                () => _model.pregnantSwitchValue = newValue!);
                            if (newValue!) {
                              setState(() {
                                _model.stillPregnant = true;
                              });
                              setState(() {
                                FFAppState().updateTempChildStruct(
                                  (e) => e..childIsBorn = false,
                                );
                              });
                            } else {
                              setState(() {
                                _model.stillPregnant = false;
                                _model.conceptionDateIsKnown = false;
                              });
                              setState(() {
                                FFAppState().customPickerItemIndex1 =
                                    functions.getCurrentDateIndex();
                                FFAppState().updateTempChildStruct(
                                  (e) => e..childIsBorn = true,
                                );
                              });
                            }
                          },
                          activeColor: FlutterFlowTheme.of(context).primary,
                          activeTrackColor:
                              FlutterFlowTheme.of(context).tertiary,
                          inactiveTrackColor:
                              FlutterFlowTheme.of(context).grey20,
                          inactiveThumbColor:
                              FlutterFlowTheme.of(context).alternate,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 45.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    if (_model.pregnantSwitchValue!) {
                      if (_model.switchValue!) {
                        setState(() {
                          FFAppState().updateTempChildStruct(
                            (e) => e
                              ..conceptionDate =
                                  functions.createDateTimeFromIndices(
                                      FFAppState().customPickerItemIndex1,
                                      FFAppState().customPickerItemIndex2,
                                      FFAppState().customPickerItemIndex3),
                          );
                        });
                      } else {
                        setState(() {
                          FFAppState().updateTempChildStruct(
                            (e) => e
                              ..conceptionDate =
                                  functions.calculateDateFromWeeksAgo(
                                      FFAppState().weekPickerIndex1),
                          );
                        });
                      }
                    } else {
                      setState(() {
                        FFAppState().updateTempChildStruct(
                          (e) => e
                            ..birthDate = functions.createDateTimeFromIndices(
                                FFAppState().customPickerItemIndex1,
                                FFAppState().customPickerItemIndex2,
                                FFAppState().customPickerItemIndex3),
                        );
                      });
                    }

                    context.pushNamed('ChildInfo');
                  },
                  text: 'Продолжить',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 56.0,
                    padding: EdgeInsets.all(0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).displaySmall,
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
