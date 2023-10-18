import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sleep_norms_page_model.dart';
export 'sleep_norms_page_model.dart';

class SleepNormsPageWidget extends StatefulWidget {
  const SleepNormsPageWidget({
    Key? key,
    this.child,
  }) : super(key: key);

  final ChildrenRecord? child;

  @override
  _SleepNormsPageWidgetState createState() => _SleepNormsPageWidgetState();
}

class _SleepNormsPageWidgetState extends State<SleepNormsPageWidget> {
  late SleepNormsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SleepNormsPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.currentMonthIndex =
            functions.monthsSinceBirthday(widget.child!.birthDate!) - 1;
        _model.pickedMonthIndex = _model.currentMonthIndex;
      });
      await Future.delayed(const Duration(milliseconds: 500));
      await _model.months?.animateTo(
        _model.months!.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
      if (functions.isWithinNDays(widget.child!.birthDate!, 31) &&
          (functions.countDates(widget.child!.unnormalSleepDate.toList()) >=
              8) &&
          (FFAppState().firstTipWasShowed == 0)) {
        FFAppState().firstTipWasShowed = 1;
      } else if (functions.isWithinNDays(widget.child!.birthDate!, 61) &&
          (functions.countDates(widget.child!.unnormalSleepDate.toList()) >=
              5) &&
          (FFAppState().firstTipWasShowed == 0)) {
        FFAppState().firstTipWasShowed = 1;
      } else if (functions.isWithinNDays(widget.child!.birthDate!, 122) &&
          (functions.countDates(widget.child!.unnormalSleepDate.toList()) >=
              4) &&
          (FFAppState().firstTipWasShowed == 0)) {
        FFAppState().firstTipWasShowed = 1;
      } else if (functions.isWithinNDays(widget.child!.birthDate!, 212) &&
          (functions.countDates(widget.child!.unnormalSleepDate.toList()) >=
              3) &&
          (FFAppState().firstTipWasShowed == 0)) {
        FFAppState().firstTipWasShowed = 1;
      } else if (functions.isWithinNDays(widget.child!.birthDate!, 1095) &&
          (functions.countDates(widget.child!.unnormalSleepDate.toList()) >=
              2) &&
          (FFAppState().firstTipWasShowed == 0)) {
        FFAppState().firstTipWasShowed = 1;
      }
    });
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
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 45.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                    child: Container(
                      height: 38.0,
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
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
                                    size: 24.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    6.0, 0.0, 30.0, 0.0),
                                child: Text(
                                  'График нормы сна',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w600,
                                        lineHeight: 1.25,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    child: SingleChildScrollView(
                      controller: _model.columnController,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 16.0, 20.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              height: 36.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    2.0, 2.0, 2.0, 2.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          setState(() {
                                            FFAppState().viewSleepNorms = 0;
                                          });
                                          await Future.delayed(const Duration(
                                              milliseconds: 500));
                                          await _model.months?.animateTo(
                                            _model.months!.position
                                                .maxScrollExtent,
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.ease,
                                          );
                                        },
                                        child: Container(
                                          width: 100.0,
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            color: FFAppState()
                                                        .viewSleepNorms ==
                                                    0
                                                ? FlutterFlowTheme.of(context)
                                                    .primary
                                                : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Align(
                                            alignment: AlignmentDirectional(
                                                0.00, 0.00),
                                            child: Text(
                                              'Месяц',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .headlineSmall
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: FFAppState()
                                                                .viewSleepNorms ==
                                                            0
                                                        ? Colors.white
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    fontWeight: FontWeight.w500,
                                                    lineHeight: 1.25,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          setState(() {
                                            FFAppState().viewSleepNorms = 1;
                                          });
                                        },
                                        child: Container(
                                          width: 100.0,
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            color: FFAppState()
                                                        .viewSleepNorms ==
                                                    0
                                                ? Colors.white
                                                : FlutterFlowTheme.of(context)
                                                    .primary,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Align(
                                            alignment: AlignmentDirectional(
                                                0.00, 0.00),
                                            child: Text(
                                              'Неделя',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .headlineSmall
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: FFAppState()
                                                                .viewSleepNorms ==
                                                            0
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText
                                                        : Colors.white,
                                                    fontWeight: FontWeight.w500,
                                                    lineHeight: 1.25,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 7.0)),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 0.0),
                            child: Builder(
                              builder: (context) {
                                if (FFAppState().viewSleepNorms == 0) {
                                  return StreamBuilder<List<TrackersRecord>>(
                                    stream: queryTrackersRecord(
                                      parent: currentUserReference,
                                      queryBuilder: (trackersRecord) =>
                                          trackersRecord
                                              .where(
                                                'child_ref',
                                                isEqualTo:
                                                    widget.child?.reference,
                                              )
                                              .where(
                                                'tracker_title',
                                                isNotEqualTo:
                                                    'Кормление грудью',
                                              ),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<TrackersRecord>
                                          monthTrackersRecordList =
                                          snapshot.data!;
                                      return Container(
                                        width: 320.0,
                                        height: 300.0,
                                        decoration: BoxDecoration(),
                                        child: Visibility(
                                          visible: functions
                                                  .getDateTimeDifferenceInSeconds(
                                                      monthTrackersRecordList
                                                          .where((e) =>
                                                              (e.trackerTitle != 'Прикорм') &&
                                                              (e.trackerStartTime! >=
                                                                  functions.addMonthsToBirthday(
                                                                      widget
                                                                          .child!
                                                                          .birthDate!,
                                                                      _model
                                                                          .pickedMonthIndex)) &&
                                                              (e.trackerStartTime! <
                                                                  functions.addMonthsToBirthday(
                                                                      widget
                                                                          .child!
                                                                          .birthDate!,
                                                                      _model.pickedMonthIndex +
                                                                          1)))
                                                          .toList()
                                                          .map((e) => e
                                                              .trackerStartTime)
                                                          .withoutNulls
                                                          .toList(),
                                                      monthTrackersRecordList
                                                          .where((e) =>
                                                              (e.trackerTitle !=
                                                                  'Прикорм') &&
                                                              (e.trackerStartTime! >=
                                                                  functions.addMonthsToBirthday(widget.child!.birthDate!, _model.pickedMonthIndex)) &&
                                                              (e.trackerStartTime! < functions.addMonthsToBirthday(widget.child!.birthDate!, _model.pickedMonthIndex + 1)))
                                                          .toList()
                                                          .map((e) => e.sleepEndTime)
                                                          .withoutNulls
                                                          .toList())
                                                  .length >
                                              0,
                                          child: Container(
                                            width: double.infinity,
                                            height: double.infinity,
                                            child: custom_widgets.TimeSchedule(
                                              width: double.infinity,
                                              height: double.infinity,
                                              scheduleTypeByDays: 31,
                                              recommendedRateByMinute:
                                                  _model.pickedMonthIndex == 0
                                                      ? 240
                                                      : 120,
                                              timeRanges: functions.getDateTimeDifferenceInSeconds(
                                                  monthTrackersRecordList
                                                      .where((e) =>
                                                          (e.trackerTitle != 'Прикорм') &&
                                                          (e.trackerStartTime! >=
                                                              functions.addMonthsToBirthday(
                                                                  widget.child!
                                                                      .birthDate!,
                                                                  _model
                                                                      .pickedMonthIndex)) &&
                                                          (e.trackerStartTime! <
                                                              functions.addMonthsToBirthday(
                                                                  widget.child!
                                                                      .birthDate!,
                                                                  _model.pickedMonthIndex +
                                                                      1)))
                                                      .toList()
                                                      .map((e) =>
                                                          e.trackerStartTime)
                                                      .withoutNulls
                                                      .toList(),
                                                  monthTrackersRecordList
                                                      .where((e) =>
                                                          (e.trackerTitle != 'Прикорм') &&
                                                          (e.trackerStartTime! >= functions.addMonthsToBirthday(widget.child!.birthDate!, _model.pickedMonthIndex)) &&
                                                          (e.trackerStartTime! < functions.addMonthsToBirthday(widget.child!.birthDate!, _model.pickedMonthIndex + 1)))
                                                      .toList()
                                                      .map((e) => e.sleepEndTime)
                                                      .withoutNulls
                                                      .toList()),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                } else {
                                  return StreamBuilder<List<TrackersRecord>>(
                                    stream: queryTrackersRecord(
                                      parent: currentUserReference,
                                      queryBuilder: (trackersRecord) =>
                                          trackersRecord
                                              .where(
                                                'child_ref',
                                                isEqualTo:
                                                    widget.child?.reference,
                                              )
                                              .where(
                                                'tracker_title',
                                                isNotEqualTo:
                                                    'Кормление грудью',
                                              ),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<TrackersRecord>
                                          weekTrackersRecordList =
                                          snapshot.data!;
                                      return Container(
                                        width: 320.0,
                                        height: 300.0,
                                        decoration: BoxDecoration(),
                                        child: Visibility(
                                          visible: functions
                                                  .getDateTimeDifferenceInSeconds(
                                                      weekTrackersRecordList
                                                          .where((e) =>
                                                              (e.trackerTitle !=
                                                                  'Прикорм') &&
                                                              (e.trackerStartTime! >=
                                                                  functions
                                                                      .getStartOfWeek(
                                                                          getCurrentTimestamp)))
                                                          .toList()
                                                          .map((e) => e
                                                              .trackerStartTime)
                                                          .withoutNulls
                                                          .toList(),
                                                      weekTrackersRecordList
                                                          .where((e) =>
                                                              (e.trackerTitle !=
                                                                  'Прикорм') &&
                                                              (e.trackerStartTime! >=
                                                                  functions
                                                                      .getStartOfWeek(
                                                                          getCurrentTimestamp)))
                                                          .toList()
                                                          .map((e) =>
                                                              e.sleepEndTime)
                                                          .withoutNulls
                                                          .toList())
                                                  .length >
                                              0,
                                          child: Container(
                                            width: double.infinity,
                                            height: double.infinity,
                                            child: custom_widgets.TimeSchedule(
                                              width: double.infinity,
                                              height: double.infinity,
                                              scheduleTypeByDays: 7,
                                              recommendedRateByMinute:
                                                  _model.pickedMonthIndex == 0
                                                      ? 240
                                                      : 120,
                                              timeRanges: functions.getDateTimeDifferenceInSeconds(
                                                  weekTrackersRecordList
                                                      .where((e) =>
                                                          (e.trackerTitle !=
                                                              'Прикорм') &&
                                                          (e.trackerStartTime! >=
                                                              functions
                                                                  .getStartOfWeek(
                                                                      getCurrentTimestamp)))
                                                      .toList()
                                                      .map((e) =>
                                                          e.trackerStartTime)
                                                      .withoutNulls
                                                      .toList(),
                                                  weekTrackersRecordList
                                                      .where((e) =>
                                                          (e.trackerTitle !=
                                                              'Прикорм') &&
                                                          (e.trackerStartTime! >=
                                                              functions
                                                                  .getStartOfWeek(
                                                                      getCurrentTimestamp)))
                                                      .toList()
                                                      .map(
                                                          (e) => e.sleepEndTime)
                                                      .withoutNulls
                                                      .toList()),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 0.0),
                            child: Builder(
                              builder: (context) {
                                if (_model.pickedMonthIndex == 0) {
                                  return Text(
                                    'Продолжительность времени бодрствования до 1 месяца: 20-50 минут\nКоличество дневных снов до 1 месяца: 4-8',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: 14.0,
                                          lineHeight: 1.28,
                                        ),
                                  );
                                } else if ((_model.pickedMonthIndex == 1) ||
                                    (_model.pickedMonthIndex == 2)) {
                                  return Text(
                                    'Продолжительность времени бодрствования 3 месяца: 1 час 20 мин - 1 час 40 мин.\nКоличество дневных снов 1-2 месяца: 4-5',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: 14.0,
                                          lineHeight: 1.28,
                                        ),
                                  );
                                } else if (_model.pickedMonthIndex == 3) {
                                  return Text(
                                    'Продолжительность времени бодрствования 3 месяца: 1 час 20 мин - 1 час 40 мин.\nКоличество дневных снов 3 месяца: 3-4',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: 14.0,
                                          lineHeight: 1.28,
                                        ),
                                  );
                                } else if (_model.pickedMonthIndex == 4) {
                                  return Text(
                                    'Продолжительность времени бодрствования 4 месяца: 1 час 30 мин - 2 часа.\nКоличество дневных снов 4 месяца: 3-4',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: 14.0,
                                          lineHeight: 1.28,
                                        ),
                                  );
                                } else if ((_model.pickedMonthIndex == 5) ||
                                    (_model.pickedMonthIndex == 6)) {
                                  return Text(
                                    'Продолжительность времени бодрствования 5-6 месяцев: 1 час 45 мин - 2 часа 15 мин.\nКоличество дневных снов 5-6 месяцев: 3',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: 14.0,
                                          lineHeight: 1.28,
                                        ),
                                  );
                                } else if (_model.pickedMonthIndex == 7) {
                                  return Text(
                                    'Продолжительность времени бодрствования 6-7 месяцев: 2 часа 30 мин - 3 часа.\nКоличество дневных снов 6-7 месяцев: 2-3',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: 14.0,
                                          lineHeight: 1.28,
                                        ),
                                  );
                                } else if ((_model.pickedMonthIndex >= 8) &&
                                    (_model.pickedMonthIndex < 10)) {
                                  return Text(
                                    'Продолжительность времени бодрствования 8-10 месяцев: 3 часа - 3 часа 45 мин.\nКоличество дневных снов 8-10 месяцев: 2',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: 14.0,
                                          lineHeight: 1.28,
                                        ),
                                  );
                                } else if ((_model.pickedMonthIndex >= 10) &&
                                    (_model.pickedMonthIndex < 12)) {
                                  return Text(
                                    'Продолжительность времени бодрствования 10-12 месяцев: 3 часа 30 мин - 4 часа 30 мин.\nКоличество дневных снов 10-12 месяцев: 2 (редко 1)',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: 14.0,
                                          lineHeight: 1.28,
                                        ),
                                  );
                                } else if ((_model.pickedMonthIndex >= 12) &&
                                    (_model.pickedMonthIndex < 18)) {
                                  return Text(
                                    'Продолжительность времени бодрствования 12-18 месяцев: 4 часа - 5 часов 50 мин.\nКоличество дневных снов 12-18 месяцев: 1-2',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: 14.0,
                                          lineHeight: 1.28,
                                        ),
                                  );
                                } else if (_model.pickedMonthIndex < 36) {
                                  return Text(
                                    'Продолжительность времени бодрствования 2 года: 4-6 ч.\nКоличество дневных снов 2 года: 1',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: 14.0,
                                          lineHeight: 1.28,
                                        ),
                                  );
                                } else {
                                  return Text(
                                    'Продолжительность времени бодрствования 3 года: 5-6 ч.\nКоличество дневных снов 3 года: 1',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: 14.0,
                                          lineHeight: 1.28,
                                        ),
                                  );
                                }
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 12.0, 20.0, 125.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 16.0, 16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(
                                          FFIcons.kmessageCircle,
                                          color:
                                              FlutterFlowTheme.of(context).blue,
                                          size: 24.0,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'Совет',
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
                                    Builder(
                                      builder: (context) {
                                        if (functions.isWithinNDays(widget.child!.birthDate!, 31) &&
                                            (functions.countDates(widget.child!.unnormalSleepDate.toList()) >=
                                                8) &&
                                            (FFAppState().firstTipWasShowed ==
                                                0)) {
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 0.0, 0.0),
                                            child: AuthUserStreamWidget(
                                              builder: (context) => Text(
                                                'Привет, ${valueOrDefault(currentUserDocument?.firstName, '') != null && valueOrDefault(currentUserDocument?.firstName, '') != '' ? valueOrDefault(currentUserDocument?.firstName, '') : 'мама'}!  На графике сна, появилось первое отклонение в режиме сна и бодрствования малыша, оно отмечено оранжевым цветом.  В зависимости от количества отклонений мы будем отправлять подсказки как наладить режим.  Мы хотим быть рядом и помочь во всех вопросах и моментах твоего материнства. Желаем тебе отличного дня. ',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          lineHeight: 1.5,
                                                        ),
                                              ),
                                            ),
                                          );
                                        } else if (functions.isWithinNDays(
                                                widget.child!.birthDate!, 61) &&
                                            (functions.countDates(widget.child!.unnormalSleepDate.toList()) >=
                                                5) &&
                                            (FFAppState().firstTipWasShowed ==
                                                0)) {
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 0.0, 0.0),
                                            child: AuthUserStreamWidget(
                                              builder: (context) => Text(
                                                'Привет, ${valueOrDefault(currentUserDocument?.firstName, '') != null && valueOrDefault(currentUserDocument?.firstName, '') != '' ? valueOrDefault(currentUserDocument?.firstName, '') : 'мама'}!  На графике сна, появилось первое отклонение в режиме сна и бодрствования малыша, оно отмечено оранжевым цветом.  В зависимости от количества отклонений мы будем отправлять подсказки как наладить режим.  Мы хотим быть рядом и помочь во всех вопросах и моментах твоего материнства. Желаем тебе отличного дня. ',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          lineHeight: 1.5,
                                                        ),
                                              ),
                                            ),
                                          );
                                        } else if (functions.isWithinNDays(widget.child!.birthDate!, 122) &&
                                            (functions.countDates(widget.child!.unnormalSleepDate.toList()) >=
                                                4) &&
                                            (FFAppState().firstTipWasShowed ==
                                                0)) {
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 0.0, 0.0),
                                            child: AuthUserStreamWidget(
                                              builder: (context) => Text(
                                                'Привет, ${valueOrDefault(currentUserDocument?.firstName, '') != null && valueOrDefault(currentUserDocument?.firstName, '') != '' ? valueOrDefault(currentUserDocument?.firstName, '') : 'мама'}!  На графике сна, появилось первое отклонение в режиме сна и бодрствования малыша, оно отмечено оранжевым цветом.  В зависимости от количества отклонений мы будем отправлять подсказки как наладить режим.  Мы хотим быть рядом и помочь во всех вопросах и моментах твоего материнства. Желаем тебе отличного дня. ',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          lineHeight: 1.5,
                                                        ),
                                              ),
                                            ),
                                          );
                                        } else if (functions.isWithinNDays(
                                                widget.child!.birthDate!,
                                                212) &&
                                            (functions.countDates(widget.child!.unnormalSleepDate.toList()) >=
                                                3) &&
                                            (FFAppState().firstTipWasShowed ==
                                                0)) {
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 0.0, 0.0),
                                            child: AuthUserStreamWidget(
                                              builder: (context) => Text(
                                                'Привет, ${valueOrDefault(currentUserDocument?.firstName, '') != null && valueOrDefault(currentUserDocument?.firstName, '') != '' ? valueOrDefault(currentUserDocument?.firstName, '') : 'мама'}!  На графике сна, появилось первое отклонение в режиме сна и бодрствования малыша, оно отмечено оранжевым цветом.  В зависимости от количества отклонений мы будем отправлять подсказки как наладить режим.  Мы хотим быть рядом и помочь во всех вопросах и моментах твоего материнства. Желаем тебе отличного дня. ',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          lineHeight: 1.5,
                                                        ),
                                              ),
                                            ),
                                          );
                                        } else if (functions.isWithinNDays(
                                                widget.child!.birthDate!, 1095) &&
                                            (functions.countDates(widget.child!.unnormalSleepDate.toList()) >= 2) &&
                                            (FFAppState().firstTipWasShowed == 0)) {
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 0.0, 0.0),
                                            child: AuthUserStreamWidget(
                                              builder: (context) => Text(
                                                'Привет, ${valueOrDefault(currentUserDocument?.firstName, '') != null && valueOrDefault(currentUserDocument?.firstName, '') != '' ? valueOrDefault(currentUserDocument?.firstName, '') : 'мама'}!  На графике сна, появилось первое отклонение в режиме сна и бодрствования малыша, оно отмечено оранжевым цветом.  В зависимости от количества отклонений мы будем отправлять подсказки как наладить режим.  Мы хотим быть рядом и помочь во всех вопросах и моментах твоего материнства. Желаем тебе отличного дня. ',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          lineHeight: 1.5,
                                                        ),
                                              ),
                                            ),
                                          );
                                        } else {
                                          return Builder(
                                            builder: (context) {
                                              if (functions.isWithinNDays(
                                                      widget.child!.birthDate!,
                                                      31) &&
                                                  (functions.countDates(widget.child!.unnormalSleepDate.toList()) >=
                                                      8)) {
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 0.0, 0.0),
                                                  child: Text(
                                                    functions.getRandomElement(
                                                        FFAppState()
                                                            .randomSleepTip
                                                            .toList()),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          lineHeight: 1.5,
                                                        ),
                                                  ),
                                                );
                                              } else if (functions.isWithinNDays(
                                                      widget.child!.birthDate!,
                                                      61) &&
                                                  (functions.countDates(widget.child!.unnormalSleepDate.toList()) >=
                                                      5)) {
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 0.0, 0.0),
                                                  child: Text(
                                                    functions.getRandomElement(
                                                        FFAppState()
                                                            .randomSleepTip
                                                            .toList()),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          lineHeight: 1.5,
                                                        ),
                                                  ),
                                                );
                                              } else if (functions.isWithinNDays(
                                                      widget.child!.birthDate!,
                                                      122) &&
                                                  (functions.countDates(widget.child!.unnormalSleepDate.toList()) >=
                                                      4)) {
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 0.0, 0.0),
                                                  child: Text(
                                                    functions.getRandomElement(
                                                        FFAppState()
                                                            .randomSleepTip
                                                            .toList()),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          lineHeight: 1.5,
                                                        ),
                                                  ),
                                                );
                                              } else if (functions.isWithinNDays(
                                                      widget.child!.birthDate!,
                                                      212) &&
                                                  (functions.countDates(widget.child!.unnormalSleepDate.toList()) >=
                                                      3)) {
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 0.0, 0.0),
                                                  child: Text(
                                                    functions.getRandomElement(
                                                        FFAppState()
                                                            .randomSleepTip
                                                            .toList()),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          lineHeight: 1.5,
                                                        ),
                                                  ),
                                                );
                                              } else if (functions.countDates(widget.child!.unnormalSleepDate.toList()) >= 2) {
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 0.0, 0.0),
                                                  child: Text(
                                                    functions.getRandomElement(
                                                        FFAppState()
                                                            .randomSleepTip
                                                            .toList()),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          lineHeight: 1.5,
                                                        ),
                                                  ),
                                                );
                                              } else {
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 0.0, 0.0),
                                                  child: Text(
                                                    'В этом месяце ребенок спал хорошо. Продолжайте в том же духе',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          lineHeight: 1.5,
                                                        ),
                                                  ),
                                                );
                                              }
                                            },
                                          );
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (FFAppState().viewSleepNorms == 0)
              Align(
                alignment: AlignmentDirectional(0.00, 1.00),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: 126.0,
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Builder(
                          builder: (context) {
                            final months = functions
                                .generateList(functions.monthsSinceBirthday(
                                    widget.child!.birthDate!))
                                .toList();
                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              controller: _model.months,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:
                                    List.generate(months.length, (monthsIndex) {
                                  final monthsItem = months[monthsIndex];
                                  return Builder(
                                    builder: (context) {
                                      if (monthsIndex <=
                                          _model.currentMonthIndex) {
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            setState(() {
                                              _model.pickedMonthIndex =
                                                  monthsIndex;
                                            });
                                          },
                                          child: Container(
                                            width: 56.0,
                                            height: 78.0,
                                            decoration: BoxDecoration(
                                              color: monthsIndex ==
                                                      _model.pickedMonthIndex
                                                  ? Colors.black
                                                  : Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(40.0),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  monthsItem.toString(),
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineSmall
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            color: monthsIndex ==
                                                                    _model
                                                                        .pickedMonthIndex
                                                                ? Colors.white
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                            fontSize: 20.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            lineHeight: 1.3,
                                                          ),
                                                ),
                                                Text(
                                                  'мес',
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .displayMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            color: monthsIndex ==
                                                                    _model
                                                                        .pickedMonthIndex
                                                                ? Colors.white
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .grey60,
                                                            fontSize: 12.0,
                                                            lineHeight: 1.33,
                                                          ),
                                                ),
                                                if (monthsIndex ==
                                                    _model.currentMonthIndex)
                                                  Container(
                                                    width: 6.0,
                                                    height: 6.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      shape: BoxShape.circle,
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        );
                                      } else {
                                        return Container(
                                          width: 56.0,
                                          height: 78.0,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                monthsItem.toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .grey40,
                                                          fontSize: 20.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          lineHeight: 1.3,
                                                        ),
                                              ),
                                              Text(
                                                'мес',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .displayMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .grey40,
                                                          lineHeight: 1.33,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }
                                    },
                                  );
                                })
                                        .divide(SizedBox(width: 12.0))
                                        .addToStart(SizedBox(width: 20.0))
                                        .addToEnd(SizedBox(width: 20.0)),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
