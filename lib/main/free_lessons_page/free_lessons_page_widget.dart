import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'free_lessons_page_model.dart';
export 'free_lessons_page_model.dart';

class FreeLessonsPageWidget extends StatefulWidget {
  const FreeLessonsPageWidget({super.key});

  @override
  State<FreeLessonsPageWidget> createState() => _FreeLessonsPageWidgetState();
}

class _FreeLessonsPageWidgetState extends State<FreeLessonsPageWidget> {
  late FreeLessonsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FreeLessonsPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
        backgroundColor: FlutterFlowTheme.of(context).backgroundMain,
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 45.0, 20.0, 45.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                height: 38.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
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
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: AutoSizeText(
                          'Бесплатные уроки',
                          maxLines: 1,
                          style: FlutterFlowTheme.of(context).displayLarge,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                      child: StreamBuilder<List<LearningRecord>>(
                        stream: queryLearningRecord(
                          queryBuilder: (learningRecord) => learningRecord
                              .where(
                                'free_lesson',
                                isEqualTo: true,
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
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<LearningRecord> containerLearningRecordList =
                              snapshot.data!;
                          return Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Builder(
                              builder: (context) {
                                final lessons =
                                    containerLearningRecordList.toList();
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: List.generate(lessons.length,
                                          (lessonsIndex) {
                                    final lessonsItem = lessons[lessonsIndex];
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'ViewLessonPage',
                                          queryParameters: {
                                            'lesson': serializeParam(
                                              lessonsItem,
                                              ParamType.Document,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'lesson': lessonsItem,
                                          },
                                        );
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                            child: Image.network(
                                              lessonsItem.preview,
                                              width: 80.0,
                                              height: 80.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  if (lessonsItem.category !=
                                                          null &&
                                                      lessonsItem.category !=
                                                          '')
                                                    Text(
                                                      lessonsItem.category,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            lineHeight: 1.28,
                                                          ),
                                                    ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      lessonsItem.title,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .headlineSmall
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            lineHeight: 1.25,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  })
                                      .divide(SizedBox(height: 12.0))
                                      .addToEnd(SizedBox(height: 45.0)),
                                );
                              },
                            ),
                          );
                        },
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
