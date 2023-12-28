import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/bottom_sheet/profile_bottom_sheet/chose_the_date_of_tracker/chose_the_date_of_tracker_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'trackers_page_model.dart';
export 'trackers_page_model.dart';

class TrackersPageWidget extends StatefulWidget {
  const TrackersPageWidget({Key? key}) : super(key: key);

  @override
  _TrackersPageWidgetState createState() => _TrackersPageWidgetState();
}

class _TrackersPageWidgetState extends State<TrackersPageWidget> {
  late TrackersPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrackersPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.pickedDate = getCurrentTimestamp;
      });
      await Future.delayed(const Duration(milliseconds: 500));
      await _model.dates?.animateTo(
        _model.dates!.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
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
        body: Stack(
          children: [
            StreamBuilder<List<ChildrenRecord>>(
              stream: queryChildrenRecord(
                parent: currentUserReference,
                queryBuilder: (childrenRecord) => childrenRecord.where(
                  'childIsBorn',
                  isEqualTo: true,
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
                        valueColor: AlwaysStoppedAnimation<Color>(
                          FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                    ),
                  );
                }
                List<ChildrenRecord> childrenChildrenRecordList =
                    snapshot.data!;
                return Container(
                  decoration: BoxDecoration(),
                  child: SingleChildScrollView(
                    controller: _model.columnController1,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (childrenChildrenRecordList.length == 0)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 45.0, 20.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 30.0, 0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: Image.asset(
                                      'assets/images/___.webp',
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Трекеры',
                                  style:
                                      FlutterFlowTheme.of(context).displayLarge,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 26.0, 0.0, 0.0),
                                  child: Text(
                                    'Станут доступны. когда малыш  появится на свет',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .displayMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          lineHeight: 1.5,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        if (childrenChildrenRecordList.length >= 1)
                          StreamBuilder<ChildrenRecord>(
                            stream: ChildrenRecord.getDocument(
                                childrenChildrenRecordList[_model.childIndex]
                                    .reference),
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
                              final childChildrenRecord = snapshot.data!;
                              return Container(
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    SingleChildScrollView(
                                      controller: _model.columnController2,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 45.0, 20.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 22.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Трекеры',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .displayLarge,
                                                      ),
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          if (_model.childIndex <
                                                              functions.decrementByOne(
                                                                  childrenChildrenRecordList
                                                                      .length)) {
                                                            setState(() {
                                                              _model.childIndex =
                                                                  _model.childIndex +
                                                                      1;
                                                            });
                                                          } else {
                                                            setState(() {
                                                              _model.childIndex =
                                                                  0;
                                                            });
                                                          }

                                                          HapticFeedback
                                                              .heavyImpact();
                                                        },
                                                        child: Builder(
                                                          builder: (context) {
                                                            if (childChildrenRecord
                                                                        .photo !=
                                                                    null &&
                                                                childChildrenRecord
                                                                        .photo !=
                                                                    '') {
                                                              return Container(
                                                                width: 48.0,
                                                                height: 48.0,
                                                                clipBehavior: Clip
                                                                    .antiAlias,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: Image
                                                                    .network(
                                                                  childChildrenRecord
                                                                      .photo,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              );
                                                            } else if (childChildrenRecord
                                                                    .gender ==
                                                                'male') {
                                                              return ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            0.0),
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/uc7hf_.webp',
                                                                  width: 48.0,
                                                                  height: 48.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              );
                                                            } else {
                                                              return ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            0.0),
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/76ydn_.webp',
                                                                  width: 48.0,
                                                                  height: 48.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              );
                                                            }
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 16.0,
                                                                0.0, 0.0),
                                                    child: StreamBuilder<
                                                        List<TrackersRecord>>(
                                                      stream:
                                                          queryTrackersRecord(
                                                        parent:
                                                            currentUserReference,
                                                        queryBuilder:
                                                            (trackersRecord) =>
                                                                trackersRecord
                                                                    .where(
                                                                      'tracker_start_time',
                                                                      isLessThan:
                                                                          functions
                                                                              .getStartOfNextDay(_model.pickedDate!),
                                                                    )
                                                                    .where(
                                                                      'tracker_start_time',
                                                                      isGreaterThanOrEqualTo:
                                                                          functions
                                                                              .getStartOfDay(_model.pickedDate!),
                                                                    )
                                                                    .where(
                                                                      'child_ref',
                                                                      isEqualTo:
                                                                          childChildrenRecord
                                                                              .reference,
                                                                    )
                                                                    .orderBy(
                                                                        'tracker_start_time'),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50.0,
                                                              height: 50.0,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                valueColor:
                                                                    AlwaysStoppedAnimation<
                                                                        Color>(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<TrackersRecord>
                                                            containerTrackersRecordList =
                                                            snapshot.data!;
                                                        return Container(
                                                          width: 245.0,
                                                          height: 245.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Container(
                                                            width: 250.0,
                                                            height: 250.0,
                                                            child: custom_widgets
                                                                .TimeTracker(
                                                              width: 250.0,
                                                              height: 250.0,
                                                              radius: 100.0,
                                                              titleScaleFactor:
                                                                  0.7,
                                                              counterScaleFactor:
                                                                  1.0,
                                                              breastFeedingTime: functions.getDateTimeDifferenceInSeconds(
                                                                  containerTrackersRecordList
                                                                      .where((e) =>
                                                                          e.trackerTitle ==
                                                                          'Кормление грудью')
                                                                      .toList()
                                                                      .map((e) => e
                                                                          .trackerStartTime)
                                                                      .withoutNulls
                                                                      .toList(),
                                                                  containerTrackersRecordList
                                                                      .where((e) =>
                                                                          e.trackerTitle ==
                                                                          'Кормление грудью')
                                                                      .toList()
                                                                      .map((e) =>
                                                                          e.breastEndTime)
                                                                      .withoutNulls
                                                                      .toList()),
                                                              sleepTime: functions.getDateTimeDifferenceInSeconds(
                                                                  containerTrackersRecordList
                                                                      .where((e) =>
                                                                          (e.trackerTitle ==
                                                                              'Дневной сон') ||
                                                                          (e.trackerTitle ==
                                                                              'Ночной сон'))
                                                                      .toList()
                                                                      .map((e) => e
                                                                          .trackerStartTime)
                                                                      .withoutNulls
                                                                      .toList(),
                                                                  containerTrackersRecordList
                                                                      .where((e) =>
                                                                          (e.trackerTitle ==
                                                                              'Дневной сон') ||
                                                                          (e.trackerTitle ==
                                                                              'Ночной сон'))
                                                                      .toList()
                                                                      .map((e) =>
                                                                          e.sleepEndTime)
                                                                      .withoutNulls
                                                                      .toList()),
                                                              additionalFeedingTime: functions.getDateTimeDifferenceInSeconds(
                                                                  containerTrackersRecordList
                                                                      .where((e) =>
                                                                          e.trackerTitle ==
                                                                          'Прикорм')
                                                                      .toList()
                                                                      .map((e) => e
                                                                          .trackerStartTime)
                                                                      .withoutNulls
                                                                      .toList(),
                                                                  containerTrackersRecordList
                                                                      .where((e) =>
                                                                          e.trackerTitle ==
                                                                          'Прикорм')
                                                                      .toList()
                                                                      .map((e) =>
                                                                          e.feedingEndTime)
                                                                      .withoutNulls
                                                                      .toList()),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        context.pushNamed(
                                                          'TrackersListPage',
                                                          queryParameters: {
                                                            'child':
                                                                serializeParam(
                                                              childChildrenRecord,
                                                              ParamType
                                                                  .Document,
                                                            ),
                                                          }.withoutNulls,
                                                          extra: <String,
                                                              dynamic>{
                                                            'child':
                                                                childChildrenRecord,
                                                            kTransitionInfoKey:
                                                                TransitionInfo(
                                                              hasTransition:
                                                                  true,
                                                              transitionType:
                                                                  PageTransitionType
                                                                      .fade,
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      0),
                                                            ),
                                                          },
                                                        );
                                                      },
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Icon(
                                                            FFIcons.kburger,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 24.0,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        4.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Список',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    lineHeight:
                                                                        1.25,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        setState(() {
                                                          FFAppState()
                                                              .viewSleepNorms = 0;
                                                        });

                                                        context.pushNamed(
                                                          'SleepNormsPage',
                                                          queryParameters: {
                                                            'child':
                                                                serializeParam(
                                                              childChildrenRecord,
                                                              ParamType
                                                                  .Document,
                                                            ),
                                                          }.withoutNulls,
                                                          extra: <String,
                                                              dynamic>{
                                                            'child':
                                                                childChildrenRecord,
                                                          },
                                                        );
                                                      },
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Icon(
                                                            FFIcons.kchart1,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 24.0,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        4.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Норма',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    lineHeight:
                                                                        1.25,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 46.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'ДОБАВИТЬ',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .headlineMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            lineHeight: 1.28,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 12.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          context.pushNamed(
                                                            'BreastTrackerPage',
                                                            queryParameters: {
                                                              'child':
                                                                  serializeParam(
                                                                childChildrenRecord,
                                                                ParamType
                                                                    .Document,
                                                              ),
                                                            }.withoutNulls,
                                                            extra: <String,
                                                                dynamic>{
                                                              'child':
                                                                  childChildrenRecord,
                                                            },
                                                          );
                                                        },
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              width: 104.0,
                                                              height: 56.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .iconColor,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20.0),
                                                              ),
                                                              child: Icon(
                                                                FFIcons.kbreast,
                                                                color: Colors
                                                                    .white,
                                                                size: 40.0,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                'Грудь',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .displayMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .iconColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      lineHeight:
                                                                          1.25,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          context.pushNamed(
                                                            'SleepTrackerPage',
                                                            queryParameters: {
                                                              'child':
                                                                  serializeParam(
                                                                childChildrenRecord,
                                                                ParamType
                                                                    .Document,
                                                              ),
                                                            }.withoutNulls,
                                                            extra: <String,
                                                                dynamic>{
                                                              'child':
                                                                  childChildrenRecord,
                                                            },
                                                          );
                                                        },
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              width: 104.0,
                                                              height: 56.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .blue,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20.0),
                                                              ),
                                                              child: Icon(
                                                                FFIcons.kmoon,
                                                                color: Colors
                                                                    .white,
                                                                size: 40.0,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                'Сон',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .displayMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .blue,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      lineHeight:
                                                                          1.25,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          context.pushNamed(
                                                            'FeedingTrackerPage',
                                                            queryParameters: {
                                                              'child':
                                                                  serializeParam(
                                                                childChildrenRecord,
                                                                ParamType
                                                                    .Document,
                                                              ),
                                                            }.withoutNulls,
                                                            extra: <String,
                                                                dynamic>{
                                                              'child':
                                                                  childChildrenRecord,
                                                            },
                                                          );
                                                        },
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              width: 104.0,
                                                              height: 56.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .redIcon,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20.0),
                                                              ),
                                                              child: Icon(
                                                                FFIcons
                                                                    .kbottle2,
                                                                color: Colors
                                                                    .white,
                                                                size: 40.0,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                'Прикорм',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .displayMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .redIcon,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      lineHeight:
                                                                          1.25,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 32.0, 0.0, 0.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 126.0,
                                                    decoration: BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Builder(
                                                          builder: (context) {
                                                            final dates = functions
                                                                .getDatesAround(
                                                                    getCurrentTimestamp)
                                                                .toList();
                                                            return SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              controller:
                                                                  _model.dates,
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: List.generate(
                                                                        dates
                                                                            .length,
                                                                        (datesIndex) {
                                                                  final datesItem =
                                                                      dates[
                                                                          datesIndex];
                                                                  return Builder(
                                                                    builder:
                                                                        (context) {
                                                                      if (datesIndex <=
                                                                          15) {
                                                                        return InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            setState(() {
                                                                              _model.pickedDayIndex = datesIndex;
                                                                              _model.pickedDate = datesItem;
                                                                            });
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                56.0,
                                                                            height:
                                                                                78.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: datesIndex == _model.pickedDayIndex ? Colors.black : Colors.white,
                                                                              borderRadius: BorderRadius.circular(40.0),
                                                                            ),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Text(
                                                                                  dateTimeFormat(
                                                                                    'dd',
                                                                                    datesItem,
                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                        fontFamily: 'Inter',
                                                                                        color: datesIndex == _model.pickedDayIndex ? Colors.white : FlutterFlowTheme.of(context).secondaryText,
                                                                                        fontSize: 20.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                        lineHeight: 1.3,
                                                                                      ),
                                                                                ),
                                                                                Text(
                                                                                  functions.getShortNameOfMonthFromDateTime(datesItem),
                                                                                  style: FlutterFlowTheme.of(context).displayMedium.override(
                                                                                        fontFamily: 'Inter',
                                                                                        color: datesIndex == _model.pickedDayIndex ? Colors.white : FlutterFlowTheme.of(context).grey60,
                                                                                        lineHeight: 1.33,
                                                                                      ),
                                                                                ),
                                                                                if (datesIndex == 15)
                                                                                  Container(
                                                                                    width: 6.0,
                                                                                    height: 6.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                  ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        );
                                                                      } else {
                                                                        return Container(
                                                                          width:
                                                                              56.0,
                                                                          height:
                                                                              78.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Colors.white,
                                                                            borderRadius:
                                                                                BorderRadius.circular(40.0),
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Text(
                                                                                dateTimeFormat(
                                                                                  'dd',
                                                                                  datesItem,
                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                      fontFamily: 'Inter',
                                                                                      color: FlutterFlowTheme.of(context).grey40,
                                                                                      fontSize: 20.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      lineHeight: 1.3,
                                                                                    ),
                                                                              ),
                                                                              Text(
                                                                                functions.getShortNameOfMonthFromDateTime(datesItem),
                                                                                style: FlutterFlowTheme.of(context).displayMedium.override(
                                                                                      fontFamily: 'Inter',
                                                                                      color: FlutterFlowTheme.of(context).grey40,
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
                                                                    .divide(SizedBox(
                                                                        width:
                                                                            12.0))
                                                                    .addToStart(
                                                                        SizedBox(
                                                                            width:
                                                                                20.0))
                                                                    .addToEnd(
                                                                        SizedBox(
                                                                            width:
                                                                                20.0)),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      20.0,
                                                                      20.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    setState(
                                                                        () {
                                                                      FFAppState()
                                                                              .customPickerItemIndex1 =
                                                                          functions
                                                                              .getCurrentDateIndex();
                                                                      FFAppState()
                                                                              .customPickerItemIndex2 =
                                                                          functions
                                                                              .getCurrentMonthIndex();
                                                                      FFAppState()
                                                                          .customPickerItemIndex3 = 19;
                                                                    });
                                                                    await showModalBottomSheet(
                                                                      isScrollControlled:
                                                                          true,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      barrierColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .botomBack,
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return GestureDetector(
                                                                          onTap: () => _model.unfocusNode.canRequestFocus
                                                                              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                              : FocusScope.of(context).unfocus(),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                MediaQuery.viewInsetsOf(context),
                                                                            child:
                                                                                ChoseTheDateOfTrackerWidget(),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        safeSetState(() =>
                                                                            _model.pickedDateOutput =
                                                                                value));

                                                                    if (_model
                                                                            .pickedDateOutput !=
                                                                        null) {
                                                                      setState(
                                                                          () {
                                                                        _model.pickedDate =
                                                                            _model.pickedDateOutput;
                                                                        _model.pickedDayIndex =
                                                                            -1;
                                                                      });
                                                                    }

                                                                    setState(
                                                                        () {});
                                                                  },
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        'Выбрать дату',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .headlineSmall
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              fontWeight: FontWeight.w600,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    setState(
                                                                        () {
                                                                      _model.pickedDayIndex =
                                                                          15;
                                                                      _model.pickedDate =
                                                                          getCurrentTimestamp;
                                                                    });
                                                                    await _model
                                                                        .dates
                                                                        ?.animateTo(
                                                                      _model
                                                                          .dates!
                                                                          .position
                                                                          .maxScrollExtent,
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              300),
                                                                      curve: Curves
                                                                          .ease,
                                                                    );
                                                                  },
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        'Сегодня',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .headlineSmall
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              color: _model.pickedDayIndex != 15 ? FlutterFlowTheme.of(context).secondaryText : FlutterFlowTheme.of(context).grey40,
                                                                              fontWeight: FontWeight.w600,
                                                                              lineHeight: 1.25,
                                                                            ),
                                                                      ),
                                                                    ],
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
                                              ),
                                            ],
                                          ),
                                        ].addToEnd(SizedBox(height: 93.0)),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
            wrapWithModel(
              model: _model.navBarModel,
              updateCallback: () => setState(() {}),
              child: NavBarWidget(
                nevBarPage: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
