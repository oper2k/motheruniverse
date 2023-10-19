import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'view_lesson_page_model.dart';
export 'view_lesson_page_model.dart';

class ViewLessonPageWidget extends StatefulWidget {
  const ViewLessonPageWidget({
    Key? key,
    required this.lesson,
  }) : super(key: key);

  final LearningRecord? lesson;

  @override
  _ViewLessonPageWidgetState createState() => _ViewLessonPageWidgetState();
}

class _ViewLessonPageWidgetState extends State<ViewLessonPageWidget> {
  late ViewLessonPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewLessonPageModel());
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
        body: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: Image.network(
                    widget.lesson!.preview,
                    width: double.infinity,
                    height: 216.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1.00, -1.00),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 45.0, 0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.safePop();
                      },
                      child: Container(
                        width: 36.0,
                        height: 36.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(13.0),
                        ),
                        child: Icon(
                          FFIcons.kleft,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 79.0, 0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(
                          'ViewLessonVid',
                          queryParameters: {
                            'lesson': serializeParam(
                              widget.lesson,
                              ParamType.Document,
                            ),
                          }.withoutNulls,
                          extra: <String, dynamic>{
                            'lesson': widget.lesson,
                          },
                        );
                      },
                      child: Container(
                        width: 56.0,
                        height: 56.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.play_arrow_rounded,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 42.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 16.0, 20.0, 0.0),
                      child: Text(
                        widget.lesson!.title,
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: 'Inter',
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 16.0, 20.0, 0.0),
                      child: Text(
                        widget.lesson!.description,
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: 'Inter',
                                  lineHeight: 1.5,
                                ),
                      ),
                    ),
                    if (widget.lesson!.files.length > 0)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 32.0, 20.0, 0.0),
                        child: Text(
                          'МАТЕРИАЛЫ',
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                    if (widget.lesson!.files.length > 0)
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            final files = widget.lesson?.files?.toList() ?? [];
                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children:
                                    List.generate(files.length, (filesIndex) {
                                  final filesItem = files[filesIndex];
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await launchURL(filesItem.link);
                                    },
                                    child: Container(
                                      width: 142.0,
                                      height: 110.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 12.0, 12.0, 12.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Icon(
                                              FFIcons.kdocument,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 24.0,
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 4.0, 0.0, 0.0),
                                                child: Text(
                                                  filesItem.fileName,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        lineHeight: 1.28,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: Text(
                                                '${filesItem.type} • ${filesItem.size}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                })
                                        .divide(SizedBox(width: 12.0))
                                        .addToStart(SizedBox(width: 20.0))
                                        .addToEnd(SizedBox(width: 20.0)),
                              ),
                            );
                          },
                        ),
                      ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                      child: StreamBuilder<UsersRecord>(
                        stream: UsersRecord.getDocument(currentUserReference!),
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
                          final containerUsersRecord = snapshot.data!;
                          return Container(
                            decoration: BoxDecoration(),
                            child: StreamBuilder<List<LearningRecord>>(
                              stream: queryLearningRecord(
                                queryBuilder: (learningRecord) => learningRecord
                                    .where(
                                      'category',
                                      isEqualTo: widget.lesson?.category,
                                    )
                                    .orderBy('sort', descending: true),
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
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<LearningRecord>
                                    learningQueryLearningRecordList =
                                    snapshot.data!;
                                return Container(
                                  decoration: BoxDecoration(),
                                  child: Visibility(
                                    visible:
                                        learningQueryLearningRecordList.length >
                                            1,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 20.0, 0.0),
                                          child: Text(
                                            'ЕЩЕ ПО ЭТОЙ ТЕМЕ',
                                            style: FlutterFlowTheme.of(context)
                                                .headlineMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 12.0, 0.0, 0.0),
                                          child: Builder(
                                            builder: (context) {
                                              final lesson =
                                                  learningQueryLearningRecordList
                                                      .toList();
                                              return Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: List.generate(
                                                        lesson.length,
                                                        (lessonIndex) {
                                                  final lessonItem =
                                                      lesson[lessonIndex];
                                                  return Visibility(
                                                    visible: lessonItem
                                                            .reference.id !=
                                                        widget.lesson?.reference
                                                            .id,
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        if (containerUsersRecord
                                                                .purchasedLessons
                                                                .contains(
                                                                    lessonItem
                                                                        .reference
                                                                        .id) ||
                                                            (lessonItem
                                                                    .freeLesson ==
                                                                true)) {
                                                          if (Navigator.of(
                                                                  context)
                                                              .canPop()) {
                                                            context.pop();
                                                          }
                                                          context.pushNamed(
                                                            'ViewLessonPage',
                                                            queryParameters: {
                                                              'lesson':
                                                                  serializeParam(
                                                                lessonItem,
                                                                ParamType
                                                                    .Document,
                                                              ),
                                                            }.withoutNulls,
                                                            extra: <String,
                                                                dynamic>{
                                                              'lesson':
                                                                  lessonItem,
                                                            },
                                                          );
                                                        } else {
                                                          if (Navigator.of(
                                                                  context)
                                                              .canPop()) {
                                                            context.pop();
                                                          }
                                                          context.pushNamed(
                                                            'BuyLessonPage',
                                                            queryParameters: {
                                                              'lesson':
                                                                  serializeParam(
                                                                lessonItem,
                                                                ParamType
                                                                    .Document,
                                                              ),
                                                            }.withoutNulls,
                                                            extra: <String,
                                                                dynamic>{
                                                              'lesson':
                                                                  lessonItem,
                                                            },
                                                          );
                                                        }
                                                      },
                                                      child: Container(
                                                        width: 120.0,
                                                        height: 168.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          13.0),
                                                              child: Container(
                                                                width: 120.0,
                                                                height: 120.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              13.0),
                                                                ),
                                                                child: Stack(
                                                                  children: [
                                                                    ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              0.0),
                                                                      child: Image
                                                                          .network(
                                                                        lessonItem
                                                                            .preview,
                                                                        width:
                                                                            120.0,
                                                                        height:
                                                                            120.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          2.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          if (lessonItem.freeLesson ==
                                                                              true)
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 0.0, 0.0),
                                                                              child: Container(
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).blue,
                                                                                  borderRadius: BorderRadius.circular(20.0),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(7.0, 2.0, 7.0, 2.0),
                                                                                  child: AutoSizeText(
                                                                                    'Беслатно',
                                                                                    maxLines: 1,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Inter',
                                                                                          color: Colors.white,
                                                                                          fontSize: 12.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          if (functions
                                                                              .checkIfLessonIsNew(lessonItem.dateOfPublication!))
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 0.0, 0.0),
                                                                              child: Container(
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  borderRadius: BorderRadius.circular(20.0),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(7.0, 2.0, 7.0, 2.0),
                                                                                  child: AutoSizeText(
                                                                                    'New',
                                                                                    maxLines: 1,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Inter',
                                                                                          color: Colors.white,
                                                                                          fontSize: 12.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Builder(
                                                                      builder:
                                                                          (context) {
                                                                        if (containerUsersRecord.purchasedLessons.contains(lessonItem.reference.id) ||
                                                                            (lessonItem.freeLesson ==
                                                                                true)) {
                                                                          return Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.00, 0.00),
                                                                            child:
                                                                                Container(
                                                                              width: 32.0,
                                                                              height: 32.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                shape: BoxShape.circle,
                                                                              ),
                                                                              child: Icon(
                                                                                Icons.play_arrow_rounded,
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                size: 24.0,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        } else {
                                                                          return Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.00, 0.00),
                                                                            child:
                                                                                Container(
                                                                              width: 32.0,
                                                                              height: 32.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).grey20,
                                                                                shape: BoxShape.circle,
                                                                              ),
                                                                              child: Icon(
                                                                                FFIcons.klock,
                                                                                color: FlutterFlowTheme.of(context).grey40,
                                                                                size: 24.0,
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
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                              child:
                                                                  AutoSizeText(
                                                                lessonItem.title
                                                                    .maybeHandleOverflow(
                                                                  maxChars: 27,
                                                                  replacement:
                                                                      '…',
                                                                ),
                                                                maxLines: 2,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      fontSize:
                                                                          14.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      lineHeight:
                                                                          1.28,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                })
                                                    .divide(
                                                        SizedBox(width: 12.0))
                                                    .addToStart(
                                                        SizedBox(width: 20.0))
                                                    .addToEnd(
                                                        SizedBox(width: 20.0)),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ].addToEnd(SizedBox(height: 150.0)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
