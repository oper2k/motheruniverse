import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'personalisation_model.dart';
export 'personalisation_model.dart';

class PersonalisationWidget extends StatefulWidget {
  const PersonalisationWidget({Key? key}) : super(key: key);

  @override
  _PersonalisationWidgetState createState() => _PersonalisationWidgetState();
}

class _PersonalisationWidgetState extends State<PersonalisationWidget> {
  late PersonalisationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PersonalisationModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.rightPhoto = FFAppState().tempChild.imageRight;
        _model.leftPhoto = FFAppState().tempChild.imageLeft;
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
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 45.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1.0, -1.0),
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
                            FFIcons.kclose2,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: AutoSizeText(
                          'Персонализация',
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          style: FlutterFlowTheme.of(context).displayLarge,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(32.0, 6.0, 32.0, 0.0),
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Container(
                                width: 236.0,
                                height: 236.0,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.network(
                                  FFAppState().tempChild.photo,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 8.0, 0.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Container(
                                  width: 100.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: _model.rightImageIsChanging
                                        ? Color(0x34E28C13)
                                        : Color(0x19747474),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Builder(
                                    builder: (context) {
                                      if (_model.rightPhoto != null &&
                                          _model.rightPhoto != '') {
                                        return ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          child: Image.network(
                                            _model.rightPhoto!,
                                            width: 100.0,
                                            height: 100.0,
                                            fit: BoxFit.contain,
                                          ),
                                        );
                                      } else {
                                        return Icon(
                                          FFIcons.kplus2,
                                          color: _model.rightImageIsChanging
                                              ? FlutterFlowTheme.of(context)
                                                  .primary
                                              : FlutterFlowTheme.of(context)
                                                  .grey60,
                                          size: 24.0,
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 8.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  setState(() {
                                    _model.leftImageIsChanging = false;
                                    _model.rightImageIsChanging = true;
                                  });
                                },
                                child: Container(
                                  width: 100.0,
                                  height: 100.0,
                                  child: custom_widgets.DottedContainer(
                                    width: 100.0,
                                    height: 100.0,
                                    colorDecoration: _model.rightImageIsChanging
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context)
                                            .primaryText,
                                    intDash: 10,
                                    intSpase: 10,
                                    doubleStrokeWidth: 2.0,
                                    doubleRadius: 20.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          if (_model.rightPhoto != null &&
                              _model.rightPhoto != '')
                            Align(
                              alignment: AlignmentDirectional(1.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  setState(() {
                                    _model.rightPhoto = null;
                                  });
                                },
                                child: Container(
                                  width: 28.0,
                                  height: 28.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    FFIcons.kclose3,
                                    color: FlutterFlowTheme.of(context).grey60,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                            ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 164.0, 0.0, 0.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Container(
                                width: 100.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: _model.leftImageIsChanging
                                      ? Color(0x34E28C13)
                                      : Color(0x19747474),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Builder(
                                  builder: (context) {
                                    if (_model.leftPhoto != null &&
                                        _model.leftPhoto != '') {
                                      return ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        child: Image.network(
                                          _model.leftPhoto!,
                                          width: 100.0,
                                          height: 100.0,
                                          fit: BoxFit.contain,
                                        ),
                                      );
                                    } else {
                                      return Icon(
                                        FFIcons.kplus2,
                                        color: _model.leftImageIsChanging
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : FlutterFlowTheme.of(context)
                                                .grey60,
                                        size: 24.0,
                                      );
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 164.0, 0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                setState(() {
                                  _model.rightImageIsChanging = false;
                                  _model.leftImageIsChanging = true;
                                });
                              },
                              child: Container(
                                width: 100.0,
                                height: 100.0,
                                child: custom_widgets.DottedContainer(
                                  width: 100.0,
                                  height: 100.0,
                                  colorDecoration: _model.leftImageIsChanging
                                      ? FlutterFlowTheme.of(context).primary
                                      : FlutterFlowTheme.of(context)
                                          .primaryText,
                                  intDash: 10,
                                  intSpase: 10,
                                  doubleStrokeWidth: 2.0,
                                  doubleRadius: 20.0,
                                ),
                              ),
                            ),
                          ),
                          if (_model.leftPhoto != null &&
                              _model.leftPhoto != '')
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 156.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  setState(() {
                                    _model.leftPhoto = null;
                                  });
                                },
                                child: Container(
                                  width: 28.0,
                                  height: 28.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    FFIcons.kclose3,
                                    color: FlutterFlowTheme.of(context).grey60,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: Text(
                        'Выбери рисунок',
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: 'Inter',
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600,
                                  lineHeight: 1.3,
                                ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                        child: StreamBuilder<List<PaintsRecord>>(
                          stream: queryPaintsRecord(),
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
                            List<PaintsRecord> paintsPaintsRecordList =
                                snapshot.data!;
                            return SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children:
                                    List.generate(paintsPaintsRecordList.length,
                                            (paintsIndex) {
                                  final paintsPaintsRecord =
                                      paintsPaintsRecordList[paintsIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 24.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0x00FDF5F1),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            paintsPaintsRecord.title,
                                            style: FlutterFlowTheme.of(context)
                                                .headlineMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w600,
                                                  lineHeight: 1.28,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 0.0, 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(),
                                              child: Builder(
                                                builder: (context) {
                                                  final paints =
                                                      paintsPaintsRecord.images
                                                          .toList();
                                                  return GridView.builder(
                                                    padding: EdgeInsets.zero,
                                                    gridDelegate:
                                                        SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 5,
                                                      crossAxisSpacing: 20.0,
                                                      mainAxisSpacing: 10.0,
                                                      childAspectRatio: 1.0,
                                                    ),
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount: paints.length,
                                                    itemBuilder:
                                                        (context, paintsIndex) {
                                                      final paintsItem =
                                                          paints[paintsIndex];
                                                      return InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          if (_model
                                                              .leftImageIsChanging) {
                                                            setState(() {
                                                              _model.leftPhoto =
                                                                  paintsItem;
                                                            });
                                                          } else {
                                                            if (_model
                                                                .rightImageIsChanging) {
                                                              setState(() {
                                                                _model.rightPhoto =
                                                                    paintsItem;
                                                              });
                                                            }
                                                          }
                                                        },
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                          child: Image.network(
                                                            paintsItem,
                                                            width: 300.0,
                                                            height: 200.0,
                                                            fit: BoxFit.contain,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                })
                                        .addToStart(SizedBox(height: 4.0))
                                        .addToEnd(SizedBox(height: 160.0)),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 45.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      setState(() {
                        FFAppState().updateTempChildStruct(
                          (e) => e
                            ..imageLeft = _model.leftPhoto
                            ..imageRight = _model.rightPhoto,
                        );
                      });
                      context.safePop();
                    },
                    text: 'Применить',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 56.0,
                      padding: EdgeInsets.all(0.0),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
