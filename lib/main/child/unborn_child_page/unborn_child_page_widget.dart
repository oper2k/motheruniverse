import '/backend/backend.dart';
import '/components/bottom_sheet/child_bottom_sheet/child_size/child_size_widget.dart';
import '/components/bottom_sheet/child_bottom_sheet/date_of_birth/date_of_birth_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'unborn_child_page_model.dart';
export 'unborn_child_page_model.dart';

class UnbornChildPageWidget extends StatefulWidget {
  const UnbornChildPageWidget({
    super.key,
    required this.child,
  });

  final ChildrenRecord? child;

  @override
  State<UnbornChildPageWidget> createState() => _UnbornChildPageWidgetState();
}

class _UnbornChildPageWidgetState extends State<UnbornChildPageWidget> {
  late UnbornChildPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UnbornChildPageModel());

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
              ),
              Flexible(
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, -1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AutoSizeText(
                                      widget.child!.name,
                                      maxLines: 1,
                                      style: FlutterFlowTheme.of(context)
                                          .displayLarge,
                                    ),
                                    Text(
                                      '${'Срок: ${functions.getWeeksSince(widget.child!.conceptionDate!).toString()}'} неделя',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 61.0, 0.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
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
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall
                                              .override(
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w500,
                                                lineHeight: 1.25,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 12.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
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
                                    if (widget.child?.photo != null &&
                                        widget.child?.photo != '') {
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
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
                                    } else if (widget.child?.gender == 'male') {
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 8.0, 6.0, 0.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    28.0, 53.0, 28.0, 53.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 8.0, 6.0, 0.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    28.0, 53.0, 28.0, 53.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 8.0, 6.0, 0.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    28.0, 53.0, 28.0, 53.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
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
                                    borderRadius: BorderRadius.circular(0.0),
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 123.0, 93.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
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
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        barrierColor:
                                            FlutterFlowTheme.of(context)
                                                .botomBack,
                                        context: context,
                                        builder: (context) {
                                          return GestureDetector(
                                            onTap: () => _model
                                                    .unfocusNode.canRequestFocus
                                                ? FocusScope.of(context)
                                                    .requestFocus(
                                                        _model.unfocusNode)
                                                : FocusScope.of(context)
                                                    .unfocus(),
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: DateOfBirthWidget(
                                                day: functions.extractDay(functions
                                                    .formatDateAfter40Weeks(
                                                        widget.child!
                                                            .conceptionDate!)),
                                                month: functions.extractMonth(
                                                    functions
                                                        .formatDateAfter40Weeks(
                                                            widget.child!
                                                                .conceptionDate!)),
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                    child: Container(
                                      width: 120.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .yellowLight,
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(14.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: AutoSizeText(
                                                    '~ Дата родов',
                                                    maxLines: 1,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .yellow,
                                                          fontSize: 16.0,
                                                          lineHeight: 1.25,
                                                        ),
                                                  ),
                                                ),
                                                Icon(
                                                  FFIcons.kcalendar,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .yellow,
                                                  size: 24.0,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  functions.extractDay(functions
                                                      .formatDateAfter40Weeks(
                                                          widget.child!
                                                              .conceptionDate!)),
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
                                                    functions.extractMonth(functions
                                                        .formatDateAfter40Weeks(
                                                            widget.child!
                                                                .conceptionDate!)),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          lineHeight: 1.28,
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
                                  StreamBuilder<List<ChildSizeRecord>>(
                                    stream: queryChildSizeRecord(
                                      queryBuilder: (childSizeRecord) =>
                                          childSizeRecord.orderBy('weekNumber'),
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
                                      List<ChildSizeRecord>
                                          containerChildSizeRecordList =
                                          snapshot.data!;
                                      return InkWell(
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
                                                  child: ChildSizeWidget(
                                                    childName:
                                                        widget.child!.name,
                                                    currentWeek: functions
                                                                .getWeeksSince(
                                                                    widget
                                                                        .child!
                                                                        .conceptionDate!) >=
                                                            40
                                                        ? 39
                                                        : (functions.getWeeksSince(
                                                                widget.child!
                                                                    .conceptionDate!) -
                                                            1),
                                                    gender:
                                                        widget.child!.gender,
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        },
                                        child: Container(
                                          width: 120.0,
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .purpleLight,
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(14.0),
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
                                                        '~ Размер',
                                                        maxLines: 1,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .headlineLarge
                                                            .override(
                                                              fontFamily:
                                                                  'Inter',
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .purple,
                                                              fontSize: 16.0,
                                                              lineHeight: 1.25,
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
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                      child: Image.network(
                                                        containerChildSizeRecordList[
                                                                functions.getNumberFromWeekString(functions
                                                                    .getWeeksSince(widget
                                                                        .child!
                                                                        .conceptionDate!)
                                                                    .toString())]
                                                            .image,
                                                        height: 28.0,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    4.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          'Как ${containerChildSizeRecordList[functions.getNumberFromWeekString(functions.getWeeksSince(widget.child!.conceptionDate!).toString())].object}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
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
                                        'AnalyzesPage',
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
                                        color: FlutterFlowTheme.of(context)
                                            .successLight,
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(14.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: AutoSizeText(
                                                    'Анализы',
                                                    maxLines: 1,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .gift,
                                                          fontSize: 16.0,
                                                          lineHeight: 1.25,
                                                        ),
                                                  ),
                                                ),
                                                Icon(
                                                  FFIcons.kdocument2,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .gift,
                                                  size: 24.0,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  '1',
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
                                                Flexible(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(4.0, 0.0,
                                                                0.0, 1.0),
                                                    child: AutoSizeText(
                                                      'в этом месяце',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .headlineMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            lineHeight: 1.28,
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
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        'NutritionalAdvice',
                                        queryParameters: {
                                          'currentWeek': serializeParam(
                                            () {
                                              if (functions.getCountOfDays(
                                                      widget.child!
                                                          .conceptionDate!) <
                                                  8) {
                                                return 0;
                                              } else if (functions
                                                      .getCountOfDays(widget
                                                          .child!
                                                          .conceptionDate!) >=
                                                  294) {
                                                return 41;
                                              } else {
                                                return functions
                                                    .getNumberFromWeekString(
                                                        functions
                                                            .getWeeksSince(widget
                                                                .child!
                                                                .conceptionDate!)
                                                            .toString());
                                              }
                                            }(),
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: Container(
                                      width: 120.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(14.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: AutoSizeText(
                                                    'Питание',
                                                    maxLines: 1,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          fontSize: 16.0,
                                                          lineHeight: 1.25,
                                                        ),
                                                  ),
                                                ),
                                                Icon(
                                                  FFIcons.kfood,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 24.0,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  'Смотреть',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.w600,
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
                                      context.pushNamed(
                                        'AdvicesUnbornChild',
                                        queryParameters: {
                                          'initialIndex': serializeParam(
                                            functions.findNumberOfWeek(widget
                                                    .child!.conceptionDate!) -
                                                1,
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: Container(
                                      width: 120.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .blueLight,
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(14.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: AutoSizeText(
                                                    'Советы',
                                                    maxLines: 1,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .blue,
                                                          fontSize: 16.0,
                                                          lineHeight: 1.25,
                                                        ),
                                                  ),
                                                ),
                                                Icon(
                                                  FFIcons.kmessageCircle,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .blue,
                                                  size: 24.0,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  'Смотреть',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.w600,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
