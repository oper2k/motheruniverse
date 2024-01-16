import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'doctor_visiting_page_model.dart';
export 'doctor_visiting_page_model.dart';

class DoctorVisitingPageWidget extends StatefulWidget {
  const DoctorVisitingPageWidget({
    Key? key,
    required this.currentWeek,
    required this.child,
  }) : super(key: key);

  final int? currentWeek;
  final ChildrenRecord? child;

  @override
  _DoctorVisitingPageWidgetState createState() =>
      _DoctorVisitingPageWidgetState();
}

class _DoctorVisitingPageWidgetState extends State<DoctorVisitingPageWidget> {
  late DoctorVisitingPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DoctorVisitingPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (functions.calculateElapsedMonths(widget.child!.birthDate!) < 1) {
        setState(() {
          _model.initialIndex = 0;
        });
      } else if (functions.calculateElapsedMonths(widget.child!.birthDate!) <
          2) {
        setState(() {
          _model.initialIndex = 1;
        });
      } else if (functions.calculateElapsedMonths(widget.child!.birthDate!) <
          3) {
        setState(() {
          _model.initialIndex = 2;
        });
      } else if (functions.calculateElapsedMonths(widget.child!.birthDate!) <
          4) {
        setState(() {
          _model.initialIndex = 3;
        });
      } else if (functions.calculateElapsedMonths(widget.child!.birthDate!) <
          5) {
        setState(() {
          _model.initialIndex = 4;
        });
      } else if (functions.calculateElapsedMonths(widget.child!.birthDate!) <
          6) {
        setState(() {
          _model.initialIndex = 5;
        });
      } else if (functions.calculateElapsedMonths(widget.child!.birthDate!) <
          7) {
        setState(() {
          _model.initialIndex = 6;
        });
      } else if (functions.calculateElapsedMonths(widget.child!.birthDate!) <
          8) {
        setState(() {
          _model.initialIndex = 7;
        });
      } else if (functions.calculateElapsedMonths(widget.child!.birthDate!) <
          9) {
        setState(() {
          _model.initialIndex = 8;
        });
      } else if (functions.calculateElapsedMonths(widget.child!.birthDate!) <
          10) {
        setState(() {
          _model.initialIndex = 9;
        });
      } else if (functions.calculateElapsedMonths(widget.child!.birthDate!) <
          11) {
        setState(() {
          _model.initialIndex = 10;
        });
      } else if (functions.calculateElapsedMonths(widget.child!.birthDate!) <
          12) {
        setState(() {
          _model.initialIndex = 11;
        });
      } else if (functions.calculateElapsedMonths(widget.child!.birthDate!) <
          15) {
        setState(() {
          _model.initialIndex = 12;
        });
      } else if (functions.calculateElapsedMonths(widget.child!.birthDate!) <
          24) {
        setState(() {
          _model.initialIndex = 13;
        });
      } else if (functions.calculateElapsedMonths(widget.child!.birthDate!) <
          36) {
        setState(() {
          _model.initialIndex = 14;
        });
      } else {
        setState(() {
          _model.initialIndex = 15;
        });
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
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 45.0, 0.0, 110.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
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
                            FFIcons.kleft,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 0.0),
                            child: Text(
                              'Посещение врачей',
                              style: FlutterFlowTheme.of(context).displayLarge,
                            ),
                          ),
                          Text(
                            'Наши рекомедации по датам и врачам, которых необходимо посетить в данный промежуток',
                            style: FlutterFlowTheme.of(context)
                                .displayMedium
                                .override(
                                  fontFamily: 'Inter',
                                  lineHeight: 1.5,
                                ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 24.0, 0.0, 0.0),
                            child: StreamBuilder<List<AgeRecord>>(
                              stream: queryAgeRecord(
                                queryBuilder: (ageRecord) =>
                                    ageRecord.orderBy('sort'),
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
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<AgeRecord> ageQueryAgeRecordList =
                                    snapshot.data!;
                                return Container(
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await _model.pageViewController
                                                  ?.previousPage(
                                                duration:
                                                    Duration(milliseconds: 300),
                                                curve: Curves.ease,
                                              );
                                              setState(() {
                                                _model.initialIndex =
                                                    _model.pageViewCurrentIndex;
                                              });
                                            },
                                            child: Container(
                                              width: 40.0,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              child: Icon(
                                                FFIcons.kright4,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 24.0,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                ageQueryAgeRecordList[
                                                        _model.initialIndex]
                                                    .age,
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 0.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await _model.pageViewController
                                                    ?.nextPage(
                                                  duration: Duration(
                                                      milliseconds: 300),
                                                  curve: Curves.ease,
                                                );
                                                setState(() {
                                                  _model.initialIndex = _model
                                                      .pageViewCurrentIndex;
                                                });
                                              },
                                              child: Container(
                                                width: 40.0,
                                                height: 40.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                child: Icon(
                                                  FFIcons.kright10,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 24.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 16.0, 0.0, 0.0),
                                        child: StreamBuilder<UsersRecord>(
                                          stream: UsersRecord.getDocument(
                                              currentUserReference!),
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
                                            final usersQueryUsersRecord =
                                                snapshot.data!;
                                            return Container(
                                              decoration: BoxDecoration(),
                                              child: StreamBuilder<
                                                  List<
                                                      CreatedDoctorVisitingRecord>>(
                                                stream:
                                                    queryCreatedDoctorVisitingRecord(
                                                  parent: currentUserReference,
                                                  queryBuilder:
                                                      (createdDoctorVisitingRecord) =>
                                                          createdDoctorVisitingRecord
                                                              .where(
                                                    'age',
                                                    isEqualTo:
                                                        ageQueryAgeRecordList[
                                                                _model
                                                                    .initialIndex]
                                                            .age,
                                                  ),
                                                ),
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
                                                  List<CreatedDoctorVisitingRecord>
                                                      createdDoctorQueryCreatedDoctorVisitingRecordList =
                                                      snapshot.data!;
                                                  return Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(),
                                                    child: StreamBuilder<
                                                        List<DoctorsRecord>>(
                                                      stream:
                                                          queryDoctorsRecord(
                                                        queryBuilder:
                                                            (doctorsRecord) =>
                                                                doctorsRecord
                                                                    .where(
                                                          'age',
                                                          isEqualTo:
                                                              ageQueryAgeRecordList[
                                                                      _model
                                                                          .initialIndex]
                                                                  .age,
                                                        ),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
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
                                                        return Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Builder(
                                                            builder: (context) {
                                                              final ageCounter =
                                                                  ageQueryAgeRecordList
                                                                      .toList();
                                                              return Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 500.0,
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          40.0),
                                                                  child: PageView
                                                                      .builder(
                                                                    controller: _model.pageViewController ??= PageController(
                                                                        initialPage: min(
                                                                            valueOrDefault<int>(
                                                                              _model.initialIndex,
                                                                              0,
                                                                            ),
                                                                            ageCounter.length - 1)),
                                                                    onPageChanged:
                                                                        (_) async {
                                                                      setState(
                                                                          () {
                                                                        _model.initialIndex =
                                                                            _model.pageViewCurrentIndex;
                                                                      });
                                                                    },
                                                                    scrollDirection:
                                                                        Axis.horizontal,
                                                                    itemCount:
                                                                        ageCounter
                                                                            .length,
                                                                    itemBuilder:
                                                                        (context,
                                                                            ageCounterIndex) {
                                                                      final ageCounterItem =
                                                                          ageCounter[
                                                                              ageCounterIndex];
                                                                      return SingleChildScrollView(
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Builder(
                                                                              builder: (context) {
                                                                                final currentDoctors = containerDoctorsRecordList.toList();
                                                                                return Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: List.generate(currentDoctors.length, (currentDoctorsIndex) {
                                                                                    final currentDoctorsItem = currentDoctors[currentDoctorsIndex];
                                                                                    return Container(
                                                                                      width: double.infinity,
                                                                                      decoration: BoxDecoration(),
                                                                                      child: Builder(
                                                                                        builder: (context) {
                                                                                          if (!usersQueryUsersRecord.passedDoctors.contains(currentDoctorsItem.reference.id)) {
                                                                                            return Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                                                                                                  child: InkWell(
                                                                                                    splashColor: Colors.transparent,
                                                                                                    focusColor: Colors.transparent,
                                                                                                    hoverColor: Colors.transparent,
                                                                                                    highlightColor: Colors.transparent,
                                                                                                    onTap: () async {
                                                                                                      await usersQueryUsersRecord.reference.update({
                                                                                                        ...mapToFirestore(
                                                                                                          {
                                                                                                            'passed_doctors': FieldValue.arrayUnion([
                                                                                                              currentDoctorsItem.reference.id
                                                                                                            ]),
                                                                                                          },
                                                                                                        ),
                                                                                                      });
                                                                                                    },
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Expanded(
                                                                                                          child: RichText(
                                                                                                            textScaleFactor: MediaQuery.of(context).textScaleFactor,
                                                                                                            text: TextSpan(
                                                                                                              children: [
                                                                                                                TextSpan(
                                                                                                                  text: currentDoctorsItem.name,
                                                                                                                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                                        fontFamily: 'Inter',
                                                                                                                        fontWeight: FontWeight.w500,
                                                                                                                        lineHeight: 1.25,
                                                                                                                      ),
                                                                                                                ),
                                                                                                                TextSpan(
                                                                                                                  text: ' ${currentDoctorsItem.description}',
                                                                                                                  style: TextStyle(),
                                                                                                                )
                                                                                                              ],
                                                                                                              style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                                    fontFamily: 'Inter',
                                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Container(
                                                                                                          width: 30.0,
                                                                                                          height: 30.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            shape: BoxShape.circle,
                                                                                                            border: Border.all(
                                                                                                              color: FlutterFlowTheme.of(context).grey40,
                                                                                                              width: 2.0,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                Container(
                                                                                                  width: double.infinity,
                                                                                                  height: 1.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).grey20,
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            );
                                                                                          } else {
                                                                                            return Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                                                                                                  child: InkWell(
                                                                                                    splashColor: Colors.transparent,
                                                                                                    focusColor: Colors.transparent,
                                                                                                    hoverColor: Colors.transparent,
                                                                                                    highlightColor: Colors.transparent,
                                                                                                    onTap: () async {
                                                                                                      await usersQueryUsersRecord.reference.update({
                                                                                                        ...mapToFirestore(
                                                                                                          {
                                                                                                            'passed_doctors': FieldValue.arrayRemove([
                                                                                                              currentDoctorsItem.reference.id
                                                                                                            ]),
                                                                                                          },
                                                                                                        ),
                                                                                                      });
                                                                                                    },
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Expanded(
                                                                                                          child: RichText(
                                                                                                            textScaleFactor: MediaQuery.of(context).textScaleFactor,
                                                                                                            text: TextSpan(
                                                                                                              children: [
                                                                                                                TextSpan(
                                                                                                                  text: currentDoctorsItem.name,
                                                                                                                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                                        fontFamily: 'Inter',
                                                                                                                        color: FlutterFlowTheme.of(context).grey40,
                                                                                                                        fontWeight: FontWeight.w500,
                                                                                                                        decoration: TextDecoration.lineThrough,
                                                                                                                        lineHeight: 1.25,
                                                                                                                      ),
                                                                                                                ),
                                                                                                                TextSpan(
                                                                                                                  text: ' ${currentDoctorsItem.description}',
                                                                                                                  style: TextStyle(
                                                                                                                    color: FlutterFlowTheme.of(context).grey40,
                                                                                                                    decoration: TextDecoration.lineThrough,
                                                                                                                  ),
                                                                                                                )
                                                                                                              ],
                                                                                                              style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                                    fontFamily: 'Inter',
                                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Container(
                                                                                                          width: 30.0,
                                                                                                          height: 30.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                                            shape: BoxShape.circle,
                                                                                                          ),
                                                                                                          child: Icon(
                                                                                                            FFIcons.kcheckMini,
                                                                                                            color: Colors.white,
                                                                                                            size: 24.0,
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                Container(
                                                                                                  width: double.infinity,
                                                                                                  height: 1.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).grey20,
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            );
                                                                                          }
                                                                                        },
                                                                                      ),
                                                                                    );
                                                                                  }),
                                                                                );
                                                                              },
                                                                            ),
                                                                            Builder(
                                                                              builder: (context) {
                                                                                final usersDoctors = createdDoctorQueryCreatedDoctorVisitingRecordList.toList();
                                                                                return Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: List.generate(usersDoctors.length, (usersDoctorsIndex) {
                                                                                    final usersDoctorsItem = usersDoctors[usersDoctorsIndex];
                                                                                    return Container(
                                                                                      width: double.infinity,
                                                                                      decoration: BoxDecoration(),
                                                                                      child: Builder(
                                                                                        builder: (context) {
                                                                                          if (!usersQueryUsersRecord.passedDoctors.contains(usersDoctorsItem.reference.id)) {
                                                                                            return Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                                                                                                  child: InkWell(
                                                                                                    splashColor: Colors.transparent,
                                                                                                    focusColor: Colors.transparent,
                                                                                                    hoverColor: Colors.transparent,
                                                                                                    highlightColor: Colors.transparent,
                                                                                                    onTap: () async {
                                                                                                      await usersQueryUsersRecord.reference.update({
                                                                                                        ...mapToFirestore(
                                                                                                          {
                                                                                                            'passed_doctors': FieldValue.arrayUnion([
                                                                                                              usersDoctorsItem.reference.id
                                                                                                            ]),
                                                                                                          },
                                                                                                        ),
                                                                                                      });
                                                                                                    },
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Expanded(
                                                                                                          child: RichText(
                                                                                                            textScaleFactor: MediaQuery.of(context).textScaleFactor,
                                                                                                            text: TextSpan(
                                                                                                              children: [
                                                                                                                TextSpan(
                                                                                                                  text: usersDoctorsItem.name,
                                                                                                                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                                        fontFamily: 'Inter',
                                                                                                                        fontWeight: FontWeight.w500,
                                                                                                                        lineHeight: 1.25,
                                                                                                                      ),
                                                                                                                ),
                                                                                                                TextSpan(
                                                                                                                  text: ' ${usersDoctorsItem.description}',
                                                                                                                  style: TextStyle(),
                                                                                                                )
                                                                                                              ],
                                                                                                              style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                                    fontFamily: 'Inter',
                                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Container(
                                                                                                          width: 30.0,
                                                                                                          height: 30.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            shape: BoxShape.circle,
                                                                                                            border: Border.all(
                                                                                                              color: FlutterFlowTheme.of(context).grey40,
                                                                                                              width: 2.0,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                Container(
                                                                                                  width: double.infinity,
                                                                                                  height: 1.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).grey20,
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            );
                                                                                          } else {
                                                                                            return Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                                                                                                  child: InkWell(
                                                                                                    splashColor: Colors.transparent,
                                                                                                    focusColor: Colors.transparent,
                                                                                                    hoverColor: Colors.transparent,
                                                                                                    highlightColor: Colors.transparent,
                                                                                                    onTap: () async {
                                                                                                      await usersQueryUsersRecord.reference.update({
                                                                                                        ...mapToFirestore(
                                                                                                          {
                                                                                                            'passed_doctors': FieldValue.arrayRemove([
                                                                                                              usersDoctorsItem.reference.id
                                                                                                            ]),
                                                                                                          },
                                                                                                        ),
                                                                                                      });
                                                                                                    },
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Expanded(
                                                                                                          child: RichText(
                                                                                                            textScaleFactor: MediaQuery.of(context).textScaleFactor,
                                                                                                            text: TextSpan(
                                                                                                              children: [
                                                                                                                TextSpan(
                                                                                                                  text: usersDoctorsItem.name,
                                                                                                                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                                        fontFamily: 'Inter',
                                                                                                                        color: FlutterFlowTheme.of(context).grey40,
                                                                                                                        fontWeight: FontWeight.w500,
                                                                                                                        decoration: TextDecoration.lineThrough,
                                                                                                                        lineHeight: 1.25,
                                                                                                                      ),
                                                                                                                ),
                                                                                                                TextSpan(
                                                                                                                  text: ' ${usersDoctorsItem.description}',
                                                                                                                  style: TextStyle(
                                                                                                                    color: FlutterFlowTheme.of(context).grey40,
                                                                                                                    fontSize: 14.0,
                                                                                                                  ),
                                                                                                                )
                                                                                                              ],
                                                                                                              style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                                    fontFamily: 'Inter',
                                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Container(
                                                                                                          width: 30.0,
                                                                                                          height: 30.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                                            shape: BoxShape.circle,
                                                                                                          ),
                                                                                                          child: Icon(
                                                                                                            FFIcons.kcheckMini,
                                                                                                            color: Colors.white,
                                                                                                            size: 24.0,
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                Container(
                                                                                                  width: double.infinity,
                                                                                                  height: 1.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).grey20,
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            );
                                                                                          }
                                                                                        },
                                                                                      ),
                                                                                    );
                                                                                  }),
                                                                                );
                                                                              },
                                                                            ),
                                                                          ].addToEnd(SizedBox(height: 10.0)),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 45.0),
                  child: StreamBuilder<List<AgeRecord>>(
                    stream: queryAgeRecord(
                      queryBuilder: (ageRecord) => ageRecord.orderBy('sort'),
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
                      List<AgeRecord> buttonAgeRecordList = snapshot.data!;
                      return FFButtonWidget(
                        onPressed: () async {
                          context.pushNamed(
                            'CreateDoctorVisitingPage',
                            queryParameters: {
                              'age': serializeParam(
                                buttonAgeRecordList[_model.initialIndex].age,
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );
                        },
                        text: 'Добавить посещение',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 56.0,
                          padding: EdgeInsets.all(0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle: FlutterFlowTheme.of(context).displaySmall,
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        showLoadingIndicator: false,
                      );
                    },
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
