import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'entry_to_event_page_model.dart';
export 'entry_to_event_page_model.dart';

class EntryToEventPageWidget extends StatefulWidget {
  const EntryToEventPageWidget({
    Key? key,
    required this.event,
  }) : super(key: key);

  final EventsRecord? event;

  @override
  _EntryToEventPageWidgetState createState() => _EntryToEventPageWidgetState();
}

class _EntryToEventPageWidgetState extends State<EntryToEventPageWidget> {
  late EntryToEventPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EntryToEventPageModel());

    _model.nameController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.firstName, ''));
    _model.nameFocusNode ??= FocusNode();

    _model.phoneController ??= TextEditingController(text: currentPhoneNumber);
    _model.phoneFocusNode ??= FocusNode();

    _model.emailController ??= TextEditingController(text: currentUserEmail);
    _model.emailFocusNode ??= FocusNode();

    _model.childAgeController ??= TextEditingController();
    _model.childAgeFocusNode ??= FocusNode();

    _model.solvedCaseController ??= TextEditingController();
    _model.solvedCaseFocusNode ??= FocusNode();
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
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 45.0, 20.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                    ),
                  ),
                  Flexible(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 0.0),
                            child: Text(
                              widget.event!.eventName,
                              style: FlutterFlowTheme.of(context).displayLarge,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: Text(
                              widget.event!.description,
                              style: FlutterFlowTheme.of(context)
                                  .displayMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    lineHeight: 1.5,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 32.0, 0.0, 0.0),
                            child: AuthUserStreamWidget(
                              builder: (context) => Container(
                                width: double.infinity,
                                child: TextFormField(
                                  controller: _model.nameController,
                                  focusNode: _model.nameFocusNode,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Ваше имя',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          lineHeight: 1.28,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .divider,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            16.0, 22.0, 16.0, 22.0),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall,
                                  cursorColor:
                                      FlutterFlowTheme.of(context).overlay,
                                  validator: _model.nameControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 0.0),
                            child: AuthUserStreamWidget(
                              builder: (context) => Container(
                                width: double.infinity,
                                child: TextFormField(
                                  controller: _model.phoneController,
                                  focusNode: _model.phoneFocusNode,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Номер телефона',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          lineHeight: 1.28,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .divider,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            16.0, 22.0, 16.0, 22.0),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall,
                                  cursorColor:
                                      FlutterFlowTheme.of(context).overlay,
                                  validator: _model.phoneControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              child: TextFormField(
                                controller: _model.emailController,
                                focusNode: _model.emailFocusNode,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Электронная почта',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        lineHeight: 1.28,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).divider,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
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
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          16.0, 22.0, 16.0, 22.0),
                                ),
                                style:
                                    FlutterFlowTheme.of(context).headlineSmall,
                                cursorColor:
                                    FlutterFlowTheme.of(context).overlay,
                                validator: _model.emailControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              child: TextFormField(
                                controller: _model.childAgeController,
                                focusNode: _model.childAgeFocusNode,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Возраст ребенка',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        lineHeight: 1.28,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).divider,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
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
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          16.0, 22.0, 16.0, 22.0),
                                ),
                                style:
                                    FlutterFlowTheme.of(context).headlineSmall,
                                cursorColor:
                                    FlutterFlowTheme.of(context).overlay,
                                validator: _model.childAgeControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              child: TextFormField(
                                controller: _model.solvedCaseController,
                                focusNode: _model.solvedCaseFocusNode,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText:
                                      'Укажите запрос/проблему, которую вы хотите решить с помощью курса?',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        lineHeight: 1.28,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).divider,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
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
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          16.0, 22.0, 16.0, 22.0),
                                ),
                                style:
                                    FlutterFlowTheme.of(context).headlineSmall,
                                maxLines: null,
                                cursorColor:
                                    FlutterFlowTheme.of(context).overlay,
                                validator: _model.solvedCaseControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ].addToEnd(SizedBox(height: 110.0)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 45.0),
                child: FFButtonWidget(
                  onPressed: ((_model.nameController.text == null ||
                              _model.nameController.text == '') &&
                          (_model.phoneController.text == null ||
                              _model.phoneController.text == '') &&
                          (_model.emailController.text == null ||
                              _model.emailController.text == '') &&
                          (_model.childAgeController.text == null ||
                              _model.childAgeController.text == '') &&
                          (_model.solvedCaseController.text == null ||
                              _model.solvedCaseController.text == ''))
                      ? null
                      : () async {
                          await EventEntryRecord.collection
                              .doc()
                              .set(createEventEntryRecordData(
                                eventName: widget.event?.eventName,
                                eventDate: widget.event?.date,
                                eventTime: widget.event?.time,
                                userName: _model.nameController.text,
                                userEmail: _model.emailController.text,
                                userPhoneNumber: _model.phoneController.text,
                                childAge: _model.childAgeController.text,
                                userCase: _model.solvedCaseController.text,
                              ));

                          context.goNamed('EntryFinishedPage');
                        },
                  text: 'Записаться',
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
                    disabledColor: FlutterFlowTheme.of(context).tertiary,
                    disabledTextColor: FlutterFlowTheme.of(context).primaryText,
                  ),
                  showLoadingIndicator: false,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
