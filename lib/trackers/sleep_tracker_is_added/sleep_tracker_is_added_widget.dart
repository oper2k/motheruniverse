import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/bottom_sheet/loyalty_bottom_sheet/filling_trackers_bonus/filling_trackers_bonus_widget.dart';
import '/components/bottom_sheet/profile_bottom_sheet/add_sleeping_tracker/add_sleeping_tracker_widget.dart';
import '/components/bottom_sheet/profile_bottom_sheet/chose_tracker_sleeping/chose_tracker_sleeping_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sleep_tracker_is_added_model.dart';
export 'sleep_tracker_is_added_model.dart';

class SleepTrackerIsAddedWidget extends StatefulWidget {
  const SleepTrackerIsAddedWidget({
    Key? key,
    required this.tracker,
    required this.child,
    this.secondDay,
  }) : super(key: key);

  final TrackersRecord? tracker;
  final ChildrenRecord? child;
  final TrackersRecord? secondDay;

  @override
  _SleepTrackerIsAddedWidgetState createState() =>
      _SleepTrackerIsAddedWidgetState();
}

class _SleepTrackerIsAddedWidgetState extends State<SleepTrackerIsAddedWidget> {
  late SleepTrackerIsAddedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SleepTrackerIsAddedModel());

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 38.0,
                      decoration: BoxDecoration(),
                      child: Align(
                        alignment: AlignmentDirectional(-1.00, 0.00),
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
                              alignment: AlignmentDirectional(-1.00, 0.00),
                              child: Icon(
                                FFIcons.kleft,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: Text(
                        'Трек добавлен!',
                        style: FlutterFlowTheme.of(context).displayLarge,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(0.0),
                        child: Image.asset(
                          'assets/images/Group_10551.webp',
                          width: 190.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Spacer(flex: 89),
                    Text(
                      'Общее время',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            lineHeight: 1.28,
                          ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                      child: Text(
                        widget.secondDay != null
                            ? functions.calculeteSleepDuratioin(
                                widget.tracker!.trackerStartTime!,
                                widget.secondDay!.sleepEndTime!)
                            : functions.calculeteSleepDuratioin(
                                widget.tracker!.trackerStartTime!,
                                widget.tracker!.sleepEndTime!),
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: 'Inter',
                                  fontSize: 40.0,
                                  fontWeight: FontWeight.bold,
                                  lineHeight: 1.2,
                                ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                      child: Text(
                        'Начало в ${dateTimeFormat(
                          'Hm',
                          widget.tracker?.trackerStartTime,
                          locale: FFLocalizations.of(context).languageCode,
                        )}',
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: 'Inter',
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                  lineHeight: 1.28,
                                ),
                      ),
                    ),
                    Spacer(flex: 127),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 45.0),
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
                                barrierColor:
                                    FlutterFlowTheme.of(context).botomBack,
                                context: context,
                                builder: (context) {
                                  return GestureDetector(
                                    onTap: () => _model
                                            .unfocusNode.canRequestFocus
                                        ? FocusScope.of(context)
                                            .requestFocus(_model.unfocusNode)
                                        : FocusScope.of(context).unfocus(),
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: AddSleepingTrackerWidget(
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
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(14.0),
                              ),
                              child: Icon(
                                FFIcons.kplus2,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await widget.tracker!.reference.delete();

                              context.goNamed(
                                'SleepTrackerPage',
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
                              width: 166.0,
                              height: 48.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).purpleLight,
                                borderRadius: BorderRadius.circular(14.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 12.0, 24.0, 12.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Начать заново',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineLarge
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .purple,
                                            fontSize: 16.0,
                                            lineHeight: 1.25,
                                          ),
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
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                barrierColor:
                                    FlutterFlowTheme.of(context).botomBack,
                                context: context,
                                builder: (context) {
                                  return GestureDetector(
                                    onTap: () => _model
                                            .unfocusNode.canRequestFocus
                                        ? FocusScope.of(context)
                                            .requestFocus(_model.unfocusNode)
                                        : FocusScope.of(context).unfocus(),
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: ChoseTrackerSleepingWidget(
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
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(14.0),
                              ),
                              child: Icon(
                                FFIcons.kcategory,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
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
            );
          },
        ),
      ),
    );
  }
}
