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
import 'born_child_page_model.dart';
export 'born_child_page_model.dart';

class BornChildPageWidget extends StatefulWidget {
  const BornChildPageWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  final ChildrenRecord? child;

  @override
  _BornChildPageWidgetState createState() => _BornChildPageWidgetState();
}

class _BornChildPageWidgetState extends State<BornChildPageWidget> {
  late BornChildPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BornChildPageModel());
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
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 45.0, 0.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: 38.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
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
              ),
              Flexible(
                child: StreamBuilder<ChildrenRecord>(
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
                    final childQueryChildrenRecord = snapshot.data!;
                    return Container(
                      width: double.infinity,
                      decoration: BoxDecoration(),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 7.0, 14.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment:
                                        AlignmentDirectional(0.00, -1.00),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AutoSizeText(
                                            widget.child!.name,
                                            maxLines: 1,
                                            style: FlutterFlowTheme.of(context)
                                                .displayLarge,
                                          ),
                                          Text(
                                            functions.calculateAgeAndMonths(
                                                childQueryChildrenRecord
                                                    .birthDate!),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 61.0, 0.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'EditChildInfoPage',
                                                  queryParameters: {
                                                    'child': serializeParam(
                                                      widget.child,
                                                      ParamType.Document,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'child': widget.child,
                                                  },
                                                );
                                              },
                                              child: Text(
                                                'Изменить данные',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          lineHeight: 1.25,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 12.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'EditChildInfoPage',
                                                  queryParameters: {
                                                    'child': serializeParam(
                                                      widget.child,
                                                      ParamType.Document,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'child': widget.child,
                                                  },
                                                );
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                                child: Image.asset(
                                                  'assets/images/profile_wawe.webp',
                                                  height: 8.0,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Stack(
                                    alignment: AlignmentDirectional(1.0, -1.0),
                                    children: [
                                      Builder(
                                        builder: (context) {
                                          if (childQueryChildrenRecord.photo !=
                                                  null &&
                                              childQueryChildrenRecord.photo !=
                                                  '') {
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 8.0, 6.0, 0.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                                child: Image.network(
                                                  widget.child!.photo,
                                                  width: 120.0,
                                                  height: 170.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            );
                                          } else if (widget.child?.gender ==
                                              'male') {
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 8.0, 6.0, 0.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(28.0, 53.0,
                                                          28.0, 53.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                    child: Image.asset(
                                                      'assets/images/uc7hf_.webp',
                                                      width: 64.0,
                                                      height: 64.0,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          } else if (widget.child?.gender ==
                                              'female') {
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 8.0, 6.0, 0.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(28.0, 53.0,
                                                          28.0, 53.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                    child: Image.asset(
                                                      'assets/images/76ydn_.webp',
                                                      width: 64.0,
                                                      height: 64.0,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          } else {
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 8.0, 6.0, 0.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(28.0, 53.0,
                                                          28.0, 53.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                    child: Image.asset(
                                                      'assets/images/f5ei4_.webp',
                                                      width: 64.0,
                                                      height: 64.0,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                      if (widget.child?.imageRight != null &&
                                          widget.child?.imageRight != '')
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          child: Image.network(
                                            valueOrDefault<String>(
                                              widget.child?.imageRight,
                                              'false',
                                            ),
                                            width: 50.0,
                                            height: 50.0,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      if (widget.child?.imageLeft != null &&
                                          widget.child?.imageLeft != '')
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 123.0, 93.0, 0.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                            child: Image.network(
                                              widget.child!.imageLeft,
                                              width: 50.0,
                                              height: 50.0,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 24.0, 20.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'ИНФОРМАЦИЯ',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w600,
                                          lineHeight: 1.28,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 50.0),
                                    child: GridView(
                                      padding: EdgeInsets.zero,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 15.0,
                                        mainAxisSpacing: 15.0,
                                        childAspectRatio: 1.6,
                                      ),
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'GrowthPage',
                                              queryParameters: {
                                                'child': serializeParam(
                                                  widget.child,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'child': widget.child,
                                              },
                                            );
                                          },
                                          child: Container(
                                            width: 120.0,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .yellowLight,
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      14.0, 14.0, 14.0, 14.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: AutoSizeText(
                                                          'Рост',
                                                          maxLines: 1,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .yellow,
                                                                fontSize: 16.0,
                                                                lineHeight:
                                                                    1.25,
                                                              ),
                                                        ),
                                                      ),
                                                      Icon(
                                                        FFIcons.kheight,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .yellow,
                                                        size: 24.0,
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        valueOrDefault<String>(
                                                          childQueryChildrenRecord
                                                              .growthList
                                                              .last
                                                              .growth
                                                              .toString(),
                                                          '-',
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .headlineSmall
                                                            .override(
                                                              fontFamily:
                                                                  'Inter',
                                                              fontSize: 24.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              lineHeight: 1.16,
                                                            ),
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
                                                          'см',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                lineHeight:
                                                                    1.28,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
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
                                            context.pushNamed(
                                              'WeightPage',
                                              queryParameters: {
                                                'child': serializeParam(
                                                  widget.child,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'child': widget.child,
                                              },
                                            );
                                          },
                                          child: Container(
                                            width: 120.0,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .purpleLight,
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      14.0, 14.0, 14.0, 14.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: AutoSizeText(
                                                          'Вес',
                                                          maxLines: 1,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .purple,
                                                                fontSize: 16.0,
                                                                lineHeight:
                                                                    1.25,
                                                              ),
                                                        ),
                                                      ),
                                                      Icon(
                                                        FFIcons.kunion,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .purple,
                                                        size: 24.0,
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        valueOrDefault<String>(
                                                          childQueryChildrenRecord
                                                              .weightList
                                                              .last
                                                              .weight
                                                              .toString(),
                                                          '-',
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .headlineSmall
                                                            .override(
                                                              fontFamily:
                                                                  'Inter',
                                                              fontSize: 24.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              lineHeight: 1.16,
                                                            ),
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
                                                          'кг',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        StreamBuilder<List<DoctorsRecord>>(
                                          stream: queryDoctorsRecord(),
                                          builder: (context, snapshot) {
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
                                            List<DoctorsRecord>
                                                containerDoctorsRecordList =
                                                snapshot.data!;
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'DoctorVisitingPage',
                                                  queryParameters: {
                                                    'currentWeek':
                                                        serializeParam(
                                                      functions
                                                          .calculateAgePeriodIndex(
                                                              widget.child!
                                                                  .birthDate!),
                                                      ParamType.int,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: Container(
                                                width: 120.0,
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .successLight,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(14.0, 14.0,
                                                          14.0, 14.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: AutoSizeText(
                                                              'Врачи',
                                                              maxLines: 1,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .gift,
                                                                    fontSize:
                                                                        16.0,
                                                                    lineHeight:
                                                                        1.25,
                                                                  ),
                                                            ),
                                                          ),
                                                          Icon(
                                                            FFIcons.kdoctor,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .gift,
                                                            size: 24.0,
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                            () {
                                                              if (functions.isWithinNDays(
                                                                  widget.child!
                                                                      .birthDate!,
                                                                  30)) {
                                                                return containerDoctorsRecordList
                                                                    .where((e) =>
                                                                        e.age ==
                                                                        'До 1 месяца')
                                                                    .toList()
                                                                    .length
                                                                    .toString();
                                                              } else if (functions.isWithinNDays(
                                                                  widget.child!
                                                                      .birthDate!,
                                                                  60)) {
                                                                return containerDoctorsRecordList
                                                                    .where((e) =>
                                                                        e.age ==
                                                                        '1 месяц')
                                                                    .toList()
                                                                    .length
                                                                    .toString();
                                                              } else if (functions.isWithinNDays(
                                                                  widget.child!
                                                                      .birthDate!,
                                                                  91)) {
                                                                return containerDoctorsRecordList
                                                                    .where((e) =>
                                                                        e.age ==
                                                                        '2 месяц')
                                                                    .toList()
                                                                    .length
                                                                    .toString();
                                                              } else if (functions.isWithinNDays(
                                                                  widget.child!
                                                                      .birthDate!,
                                                                  121)) {
                                                                return containerDoctorsRecordList
                                                                    .where((e) =>
                                                                        e.age ==
                                                                        '3 месяц')
                                                                    .toList()
                                                                    .length
                                                                    .toString();
                                                              } else if (functions.isWithinNDays(
                                                                  widget.child!
                                                                      .birthDate!,
                                                                  152)) {
                                                                return containerDoctorsRecordList
                                                                    .where((e) =>
                                                                        e.age ==
                                                                        '4 месяц')
                                                                    .toList()
                                                                    .length
                                                                    .toString();
                                                              } else if (functions.isWithinNDays(
                                                                  widget.child!
                                                                      .birthDate!,
                                                                  182)) {
                                                                return containerDoctorsRecordList
                                                                    .where((e) =>
                                                                        e.age ==
                                                                        '5 месяц')
                                                                    .toList()
                                                                    .length
                                                                    .toString();
                                                              } else if (functions.isWithinNDays(
                                                                  widget.child!
                                                                      .birthDate!,
                                                                  212)) {
                                                                return containerDoctorsRecordList
                                                                    .where((e) =>
                                                                        e.age ==
                                                                        '6 месяц')
                                                                    .toList()
                                                                    .length
                                                                    .toString();
                                                              } else if (functions
                                                                  .isWithinNDays(
                                                                      widget
                                                                          .child!
                                                                          .birthDate!,
                                                                      243)) {
                                                                return containerDoctorsRecordList
                                                                    .where((e) =>
                                                                        e.age ==
                                                                        '7 месяц')
                                                                    .toList()
                                                                    .length
                                                                    .toString();
                                                              } else if (functions
                                                                  .isWithinNDays(
                                                                      widget.child!.birthDate!, 273)) {
                                                                return containerDoctorsRecordList
                                                                    .where((e) =>
                                                                        e.age ==
                                                                        '8 месяц')
                                                                    .toList()
                                                                    .length
                                                                    .toString();
                                                              } else if (functions.isWithinNDays(widget.child!.birthDate!, 304)) {
                                                                return containerDoctorsRecordList
                                                                    .where((e) =>
                                                                        e.age ==
                                                                        '9 месяц')
                                                                    .toList()
                                                                    .length
                                                                    .toString();
                                                              } else if (functions.isWithinNDays(widget.child!.birthDate!, 335)) {
                                                                return containerDoctorsRecordList
                                                                    .where((e) =>
                                                                        e.age ==
                                                                        '10 месяц')
                                                                    .toList()
                                                                    .length
                                                                    .toString();
                                                              } else if (functions.isWithinNDays(widget.child!.birthDate!, 365)) {
                                                                return containerDoctorsRecordList
                                                                    .where((e) =>
                                                                        e.age ==
                                                                        '11 месяц')
                                                                    .toList()
                                                                    .length
                                                                    .toString();
                                                              } else if (functions.isWithinNDays(widget.child!.birthDate!, 395)) {
                                                                return containerDoctorsRecordList
                                                                    .where((e) =>
                                                                        e.age ==
                                                                        '12 месяц')
                                                                    .toList()
                                                                    .length
                                                                    .toString();
                                                              } else if (functions.isWithinNDays(widget.child!.birthDate!, 487)) {
                                                                return containerDoctorsRecordList
                                                                    .where((e) =>
                                                                        e.age ==
                                                                        '1.3 года')
                                                                    .toList()
                                                                    .length
                                                                    .toString();
                                                              } else if (functions.isWithinNDays(widget.child!.birthDate!, 1065)) {
                                                                return containerDoctorsRecordList
                                                                    .where((e) =>
                                                                        e.age ==
                                                                        '2 года')
                                                                    .toList()
                                                                    .length
                                                                    .toString();
                                                              } else {
                                                                return containerDoctorsRecordList
                                                                    .where((e) =>
                                                                        e.age ==
                                                                        '3 года')
                                                                    .toList()
                                                                    .length
                                                                    .toString();
                                                              }
                                                            }(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  fontSize:
                                                                      24.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  lineHeight:
                                                                      1.16,
                                                                ),
                                                          ),
                                                          Flexible(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          0.0,
                                                                          1.0),
                                                              child:
                                                                  AutoSizeText(
                                                                'в этом месяце',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      lineHeight:
                                                                          1.28,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'VaccinationCalendarPage',
                                              queryParameters: {
                                                'currentWeek': serializeParam(
                                                  functions
                                                      .calculateAgePeriodIndex(
                                                          widget.child!
                                                              .birthDate!),
                                                  ParamType.int,
                                                ),
                                                'birthDate': serializeParam(
                                                  widget.child?.birthDate,
                                                  ParamType.DateTime,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Container(
                                            width: 120.0,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      14.0, 14.0, 14.0, 14.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: AutoSizeText(
                                                          'Прививки',
                                                          maxLines: 1,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                fontSize: 16.0,
                                                                lineHeight:
                                                                    1.25,
                                                              ),
                                                        ),
                                                      ),
                                                      Icon(
                                                        FFIcons.ksyringe,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 24.0,
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        'Смотреть',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .headlineSmall
                                                            .override(
                                                              fontFamily:
                                                                  'Inter',
                                                              fontSize: 14.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              lineHeight: 1.28,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
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
                                            context.pushNamed('AdvicesPage');
                                          },
                                          child: Container(
                                            width: 120.0,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .blueLight,
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      14.0, 14.0, 14.0, 14.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: AutoSizeText(
                                                          'Советы',
                                                          maxLines: 1,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .blue,
                                                                fontSize: 16.0,
                                                                lineHeight:
                                                                    1.25,
                                                              ),
                                                        ),
                                                      ),
                                                      Icon(
                                                        FFIcons.kmessageCircle,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .blue,
                                                        size: 24.0,
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        'Смотреть',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .headlineSmall
                                                            .override(
                                                              fontFamily:
                                                                  'Inter',
                                                              fontSize: 14.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              lineHeight: 1.28,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
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
                          ],
                        ),
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
