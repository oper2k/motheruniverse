import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'vaccination_calendar_page_model.dart';
export 'vaccination_calendar_page_model.dart';

class VaccinationCalendarPageWidget extends StatefulWidget {
  const VaccinationCalendarPageWidget({
    super.key,
    required this.currentWeek,
    required this.birthDate,
    required this.child,
  });

  final int? currentWeek;
  final DateTime? birthDate;
  final ChildrenRecord? child;

  @override
  State<VaccinationCalendarPageWidget> createState() =>
      _VaccinationCalendarPageWidgetState();
}

class _VaccinationCalendarPageWidgetState
    extends State<VaccinationCalendarPageWidget> {
  late VaccinationCalendarPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VaccinationCalendarPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (functions.getCountOfDays(widget.birthDate!) < 3) {
        setState(() {
          _model.initialIndex = 0;
        });
      } else if (functions.getCountOfDays(widget.birthDate!) <= 7) {
        setState(() {
          _model.initialIndex = 1;
        });
      } else if (functions.getCountOfDays(widget.birthDate!) < 61) {
        setState(() {
          _model.initialIndex = 2;
        });
      } else if (functions.getCountOfDays(widget.birthDate!) < 91) {
        setState(() {
          _model.initialIndex = 3;
        });
      } else if (functions.getCountOfDays(widget.birthDate!) < 137) {
        setState(() {
          _model.initialIndex = 4;
        });
      } else if (functions.getCountOfDays(widget.birthDate!) <= 182) {
        setState(() {
          _model.initialIndex = 5;
        });
      } else if (functions.getCountOfDays(widget.birthDate!) <= 364) {
        setState(() {
          _model.initialIndex = 6;
        });
      } else if (functions.getCountOfDays(widget.birthDate!) <= 457) {
        setState(() {
          _model.initialIndex = 7;
        });
      } else if (functions.getCountOfDays(widget.birthDate!) < 549) {
        setState(() {
          _model.initialIndex = 8;
        });
      } else if (functions.getCountOfDays(widget.birthDate!) < 609) {
        setState(() {
          _model.initialIndex = 9;
        });
      } else if (functions.getCountOfDays(widget.birthDate!) < 2191) {
        setState(() {
          _model.initialIndex = 10;
        });
      } else if (functions.getCountOfDays(widget.birthDate!) < 2556) {
        setState(() {
          _model.initialIndex = 11;
        });
      } else if (functions.getCountOfDays(widget.birthDate!) < 4748) {
        setState(() {
          _model.initialIndex = 12;
        });
      } else if (functions.getCountOfDays(widget.birthDate!) < 5113) {
        setState(() {
          _model.initialIndex = 13;
        });
      } else if (functions.getCountOfDays(widget.birthDate!) < 5844) {
        setState(() {
          _model.initialIndex = 14;
        });
      } else {
        setState(() {
          _model.initialIndex = 15;
        });
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
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).backgroundMain,
        body: StreamBuilder<List<VaccinatePeriodRecord>>(
          stream: queryVaccinatePeriodRecord(
            queryBuilder: (vaccinatePeriodRecord) =>
                vaccinatePeriodRecord.orderBy('sort'),
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
            List<VaccinatePeriodRecord> containerVaccinatePeriodRecordList =
                snapshot.data!;
            return Container(
              decoration: const BoxDecoration(),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: Stack(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 45.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 38.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                            child: Align(
                              alignment: const AlignmentDirectional(-1.0, -1.0),
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
                                  decoration: const BoxDecoration(),
                                  child: Icon(
                                    FFIcons.kleft,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 16.0, 0.0, 0.0),
                                    child: Text(
                                      'Календарь прививок',
                                      style: FlutterFlowTheme.of(context)
                                          .displayLarge,
                                    ),
                                  ),
                                  Text(
                                    'Наши рекомедации по прививкам, которые необходимо поставить, разделенные по возрасту ребенка',
                                    style: FlutterFlowTheme.of(context)
                                        .displayMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          lineHeight: 1.5,
                                        ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 24.0, 0.0, 0.0),
                                    child: StreamBuilder<
                                        List<VaccinatePeriodRecord>>(
                                      stream: queryVaccinatePeriodRecord(
                                        queryBuilder: (vaccinatePeriodRecord) =>
                                            vaccinatePeriodRecord
                                                .orderBy('sort'),
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
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<VaccinatePeriodRecord>
                                            vacinationPeriodQueryVaccinatePeriodRecordList =
                                            snapshot.data!;
                                        return Container(
                                          decoration: const BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      await _model
                                                          .pageViewController
                                                          ?.previousPage(
                                                        duration: const Duration(
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                      child: Icon(
                                                        FFIcons.kright4,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  20.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        vacinationPeriodQueryVaccinatePeriodRecordList[
                                                                _model
                                                                    .initialIndex]
                                                            .period,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(20.0, 0.0,
                                                                0.0, 0.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        await _model
                                                            .pageViewController
                                                            ?.nextPage(
                                                          duration: const Duration(
                                                              milliseconds:
                                                                  300),
                                                          curve: Curves.ease,
                                                        );
                                                        setState(() {
                                                          _model.initialIndex =
                                                              _model
                                                                  .pageViewCurrentIndex;
                                                        });
                                                      },
                                                      child: Container(
                                                        width: 40.0,
                                                        height: 40.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        child: Icon(
                                                          FFIcons.kright10,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 16.0, 0.0, 0.0),
                                                child:
                                                    StreamBuilder<UsersRecord>(
                                                  stream:
                                                      UsersRecord.getDocument(
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
                                                    final userQueryUsersRecord =
                                                        snapshot.data!;
                                                    return Container(
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: StreamBuilder<
                                                          List<
                                                              CreatedVaccineRecord>>(
                                                        stream:
                                                            queryCreatedVaccineRecord(
                                                          parent:
                                                              currentUserReference,
                                                          queryBuilder:
                                                              (createdVaccineRecord) =>
                                                                  createdVaccineRecord
                                                                      .where(
                                                                        'period_vaccinating',
                                                                        isEqualTo:
                                                                            vacinationPeriodQueryVaccinatePeriodRecordList[_model.initialIndex].period,
                                                                      )
                                                                      .where(
                                                                        'child',
                                                                        isEqualTo: widget
                                                                            .child
                                                                            ?.reference,
                                                                      )
                                                                      .orderBy(
                                                                          'date'),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
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
                                                          List<CreatedVaccineRecord>
                                                              createdVaccinesQueryCreatedVaccineRecordList =
                                                              snapshot.data!;
                                                          return Container(
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                const BoxDecoration(),
                                                            child: StreamBuilder<
                                                                List<
                                                                    VaccinationsRecord>>(
                                                              stream:
                                                                  queryVaccinationsRecord(
                                                                queryBuilder: (vaccinationsRecord) =>
                                                                    vaccinationsRecord
                                                                        .where(
                                                                          'period_vacinating',
                                                                          isEqualTo:
                                                                              vacinationPeriodQueryVaccinatePeriodRecordList[_model.initialIndex].period,
                                                                        )
                                                                        .orderBy(
                                                                            'age_of_child_in_days'),
                                                              ),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          50.0,
                                                                      height:
                                                                          50.0,
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        valueColor:
                                                                            AlwaysStoppedAnimation<Color>(
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<VaccinationsRecord>
                                                                    vaccinationsQueryVaccinationsRecordList =
                                                                    snapshot
                                                                        .data!;
                                                                return Container(
                                                                  decoration:
                                                                      const BoxDecoration(),
                                                                  child:
                                                                      Builder(
                                                                    builder:
                                                                        (context) {
                                                                      final weeksCounter =
                                                                          vacinationPeriodQueryVaccinatePeriodRecordList
                                                                              .toList();
                                                                      return SizedBox(
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            500.0,
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              40.0),
                                                                          child:
                                                                              PageView.builder(
                                                                            controller: _model.pageViewController ??= PageController(
                                                                                initialPage: min(
                                                                                    valueOrDefault<int>(
                                                                                      _model.initialIndex,
                                                                                      0,
                                                                                    ),
                                                                                    weeksCounter.length - 1)),
                                                                            onPageChanged:
                                                                                (_) async {
                                                                              setState(() {
                                                                                _model.initialIndex = _model.pageViewCurrentIndex;
                                                                              });
                                                                            },
                                                                            scrollDirection:
                                                                                Axis.horizontal,
                                                                            itemCount:
                                                                                weeksCounter.length,
                                                                            itemBuilder:
                                                                                (context, weeksCounterIndex) {
                                                                              final weeksCounterItem = weeksCounter[weeksCounterIndex];
                                                                              return SingleChildScrollView(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Builder(
                                                                                      builder: (context) {
                                                                                        final currentVaccines = vaccinationsQueryVaccinationsRecordList.toList();
                                                                                        return Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: List.generate(currentVaccines.length, (currentVaccinesIndex) {
                                                                                            final currentVaccinesItem = currentVaccines[currentVaccinesIndex];
                                                                                            return StreamBuilder<List<PassedVaccineRecord>>(
                                                                                              stream: queryPassedVaccineRecord(
                                                                                                parent: currentUserReference,
                                                                                                queryBuilder: (passedVaccineRecord) => passedVaccineRecord.where(
                                                                                                  'id',
                                                                                                  isEqualTo: currentVaccinesItem.reference.id,
                                                                                                ),
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
                                                                                                List<PassedVaccineRecord> containerPassedVaccineRecordList = snapshot.data!;
                                                                                                return Container(
                                                                                                  width: double.infinity,
                                                                                                  decoration: const BoxDecoration(),
                                                                                                  child: Builder(
                                                                                                    builder: (context) {
                                                                                                      if (containerPassedVaccineRecordList.where((e) => e.child == widget.child?.reference).toList().isEmpty) {
                                                                                                        return Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            Padding(
                                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                                                                                                              child: InkWell(
                                                                                                                splashColor: Colors.transparent,
                                                                                                                focusColor: Colors.transparent,
                                                                                                                hoverColor: Colors.transparent,
                                                                                                                highlightColor: Colors.transparent,
                                                                                                                onTap: () async {
                                                                                                                  await PassedVaccineRecord.createDoc(currentUserReference!).set(createPassedVaccineRecordData(
                                                                                                                    vaccineName: currentVaccinesItem.vaccinationName,
                                                                                                                    id: currentVaccinesItem.reference.id,
                                                                                                                    passedDate: getCurrentTimestamp,
                                                                                                                    child: widget.child?.reference,
                                                                                                                  ));
                                                                                                                },
                                                                                                                child: Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                  children: [
                                                                                                                    Expanded(
                                                                                                                      child: Column(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                        children: [
                                                                                                                          Text(
                                                                                                                            currentVaccinesItem.vaccinationName,
                                                                                                                            style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                                                  fontFamily: 'Inter',
                                                                                                                                  lineHeight: 1.25,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                          Text(
                                                                                                                            'До ${functions.formatDateInDayNumberMonthStringYearNumber(functions.addDaysToDate(currentVaccinesItem.ageOfChildInDays, widget.birthDate!))}',
                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                  fontFamily: 'Inter',
                                                                                                                                  color: functions.addDaysToDate(currentVaccinesItem.ageOfChildInDays, widget.birthDate!) < getCurrentTimestamp ? FlutterFlowTheme.of(context).errorDark : FlutterFlowTheme.of(context).grey60,
                                                                                                                                  lineHeight: 1.0,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ],
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
                                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                                                                                                              child: InkWell(
                                                                                                                splashColor: Colors.transparent,
                                                                                                                focusColor: Colors.transparent,
                                                                                                                hoverColor: Colors.transparent,
                                                                                                                highlightColor: Colors.transparent,
                                                                                                                onTap: () async {
                                                                                                                  await containerPassedVaccineRecordList.first.reference.delete();
                                                                                                                },
                                                                                                                child: Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  children: [
                                                                                                                    Expanded(
                                                                                                                      child: Column(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                        children: [
                                                                                                                          Text(
                                                                                                                            containerPassedVaccineRecordList.first.vaccineName,
                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                  fontFamily: 'Inter',
                                                                                                                                  fontSize: 16.0,
                                                                                                                                  fontWeight: FontWeight.w500,
                                                                                                                                  decoration: TextDecoration.lineThrough,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                          Text(
                                                                                                                            functions.formatDateInDayNumberMonthStringYearNumber(containerPassedVaccineRecordList.first.passedDate!),
                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Container(
                                                                                                                      width: 30.0,
                                                                                                                      height: 30.0,
                                                                                                                      decoration: BoxDecoration(
                                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                                        shape: BoxShape.circle,
                                                                                                                      ),
                                                                                                                      child: const Icon(
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
                                                                                              },
                                                                                            );
                                                                                          }),
                                                                                        );
                                                                                      },
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 120.0),
                                                                                      child: Builder(
                                                                                        builder: (context) {
                                                                                          final usersVaccines = createdVaccinesQueryCreatedVaccineRecordList.toList();
                                                                                          return Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: List.generate(usersVaccines.length, (usersVaccinesIndex) {
                                                                                              final usersVaccinesItem = usersVaccines[usersVaccinesIndex];
                                                                                              return Container(
                                                                                                width: double.infinity,
                                                                                                decoration: const BoxDecoration(),
                                                                                                child: StreamBuilder<List<PassedVaccineRecord>>(
                                                                                                  stream: queryPassedVaccineRecord(
                                                                                                    parent: currentUserReference,
                                                                                                    queryBuilder: (passedVaccineRecord) => passedVaccineRecord.where(
                                                                                                      'id',
                                                                                                      isEqualTo: usersVaccinesItem.reference.id,
                                                                                                    ),
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
                                                                                                    List<PassedVaccineRecord> containerPassedVaccineRecordList = snapshot.data!;
                                                                                                    return Container(
                                                                                                      width: double.infinity,
                                                                                                      decoration: const BoxDecoration(),
                                                                                                      child: Builder(
                                                                                                        builder: (context) {
                                                                                                          if (containerPassedVaccineRecordList.where((e) => e.child == widget.child?.reference).toList().isEmpty) {
                                                                                                            return Column(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Padding(
                                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                                                                                                                  child: InkWell(
                                                                                                                    splashColor: Colors.transparent,
                                                                                                                    focusColor: Colors.transparent,
                                                                                                                    hoverColor: Colors.transparent,
                                                                                                                    highlightColor: Colors.transparent,
                                                                                                                    onTap: () async {
                                                                                                                      await PassedVaccineRecord.createDoc(currentUserReference!).set(createPassedVaccineRecordData(
                                                                                                                        vaccineName: usersVaccinesItem.vaccineName,
                                                                                                                        id: usersVaccinesItem.reference.id,
                                                                                                                        passedDate: getCurrentTimestamp,
                                                                                                                        child: widget.child?.reference,
                                                                                                                      ));
                                                                                                                    },
                                                                                                                    child: Row(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      children: [
                                                                                                                        Expanded(
                                                                                                                          child: Column(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                            children: [
                                                                                                                              Text(
                                                                                                                                usersVaccinesItem.vaccineName,
                                                                                                                                style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                                                      fontFamily: 'Inter',
                                                                                                                                      fontWeight: FontWeight.w500,
                                                                                                                                      lineHeight: 1.25,
                                                                                                                                    ),
                                                                                                                              ),
                                                                                                                              Text(
                                                                                                                                'До ${functions.formatDateInDayNumberMonthStringYearNumber(usersVaccinesItem.date!)}',
                                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                                              ),
                                                                                                                            ],
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
                                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                                                                                                                  child: InkWell(
                                                                                                                    splashColor: Colors.transparent,
                                                                                                                    focusColor: Colors.transparent,
                                                                                                                    hoverColor: Colors.transparent,
                                                                                                                    highlightColor: Colors.transparent,
                                                                                                                    onTap: () async {
                                                                                                                      await containerPassedVaccineRecordList.first.reference.delete();
                                                                                                                    },
                                                                                                                    child: Row(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      children: [
                                                                                                                        Expanded(
                                                                                                                          child: Column(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                            children: [
                                                                                                                              Text(
                                                                                                                                containerPassedVaccineRecordList.first.vaccineName,
                                                                                                                                style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                                                      fontFamily: 'Inter',
                                                                                                                                      color: FlutterFlowTheme.of(context).grey40,
                                                                                                                                      fontWeight: FontWeight.w500,
                                                                                                                                      decoration: TextDecoration.lineThrough,
                                                                                                                                      lineHeight: 1.28,
                                                                                                                                    ),
                                                                                                                              ),
                                                                                                                              Text(
                                                                                                                                functions.formatDateInDayNumberMonthStringYearNumber(containerPassedVaccineRecordList.first.passedDate!),
                                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                      fontFamily: 'Inter',
                                                                                                                                      color: FlutterFlowTheme.of(context).grey40,
                                                                                                                                    ),
                                                                                                                              ),
                                                                                                                            ],
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        Container(
                                                                                                                          width: 30.0,
                                                                                                                          height: 30.0,
                                                                                                                          decoration: BoxDecoration(
                                                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                                                            shape: BoxShape.circle,
                                                                                                                          ),
                                                                                                                          child: const Icon(
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
                                                                                                  },
                                                                                                ),
                                                                                              );
                                                                                            }),
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
                                ].addToEnd(const SizedBox(height: 120.0)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 1.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 45.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            context.pushNamed(
                              'CreateVaccinePage',
                              queryParameters: {
                                'period': serializeParam(
                                  containerVaccinatePeriodRecordList[
                                          _model.initialIndex]
                                      .period,
                                  ParamType.String,
                                ),
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
                          text: 'Добавить прививку',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 56.0,
                            padding: const EdgeInsets.all(0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle:
                                FlutterFlowTheme.of(context).displaySmall,
                            elevation: 0.0,
                            borderSide: const BorderSide(
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
            );
          },
        ),
      ),
    );
  }
}
