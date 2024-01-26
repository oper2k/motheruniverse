import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nutritional_advice_model.dart';
export 'nutritional_advice_model.dart';

class NutritionalAdviceWidget extends StatefulWidget {
  const NutritionalAdviceWidget({
    super.key,
    required this.currentWeek,
  });

  final int? currentWeek;

  @override
  State<NutritionalAdviceWidget> createState() =>
      _NutritionalAdviceWidgetState();
}

class _NutritionalAdviceWidgetState extends State<NutritionalAdviceWidget> {
  late NutritionalAdviceModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NutritionalAdviceModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.choseWeekIndex = widget.currentWeek!;
      });
    });

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
        body: StreamBuilder<List<NutritionalAdviceRecord>>(
          stream: queryNutritionalAdviceRecord(
            queryBuilder: (nutritionalAdviceRecord) =>
                nutritionalAdviceRecord.orderBy('weekNumber'),
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
            List<NutritionalAdviceRecord> containerNutritionalAdviceRecordList =
                snapshot.data!;
            return Container(
              decoration: BoxDecoration(),
              child: Stack(
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 45.0, 20.0, 0.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
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
                                  child: Icon(
                                    FFIcons.kleft,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Рекомендации по питанию',
                                        style: FlutterFlowTheme.of(context)
                                            .displayLarge,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 24.0, 0.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(),
                                          child: Text(
                                            containerNutritionalAdviceRecordList[
                                                    _model.choseWeekIndex]
                                                .recommendation,
                                            style: FlutterFlowTheme.of(context)
                                                .headlineSmall
                                                .override(
                                                  fontFamily: 'Inter',
                                                  lineHeight: 1.5,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ].addToEnd(SizedBox(height: 183.0)),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Container(
                      width: double.infinity,
                      height: 171.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Builder(
                              builder: (context) {
                                final week =
                                    containerNutritionalAdviceRecordList
                                        .toList();
                                return Container(
                                  width: double.infinity,
                                  height: 78.0,
                                  child: CarouselSlider.builder(
                                    itemCount: week.length,
                                    itemBuilder: (context, weekIndex, _) {
                                      final weekItem = week[weekIndex];
                                      return Builder(
                                        builder: (context) {
                                          if (weekIndex <=
                                              widget.currentWeek!) {
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                setState(() {
                                                  _model.choseWeekIndex =
                                                      weekIndex;
                                                });
                                              },
                                              child: Container(
                                                width: 56.0,
                                                height: 78.0,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          40.0),
                                                  border: Border.all(
                                                    color:
                                                        _model.choseWeekIndex ==
                                                                weekIndex
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .primary
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .divider,
                                                    width: 2.0,
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      weekItem.weekNumber
                                                          .toString(),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .headlineSmall
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            fontSize: 20.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            lineHeight: 1.3,
                                                          ),
                                                    ),
                                                    Text(
                                                      'нед',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .displayMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            lineHeight: 1.33,
                                                          ),
                                                    ),
                                                    if (weekIndex ==
                                                        widget.currentWeek)
                                                      Container(
                                                        width: 6.0,
                                                        height: 6.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          } else {
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {},
                                              child: Container(
                                                width: 56.0,
                                                height: 78.0,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          40.0),
                                                  border: Border.all(
                                                    color:
                                                        _model.choseWeekIndex ==
                                                                weekIndex
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .primary
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .divider,
                                                    width: 2.0,
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      weekItem.weekNumber
                                                          .toString(),
                                                      style: FlutterFlowTheme
                                                              .of(context)
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
                                                      'нед',
                                                      style: FlutterFlowTheme
                                                              .of(context)
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
                                              ),
                                            );
                                          }
                                        },
                                      );
                                    },
                                    carouselController:
                                        _model.carouselController ??=
                                            CarouselController(),
                                    options: CarouselOptions(
                                      initialPage: min(
                                          valueOrDefault<int>(
                                            _model.choseWeekIndex,
                                            0,
                                          ),
                                          week.length - 1),
                                      viewportFraction: 0.2,
                                      disableCenter: false,
                                      enlargeCenterPage: false,
                                      enlargeFactor: 0.0,
                                      enableInfiniteScroll: false,
                                      scrollDirection: Axis.horizontal,
                                      autoPlay: false,
                                      onPageChanged: (index, _) =>
                                          _model.carouselCurrentIndex = index,
                                    ),
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
            );
          },
        ),
      ),
    );
  }
}
