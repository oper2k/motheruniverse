import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/bottom_sheet/loyalty_bottom_sheet/filling_trackers_bonus/filling_trackers_bonus_widget.dart';
import '/components/bottom_sheet/profile_bottom_sheet/add_breast_tracker/add_breast_tracker_widget.dart';
import '/components/bottom_sheet/profile_bottom_sheet/chose_tracker_breast/chose_tracker_breast_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'breast_tracker_is_added_model.dart';
export 'breast_tracker_is_added_model.dart';

class BreastTrackerIsAddedWidget extends StatefulWidget {
  const BreastTrackerIsAddedWidget({
    super.key,
    required this.track,
    required this.child,
  });

  final TrackersRecord? track;
  final ChildrenRecord? child;

  @override
  State<BreastTrackerIsAddedWidget> createState() =>
      _BreastTrackerIsAddedWidgetState();
}

class _BreastTrackerIsAddedWidgetState
    extends State<BreastTrackerIsAddedWidget> {
  late BreastTrackerIsAddedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BreastTrackerIsAddedModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (((currentUserDocument?.trackersAddingDates?.toList() ?? []).length >=
              10) &&
          valueOrDefault<bool>(
              currentUserDocument?.loyaltyProgramActivated, false)) {
        await currentUserReference!.update({
          ...createUsersRecordData(
            loyaltyBonuses: functions.addBonusesToUser(
                valueOrDefault(currentUserDocument?.loyaltyBonuses, 0.0), 50.0),
          ),
          ...mapToFirestore(
            {
              'trackers_adding_dates': functions.clearDateTimeList(
                  (currentUserDocument?.trackersAddingDates?.toList() ?? [])
                      .toList()),
            },
          ),
        });
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          barrierColor: FlutterFlowTheme.of(context).botomBack,
          context: context,
          builder: (context) {
            return GestureDetector(
              onTap: () => _model.unfocusNode.canRequestFocus
                  ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                  : FocusScope.of(context).unfocus(),
              child: Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: FillingTrackersBonusWidget(),
              ),
            );
          },
        ).then((value) => safeSetState(() {}));
      }
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
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).backgroundMain,
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 45.0, 20.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                height: 38.0,
                decoration: BoxDecoration(),
                child: Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.goNamed('TrackersPage');
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: Text(
                  'Трек добавлен!',
                  style: FlutterFlowTheme.of(context).displayLarge,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: Image.asset(
                    'assets/images/afyfv-hgsfh.webp',
                    width: MediaQuery.sizeOf(context).width * 0.5,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 37.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Кормление левой',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    lineHeight: 1.28,
                                  ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 2.0, 0.0, 0.0),
                          child: Text(
                            functions
                                .calculateMinutesAndSecondsFromMilliseconds(
                                    widget.track!.breastLeftDuration),
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
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Кормление правой',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    lineHeight: 1.28,
                                  ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 2.0, 0.0, 0.0),
                          child: Text(
                            functions
                                .calculateMinutesAndSecondsFromMilliseconds(
                                    widget.track!.breastRightDuration),
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
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                child: Text(
                  'Общее время',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Inter',
                        lineHeight: 1.28,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                child: Text(
                  functions.calculateMinutesAndSecondsFromMilliseconds(
                      widget.track!.breastTotalDuration),
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                        fontFamily: 'Inter',
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        lineHeight: 1.2,
                      ),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 45.0),
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
                        setState(() {
                          FFAppState().customPickerItemIndex1 = 0;
                          FFAppState().customPickerItemIndex2 = 0;
                        });
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          barrierColor: FlutterFlowTheme.of(context).botomBack,
                          enableDrag: false,
                          context: context,
                          builder: (context) {
                            return GestureDetector(
                              onTap: () => _model.unfocusNode.canRequestFocus
                                  ? FocusScope.of(context)
                                      .requestFocus(_model.unfocusNode)
                                  : FocusScope.of(context).unfocus(),
                              child: Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: AddBreastTrackerWidget(
                                  child: widget.child!,
                                ),
                              ),
                            );
                          },
                        ).then((value) => safeSetState(() {}));
                      },
                      child: Container(
                        width: 48.0,
                        height: 48.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        child: Icon(
                          FFIcons.kplus2,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        await widget.track!.reference.delete();

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
                      text: 'Начать заново',
                      options: FFButtonOptions(
                        width: 166.0,
                        height: 48.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).yellow,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Inter',
                                  color: Colors.white,
                                ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          barrierColor: FlutterFlowTheme.of(context).botomBack,
                          context: context,
                          builder: (context) {
                            return GestureDetector(
                              onTap: () => _model.unfocusNode.canRequestFocus
                                  ? FocusScope.of(context)
                                      .requestFocus(_model.unfocusNode)
                                  : FocusScope.of(context).unfocus(),
                              child: Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: ChoseTrackerBreastWidget(
                                  child: widget.child!,
                                ),
                              ),
                            );
                          },
                        ).then((value) => safeSetState(() {}));
                      },
                      child: Container(
                        width: 48.0,
                        height: 48.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        child: Icon(
                          FFIcons.kcategory,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
