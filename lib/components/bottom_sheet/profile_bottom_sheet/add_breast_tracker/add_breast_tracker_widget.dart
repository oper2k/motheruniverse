import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'add_breast_tracker_model.dart';
export 'add_breast_tracker_model.dart';

class AddBreastTrackerWidget extends StatefulWidget {
  const AddBreastTrackerWidget({
    super.key,
    required this.child,
  });

  final ChildrenRecord? child;

  @override
  State<AddBreastTrackerWidget> createState() => _AddBreastTrackerWidgetState();
}

class _AddBreastTrackerWidgetState extends State<AddBreastTrackerWidget> {
  late AddBreastTrackerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddBreastTrackerModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.time = getCurrentTimestamp;
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

    return Container(
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
        padding: const EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
                        'Новый трек',
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
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
                  'ВЫБЕРИТЕ ДАТУ',
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
                  final datePickedDate = await showDatePicker(
                    context: context,
                    initialDate: getCurrentTimestamp,
                    firstDate: DateTime(1900),
                    lastDate: getCurrentTimestamp,
                    builder: (context, child) {
                      return wrapInMaterialDatePickerTheme(
                        context,
                        child!,
                        headerBackgroundColor:
                            FlutterFlowTheme.of(context).primary,
                        headerForegroundColor:
                            FlutterFlowTheme.of(context).info,
                        headerTextStyle:
                            FlutterFlowTheme.of(context).headlineLarge.override(
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

                  TimeOfDay? datePickedTime;
                  if (datePickedDate != null) {
                    datePickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.fromDateTime(getCurrentTimestamp),
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
                  }

                  if (datePickedDate != null && datePickedTime != null) {
                    safeSetState(() {
                      _model.datePicked = DateTime(
                        datePickedDate.year,
                        datePickedDate.month,
                        datePickedDate.day,
                        datePickedTime!.hour,
                        datePickedTime.minute,
                      );
                    });
                  }
                  if (_model.datePicked != null) {
                    setState(() {
                      _model.time = _model.datePicked;
                    });
                  }
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
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
                                      _model.time!),
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
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
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
                                    _model.time,
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
                  'ВВЕДИТЕ ВРЕМЯ  КОРМЛЕНИЯ',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        lineHeight: 1.28,
                      ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 22.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Левая',
                    style: FlutterFlowTheme.of(context).displayMedium.override(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          lineHeight: 1.25,
                        ),
                  ),
                  Text(
                    'Правая',
                    style: FlutterFlowTheme.of(context).displayMedium.override(
                          fontFamily: 'Inter',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontWeight: FontWeight.w500,
                          lineHeight: 1.25,
                        ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 14.0, 0.0, 0.0),
              child: SizedBox(
                width: double.infinity,
                height: 160.0,
                child: custom_widgets.CustomPicker(
                  width: double.infinity,
                  height: 160.0,
                  horizontalPadding: 50.0,
                  backgroundColor: Colors.transparent,
                  lineColor: Colors.transparent,
                  textColor: FlutterFlowTheme.of(context).secondaryText,
                  initialItemIndexFirst: 0,
                  initialItemIndexSecond: 0,
                  initialItemIndexThird: null,
                  itemExtent: 30.0,
                  borderRadius: 0.0,
                  textSizeItem1: 24.0,
                  textSizeItem2: 24.0,
                  textSizeItem3: 24.0,
                  items1: functions.returnListOf59Minutes(),
                  items2: functions.returnListOf59Minutes(),
                  items3: functions.nullList(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Последняя',
                    style: FlutterFlowTheme.of(context).displayMedium.override(
                          fontFamily: 'Inter',
                          color: _model.leftIsLast
                              ? FlutterFlowTheme.of(context).primaryText
                              : Colors.transparent,
                          fontWeight: FontWeight.w500,
                          lineHeight: 1.25,
                        ),
                  ),
                  Builder(
                    builder: (context) {
                      if (_model.leftIsLast == false) {
                        return InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            setState(() {
                              _model.leftIsLast = true;
                            });
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
                              FFIcons.kleft,
                              color: FlutterFlowTheme.of(context).secondaryText,
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
                              _model.leftIsLast = false;
                            });
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
                              FFIcons.kright,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  Text(
                    'Последняя',
                    style: FlutterFlowTheme.of(context).displayMedium.override(
                          fontFamily: 'Inter',
                          color: !_model.leftIsLast
                              ? FlutterFlowTheme.of(context).primaryText
                              : Colors.transparent,
                          fontWeight: FontWeight.w500,
                          lineHeight: 1.25,
                        ),
                  ),
                ],
              ),
            ),
            Builder(
              builder: (context) {
                if ((FFAppState().customPickerItemIndex1 > 0) ||
                    (FFAppState().customPickerItemIndex2 > 0)) {
                  return Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 58.0, 0.0, 45.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        if (dateTimeFormat(
                              'Md',
                              _model.time,
                              locale: FFLocalizations.of(context).languageCode,
                            ) ==
                            dateTimeFormat(
                              'Md',
                              functions.addMultipleMinutesToTime(
                                  _model.time!,
                                  functions.returnListOf59Minutes()[
                                      FFAppState().customPickerItemIndex1],
                                  functions.returnListOf59Minutes()[
                                      FFAppState().customPickerItemIndex2]),
                              locale: FFLocalizations.of(context).languageCode,
                            )) {
                          var trackersRecordReference1 =
                              TrackersRecord.createDoc(currentUserReference!);
                          await trackersRecordReference1
                              .set(createTrackersRecordData(
                            trackerTitle: 'Кормление грудью',
                            childRef: widget.child?.reference,
                            breastEndTime: functions.addMultipleMinutesToTime(
                                _model.time!,
                                functions.returnListOf59Minutes()[
                                    FFAppState().customPickerItemIndex1],
                                functions.returnListOf59Minutes()[
                                    FFAppState().customPickerItemIndex2]),
                            breastLeftDuration: functions
                                .calculateMillisecondsFromStringMinutes(
                                    functions.returnListOf59Minutes()[
                                        FFAppState().customPickerItemIndex1]),
                            breastRightDuration: functions
                                .calculateMillisecondsFromStringMinutes(
                                    functions.returnListOf59Minutes()[
                                        FFAppState().customPickerItemIndex2]),
                            breastTotalDuration:
                                functions.findTotalTimeFromTwoDurations(
                                    functions
                                        .calculateMillisecondsFromStringMinutes(
                                            functions.returnListOf59Minutes()[
                                                FFAppState()
                                                    .customPickerItemIndex1]),
                                    functions
                                        .calculateMillisecondsFromStringMinutes(
                                            functions.returnListOf59Minutes()[
                                                FFAppState()
                                                    .customPickerItemIndex2])),
                            trackerStartTime: _model.time,
                          ));
                          _model.trackerDoc =
                              TrackersRecord.getDocumentFromData(
                                  createTrackersRecordData(
                                    trackerTitle: 'Кормление грудью',
                                    childRef: widget.child?.reference,
                                    breastEndTime:
                                        functions.addMultipleMinutesToTime(
                                            _model.time!,
                                            functions.returnListOf59Minutes()[
                                                FFAppState()
                                                    .customPickerItemIndex1],
                                            functions.returnListOf59Minutes()[
                                                FFAppState()
                                                    .customPickerItemIndex2]),
                                    breastLeftDuration: functions
                                        .calculateMillisecondsFromStringMinutes(
                                            functions.returnListOf59Minutes()[
                                                FFAppState()
                                                    .customPickerItemIndex1]),
                                    breastRightDuration: functions
                                        .calculateMillisecondsFromStringMinutes(
                                            functions.returnListOf59Minutes()[
                                                FFAppState()
                                                    .customPickerItemIndex2]),
                                    breastTotalDuration: functions.findTotalTimeFromTwoDurations(
                                        functions
                                            .calculateMillisecondsFromStringMinutes(
                                                functions
                                                        .returnListOf59Minutes()[
                                                    FFAppState()
                                                        .customPickerItemIndex1]),
                                        functions
                                            .calculateMillisecondsFromStringMinutes(
                                                functions
                                                        .returnListOf59Minutes()[
                                                    FFAppState()
                                                        .customPickerItemIndex2])),
                                    trackerStartTime: _model.time,
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
                          if (Navigator.of(context).canPop()) {
                            context.pop();
                          }
                          context.pushNamed(
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
                            },
                          );
                        } else {
                          var trackersRecordReference2 =
                              TrackersRecord.createDoc(currentUserReference!);
                          await trackersRecordReference2
                              .set(createTrackersRecordData(
                            trackerTitle: 'Кормление грудью',
                            childRef: widget.child?.reference,
                            breastEndTime: functions.endOfDay(_model.time!),
                            breastLeftDuration: functions
                                .calculateMillisecondsFromStringMinutes(
                                    functions.returnListOf59Minutes()[
                                        FFAppState().customPickerItemIndex1]),
                            breastRightDuration: functions
                                .calculateMillisecondsFromStringMinutes(
                                    functions.returnListOf59Minutes()[
                                        FFAppState().customPickerItemIndex2]),
                            breastTotalDuration:
                                functions.findTotalTimeFromTwoDurations(
                                    functions
                                        .calculateMillisecondsFromStringMinutes(
                                            functions.returnListOf59Minutes()[
                                                FFAppState()
                                                    .customPickerItemIndex1]),
                                    functions
                                        .calculateMillisecondsFromStringMinutes(
                                            functions.returnListOf59Minutes()[
                                                FFAppState()
                                                    .customPickerItemIndex2])),
                            trackerStartTime: _model.time,
                          ));
                          _model.trackerDoc1 =
                              TrackersRecord.getDocumentFromData(
                                  createTrackersRecordData(
                                    trackerTitle: 'Кормление грудью',
                                    childRef: widget.child?.reference,
                                    breastEndTime:
                                        functions.endOfDay(_model.time!),
                                    breastLeftDuration: functions
                                        .calculateMillisecondsFromStringMinutes(
                                            functions.returnListOf59Minutes()[
                                                FFAppState()
                                                    .customPickerItemIndex1]),
                                    breastRightDuration: functions
                                        .calculateMillisecondsFromStringMinutes(
                                            functions.returnListOf59Minutes()[
                                                FFAppState()
                                                    .customPickerItemIndex2]),
                                    breastTotalDuration: functions.findTotalTimeFromTwoDurations(
                                        functions
                                            .calculateMillisecondsFromStringMinutes(
                                                functions
                                                        .returnListOf59Minutes()[
                                                    FFAppState()
                                                        .customPickerItemIndex1]),
                                        functions
                                            .calculateMillisecondsFromStringMinutes(
                                                functions
                                                        .returnListOf59Minutes()[
                                                    FFAppState()
                                                        .customPickerItemIndex2])),
                                    trackerStartTime: _model.time,
                                  ),
                                  trackersRecordReference2);

                          await TrackersRecord.createDoc(currentUserReference!)
                              .set(createTrackersRecordData(
                            trackerTitle: 'Кормление грудью',
                            childRef: widget.child?.reference,
                            breastEndTime: functions.addMultipleMinutesToTime(
                                _model.time!,
                                functions.returnListOf59Minutes()[
                                    FFAppState().customPickerItemIndex1],
                                functions.returnListOf59Minutes()[
                                    FFAppState().customPickerItemIndex2]),
                            breastLeftDuration: functions
                                .calculateMillisecondsFromStringMinutes(
                                    functions.returnListOf59Minutes()[
                                        FFAppState().customPickerItemIndex1]),
                            breastRightDuration: functions
                                .calculateMillisecondsFromStringMinutes(
                                    functions.returnListOf59Minutes()[
                                        FFAppState().customPickerItemIndex2]),
                            breastTotalDuration:
                                functions.findTotalTimeFromTwoDurations(
                                    functions
                                        .calculateMillisecondsFromStringMinutes(
                                            functions.returnListOf59Minutes()[
                                                FFAppState()
                                                    .customPickerItemIndex1]),
                                    functions
                                        .calculateMillisecondsFromStringMinutes(
                                            functions.returnListOf59Minutes()[
                                                FFAppState()
                                                    .customPickerItemIndex2])),
                            trackerStartTime: functions.startOfDay(
                                functions.addMultipleMinutesToTime(
                                    _model.time!,
                                    functions.returnListOf59Minutes()[
                                        FFAppState().customPickerItemIndex1],
                                    functions.returnListOf59Minutes()[
                                        FFAppState().customPickerItemIndex2])),
                          ));

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
                          if (Navigator.of(context).canPop()) {
                            context.pop();
                          }
                          context.pushNamed(
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
                        color: FlutterFlowTheme.of(context).primary,
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
                      ),
                    ),
                  );
                } else {
                  return Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 38.0, 0.0, 45.0),
                    child: FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: 'Применить',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 56.0,
                        padding: const EdgeInsets.all(0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).grey20,
                        textStyle: FlutterFlowTheme.of(context)
                            .headlineLarge
                            .override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                        elevation: 0.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
