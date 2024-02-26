import '/backend/backend.dart';
import '/components/bottom_sheet/child_bottom_sheet/change_the_weight/change_the_weight_widget.dart';
import '/components/bottom_sheet/child_bottom_sheet/create_the_weight/create_the_weight_widget.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'weight_page_model.dart';
export 'weight_page_model.dart';

class WeightPageWidget extends StatefulWidget {
  const WeightPageWidget({
    super.key,
    required this.child,
  });

  final ChildrenRecord? child;

  @override
  State<WeightPageWidget> createState() => _WeightPageWidgetState();
}

class _WeightPageWidgetState extends State<WeightPageWidget> {
  late WeightPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WeightPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
        backgroundColor: FlutterFlowTheme.of(context).backgroundMain,
        body: StreamBuilder<ChildrenRecord>(
          stream: ChildrenRecord.getDocument(widget.child!.reference),
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
            final containerChildrenRecord = snapshot.data!;
            return Container(
              decoration: BoxDecoration(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 45.0, 20.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 38.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.safePop();
                            },
                            child: Container(
                              width: 30.0,
                              height: 38.0,
                              decoration: BoxDecoration(),
                              child: Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Icon(
                                  FFIcons.kleft,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 30.0, 0.0),
                              child: Text(
                                'График нормы веса',
                                textAlign: TextAlign.center,
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
                        ],
                      ),
                    ),
                    Flexible(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 0.0),
                              child: Text(
                                'ТЕКУЩИЙ ВЕС',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                      lineHeight: 1.28,
                                    ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${((containerChildrenRecord.weightList.last.weight * 1000).round()).toString()} гр',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 24.0,
                                            fontWeight: FontWeight.bold,
                                            lineHeight: 1.16,
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
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            barrierColor:
                                                FlutterFlowTheme.of(context)
                                                    .botomBack,
                                            context: context,
                                            builder: (context) {
                                              return GestureDetector(
                                                onTap: () => _model.unfocusNode
                                                        .canRequestFocus
                                                    ? FocusScope.of(context)
                                                        .requestFocus(
                                                            _model.unfocusNode)
                                                    : FocusScope.of(context)
                                                        .unfocus(),
                                                child: Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child: ChangeTheWeightWidget(
                                                    child: widget.child!,
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        },
                                        child: Container(
                                          width: 40.0,
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Icon(
                                            FFIcons.kedit1,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 24.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                if (dateTimeFormat(
                                      'yMMMd',
                                      containerChildrenRecord
                                          .weightList.last.date,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    ) !=
                                    dateTimeFormat(
                                      'yMMMd',
                                      getCurrentTimestamp,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    ))
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          barrierColor:
                                              FlutterFlowTheme.of(context)
                                                  .botomBack,
                                          context: context,
                                          builder: (context) {
                                            return GestureDetector(
                                              onTap: () => _model.unfocusNode
                                                      .canRequestFocus
                                                  ? FocusScope.of(context)
                                                      .requestFocus(
                                                          _model.unfocusNode)
                                                  : FocusScope.of(context)
                                                      .unfocus(),
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: CreateTheWeightWidget(
                                                  child: widget.child!,
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      },
                                      child: Container(
                                        width: 40.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Icon(
                                          FFIcons.kplus2,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 24.0,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            Text(
                              functions.ageInYearsMonthsAmdDays(
                                  widget.child!.birthDate!),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 14.0, 0.0, 0.0),
                              child: Builder(
                                builder: (context) {
                                  if (functions.getCountOfDays(
                                          widget.child!.birthDate!) <=
                                      365) {
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 326.0,
                                          child: Stack(
                                            children: [
                                              ClipRRect(
                                                child: Container(
                                                  height: 326.0,
                                                  decoration: BoxDecoration(),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                20.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                      child: Image.asset(
                                                        'assets/images/Growth1.webp',
                                                        width: double.infinity,
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.4,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  ClipRRect(
                                                    child: Container(
                                                      width: functions
                                                          .calculateResultOfChartWidth(
                                                              MediaQuery.sizeOf(
                                                                      context)
                                                                  .width,
                                                              60,
                                                              containerChildrenRecord
                                                                  .weightList
                                                                  .first
                                                                  .date!,
                                                              containerChildrenRecord
                                                                  .weightList
                                                                  .last
                                                                  .date!)
                                                          .toDouble(),
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 326.0,
                                                        child:
                                                            FlutterFlowLineChart(
                                                          data: [
                                                            FFLineChartData(
                                                              xData: containerChildrenRecord
                                                                  .weightList
                                                                  .map((e) =>
                                                                      e.date)
                                                                  .withoutNulls
                                                                  .toList(),
                                                              yData: containerChildrenRecord
                                                                  .weightList
                                                                  .map((e) =>
                                                                      e.weight)
                                                                  .toList(),
                                                              settings:
                                                                  LineChartBarData(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .blue,
                                                                barWidth: 2.0,
                                                                dotData: FlDotData(
                                                                    show:
                                                                        false),
                                                              ),
                                                            )
                                                          ],
                                                          chartStylingInfo:
                                                              ChartStylingInfo(
                                                            backgroundColor:
                                                                Color(
                                                                    0x00FFFFFF),
                                                            showBorder: false,
                                                          ),
                                                          axisBounds:
                                                              AxisBounds(
                                                            minY: 1.0,
                                                            maxY: 17.0,
                                                          ),
                                                          xAxisLabelInfo:
                                                              AxisLabelInfo(),
                                                          yAxisLabelInfo:
                                                              AxisLabelInfo(),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 20.0,
                                                    height: 326.0,
                                                    decoration: BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          '17',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        Text(
                                                          '16',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        Text(
                                                          '15',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        Text(
                                                          '14',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        Text(
                                                          '13',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        Text(
                                                          '12',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        Text(
                                                          '11',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        Text(
                                                          '10',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        Text(
                                                          '9',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        Text(
                                                          '8',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        Text(
                                                          '7',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        Text(
                                                          '6',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        Text(
                                                          '5',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        Text(
                                                          '4',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        Text(
                                                          '3',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        Text(
                                                          '2',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        Text(
                                                          '1',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 6.0, 20.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                functions.getAbbreviatedMonths(
                                                    widget
                                                        .child!.birthDate!)![0],
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                              Text(
                                                functions.getAbbreviatedMonths(
                                                    widget
                                                        .child!.birthDate!)![1],
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                              Text(
                                                functions.getAbbreviatedMonths(
                                                    widget
                                                        .child!.birthDate!)![2],
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                              Text(
                                                functions.getAbbreviatedMonths(
                                                    widget
                                                        .child!.birthDate!)![3],
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                              Text(
                                                functions.getAbbreviatedMonths(
                                                    widget
                                                        .child!.birthDate!)![4],
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                              Text(
                                                functions.getAbbreviatedMonths(
                                                    widget
                                                        .child!.birthDate!)![5],
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                              Text(
                                                functions.getAbbreviatedMonths(
                                                    widget
                                                        .child!.birthDate!)![6],
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                              Text(
                                                functions.getAbbreviatedMonths(
                                                    widget
                                                        .child!.birthDate!)![7],
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                              Text(
                                                functions.getAbbreviatedMonths(
                                                    widget
                                                        .child!.birthDate!)![8],
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                              Text(
                                                functions.getAbbreviatedMonths(
                                                    widget
                                                        .child!.birthDate!)![9],
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                              Text(
                                                functions.getAbbreviatedMonths(
                                                    widget.child!
                                                        .birthDate!)![10],
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                              Text(
                                                functions.getAbbreviatedMonths(
                                                    widget.child!
                                                        .birthDate!)![11],
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 24.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                width: 12.0,
                                                height: 12.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .blue,
                                                  shape: BoxShape.circle,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  'Вес ребенка',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 14.0,
                                                        lineHeight: 1.28,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        39.0, 0.0, 0.0, 0.0),
                                                child: Container(
                                                  width: 12.0,
                                                  height: 12.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  'Норма отклонения',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 14.0,
                                                        lineHeight: 1.28,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    );
                                  } else {
                                    return Text(
                                      'Ваш ребенок старше отслеживаемого графиком возраста',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            fontFamily: 'Inter',
                                            lineHeight: 1.28,
                                          ),
                                    );
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 77.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 50.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'При рождении',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 14.0,
                                                        lineHeight: 1.28,
                                                      ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  ((containerChildrenRecord
                                                                  .weightList
                                                                  .first
                                                                  .weight *
                                                              1000)
                                                          .round())
                                                      .toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 24.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        lineHeight: 1.16,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          4.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'гр',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          lineHeight: 1.28,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              functions
                                                  .dateOfMeasurementInShortFormatOfMonthAndYear(
                                                      containerChildrenRecord
                                                          .weightList
                                                          .first
                                                          .date!),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        lineHeight: 1.28,
                                                      ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Сейчас',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 14.0,
                                                        lineHeight: 1.28,
                                                      ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  ((containerChildrenRecord
                                                                  .weightList
                                                                  .last
                                                                  .weight *
                                                              1000)
                                                          .round())
                                                      .toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 24.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        lineHeight: 1.16,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          4.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'гр',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          lineHeight: 1.28,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              functions
                                                  .dateOfMeasurementInShortFormatOfMonthAndYear(
                                                      containerChildrenRecord
                                                          .weightList
                                                          .last
                                                          .date!),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        lineHeight: 1.28,
                                                      ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Изменение',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 14.0,
                                                        lineHeight: 1.28,
                                                      ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  valueOrDefault<String>(
                                                    functions.calculateWeightChange(
                                                        ((widget
                                                                        .child!
                                                                        .weightList
                                                                        .first
                                                                        .weight *
                                                                    1000)
                                                                .round())
                                                            .toDouble(),
                                                        ((containerChildrenRecord
                                                                        .weightList
                                                                        .last
                                                                        .weight *
                                                                    1000)
                                                                .round())
                                                            .toDouble()),
                                                    '0',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 24.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        lineHeight: 1.16,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          4.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'гр',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          lineHeight: 1.28,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
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
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
