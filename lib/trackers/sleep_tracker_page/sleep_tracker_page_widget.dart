import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/bottom_sheet/profile_bottom_sheet/add_sleeping_tracker/add_sleeping_tracker_widget.dart';
import '/components/bottom_sheet/profile_bottom_sheet/chose_tracker_sleeping/chose_tracker_sleeping_widget.dart';
import '/components/bottom_sheet/profile_bottom_sheet/reset_sleep_tracker/reset_sleep_tracker_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sleep_tracker_page_model.dart';
export 'sleep_tracker_page_model.dart';

class SleepTrackerPageWidget extends StatefulWidget {
  const SleepTrackerPageWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  final ChildrenRecord? child;

  @override
  _SleepTrackerPageWidgetState createState() => _SleepTrackerPageWidgetState();
}

class _SleepTrackerPageWidgetState extends State<SleepTrackerPageWidget>
    with TickerProviderStateMixin {
  late SleepTrackerPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'imageOnPageLoadAnimation': AnimationInfo(
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
    _model = createModel(context, () => SleepTrackerPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 1000),
        callback: (timer) async {
          setState(() {});
        },
        startImmediately: true,
      );
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: StreamBuilder<ChildrenRecord>(
          stream: ChildrenRecord.getDocument(widget.child!.reference),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                ),
              );
            }
            final containerChildrenRecord = snapshot.data!;
            return Container(
              decoration: BoxDecoration(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 45.0, 20.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 38.0,
                      decoration: BoxDecoration(),
                      child: Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
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
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Icon(
                                FFIcons.kleft,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: Text(
                        'Трекер сна',
                        style: FlutterFlowTheme.of(context).displayLarge,
                      ),
                    ),
                    if (containerChildrenRecord.tempStartSleepTime == null)
                      Spacer(flex: 136),
                    if (containerChildrenRecord.tempStartSleepTime != null)
                      Spacer(flex: 64),
                    Builder(
                      builder: (context) {
                        if (containerChildrenRecord.tempStartSleepTime !=
                            null) {
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: Image.asset(
                                  'assets/images/Frame_12374s.webp',
                                  width: 190.0,
                                  fit: BoxFit.cover,
                                ),
                              ).animateOnPageLoad(
                                  animationsMap['imageOnPageLoadAnimation']!),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 37.0, 0.0, 0.0),
                                child: Text(
                                  'Общее время',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        lineHeight: 1.28,
                                      ),
                                ),
                              ),
                              Text(
                                functions.calculeteSleepDuratioin(
                                    containerChildrenRecord.tempStartSleepTime!,
                                    getCurrentTimestamp),
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold,
                                      lineHeight: 1.16,
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
                                child: Text(
                                  'Начало  в ${dateTimeFormat(
                                    'Hm',
                                    containerChildrenRecord.tempStartSleepTime,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  )}',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: 'Inter',
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w600,
                                        lineHeight: 1.28,
                                      ),
                                ),
                              ),
                            ],
                          );
                        } else {
                          return Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Stack(
                              alignment: AlignmentDirectional(0.0, -1.0),
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await containerChildrenRecord.reference
                                        .update(createChildrenRecordData(
                                      tempStartSleepTime: getCurrentTimestamp,
                                    ));
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: Image.asset(
                                      'assets/images/Frame_12374a.webp',
                                      width: 138.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 123.0, 98.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: Image.asset(
                                      'assets/images/curly_arrow2.webp',
                                      width: 108.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 210.0, 0.0, 0.0),
                                  child: Text(
                                    'Нажми на кнопку, чтобы начать',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w500,
                                          lineHeight: 1.25,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                    ),
                    if (containerChildrenRecord.tempStartSleepTime != null)
                      Spacer(flex: 143),
                    if (containerChildrenRecord.tempStartSleepTime == null)
                      Spacer(flex: 173),
                    if (containerChildrenRecord.tempStartSleepTime != null)
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              barrierColor:
                                  FlutterFlowTheme.of(context).botomBack,
                              context: context,
                              builder: (context) {
                                return GestureDetector(
                                  onTap: () =>
                                      _model.unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: ResetSleepTrackerWidget(),
                                  ),
                                );
                              },
                            ).then((value) =>
                                safeSetState(() => _model.reset = value));

                            if (_model.reset!) {
                              await widget.child!.reference.update({
                                ...mapToFirestore(
                                  {
                                    'temp_start_sleep_time':
                                        FieldValue.delete(),
                                  },
                                ),
                              });
                            }

                            setState(() {});
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Сбросить',
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 0.0),
                                child: Icon(
                                  FFIcons.kreset,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 45.0),
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
                                barrierColor:
                                    FlutterFlowTheme.of(context).botomBack,
                                context: context,
                                builder: (context) {
                                  return GestureDetector(
                                    onTap: () => _model
                                            .unfocusNode.canRequestFocus
                                        ? FocusScope.of(context)
                                            .requestFocus(_model.unfocusNode)
                                        : FocusScope.of(context).unfocus(),
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: AddSleepingTrackerWidget(
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
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(14.0),
                              ),
                              child: Icon(
                                FFIcons.kplus2,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ),
                          ),
                          Builder(
                            builder: (context) {
                              if (containerChildrenRecord.tempStartSleepTime !=
                                  null) {
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (dateTimeFormat(
                                          'Md',
                                          containerChildrenRecord
                                              .tempStartSleepTime,
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
                                        trackerTitle:
                                            functions.checkIfNightSleep(
                                                    containerChildrenRecord
                                                        .tempStartSleepTime!)
                                                ? 'Ночной сон'
                                                : 'Дневной  сон',
                                        childRef:
                                            containerChildrenRecord.reference,
                                        sleepEndTime: getCurrentTimestamp,
                                        trackerStartTime:
                                            containerChildrenRecord
                                                .tempStartSleepTime,
                                      ));
                                      _model.trackerDoc =
                                          TrackersRecord.getDocumentFromData(
                                              createTrackersRecordData(
                                                trackerTitle:
                                                    functions.checkIfNightSleep(
                                                            containerChildrenRecord
                                                                .tempStartSleepTime!)
                                                        ? 'Ночной сон'
                                                        : 'Дневной  сон',
                                                childRef:
                                                    containerChildrenRecord
                                                        .reference,
                                                sleepEndTime:
                                                    getCurrentTimestamp,
                                                trackerStartTime:
                                                    containerChildrenRecord
                                                        .tempStartSleepTime,
                                              ),
                                              trackersRecordReference1);
                                      if (functions.isWithinNDays(
                                              widget.child!.birthDate!, 31) &&
                                          (functions
                                                  .calculateSleepDurationInMinutes(
                                                      _model.trackerDoc!
                                                          .trackerStartTime!,
                                                      getCurrentTimestamp) >
                                              240)) {
                                        await widget.child!.reference.update({
                                          ...mapToFirestore(
                                            {
                                              'temp_start_sleep_time':
                                                  FieldValue.delete(),
                                              'unnormal_sleep_date':
                                                  FieldValue.arrayUnion(
                                                      [getCurrentTimestamp]),
                                            },
                                          ),
                                        });
                                      } else if (functions.isWithinNDays(
                                              widget.child!.birthDate!,
                                              1095) &&
                                          (functions
                                                  .calculateSleepDurationInMinutes(
                                                      _model.trackerDoc!
                                                          .trackerStartTime!,
                                                      getCurrentTimestamp) >
                                              120)) {
                                        await widget.child!.reference.update({
                                          ...mapToFirestore(
                                            {
                                              'temp_start_sleep_time':
                                                  FieldValue.delete(),
                                              'unnormal_sleep_date':
                                                  FieldValue.arrayUnion(
                                                      [getCurrentTimestamp]),
                                            },
                                          ),
                                        });
                                      } else {
                                        await widget.child!.reference.update({
                                          ...mapToFirestore(
                                            {
                                              'temp_start_sleep_time':
                                                  FieldValue.delete(),
                                            },
                                          ),
                                        });
                                      }

                                      await currentUserReference!.update({
                                        ...mapToFirestore(
                                          {
                                            'trackers_adding_dates': functions
                                                .processDateList(functions
                                                    .processDateList(
                                                        (currentUserDocument
                                                                    ?.trackersAddingDates
                                                                    ?.toList() ??
                                                                [])
                                                            .toList())
                                                    .toList()),
                                          },
                                        ),
                                      });

                                      context.goNamed(
                                        'SleepTrackerIsAdded',
                                        queryParameters: {
                                          'tracker': serializeParam(
                                            _model.trackerDoc,
                                            ParamType.Document,
                                          ),
                                          'child': serializeParam(
                                            widget.child,
                                            ParamType.Document,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'tracker': _model.trackerDoc,
                                          'child': widget.child,
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.rightToLeft,
                                            duration:
                                                Duration(milliseconds: 300),
                                          ),
                                        },
                                      );
                                    } else {
                                      var trackersRecordReference2 =
                                          TrackersRecord.createDoc(
                                              currentUserReference!);
                                      await trackersRecordReference2
                                          .set(createTrackersRecordData(
                                        trackerTitle:
                                            functions.checkIfNightSleep(
                                                    containerChildrenRecord
                                                        .tempStartSleepTime!)
                                                ? 'Ночной сон'
                                                : 'Дневной  сон',
                                        childRef:
                                            containerChildrenRecord.reference,
                                        sleepEndTime: functions.endOfDay(
                                            containerChildrenRecord
                                                .tempStartSleepTime!),
                                        trackerStartTime:
                                            containerChildrenRecord
                                                .tempStartSleepTime,
                                      ));
                                      _model.trackerDoc1 =
                                          TrackersRecord.getDocumentFromData(
                                              createTrackersRecordData(
                                                trackerTitle:
                                                    functions.checkIfNightSleep(
                                                            containerChildrenRecord
                                                                .tempStartSleepTime!)
                                                        ? 'Ночной сон'
                                                        : 'Дневной  сон',
                                                childRef:
                                                    containerChildrenRecord
                                                        .reference,
                                                sleepEndTime: functions.endOfDay(
                                                    containerChildrenRecord
                                                        .tempStartSleepTime!),
                                                trackerStartTime:
                                                    containerChildrenRecord
                                                        .tempStartSleepTime,
                                              ),
                                              trackersRecordReference2);

                                      var trackersRecordReference3 =
                                          TrackersRecord.createDoc(
                                              currentUserReference!);
                                      await trackersRecordReference3
                                          .set(createTrackersRecordData(
                                        trackerTitle:
                                            functions.checkIfNightSleep(
                                                    containerChildrenRecord
                                                        .tempStartSleepTime!)
                                                ? 'Ночной сон'
                                                : 'Дневной  сон',
                                        childRef:
                                            containerChildrenRecord.reference,
                                        sleepEndTime: getCurrentTimestamp,
                                        trackerStartTime: functions
                                            .startOfDay(getCurrentTimestamp),
                                      ));
                                      _model.secondDay =
                                          TrackersRecord.getDocumentFromData(
                                              createTrackersRecordData(
                                                trackerTitle:
                                                    functions.checkIfNightSleep(
                                                            containerChildrenRecord
                                                                .tempStartSleepTime!)
                                                        ? 'Ночной сон'
                                                        : 'Дневной  сон',
                                                childRef:
                                                    containerChildrenRecord
                                                        .reference,
                                                sleepEndTime:
                                                    getCurrentTimestamp,
                                                trackerStartTime:
                                                    functions.startOfDay(
                                                        getCurrentTimestamp),
                                              ),
                                              trackersRecordReference3);

                                      await widget.child!.reference.update({
                                        ...mapToFirestore(
                                          {
                                            'temp_start_sleep_time':
                                                FieldValue.delete(),
                                          },
                                        ),
                                      });

                                      await currentUserReference!.update({
                                        ...mapToFirestore(
                                          {
                                            'trackers_adding_dates': functions
                                                .processDateList(functions
                                                    .processDateList(
                                                        (currentUserDocument
                                                                    ?.trackersAddingDates
                                                                    ?.toList() ??
                                                                [])
                                                            .toList())
                                                    .toList()),
                                          },
                                        ),
                                      });

                                      context.goNamed(
                                        'SleepTrackerIsAdded',
                                        queryParameters: {
                                          'tracker': serializeParam(
                                            _model.trackerDoc1,
                                            ParamType.Document,
                                          ),
                                          'child': serializeParam(
                                            widget.child,
                                            ParamType.Document,
                                          ),
                                          'secondDay': serializeParam(
                                            _model.secondDay,
                                            ParamType.Document,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'tracker': _model.trackerDoc1,
                                          'child': widget.child,
                                          'secondDay': _model.secondDay,
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.rightToLeft,
                                            duration:
                                                Duration(milliseconds: 300),
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
                                      color: FlutterFlowTheme.of(context)
                                          .purpleLight,
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .purple,
                                                  fontSize: 16.0,
                                                  lineHeight: 1.25,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 0.0, 0.0),
                                            child: Icon(
                                              FFIcons.kflag,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .purple,
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .grey60,
                                                fontSize: 16.0,
                                                lineHeight: 1.25,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 0.0, 0.0),
                                          child: Icon(
                                            FFIcons.kflag,
                                            color: FlutterFlowTheme.of(context)
                                                .grey60,
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
                                barrierColor:
                                    FlutterFlowTheme.of(context).botomBack,
                                context: context,
                                builder: (context) {
                                  return GestureDetector(
                                    onTap: () => _model
                                            .unfocusNode.canRequestFocus
                                        ? FocusScope.of(context)
                                            .requestFocus(_model.unfocusNode)
                                        : FocusScope.of(context).unfocus(),
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: ChoseTrackerSleepingWidget(
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
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(14.0),
                              ),
                              child: Icon(
                                FFIcons.kcategory,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
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
            );
          },
        ),
      ),
    );
  }
}
