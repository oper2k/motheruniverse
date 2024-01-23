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
import 'breast_feeding_info_model.dart';
export 'breast_feeding_info_model.dart';

class BreastFeedingInfoWidget extends StatefulWidget {
  const BreastFeedingInfoWidget({
    Key? key,
    required this.track,
  }) : super(key: key);

  final TrackersRecord? track;

  @override
  _BreastFeedingInfoWidgetState createState() =>
      _BreastFeedingInfoWidgetState();
}

class _BreastFeedingInfoWidgetState extends State<BreastFeedingInfoWidget> {
  late BreastFeedingInfoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BreastFeedingInfoModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).backgroundMain,
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
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await widget.track!.reference.delete();
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 38.0,
                            height: 38.0,
                            decoration: BoxDecoration(),
                            child: Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Icon(
                                FFIcons.kdel,
                                color: FlutterFlowTheme.of(context).error,
                                size: 24.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 14.0,
                      height: 14.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
                      child: AutoSizeText(
                        'Кормление грудью',
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                  lineHeight: 1.25,
                                ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(1.0, 0.0),
                        child: InkWell(
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
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                child: Text(
                  '${functions.formatDateInDayNumberMonthStringYearNumber(widget.track!.trackerStartTime!)} с ${dateTimeFormat(
                    'Hm',
                    widget.track?.trackerStartTime,
                    locale: FFLocalizations.of(context).languageCode,
                  )} до ${dateTimeFormat(
                    'Hm',
                    widget.track?.breastEndTime,
                    locale: FFLocalizations.of(context).languageCode,
                  )}',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).displayMedium.override(
                        fontFamily: 'Inter',
                        lineHeight: 1.5,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Кормление левой',
                      style: FlutterFlowTheme.of(context).displayMedium,
                    ),
                    Text(
                      functions.calculateMinutesAndSecondsFromMilliseconds(
                          widget.track!.breastLeftDuration),
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                lineHeight: 1.25,
                              ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Кормление правой',
                      style: FlutterFlowTheme.of(context).displayMedium,
                    ),
                    Text(
                      functions.calculateMinutesAndSecondsFromMilliseconds(
                          widget.track!.breastRightDuration),
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                lineHeight: 1.25,
                              ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Общее время',
                      style: FlutterFlowTheme.of(context).displayMedium,
                    ),
                    Text(
                      functions.calculateMinutesAndSecondsFromMilliseconds(
                          widget.track!.breastTotalDuration),
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                lineHeight: 1.25,
                              ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 86.0, 0.0, 45.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  text: 'Понятно',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 56.0,
                    padding: EdgeInsets.all(0.0),
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
