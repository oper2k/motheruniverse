import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chose_the_date_of_tracker_model.dart';
export 'chose_the_date_of_tracker_model.dart';

class ChoseTheDateOfTrackerWidget extends StatefulWidget {
  const ChoseTheDateOfTrackerWidget({Key? key}) : super(key: key);

  @override
  _ChoseTheDateOfTrackerWidgetState createState() =>
      _ChoseTheDateOfTrackerWidgetState();
}

class _ChoseTheDateOfTrackerWidgetState
    extends State<ChoseTheDateOfTrackerWidget> {
  late ChoseTheDateOfTrackerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChoseTheDateOfTrackerModel());
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(28.0, 0.0, 0.0, 0.0),
                        child: AutoSizeText(
                          'Выберите дату',
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
              Container(
                width: double.infinity,
                height: 220.0,
                child: custom_widgets.CustomPicker(
                  width: double.infinity,
                  height: 220.0,
                  horizontalPadding: 0.0,
                  backgroundColor:
                      FlutterFlowTheme.of(context).primaryBackground,
                  lineColor: Colors.transparent,
                  textColor: FlutterFlowTheme.of(context).secondaryText,
                  initialItemIndexFirst: FFAppState().customPickerItemIndex1,
                  initialItemIndexSecond: FFAppState().customPickerItemIndex2,
                  initialItemIndexThird: FFAppState().customPickerItemIndex3,
                  itemExtent: 30.0,
                  borderRadius: 0.0,
                  textSizeItem1: 24.0,
                  textSizeItem2: 24.0,
                  textSizeItem3: 24.0,
                  items1: functions.return31days(),
                  items3: functions.getLastTwentyYears(),
                  items2: FFAppState().monthsList,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 45.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    Navigator.pop(
                        context,
                        functions.createDateTimeFromIndices(
                            FFAppState().customPickerItemIndex1,
                            FFAppState().customPickerItemIndex2,
                            FFAppState().customPickerItemIndex3));
                  },
                  text: 'Применить',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 56.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).displaySmall,
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
          ),
        ),
      ),
    );
  }
}
