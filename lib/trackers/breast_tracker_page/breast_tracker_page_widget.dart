import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/bottom_sheet/profile_bottom_sheet/add_breast_tracker/add_breast_tracker_widget.dart';
import '/components/bottom_sheet/profile_bottom_sheet/chose_tracker_breast/chose_tracker_breast_widget.dart';
import '/components/bottom_sheet/profile_bottom_sheet/reset_breast_tracker/reset_breast_tracker_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'breast_tracker_page_model.dart';
export 'breast_tracker_page_model.dart';

class BreastTrackerPageWidget extends StatefulWidget {
  const BreastTrackerPageWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  final ChildrenRecord? child;

  @override
  _BreastTrackerPageWidgetState createState() =>
      _BreastTrackerPageWidgetState();
}

class _BreastTrackerPageWidgetState extends State<BreastTrackerPageWidget>
    with TickerProviderStateMixin {
  late BreastTrackerPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'imageOnPageLoadAnimation1': AnimationInfo(
      loop: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.easeOut,
          delay: 0.ms,
          duration: 3000.ms,
          begin: Offset(1.0, 1.0),
          end: Offset(0.8, 0.8),
        ),
        ScaleEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 3000.ms,
          begin: Offset(0.8, 0.8),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'imageOnPageLoadAnimation2': AnimationInfo(
      loop: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.easeOut,
          delay: 0.ms,
          duration: 3000.ms,
          begin: Offset(1.0, 1.0),
          end: Offset(0.8, 0.8),
        ),
        ScaleEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 3000.ms,
          begin: Offset(0.8, 0.8),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BreastTrackerPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 45.0, 20.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                height: 38.0,
                decoration: BoxDecoration(),
                child: Align(
                  alignment: AlignmentDirectional(-1.00, 0.00),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.safePop();
                    },
                    child: Container(
                      width: 38.0,
                      height: 38.0,
                      decoration: BoxDecoration(),
                      child: Align(
                        alignment: AlignmentDirectional(-1.00, 0.00),
                        child: Icon(
                          FFIcons.kleft,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: Text(
                  'Трекер груди',
                  style: FlutterFlowTheme.of(context).displayLarge,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Левая',
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                lineHeight: 1.25,
                              ),
                        ),
                        if (_model.leftIsActive)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: Text(
                              'Последняя',
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    lineHeight: 1.28,
                                  ),
                            ),
                          ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Правая',
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                lineHeight: 1.25,
                              ),
                        ),
                        if (_model.rightIsActive)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: Text(
                              'Последняя',
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    lineHeight: 1.28,
                                  ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 14.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Builder(
                      builder: (context) {
                        if (_model.leftIsActive) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: Image.asset(
                              'assets/images/Frame_1237411.webp',
                              width: MediaQuery.sizeOf(context).width * 0.48,
                              fit: BoxFit.cover,
                            ),
                          ).animateOnPageLoad(
                              animationsMap['imageOnPageLoadAnimation1']!);
                        } else {
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 27.0, 0.0, 27.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                setState(() {
                                  _model.leftIsActive = true;
                                  _model.rightIsActive = false;
                                  _model.timerStarted = true;
                                });
                                _model.timerLeftController.onStartTimer();
                                _model.timerRightController.onStopTimer();
                                if (!(_model.startTime != null)) {
                                  setState(() {
                                    _model.startTime = getCurrentTimestamp;
                                  });
                                }
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: Image.asset(
                                  'assets/images/Frame_12375.webp',
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.36,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        }
                      },
                    ),
                    Builder(
                      builder: (context) {
                        if (_model.rightIsActive) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: Image.asset(
                              'assets/images/Frame_1237411.webp',
                              width: MediaQuery.sizeOf(context).width * 0.48,
                              fit: BoxFit.cover,
                            ),
                          ).animateOnPageLoad(
                              animationsMap['imageOnPageLoadAnimation2']!);
                        } else {
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 27.0, 0.0, 27.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                setState(() {
                                  _model.leftIsActive = false;
                                  _model.rightIsActive = true;
                                  _model.timerStarted = true;
                                });
                                _model.timerLeftController.onStopTimer();
                                _model.timerRightController.onStartTimer();
                                if (!(_model.startTime != null)) {
                                  setState(() {
                                    _model.startTime = getCurrentTimestamp;
                                  });
                                }
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: Image.asset(
                                  'assets/images/Frame_12375.webp',
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.36,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
              if (_model.leftIsActive || _model.rightIsActive)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 37.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Кормление левой',
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: 'Inter',
                                  lineHeight: 1.28,
                                ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 2.0, 0.0, 0.0),
                            child: FlutterFlowTimer(
                              initialTime: _model.timerLeftMilliseconds,
                              getDisplayTime: (value) =>
                                  StopWatchTimer.getDisplayTime(
                                value,
                                hours: false,
                                milliSecond: false,
                              ),
                              controller: _model.timerLeftController,
                              updateStateInterval: Duration(milliseconds: 1000),
                              onChanged: (value, displayTime, shouldUpdate) {
                                _model.timerLeftMilliseconds = value;
                                _model.timerLeftValue = displayTime;
                                if (shouldUpdate) setState(() {});
                              },
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Inter',
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                    lineHeight: 1.16,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Кормление правой',
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: 'Inter',
                                  lineHeight: 1.28,
                                ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 2.0, 0.0, 0.0),
                            child: FlutterFlowTimer(
                              initialTime: _model.timerRightMilliseconds,
                              getDisplayTime: (value) =>
                                  StopWatchTimer.getDisplayTime(
                                value,
                                hours: false,
                                milliSecond: false,
                              ),
                              controller: _model.timerRightController,
                              updateStateInterval: Duration(milliseconds: 1000),
                              onChanged: (value, displayTime, shouldUpdate) {
                                _model.timerRightMilliseconds = value;
                                _model.timerRightValue = displayTime;
                                if (shouldUpdate) setState(() {});
                              },
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Inter',
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                    lineHeight: 1.16,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              if (!(_model.leftIsActive || _model.rightIsActive))
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 37.0, 0.0, 0.0),
                  child: Text(
                    'Нажми на грудь, чтобы начать',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          lineHeight: 1.25,
                        ),
                  ),
                ),
              Spacer(),
              Align(
                alignment: AlignmentDirectional(0.00, 0.00),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      barrierColor: FlutterFlowTheme.of(context).botomBack,
                      context: context,
                      builder: (context) {
                        return GestureDetector(
                          onTap: () => _model.unfocusNode.canRequestFocus
                              ? FocusScope.of(context)
                                  .requestFocus(_model.unfocusNode)
                              : FocusScope.of(context).unfocus(),
                          child: Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: ResetBreastTrackerWidget(),
                          ),
                        );
                      },
                    ).then((value) => safeSetState(() => _model.reset = value));

                    if (_model.reset!) {
                      _model.timerLeftController.onResetTimer();

                      _model.timerRightController.onResetTimer();

                      setState(() {
                        _model.leftIsActive = false;
                        _model.rightIsActive = false;
                        _model.timerStarted = false;
                        _model.startTime = null;
                      });
                    }

                    setState(() {});
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Сбросить',
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                        child: Icon(
                          FFIcons.kreset,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 45.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        setState(() {
                          FFAppState().customPickerItemIndex1 = 0;
                          FFAppState().customPickerItemIndex2 = 0;
                        });
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          barrierColor: FlutterFlowTheme.of(context).botomBack,
                          enableDrag: false,
                          context: context,
                          builder: (context) {
                            return GestureDetector(
                              onTap: () => _model.unfocusNode.canRequestFocus
                                  ? FocusScope.of(context)
                                      .requestFocus(_model.unfocusNode)
                                  : FocusScope.of(context).unfocus(),
                              child: Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: AddBreastTrackerWidget(
                                  child: widget.child!,
                                ),
                              ),
                            );
                          },
                        ).then((value) => safeSetState(() {}));
                      },
                      child: Container(
                        width: 48.0,
                        height: 48.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        child: Icon(
                          FFIcons.kplus2,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                      ),
                    ),
                    Builder(
                      builder: (context) {
                        if (_model.timerStarted) {
                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.timerLeftController.onStopTimer();
                              _model.timerRightController.onStopTimer();
                              if (dateTimeFormat(
                                    'Md',
                                    _model.startTime,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ) ==
                                  dateTimeFormat(
                                    'Md',
                                    getCurrentTimestamp,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  )) {
                                var trackersRecordReference1 =
                                    TrackersRecord.createDoc(
                                        currentUserReference!);
                                await trackersRecordReference1
                                    .set(createTrackersRecordData(
                                  trackerTitle: 'Кормление грудью',
                                  childRef: widget.child?.reference,
                                  breastEndTime: getCurrentTimestamp,
                                  breastLeftDuration:
                                      _model.timerLeftMilliseconds,
                                  breastRightDuration:
                                      _model.timerRightMilliseconds,
                                  breastTotalDuration:
                                      functions.findTotalTimeFromTwoDurations(
                                          _model.timerLeftMilliseconds,
                                          _model.timerRightMilliseconds),
                                  trackerStartTime: _model.startTime,
                                ));
                                _model.trackerDoc =
                                    TrackersRecord.getDocumentFromData(
                                        createTrackersRecordData(
                                          trackerTitle: 'Кормление грудью',
                                          childRef: widget.child?.reference,
                                          breastEndTime: getCurrentTimestamp,
                                          breastLeftDuration:
                                              _model.timerLeftMilliseconds,
                                          breastRightDuration:
                                              _model.timerRightMilliseconds,
                                          breastTotalDuration: functions
                                              .findTotalTimeFromTwoDurations(
                                                  _model.timerLeftMilliseconds,
                                                  _model
                                                      .timerRightMilliseconds),
                                          trackerStartTime: _model.startTime,
                                        ),
                                        trackersRecordReference1);

                                await currentUserReference!.update({
                                  ...mapToFirestore(
                                    {
                                      'trackers_adding_dates':
                                          functions.processDateList(functions
                                              .processDateList((currentUserDocument
                                                          ?.trackersAddingDates
                                                          ?.toList() ??
                                                      [])
                                                  .toList())
                                              .toList()),
                                    },
                                  ),
                                });

                                context.goNamed(
                                  'BreastTrackerIsAdded',
                                  queryParameters: {
                                    'track': serializeParam(
                                      _model.trackerDoc,
                                      ParamType.Document,
                                    ),
                                    'child': serializeParam(
                                      widget.child,
                                      ParamType.Document,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'track': _model.trackerDoc,
                                    'child': widget.child,
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType:
                                          PageTransitionType.rightToLeft,
                                      duration: Duration(milliseconds: 300),
                                    ),
                                  },
                                );
                              } else {
                                var trackersRecordReference2 =
                                    TrackersRecord.createDoc(
                                        currentUserReference!);
                                await trackersRecordReference2
                                    .set(createTrackersRecordData(
                                  trackerTitle: 'Кормление грудью',
                                  childRef: widget.child?.reference,
                                  breastEndTime:
                                      functions.endOfDay(_model.startTime!),
                                  breastLeftDuration:
                                      _model.timerLeftMilliseconds,
                                  breastRightDuration:
                                      _model.timerRightMilliseconds,
                                  breastTotalDuration:
                                      functions.findTotalTimeFromTwoDurations(
                                          _model.timerLeftMilliseconds,
                                          _model.timerRightMilliseconds),
                                  trackerStartTime: _model.startTime,
                                ));
                                _model.trackerDoc1 =
                                    TrackersRecord.getDocumentFromData(
                                        createTrackersRecordData(
                                          trackerTitle: 'Кормление грудью',
                                          childRef: widget.child?.reference,
                                          breastEndTime: functions
                                              .endOfDay(_model.startTime!),
                                          breastLeftDuration:
                                              _model.timerLeftMilliseconds,
                                          breastRightDuration:
                                              _model.timerRightMilliseconds,
                                          breastTotalDuration: functions
                                              .findTotalTimeFromTwoDurations(
                                                  _model.timerLeftMilliseconds,
                                                  _model
                                                      .timerRightMilliseconds),
                                          trackerStartTime: _model.startTime,
                                        ),
                                        trackersRecordReference2);

                                await TrackersRecord.createDoc(
                                        currentUserReference!)
                                    .set(createTrackersRecordData(
                                  trackerTitle: 'Кормление грудью',
                                  childRef: widget.child?.reference,
                                  breastEndTime: getCurrentTimestamp,
                                  breastLeftDuration:
                                      _model.timerLeftMilliseconds,
                                  breastRightDuration:
                                      _model.timerRightMilliseconds,
                                  breastTotalDuration:
                                      functions.findTotalTimeFromTwoDurations(
                                          _model.timerLeftMilliseconds,
                                          _model.timerRightMilliseconds),
                                  trackerStartTime:
                                      functions.startOfDay(getCurrentTimestamp),
                                ));

                                await currentUserReference!.update({
                                  ...mapToFirestore(
                                    {
                                      'trackers_adding_dates':
                                          functions.processDateList(functions
                                              .processDateList((currentUserDocument
                                                          ?.trackersAddingDates
                                                          ?.toList() ??
                                                      [])
                                                  .toList())
                                              .toList()),
                                    },
                                  ),
                                });

                                context.goNamed(
                                  'BreastTrackerIsAdded',
                                  queryParameters: {
                                    'track': serializeParam(
                                      _model.trackerDoc1,
                                      ParamType.Document,
                                    ),
                                    'child': serializeParam(
                                      widget.child,
                                      ParamType.Document,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'track': _model.trackerDoc1,
                                    'child': widget.child,
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType:
                                          PageTransitionType.rightToLeft,
                                      duration: Duration(milliseconds: 300),
                                    ),
                                  },
                                );
                              }

                              setState(() {});
                            },
                            child: Container(
                              width: 166.0,
                              height: 48.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).tertiary,
                                borderRadius: BorderRadius.circular(14.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 12.0, 24.0, 12.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Завершить',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineLarge
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 16.0,
                                            lineHeight: 1.25,
                                          ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 0.0, 0.0),
                                      child: Icon(
                                        FFIcons.kflag,
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        size: 24.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Container(
                            width: 166.0,
                            height: 48.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).grey20,
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 12.0, 24.0, 12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Завершить',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .grey60,
                                          fontSize: 16.0,
                                          lineHeight: 1.25,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 0.0, 0.0),
                                    child: Icon(
                                      FFIcons.kflag,
                                      color:
                                          FlutterFlowTheme.of(context).grey60,
                                      size: 24.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                      },
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          barrierColor: FlutterFlowTheme.of(context).botomBack,
                          context: context,
                          builder: (context) {
                            return GestureDetector(
                              onTap: () => _model.unfocusNode.canRequestFocus
                                  ? FocusScope.of(context)
                                      .requestFocus(_model.unfocusNode)
                                  : FocusScope.of(context).unfocus(),
                              child: Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: ChoseTrackerBreastWidget(
                                  child: widget.child!,
                                ),
                              ),
                            );
                          },
                        ).then((value) => safeSetState(() {}));
                      },
                      child: Container(
                        width: 48.0,
                        height: 48.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        child: Icon(
                          FFIcons.kcategory,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
