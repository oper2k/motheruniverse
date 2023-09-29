import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/bottom_sheet/profile_bottom_sheet/add_feeding_tracker/add_feeding_tracker_widget.dart';
import '/components/bottom_sheet/profile_bottom_sheet/chose_tracker_feeding/chose_tracker_feeding_widget.dart';
import '/components/bottom_sheet/profile_bottom_sheet/reset_feeding_tracker/reset_feeding_tracker_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'feeding_tracker_page_model.dart';
export 'feeding_tracker_page_model.dart';

class FeedingTrackerPageWidget extends StatefulWidget {
  const FeedingTrackerPageWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  final ChildrenRecord? child;

  @override
  _FeedingTrackerPageWidgetState createState() =>
      _FeedingTrackerPageWidgetState();
}

class _FeedingTrackerPageWidgetState extends State<FeedingTrackerPageWidget> {
  late FeedingTrackerPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FeedingTrackerPageModel());

    _model.feedingNameController ??= TextEditingController();
    _model.amountController ??= TextEditingController();
    _model.textController3 ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
          _model.textController3?.text = '15 минут';
        }));
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
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Align(
                alignment: AlignmentDirectional(0.00, 0.00),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: Text(
                    'Трекер прикорма',
                    style: FlutterFlowTheme.of(context).displayLarge,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                child: Container(
                  width: double.infinity,
                  child: TextFormField(
                    controller: _model.feedingNameController,
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
                child: Text(
                  'Смотри наши рекомендации',
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        lineHeight: 1.25,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                child: Container(
                  width: double.infinity,
                  child: TextFormField(
                    controller: _model.amountController,
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
                          _model.isGrams = true;
                        });
                      },
                      child: Container(
                        height: 36.0,
                        decoration: BoxDecoration(
                          color: _model.isGrams
                              ? FlutterFlowTheme.of(context).redIcon
                              : FlutterFlowTheme.of(context).redLight,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.00, 0.00),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            child: Text(
                              'Граммы',
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Inter',
                                    color: _model.isGrams
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
                            _model.isGrams = false;
                          });
                        },
                        child: Container(
                          height: 36.0,
                          decoration: BoxDecoration(
                            color: _model.isGrams
                                ? FlutterFlowTheme.of(context).redLight
                                : FlutterFlowTheme.of(context).redIcon,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              child: Text(
                                'Миллилитры',
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: 'Inter',
                                      color: _model.isGrams
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: Container(
                  width: double.infinity,
                  child: TextFormField(
                    controller: _model.textController3,
                    readOnly: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Время',
                      labelStyle:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'Inter',
                                lineHeight: 1.28,
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
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          fontFamily: 'Inter',
                          lineHeight: 1.5,
                        ),
                    cursorColor: FlutterFlowTheme.of(context).overlay,
                    validator:
                        _model.textController3Validator.asValidator(context),
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
                            child: ResetFeedingTrackerWidget(),
                          ),
                        );
                      },
                    ).then((value) => safeSetState(() => _model.reset = value));

                    if (_model.reset!) {
                      setState(() {
                        _model.feedingNameController?.clear();
                        _model.amountController?.clear();
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
                                child: AddFeedingTrackerWidget(
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
                        if ((_model.feedingNameController.text != null &&
                                _model.feedingNameController.text != '') &&
                            (_model.amountController.text != null &&
                                _model.amountController.text != '')) {
                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (dateTimeFormat(
                                    'Md',
                                    functions.add15MinutesToDateTime(
                                        getCurrentTimestamp),
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
                                  trackerTitle: 'Прикорм',
                                  childRef: widget.child?.reference,
                                  feedingName:
                                      _model.feedingNameController.text,
                                  feedingAmount: _model.isGrams
                                      ? '${_model.amountController.text} гр'
                                      : '${_model.amountController.text} мл',
                                  trackerStartTime: getCurrentTimestamp,
                                  feedingEndTime:
                                      functions.add15MinutesToDateTime(
                                          getCurrentTimestamp),
                                ));
                                _model.feedingTrack =
                                    TrackersRecord.getDocumentFromData(
                                        createTrackersRecordData(
                                          trackerTitle: 'Прикорм',
                                          childRef: widget.child?.reference,
                                          feedingName:
                                              _model.feedingNameController.text,
                                          feedingAmount: _model.isGrams
                                              ? '${_model.amountController.text} гр'
                                              : '${_model.amountController.text} мл',
                                          trackerStartTime: getCurrentTimestamp,
                                          feedingEndTime:
                                              functions.add15MinutesToDateTime(
                                                  getCurrentTimestamp),
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
                                    TrackersRecord.createDoc(
                                        currentUserReference!);
                                await trackersRecordReference2
                                    .set(createTrackersRecordData(
                                  trackerTitle: 'Прикорм',
                                  childRef: widget.child?.reference,
                                  feedingName:
                                      _model.feedingNameController.text,
                                  feedingAmount: _model.isGrams
                                      ? '${_model.amountController.text} гр'
                                      : '${_model.amountController.text} мл',
                                  trackerStartTime: getCurrentTimestamp,
                                  feedingEndTime:
                                      functions.endOfDay(getCurrentTimestamp),
                                ));
                                _model.feedingTrack1 =
                                    TrackersRecord.getDocumentFromData(
                                        createTrackersRecordData(
                                          trackerTitle: 'Прикорм',
                                          childRef: widget.child?.reference,
                                          feedingName:
                                              _model.feedingNameController.text,
                                          feedingAmount: _model.isGrams
                                              ? '${_model.amountController.text} гр'
                                              : '${_model.amountController.text} мл',
                                          trackerStartTime: getCurrentTimestamp,
                                          feedingEndTime: functions
                                              .endOfDay(getCurrentTimestamp),
                                        ),
                                        trackersRecordReference2);

                                await TrackersRecord.createDoc(
                                        currentUserReference!)
                                    .set(createTrackersRecordData(
                                  trackerTitle: 'Прикорм',
                                  childRef: widget.child?.reference,
                                  feedingName:
                                      _model.feedingNameController.text,
                                  feedingAmount: _model.isGrams
                                      ? '${_model.amountController.text} гр'
                                      : '${_model.amountController.text} мл',
                                  trackerStartTime: functions.startOfDay(
                                      functions.add15MinutesToDateTime(
                                          getCurrentTimestamp)),
                                  feedingEndTime:
                                      functions.add15MinutesToDateTime(
                                          getCurrentTimestamp),
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

                              setState(() {});
                            },
                            child: Container(
                              width: 166.0,
                              height: 48.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).redIcon,
                                borderRadius: BorderRadius.circular(14.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 12.0, 24.0, 12.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Добавить',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineLarge
                                          .override(
                                            fontFamily: 'Inter',
                                            color: Colors.white,
                                            fontSize: 16.0,
                                            lineHeight: 1.25,
                                          ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 0.0, 0.0),
                                      child: Icon(
                                        FFIcons.kflag,
                                        color: Colors.white,
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
                                child: ChoseTrackerFeedingWidget(
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
