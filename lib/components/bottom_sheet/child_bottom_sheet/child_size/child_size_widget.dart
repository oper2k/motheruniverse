import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'child_size_model.dart';
export 'child_size_model.dart';

class ChildSizeWidget extends StatefulWidget {
  const ChildSizeWidget({
    Key? key,
    required this.childName,
    required this.currentWeek,
    required this.gender,
  }) : super(key: key);

  final String? childName;
  final int? currentWeek;
  final String? gender;

  @override
  _ChildSizeWidgetState createState() => _ChildSizeWidgetState();
}

class _ChildSizeWidgetState extends State<ChildSizeWidget> {
  late ChildSizeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChildSizeModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.choseWeekIndex = widget.currentWeek!;
        _model.weekInteger = widget.currentWeek;
      });
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.00, 1.00),
      child: StreamBuilder<List<ChildSizeRecord>>(
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
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            );
          }
          List<ChildSizeRecord> containerChildSizeRecordList = snapshot.data!;
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(24.0),
                topRight: Radius.circular(24.0),
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 40.0,
                    height: 4.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).divider,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            'Размер плода',
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
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            Navigator.pop(context);
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
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: Image.network(
                        containerChildSizeRecordList[_model.choseWeekIndex]
                            .image,
                        width: 200.0,
                        height: 200.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 16.0, 20.0, 0.0),
                    child: Builder(
                      builder: (context) {
                        if (_model.choseWeekIndex < widget.currentWeek!) {
                          return Text(
                            'На ${_model.weekInteger?.toString()} неделе ${widget.childName}${widget.gender == 'female' ? ' была, как ' : ' был, как '}${containerChildSizeRecordList[_model.choseWeekIndex].object}',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Inter',
                                  lineHeight: 1.5,
                                ),
                          );
                        } else if (_model.choseWeekIndex ==
                            widget.currentWeek) {
                          return Text(
                            'Сейчас ${widget.childName}, как ${containerChildSizeRecordList[_model.choseWeekIndex].object}',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Inter',
                                  lineHeight: 1.5,
                                ),
                          );
                        } else {
                          return Text(
                            'На ${_model.weekInteger?.toString()} неделе ${widget.childName} будет, как ${containerChildSizeRecordList[_model.choseWeekIndex].object}',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Inter',
                                  lineHeight: 1.5,
                                ),
                          );
                        }
                      },
                    ),
                  ),
                  if (_model.choseWeekIndex == widget.currentWeek)
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await actions.shareFirebaseImage(
                            containerChildSizeRecordList[_model.choseWeekIndex]
                                .shareImage,
                            '',
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).purple,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 15.0, 24.0, 15.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Поделиться',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        lineHeight: 1.28,
                                      ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 0.0, 0.0),
                                  child: Icon(
                                    FFIcons.kshare2,
                                    color: FlutterFlowTheme.of(context).info,
                                    size: 24.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 73.0, 0.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      height: 126.0,
                      decoration: BoxDecoration(),
                      child: Builder(
                        builder: (context) {
                          final weeks = containerChildSizeRecordList.toList();
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:
                                  List.generate(weeks.length, (weeksIndex) {
                                final weeksItem = weeks[weeksIndex];
                                return Builder(
                                  builder: (context) {
                                    if (weeksIndex <= widget.currentWeek!) {
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          setState(() {
                                            _model.choseWeekIndex = weeksIndex;
                                            _model.weekInteger =
                                                weeksItem.weekNumber;
                                          });
                                        },
                                        child: Container(
                                          width: 56.0,
                                          height: 78.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                            border: Border.all(
                                              color: _model
                                                          .choseWeekIndex ==
                                                      weeksIndex
                                                  ? FlutterFlowTheme.of(context)
                                                      .primary
                                                  : FlutterFlowTheme.of(context)
                                                      .divider,
                                              width: 2.0,
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                weeksItem.weekNumber.toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .displayMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          lineHeight: 1.33,
                                                        ),
                                              ),
                                              if (weeksIndex ==
                                                  widget.currentWeek)
                                                Container(
                                                  width: 6.0,
                                                  height: 6.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    shape: BoxShape.circle,
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
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          setState(() {
                                            _model.choseWeekIndex = weeksIndex;
                                            _model.weekInteger =
                                                weeksItem.weekNumber;
                                          });
                                        },
                                        child: Container(
                                          width: 56.0,
                                          height: 78.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                            border: Border.all(
                                              color: _model
                                                          .choseWeekIndex ==
                                                      weeksIndex
                                                  ? FlutterFlowTheme.of(context)
                                                      .primary
                                                  : FlutterFlowTheme.of(context)
                                                      .divider,
                                              width: 2.0,
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                weeksItem.weekNumber.toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                              })
                                      .divide(SizedBox(width: 12.0))
                                      .addToStart(SizedBox(width: 20.0))
                                      .addToEnd(SizedBox(width: 20.0)),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 42.0, 20.0, 45.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                      text: 'Понятно',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 56.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).tertiary,
                        textStyle: FlutterFlowTheme.of(context).headlineLarge,
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
