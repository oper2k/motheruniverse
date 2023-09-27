import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chose_tracker_sleeping_model.dart';
export 'chose_tracker_sleeping_model.dart';

class ChoseTrackerSleepingWidget extends StatefulWidget {
  const ChoseTrackerSleepingWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  final ChildrenRecord? child;

  @override
  _ChoseTrackerSleepingWidgetState createState() =>
      _ChoseTrackerSleepingWidgetState();
}

class _ChoseTrackerSleepingWidgetState
    extends State<ChoseTrackerSleepingWidget> {
  late ChoseTrackerSleepingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChoseTrackerSleepingModel());
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
      child: Container(
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
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 0.0),
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
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(28.0, 0.0, 0.0, 0.0),
                        child: AutoSizeText(
                          'Выберите раздел',
                          textAlign: TextAlign.center,
                          maxLines: 2,
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
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 28.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.goNamed(
                          'BreastTrackerPage',
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
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 104.0,
                            height: 56.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).iconColor,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Icon(
                              FFIcons.kbreast,
                              color: Colors.white,
                              size: 40.0,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: Text(
                              'Грудь',
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Inter',
                                    color:
                                        FlutterFlowTheme.of(context).iconColor,
                                    fontWeight: FontWeight.w600,
                                    lineHeight: 1.25,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 104.0,
                          height: 56.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).blueLight,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Icon(
                            FFIcons.kmoon,
                            color: FlutterFlowTheme.of(context).blue,
                            size: 40.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
                          child: Text(
                            'Сон',
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context).blue,
                                  fontWeight: FontWeight.w600,
                                  lineHeight: 1.25,
                                ),
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.goNamed(
                          'FeedingTrackerPage',
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
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 104.0,
                            height: 56.0,
                            decoration: BoxDecoration(
                              color: Color(0xFFFB3A68),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Icon(
                              FFIcons.kbottle,
                              color: Colors.white,
                              size: 40.0,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: Text(
                              'Прикорм',
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Inter',
                                    color: Color(0xFFFB3A68),
                                    fontWeight: FontWeight.w600,
                                    lineHeight: 1.25,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 38.0, 0.0, 45.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  text: 'Закрыть',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 56.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
      ),
    );
  }
}
