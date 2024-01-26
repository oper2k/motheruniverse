import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'buy_lesson_page_model.dart';
export 'buy_lesson_page_model.dart';

class BuyLessonPageWidget extends StatefulWidget {
  const BuyLessonPageWidget({
    super.key,
    required this.lesson,
  });

  final LearningRecord? lesson;

  @override
  State<BuyLessonPageWidget> createState() => _BuyLessonPageWidgetState();
}

class _BuyLessonPageWidgetState extends State<BuyLessonPageWidget> {
  late BuyLessonPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BuyLessonPageModel());

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
        body: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: Image.network(
                    widget.lesson!.preview,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 24.0, 0.0, 0.0),
                          child: Text(
                            widget.lesson!.title,
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                  lineHeight: 1.16,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
                          child: Text(
                            '${(widget.lesson!.price.round()).toString()} рублей',
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                  lineHeight: 1.25,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 0.0),
                          child: Html(
                            data: widget.lesson!.description,
                            onLinkTap: (url, _, __, ___) => launchURL(url!),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: AlignmentDirectional(1.0, -1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 55.0, 20.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.safePop();
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
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: StreamBuilder<List<LearningRecord>>(
                stream: queryLearningRecord(
                  queryBuilder: (learningRecord) => learningRecord
                      .where(
                        'category',
                        isEqualTo: widget.lesson?.category,
                      )
                      .where(
                        'free_lesson',
                        isEqualTo: false,
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
                  List<LearningRecord> learningLearningRecordList =
                      snapshot.data!;
                  return Container(
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 45.0),
                      child: Builder(
                        builder: (context) {
                          if (functions.containsAllThemeReferencesInCart(
                              FFAppState().lessonsAddedToCart.toList(),
                              learningLearningRecordList
                                  .map((e) => e.reference.id)
                                  .toList())) {
                            return Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      context.pushNamed('CartPage');
                                    },
                                    text: 'Тема добавлена в корзину',
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 56.0,
                                      padding: EdgeInsets.all(0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context)
                                          .purpleLight,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .displaySmall
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .purple,
                                          ),
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    showLoadingIndicator: false,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      setState(() {
                                        FFAppState().lessonsAddedToCart =
                                            functions
                                                .removeLessonsFromCart(
                                                    FFAppState()
                                                        .lessonsAddedToCart
                                                        .toList(),
                                                    learningLearningRecordList
                                                        .map((e) =>
                                                            e.reference.id)
                                                        .toList())
                                                .toList()
                                                .cast<String>();
                                      });
                                    },
                                    child: Container(
                                      width: 56.0,
                                      height: 56.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .redLight,
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            1.0, 0.0, 0.0, 0.0),
                                        child: Icon(
                                          FFIcons.ktrashCan,
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          size: 24.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          } else if (FFAppState()
                              .lessonsAddedToCart
                              .contains(widget.lesson?.reference.id)) {
                            return Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      context.pushNamed('CartPage');
                                    },
                                    text: 'Лекция добавлена в корзину',
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 56.0,
                                      padding: EdgeInsets.all(0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .displaySmall
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                          ),
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    showLoadingIndicator: false,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      setState(() {
                                        FFAppState()
                                            .removeFromLessonsAddedToCart(
                                                widget.lesson!.reference.id);
                                      });
                                    },
                                    child: Container(
                                      width: 56.0,
                                      height: 56.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .redLight,
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            1.0, 0.0, 0.0, 0.0),
                                        child: Icon(
                                          FFIcons.ktrashCan,
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          size: 24.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                FFButtonWidget(
                                  onPressed: () async {
                                    setState(() {
                                      FFAppState().lessonsAddedToCart =
                                          functions
                                              .mergeLists(
                                                  FFAppState()
                                                      .lessonsAddedToCart
                                                      .toList(),
                                                  learningLearningRecordList
                                                      .map(
                                                          (e) => e.reference.id)
                                                      .toList())
                                              .toList()
                                              .cast<String>();
                                    });
                                  },
                                  text: 'Купить всю тему',
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 56.0,
                                    padding: EdgeInsets.all(0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).purple,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .displaySmall,
                                    elevation: 0.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                    ),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  showLoadingIndicator: false,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      setState(() {
                                        FFAppState().addToLessonsAddedToCart(
                                            widget.lesson!.reference.id);
                                      });
                                    },
                                    text: 'Купить лекцию',
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 56.0,
                                      padding: EdgeInsets.all(0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .displaySmall,
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    showLoadingIndicator: false,
                                  ),
                                ),
                              ],
                            );
                          }
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
