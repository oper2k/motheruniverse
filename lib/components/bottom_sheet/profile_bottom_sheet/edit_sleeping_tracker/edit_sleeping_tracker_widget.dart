import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'edit_sleeping_tracker_model.dart';
export 'edit_sleeping_tracker_model.dart';

class EditSleepingTrackerWidget extends StatefulWidget {
  const EditSleepingTrackerWidget({
    super.key,
    required this.child,
    required this.firstTrack,
    this.secondTrack,
  });

  final ChildrenRecord? child;
  final TrackersRecord? firstTrack;
  final TrackersRecord? secondTrack;

  @override
  State<EditSleepingTrackerWidget> createState() =>
      _EditSleepingTrackerWidgetState();
}

class _EditSleepingTrackerWidgetState extends State<EditSleepingTrackerWidget> {
  late EditSleepingTrackerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditSleepingTrackerModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.startTime = widget.firstTrack?.trackerStartTime;
        _model.endTime = widget.secondTrack != null
            ? widget.secondTrack?.sleepEndTime
            : widget.firstTrack?.sleepEndTime;
      });
      _model.instantTimer = InstantTimer.periodic(
        duration: const Duration(milliseconds: 1000),
        callback: (timer) async {
          setState(() {});
        },
        startImmediately: true,
      );
    });

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
      alignment: const AlignmentDirectional(0.0, 1.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).backgroundMain,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(24.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 45.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 40.0,
                height: 4.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).divider,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(28.0, 0.0, 0.0, 0.0),
                        child: AutoSizeText(
                          'Изменить трек',
                          textAlign: TextAlign.center,
                          maxLines: 2,
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
                    InkWell(
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
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Text(
                    'ВЫБЕРИТЕ ДАТУ И ВРЕМЯ НАЧАЛА СНА',
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          lineHeight: 1.28,
                        ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    final datePicked1Date = await showDatePicker(
                      context: context,
                      initialDate: (_model.startTime ?? DateTime.now()),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2050),
                      builder: (context, child) {
                        return wrapInMaterialDatePickerTheme(
                          context,
                          child!,
                          headerBackgroundColor:
                              FlutterFlowTheme.of(context).primary,
                          headerForegroundColor:
                              FlutterFlowTheme.of(context).info,
                          headerTextStyle: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .override(
                                fontFamily: 'Inter',
                                fontSize: 32.0,
                                fontWeight: FontWeight.w600,
                              ),
                          pickerBackgroundColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          pickerForegroundColor:
                              FlutterFlowTheme.of(context).primaryText,
                          selectedDateTimeBackgroundColor:
                              FlutterFlowTheme.of(context).primary,
                          selectedDateTimeForegroundColor:
                              FlutterFlowTheme.of(context).info,
                          actionButtonForegroundColor:
                              FlutterFlowTheme.of(context).primaryText,
                          iconSize: 24.0,
                        );
                      },
                    );

                    TimeOfDay? datePicked1Time;
                    if (datePicked1Date != null) {
                      datePicked1Time = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.fromDateTime(
                            (_model.startTime ?? DateTime.now())),
                        builder: (context, child) {
                          return wrapInMaterialTimePickerTheme(
                            context,
                            child!,
                            headerBackgroundColor:
                                FlutterFlowTheme.of(context).primary,
                            headerForegroundColor:
                                FlutterFlowTheme.of(context).info,
                            headerTextStyle: FlutterFlowTheme.of(context)
                                .headlineLarge
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 32.0,
                                  fontWeight: FontWeight.w600,
                                ),
                            pickerBackgroundColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            pickerForegroundColor:
                                FlutterFlowTheme.of(context).primaryText,
                            selectedDateTimeBackgroundColor:
                                FlutterFlowTheme.of(context).primary,
                            selectedDateTimeForegroundColor:
                                FlutterFlowTheme.of(context).info,
                            actionButtonForegroundColor:
                                FlutterFlowTheme.of(context).primaryText,
                            iconSize: 24.0,
                          );
                        },
                      );
                    }

                    if (datePicked1Date != null && datePicked1Time != null) {
                      safeSetState(() {
                        _model.datePicked1 = DateTime(
                          datePicked1Date.year,
                          datePicked1Date.month,
                          datePicked1Date.day,
                          datePicked1Time!.hour,
                          datePicked1Time.minute,
                        );
                      });
                    }
                    if (_model.datePicked1 != null) {
                      setState(() {
                        _model.startTime = _model.datePicked1;
                        _model.endTime =
                            functions.getDateTimeAnHourLater(_model.startTime!);
                      });
                    }
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).divider,
                            width: 1.0,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 7.0, 16.0, 7.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Дата',
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                              Text(
                                functions
                                    .formatDateInDayNumberMonthStringYearNumber(
                                        _model.startTime!),
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
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 0.0, 0.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).divider,
                                width: 1.0,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 7.0, 16.0, 7.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Время',
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                  Text(
                                    dateTimeFormat(
                                      'Hm',
                                      _model.startTime,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    ),
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
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 28.0, 0.0, 0.0),
                  child: Text(
                    'ВВЕДИТЕ ДАТУ И ВРЕМЯ ОКОНЧАНИЯ СНА',
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          lineHeight: 1.28,
                        ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    final datePicked2Date = await showDatePicker(
                      context: context,
                      initialDate: (_model.endTime ?? DateTime.now()),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2050),
                      builder: (context, child) {
                        return wrapInMaterialDatePickerTheme(
                          context,
                          child!,
                          headerBackgroundColor:
                              FlutterFlowTheme.of(context).primary,
                          headerForegroundColor:
                              FlutterFlowTheme.of(context).info,
                          headerTextStyle: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .override(
                                fontFamily: 'Inter',
                                fontSize: 32.0,
                                fontWeight: FontWeight.w600,
                              ),
                          pickerBackgroundColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          pickerForegroundColor:
                              FlutterFlowTheme.of(context).primaryText,
                          selectedDateTimeBackgroundColor:
                              FlutterFlowTheme.of(context).primary,
                          selectedDateTimeForegroundColor:
                              FlutterFlowTheme.of(context).info,
                          actionButtonForegroundColor:
                              FlutterFlowTheme.of(context).primaryText,
                          iconSize: 24.0,
                        );
                      },
                    );

                    TimeOfDay? datePicked2Time;
                    if (datePicked2Date != null) {
                      datePicked2Time = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.fromDateTime(
                            (_model.endTime ?? DateTime.now())),
                        builder: (context, child) {
                          return wrapInMaterialTimePickerTheme(
                            context,
                            child!,
                            headerBackgroundColor:
                                FlutterFlowTheme.of(context).primary,
                            headerForegroundColor:
                                FlutterFlowTheme.of(context).info,
                            headerTextStyle: FlutterFlowTheme.of(context)
                                .headlineLarge
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 32.0,
                                  fontWeight: FontWeight.w600,
                                ),
                            pickerBackgroundColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            pickerForegroundColor:
                                FlutterFlowTheme.of(context).primaryText,
                            selectedDateTimeBackgroundColor:
                                FlutterFlowTheme.of(context).primary,
                            selectedDateTimeForegroundColor:
                                FlutterFlowTheme.of(context).info,
                            actionButtonForegroundColor:
                                FlutterFlowTheme.of(context).primaryText,
                            iconSize: 24.0,
                          );
                        },
                      );
                    }

                    if (datePicked2Date != null && datePicked2Time != null) {
                      safeSetState(() {
                        _model.datePicked2 = DateTime(
                          datePicked2Date.year,
                          datePicked2Date.month,
                          datePicked2Date.day,
                          datePicked2Time!.hour,
                          datePicked2Time.minute,
                        );
                      });
                    }
                    if (_model.datePicked2 != null) {
                      setState(() {
                        _model.endTime = _model.datePicked2;
                      });
                    }
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).divider,
                            width: 1.0,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 7.0, 16.0, 7.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Дата',
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                              Text(
                                functions
                                    .formatDateInDayNumberMonthStringYearNumber(
                                        _model.endTime!),
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
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 0.0, 0.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).divider,
                                width: 1.0,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 7.0, 16.0, 7.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Время',
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                  Text(
                                    dateTimeFormat(
                                      'Hm',
                                      _model.endTime,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    ),
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
                      ),
                    ],
                  ),
                ),
              ),
              if ((_model.endTime! < _model.startTime!) ||
                  functions.hasMoreThan23HoursPassed(
                      _model.startTime!, _model.endTime!))
                Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    child: Text(
                      'Проверьте правильность введенных данных',
                      style:
                          FlutterFlowTheme.of(context).displayMedium.override(
                                fontFamily: 'Inter',
                                lineHeight: 1.28,
                              ),
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 38.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: ((_model.endTime! < _model.startTime!) ||
                          functions.hasMoreThan23HoursPassed(
                              _model.startTime!, _model.endTime!))
                      ? null
                      : () async {
                          await widget.firstTrack!.reference.delete();
                          if (widget.secondTrack != null) {
                            await widget.secondTrack!.reference.delete();
                          }
                          if (dateTimeFormat(
                                'Md',
                                functions.addHoursAndMinutesToTime(
                                    '${functions.returnListOf24Hours()[FFAppState().customPickerItemIndex1]} ${functions.returnListOf59Minutes()[FFAppState().customPickerItemIndex2]}',
                                    _model.startTime!),
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ) ==
                              dateTimeFormat(
                                'Md',
                                _model.endTime,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              )) {
                            var trackersRecordReference1 =
                                TrackersRecord.createDoc(currentUserReference!);
                            await trackersRecordReference1
                                .set(createTrackersRecordData(
                              trackerTitle:
                                  functions.checkIfNightSleep(_model.startTime!)
                                      ? 'Ночной сон'
                                      : 'Дневной сон',
                              childRef: widget.child?.reference,
                              sleepEndTime: _model.endTime,
                              trackerStartTime: _model.startTime,
                            ));
                            _model.trackerDoc =
                                TrackersRecord.getDocumentFromData(
                                    createTrackersRecordData(
                                      trackerTitle: functions.checkIfNightSleep(
                                              _model.startTime!)
                                          ? 'Ночной сон'
                                          : 'Дневной сон',
                                      childRef: widget.child?.reference,
                                      sleepEndTime: _model.endTime,
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
                                                      .toList() ??
                                                  [])
                                              .toList())
                                          .toList()),
                                },
                              ),
                            });
                            if (functions.isWithinNDays(
                                    widget.child!.birthDate!, 31) &&
                                (functions.calculateSleepDurationInMinutes(
                                        _model.trackerDoc!.trackerStartTime!,
                                        _model.trackerDoc!.sleepEndTime!) >
                                    240)) {
                              await widget.child!.reference.update({
                                ...mapToFirestore(
                                  {
                                    'temp_start_sleep_time':
                                        FieldValue.delete(),
                                    'unnormal_sleep_date':
                                        FieldValue.arrayUnion([
                                      _model.trackerDoc?.trackerStartTime
                                    ]),
                                  },
                                ),
                              });
                            } else if (functions.isWithinNDays(
                                    widget.child!.birthDate!, 1095) &&
                                (functions.calculateSleepDurationInMinutes(
                                        _model.trackerDoc!.trackerStartTime!,
                                        _model.trackerDoc!.sleepEndTime!) >
                                    120)) {
                              await widget.child!.reference.update({
                                ...mapToFirestore(
                                  {
                                    'temp_start_sleep_time':
                                        FieldValue.delete(),
                                    'unnormal_sleep_date':
                                        FieldValue.arrayUnion([
                                      _model.trackerDoc?.trackerStartTime
                                    ]),
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
                              },
                            );
                          } else {
                            var trackersRecordReference2 =
                                TrackersRecord.createDoc(currentUserReference!);
                            await trackersRecordReference2
                                .set(createTrackersRecordData(
                              trackerTitle:
                                  functions.checkIfNightSleep(_model.startTime!)
                                      ? 'Ночной сон'
                                      : 'Дневной сон',
                              childRef: widget.child?.reference,
                              sleepEndTime:
                                  functions.endOfDay(_model.startTime!),
                              trackerStartTime: _model.startTime,
                            ));
                            _model.trackerDoc1 =
                                TrackersRecord.getDocumentFromData(
                                    createTrackersRecordData(
                                      trackerTitle: functions.checkIfNightSleep(
                                              _model.startTime!)
                                          ? 'Ночной сон'
                                          : 'Дневной сон',
                                      childRef: widget.child?.reference,
                                      sleepEndTime:
                                          functions.endOfDay(_model.startTime!),
                                      trackerStartTime: _model.startTime,
                                    ),
                                    trackersRecordReference2);

                            var trackersRecordReference3 =
                                TrackersRecord.createDoc(currentUserReference!);
                            await trackersRecordReference3
                                .set(createTrackersRecordData(
                              trackerTitle:
                                  functions.checkIfNightSleep(_model.startTime!)
                                      ? 'Ночной сон'
                                      : 'Дневной  сон',
                              childRef: widget.child?.reference,
                              sleepEndTime: _model.endTime,
                              trackerStartTime:
                                  functions.startOfDay(_model.endTime!),
                            ));
                            _model.secondDay =
                                TrackersRecord.getDocumentFromData(
                                    createTrackersRecordData(
                                      trackerTitle: functions.checkIfNightSleep(
                                              _model.startTime!)
                                          ? 'Ночной сон'
                                          : 'Дневной  сон',
                                      childRef: widget.child?.reference,
                                      sleepEndTime: _model.endTime,
                                      trackerStartTime:
                                          functions.startOfDay(_model.endTime!),
                                    ),
                                    trackersRecordReference3);

                            await currentUserReference!.update({
                              ...mapToFirestore(
                                {
                                  'trackers_adding_dates':
                                      functions.processDateList(functions
                                          .processDateList((currentUserDocument
                                                      ?.trackersAddingDates
                                                      .toList() ??
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
                              },
                            );
                          }

                          Navigator.pop(context);

                          setState(() {});
                        },
                  text: 'Применить',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 56.0,
                    padding: const EdgeInsets.all(0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).purple,
                    textStyle:
                        FlutterFlowTheme.of(context).headlineLarge.override(
                              fontFamily: 'Inter',
                              color: Colors.white,
                            ),
                    elevation: 0.0,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                    disabledColor: FlutterFlowTheme.of(context).alternate,
                    disabledTextColor: FlutterFlowTheme.of(context).primaryText,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
