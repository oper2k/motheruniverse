import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'analyzes_page_model.dart';
export 'analyzes_page_model.dart';

class AnalyzesPageWidget extends StatefulWidget {
  const AnalyzesPageWidget({
    Key? key,
    required this.currentWeek,
  }) : super(key: key);

  final int? currentWeek;

  @override
  _AnalyzesPageWidgetState createState() => _AnalyzesPageWidgetState();
}

class _AnalyzesPageWidgetState extends State<AnalyzesPageWidget> {
  late AnalyzesPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AnalyzesPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.initialIndex = 0;
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
              Align(
                alignment: AlignmentDirectional(-1.00, -1.00),
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
                    child: Icon(
                      FFIcons.kleft,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: Text(
                  'Рекомендуемые анализы',
                  style: FlutterFlowTheme.of(context).displayLarge,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                child: StreamBuilder<List<WeekRecord>>(
                  stream: queryWeekRecord(
                    queryBuilder: (weekRecord) => weekRecord.orderBy('sort'),
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
                    List<WeekRecord> containerWeekRecordList = snapshot.data!;
                    return Container(
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await _model.pageViewController?.previousPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.ease,
                                  );
                                  setState(() {
                                    _model.initialIndex =
                                        _model.pageViewCurrentIndex;
                                  });
                                },
                                child: Container(
                                  width: 40.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Icon(
                                    FFIcons.kright4,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    containerWeekRecordList[_model.initialIndex]
                                        .weekName,
                                    textAlign: TextAlign.center,
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await _model.pageViewController?.nextPage(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.ease,
                                    );
                                    setState(() {
                                      _model.initialIndex =
                                          _model.pageViewCurrentIndex;
                                    });
                                  },
                                  child: Container(
                                    width: 40.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Icon(
                                      FFIcons.kright10,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 0.0),
                            child: StreamBuilder<UsersRecord>(
                              stream: UsersRecord.getDocument(
                                  currentUserReference!),
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
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                final containerUsersRecord = snapshot.data!;
                                return Container(
                                  decoration: BoxDecoration(),
                                  child: StreamBuilder<
                                      List<RecommendedAnalizesRecord>>(
                                    stream: queryRecommendedAnalizesRecord(
                                      queryBuilder:
                                          (recommendedAnalizesRecord) =>
                                              recommendedAnalizesRecord.where(
                                        'week',
                                        isEqualTo: containerWeekRecordList[
                                                _model.initialIndex]
                                            .weekName,
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
                                      List<RecommendedAnalizesRecord>
                                          containerRecommendedAnalizesRecordList =
                                          snapshot.data!;
                                      return Container(
                                        decoration: BoxDecoration(),
                                        child: Builder(
                                          builder: (context) {
                                            final weeksCounter =
                                                containerWeekRecordList
                                                    .toList();
                                            return Container(
                                              width: double.infinity,
                                              height: 500.0,
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 40.0),
                                                child: PageView.builder(
                                                  controller: _model
                                                          .pageViewController ??=
                                                      PageController(
                                                          initialPage: min(
                                                              valueOrDefault<
                                                                  int>(
                                                                _model
                                                                    .initialIndex,
                                                                0,
                                                              ),
                                                              weeksCounter
                                                                      .length -
                                                                  1)),
                                                  onPageChanged: (_) async {
                                                    setState(() {
                                                      _model.initialIndex = _model
                                                          .pageViewCurrentIndex;
                                                    });
                                                  },
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount:
                                                      weeksCounter.length,
                                                  itemBuilder: (context,
                                                      weeksCounterIndex) {
                                                    final weeksCounterItem =
                                                        weeksCounter[
                                                            weeksCounterIndex];
                                                    return Builder(
                                                      builder: (context) {
                                                        final currentAnalizes =
                                                            containerRecommendedAnalizesRecordList
                                                                .toList();
                                                        return SingleChildScrollView(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: List.generate(
                                                                currentAnalizes
                                                                    .length,
                                                                (currentAnalizesIndex) {
                                                              final currentAnalizesItem =
                                                                  currentAnalizes[
                                                                      currentAnalizesIndex];
                                                              return Container(
                                                                width: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Builder(
                                                                  builder:
                                                                      (context) {
                                                                    if (!containerUsersRecord
                                                                        .passAnalizesString
                                                                        .contains(currentAnalizesItem
                                                                            .reference
                                                                            .id)) {
                                                                      return Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                12.0,
                                                                                0.0,
                                                                                12.0),
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                await containerUsersRecord.reference.update({
                                                                                  ...mapToFirestore(
                                                                                    {
                                                                                      'pass_analizes_string': FieldValue.arrayUnion([
                                                                                        currentAnalizesItem.reference.id
                                                                                      ]),
                                                                                    },
                                                                                  ),
                                                                                });
                                                                              },
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: RichText(
                                                                                      textScaleFactor: MediaQuery.of(context).textScaleFactor,
                                                                                      text: TextSpan(
                                                                                        children: [
                                                                                          TextSpan(
                                                                                            text: currentAnalizesItem.name,
                                                                                            style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                  fontFamily: 'Inter',
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                  lineHeight: 1.25,
                                                                                                ),
                                                                                          ),
                                                                                          TextSpan(
                                                                                            text: '\n',
                                                                                            style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                                  fontFamily: 'Inter',
                                                                                                  lineHeight: 1.28,
                                                                                                ),
                                                                                          ),
                                                                                          TextSpan(
                                                                                            text: currentAnalizesItem.description,
                                                                                            style: TextStyle(),
                                                                                          )
                                                                                        ],
                                                                                        style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                              fontFamily: 'Inter',
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Container(
                                                                                    width: 30.0,
                                                                                    height: 30.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      shape: BoxShape.circle,
                                                                                      border: Border.all(
                                                                                        color: FlutterFlowTheme.of(context).grey40,
                                                                                        width: 2.0,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                1.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).grey20,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    } else {
                                                                      return Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                12.0,
                                                                                0.0,
                                                                                12.0),
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                await containerUsersRecord.reference.update({
                                                                                  ...mapToFirestore(
                                                                                    {
                                                                                      'pass_analizes_string': FieldValue.arrayRemove([
                                                                                        currentAnalizesItem.reference.id
                                                                                      ]),
                                                                                    },
                                                                                  ),
                                                                                });
                                                                              },
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: RichText(
                                                                                      textScaleFactor: MediaQuery.of(context).textScaleFactor,
                                                                                      text: TextSpan(
                                                                                        children: [
                                                                                          TextSpan(
                                                                                            text: currentAnalizesItem.name,
                                                                                            style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                  fontFamily: 'Inter',
                                                                                                  color: FlutterFlowTheme.of(context).grey40,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                  decoration: TextDecoration.lineThrough,
                                                                                                  lineHeight: 1.25,
                                                                                                ),
                                                                                          ),
                                                                                          TextSpan(
                                                                                            text: '\n',
                                                                                            style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                                  fontFamily: 'Inter',
                                                                                                  lineHeight: 1.28,
                                                                                                ),
                                                                                          ),
                                                                                          TextSpan(
                                                                                            text: currentAnalizesItem.description,
                                                                                            style: TextStyle(
                                                                                              color: FlutterFlowTheme.of(context).grey40,
                                                                                              decoration: TextDecoration.lineThrough,
                                                                                            ),
                                                                                          )
                                                                                        ],
                                                                                        style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                              fontFamily: 'Inter',
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Container(
                                                                                    width: 30.0,
                                                                                    height: 30.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Icon(
                                                                                      FFIcons.kcheckMini,
                                                                                      color: Colors.white,
                                                                                      size: 24.0,
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                1.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).grey20,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    }
                                                                  },
                                                                ),
                                                              );
                                                            }),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
