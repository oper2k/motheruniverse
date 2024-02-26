import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_feeding_tracker_model.dart';
export 'add_feeding_tracker_model.dart';

class AddFeedingTrackerWidget extends StatefulWidget {
  const AddFeedingTrackerWidget({
    super.key,
    required this.child,
  });

  final ChildrenRecord? child;

  @override
  State<AddFeedingTrackerWidget> createState() =>
      _AddFeedingTrackerWidgetState();
}

class _AddFeedingTrackerWidgetState extends State<AddFeedingTrackerWidget> {
  late AddFeedingTrackerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddFeedingTrackerModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.time = getCurrentTimestamp;
      });
    });

    _model.feedingNameController ??= TextEditingController();
    _model.feedingNameFocusNode ??= FocusNode();

    _model.amountController ??= TextEditingController();
    _model.amountFocusNode ??= FocusNode();

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
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 0.0),
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
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(28.0, 0.0, 0.0, 0.0),
                        child: AutoSizeText(
                          'Новый трек',
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
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
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
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    final _datePickedDate = await showDatePicker(
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

                    TimeOfDay? _datePickedTime;
                    if (_datePickedDate != null) {
                      _datePickedTime = await showTimePicker(
                        context: context,
                        initialTime:
                            TimeOfDay.fromDateTime(getCurrentTimestamp),
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

                    if (_datePickedDate != null && _datePickedTime != null) {
                      safeSetState(() {
                        _model.datePicked = DateTime(
                          _datePickedDate.year,
                          _datePickedDate.month,
                          _datePickedDate.day,
                          _datePickedTime!.hour,
                          _datePickedTime.minute,
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
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).divider,
                            width: 1.0,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
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
                          padding: EdgeInsetsDirectional.fromSTEB(
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
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 7.0, 16.0, 7.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
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
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 28.0, 0.0, 0.0),
                  child: Text(
                    'ВВЕДИТЕ ДАННЫЕ',
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          lineHeight: 1.28,
                        ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                child: Container(
                  width: double.infinity,
                  child: TextFormField(
                    controller: _model.feedingNameController,
                    focusNode: _model.feedingNameFocusNode,
                    onChanged: (_) => EasyDebounce.debounce(
                      '_model.feedingNameController',
                      Duration(milliseconds: 100),
                      () => setState(() {}),
                    ),
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Введите название прикорма',
                      labelStyle:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                fontFamily: 'Inter',
                                lineHeight: 1.5,
                              ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).divider,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      contentPadding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 22.0, 16.0, 22.0),
                    ),
                    style: FlutterFlowTheme.of(context).headlineSmall,
                    cursorColor: FlutterFlowTheme.of(context).overlay,
                    validator: _model.feedingNameControllerValidator
                        .asValidator(context),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: Container(
                  width: double.infinity,
                  child: TextFormField(
                    controller: _model.amountController,
                    focusNode: _model.amountFocusNode,
                    onChanged: (_) => EasyDebounce.debounce(
                      '_model.amountController',
                      Duration(milliseconds: 100),
                      () => setState(() {}),
                    ),
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Количество',
                      labelStyle:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                fontFamily: 'Inter',
                                lineHeight: 1.5,
                              ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).divider,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      contentPadding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 22.0, 16.0, 22.0),
                    ),
                    style: FlutterFlowTheme.of(context).headlineSmall,
                    keyboardType: TextInputType.number,
                    cursorColor: FlutterFlowTheme.of(context).overlay,
                    validator:
                        _model.amountControllerValidator.asValidator(context),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        setState(() {
                          _model.isGramm = true;
                        });
                      },
                      child: Container(
                        height: 36.0,
                        decoration: BoxDecoration(
                          color: _model.isGramm
                              ? FlutterFlowTheme.of(context).error
                              : FlutterFlowTheme.of(context).redLight,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            child: Text(
                              'Граммы',
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Inter',
                                    color: _model.isGramm
                                        ? Colors.white
                                        : FlutterFlowTheme.of(context)
                                            .secondaryText,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          setState(() {
                            _model.isGramm = false;
                          });
                        },
                        child: Container(
                          height: 36.0,
                          decoration: BoxDecoration(
                            color: _model.isGramm
                                ? FlutterFlowTheme.of(context).warning
                                : FlutterFlowTheme.of(context).error,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              child: Text(
                                'Миллилитры',
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: 'Inter',
                                      color: _model.isGramm
                                          ? FlutterFlowTheme.of(context)
                                              .secondaryText
                                          : Colors.white,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Builder(
                builder: (context) {
                  if ((_model.feedingNameController.text != null &&
                          _model.feedingNameController.text != '') &&
                      (_model.amountController.text != null &&
                          _model.amountController.text != '')) {
                    return Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 38.0, 0.0, 45.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          if (dateTimeFormat(
                                'Md',
                                functions.add15MinutesToDateTime(_model.time!),
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ) ==
                              dateTimeFormat(
                                'Md',
                                _model.time,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              )) {
                            var trackersRecordReference1 =
                                TrackersRecord.createDoc(currentUserReference!);
                            await trackersRecordReference1
                                .set(createTrackersRecordData(
                              trackerTitle: 'Прикорм',
                              childRef: widget.child?.reference,
                              feedingName: _model.feedingNameController.text,
                              feedingAmount: _model.isGramm
                                  ? '${_model.amountController.text} гр'
                                  : '${_model.amountController.text} мл',
                              trackerStartTime: _model.time,
                              feedingEndTime: functions
                                  .add15MinutesToDateTime(_model.time!),
                            ));
                            _model.feedingTrack =
                                TrackersRecord.getDocumentFromData(
                                    createTrackersRecordData(
                                      trackerTitle: 'Прикорм',
                                      childRef: widget.child?.reference,
                                      feedingName:
                                          _model.feedingNameController.text,
                                      feedingAmount: _model.isGramm
                                          ? '${_model.amountController.text} гр'
                                          : '${_model.amountController.text} мл',
                                      trackerStartTime: _model.time,
                                      feedingEndTime: functions
                                          .add15MinutesToDateTime(_model.time!),
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
                              'FeedingTrackerIsAdded',
                              queryParameters: {
                                'feedTracker': serializeParam(
                                  _model.feedingTrack,
                                  ParamType.Document,
                                ),
                                'child': serializeParam(
                                  widget.child,
                                  ParamType.Document,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                'feedTracker': _model.feedingTrack,
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
                                TrackersRecord.createDoc(currentUserReference!);
                            await trackersRecordReference2
                                .set(createTrackersRecordData(
                              trackerTitle: 'Прикорм',
                              childRef: widget.child?.reference,
                              feedingName: _model.feedingNameController.text,
                              feedingAmount: _model.isGramm
                                  ? '${_model.amountController.text} гр'
                                  : '${_model.amountController.text} мл',
                              trackerStartTime: _model.time,
                              feedingEndTime: functions.endOfDay(_model.time!),
                            ));
                            _model.feedingTrack1 =
                                TrackersRecord.getDocumentFromData(
                                    createTrackersRecordData(
                                      trackerTitle: 'Прикорм',
                                      childRef: widget.child?.reference,
                                      feedingName:
                                          _model.feedingNameController.text,
                                      feedingAmount: _model.isGramm
                                          ? '${_model.amountController.text} гр'
                                          : '${_model.amountController.text} мл',
                                      trackerStartTime: _model.time,
                                      feedingEndTime:
                                          functions.endOfDay(_model.time!),
                                    ),
                                    trackersRecordReference2);

                            await TrackersRecord.createDoc(
                                    currentUserReference!)
                                .set(createTrackersRecordData(
                              trackerTitle: 'Прикорм',
                              childRef: widget.child?.reference,
                              feedingName: _model.feedingNameController.text,
                              feedingAmount: _model.isGramm
                                  ? '${_model.amountController.text} гр'
                                  : '${_model.amountController.text} мл',
                              trackerStartTime: functions.startOfDay(functions
                                  .add15MinutesToDateTime(_model.time!)),
                              feedingEndTime: functions
                                  .add15MinutesToDateTime(_model.time!),
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
                              'FeedingTrackerIsAdded',
                              queryParameters: {
                                'feedTracker': serializeParam(
                                  _model.feedingTrack1,
                                  ParamType.Document,
                                ),
                                'child': serializeParam(
                                  widget.child,
                                  ParamType.Document,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                'feedTracker': _model.feedingTrack1,
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

                          Navigator.pop(context);

                          setState(() {});
                        },
                        text: 'Добавить',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 56.0,
                          padding: EdgeInsets.all(0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).error,
                          textStyle: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .override(
                                fontFamily: 'Inter',
                                color: Colors.white,
                              ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                    );
                  } else {
                    return Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 38.0, 0.0, 45.0),
                      child: FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        text: 'Добавить',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 56.0,
                          padding: EdgeInsets.all(0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).grey20,
                          textStyle: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .override(
                                fontFamily: 'Inter',
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                          elevation: 0.0,
                          borderSide: BorderSide(
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
      ),
    );
  }
}
