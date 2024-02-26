import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'create_doctor_visiting_page_model.dart';
export 'create_doctor_visiting_page_model.dart';

class CreateDoctorVisitingPageWidget extends StatefulWidget {
  const CreateDoctorVisitingPageWidget({
    super.key,
    required this.age,
  });

  final String? age;

  @override
  State<CreateDoctorVisitingPageWidget> createState() =>
      _CreateDoctorVisitingPageWidgetState();
}

class _CreateDoctorVisitingPageWidgetState
    extends State<CreateDoctorVisitingPageWidget> {
  late CreateDoctorVisitingPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateDoctorVisitingPageModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 38.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
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
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: Text(
                  'Добавление посещения врача',
                  style: FlutterFlowTheme.of(context).displayLarge,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                child: StreamBuilder<List<DoctorListRecord>>(
                  stream: queryDoctorListRecord(
                    queryBuilder: (doctorListRecord) =>
                        doctorListRecord.orderBy('sort'),
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
                    List<DoctorListRecord> dropDownDoctorListRecordList =
                        snapshot.data!;
                    return FlutterFlowDropDown<String>(
                      controller: _model.dropDownValueController ??=
                          FormFieldController<String>(null),
                      options: dropDownDoctorListRecordList
                          .map((e) => e.name)
                          .toList(),
                      onChanged: (val) =>
                          setState(() => _model.dropDownValue = val),
                      width: double.infinity,
                      height: 56.0,
                      textStyle:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                fontFamily: 'Inter',
                                lineHeight: 1.5,
                              ),
                      hintText: 'Выберите врача',
                      icon: Icon(
                        FFIcons.kright10,
                        color: FlutterFlowTheme.of(context).grey40,
                        size: 24.0,
                      ),
                      elevation: 2.0,
                      borderColor: FlutterFlowTheme.of(context).divider,
                      borderWidth: 1.0,
                      borderRadius: 12.0,
                      margin:
                          EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                      hidesUnderline: true,
                      isSearchable: false,
                      isMultiSelect: false,
                    );
                  },
                ),
              ),
              if (_model.dropDownValue == 'Другой')
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    child: TextFormField(
                      controller: _model.textController,
                      focusNode: _model.textFieldFocusNode,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.textController',
                        Duration(milliseconds: 500),
                        () => setState(() {}),
                      ),
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Введите название врача',
                        labelStyle: FlutterFlowTheme.of(context).headlineSmall,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).divider,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        contentPadding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 22.0, 16.0, 22.0),
                      ),
                      style: FlutterFlowTheme.of(context).headlineSmall,
                      cursorColor: FlutterFlowTheme.of(context).overlay,
                      validator:
                          _model.textControllerValidator.asValidator(context),
                    ),
                  ),
                ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    final _datePickedDate = await showDatePicker(
                      context: context,
                      initialDate: getCurrentTimestamp,
                      firstDate: getCurrentTimestamp,
                      lastDate: DateTime(2050),
                      builder: (context, child) {
                        return wrapInMaterialDatePickerTheme(
                          context,
                          child!,
                          headerBackgroundColor:
                              FlutterFlowTheme.of(context).primary,
                          headerForegroundColor:
                              FlutterFlowTheme.of(context).info,
                          headerTextStyle: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .override(
                                fontFamily: 'Inter',
                                fontSize: 32.0,
                                fontWeight: FontWeight.w600,
                              ),
                          pickerBackgroundColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          pickerForegroundColor:
                              FlutterFlowTheme.of(context).primaryText,
                          selectedDateTimeBackgroundColor:
                              FlutterFlowTheme.of(context).primary,
                          selectedDateTimeForegroundColor:
                              FlutterFlowTheme.of(context).info,
                          actionButtonForegroundColor:
                              FlutterFlowTheme.of(context).primaryText,
                          iconSize: 24.0,
                        );
                      },
                    );

                    if (_datePickedDate != null) {
                      safeSetState(() {
                        _model.datePicked = DateTime(
                          _datePickedDate.year,
                          _datePickedDate.month,
                          _datePickedDate.day,
                        );
                      });
                    }
                    setState(() {
                      _model.date = _model.datePicked;
                    });
                  },
                  child: Builder(
                    builder: (context) {
                      if (_model.date == null) {
                        return Container(
                          width: double.infinity,
                          height: 56.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).divider,
                              width: 1.0,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Выберите дату',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Inter',
                                          lineHeight: 1.5,
                                        ),
                                  ),
                                ),
                                Icon(
                                  FFIcons.kright10,
                                  color: FlutterFlowTheme.of(context).grey40,
                                  size: 24.0,
                                ),
                              ],
                            ),
                          ),
                        );
                      } else {
                        return Container(
                          width: double.infinity,
                          height: 56.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).divider,
                              width: 1.0,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 7.0, 16.0, 7.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Выберите дату',
                                        style: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              lineHeight: 1.0,
                                            ),
                                      ),
                                      Text(
                                        functions
                                            .formatDateInDayNumberMonthStringYearNumber(
                                                _model.date!),
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              fontFamily: 'Inter',
                                              lineHeight: 1.5,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Icon(
                                  FFIcons.kright10,
                                  color: FlutterFlowTheme.of(context).grey40,
                                  size: 24.0,
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 61.0),
                child: FFButtonWidget(
                  onPressed: !((((_model.dropDownValue != null &&
                                      _model.dropDownValue != '') &&
                                  (_model.dropDownValue != 'Другой')) &&
                              (_model.date != null)) ||
                          ((_model.dropDownValue == 'Другой') &&
                              (_model.textController.text != null &&
                                  _model.textController.text != '') &&
                              (_model.date != null)))
                      ? null
                      : () async {
                          await CreatedDoctorVisitingRecord.createDoc(
                                  currentUserReference!)
                              .set(createCreatedDoctorVisitingRecordData(
                            age: widget.age,
                            name: _model.dropDownValue == 'Другой'
                                ? _model.textController.text
                                : _model.dropDownValue,
                            description: functions
                                .formatDateInDayNumberMonthStringYearNumber(
                                    _model.date!),
                          ));
                          context.safePop();
                        },
                  text: 'Добавить',
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
                    disabledColor: FlutterFlowTheme.of(context).grey20,
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
