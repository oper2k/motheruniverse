import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/bottom_sheet/loyalty_bottom_sheet/welcome_bonus/welcome_bonus_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'fill_profile_model.dart';
export 'fill_profile_model.dart';

class FillProfileWidget extends StatefulWidget {
  const FillProfileWidget({super.key});

  @override
  State<FillProfileWidget> createState() => _FillProfileWidgetState();
}

class _FillProfileWidgetState extends State<FillProfileWidget> {
  late FillProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FillProfileModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {});
    });

    _model.nameFieldController ??= TextEditingController();
    _model.nameFieldFocusNode ??= FocusNode();

    _model.secondNameFieldController ??= TextEditingController();
    _model.secondNameFieldFocusNode ??= FocusNode();

    _model.phoneNumberFieldController ??= TextEditingController();
    _model.phoneNumberFieldFocusNode ??= FocusNode();

    _model.telegramController ??= TextEditingController();
    _model.telegramFocusNode ??= FocusNode();

    _model.instagramController ??= TextEditingController();
    _model.instagramFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
          _model.phoneNumberFieldController?.text = '+7';
        }));
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: double.infinity,
                  height: 38.0,
                  decoration: BoxDecoration(
                    color: Color(0x00FFFFFF),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          GoRouter.of(context).prepareAuthEvent();
                          await authManager.signOut();
                          GoRouter.of(context).clearRedirectLocation();

                          context.goNamedAuth('SignIn', context.mounted);
                        },
                        child: Container(
                          width: 38.0,
                          height: 38.0,
                          decoration: BoxDecoration(),
                          child: Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Icon(
                              FFIcons.kleft,
                              color: FlutterFlowTheme.of(context).overlay,
                              size: 24.0,
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
                          context.pushNamed('ChooseTheGender');
                        },
                        child: Text(
                          'Пропустить',
                          style: FlutterFlowTheme.of(context).headlineLarge,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: Text(
                    'Расскажи о себе',
                    style: FlutterFlowTheme.of(context).displayLarge,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                  child: AutoSizeText(
                    'Изменить данные можно в профиле',
                    maxLines: 1,
                    style: FlutterFlowTheme.of(context).displayMedium,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                  child: Form(
                    key: _model.formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: double.infinity,
                          child: TextFormField(
                            controller: _model.nameFieldController,
                            focusNode: _model.nameFieldFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.nameFieldController',
                              Duration(milliseconds: 2000),
                              () => setState(() {}),
                            ),
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Имя',
                              labelStyle:
                                  FlutterFlowTheme.of(context).headlineSmall,
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
                              suffixIcon: _model
                                      .nameFieldController!.text.isNotEmpty
                                  ? InkWell(
                                      onTap: () async {
                                        _model.nameFieldController?.clear();
                                        setState(() {});
                                      },
                                      child: Icon(
                                        Icons.clear,
                                        color:
                                            FlutterFlowTheme.of(context).grey40,
                                        size: 24.0,
                                      ),
                                    )
                                  : null,
                            ),
                            style: FlutterFlowTheme.of(context).headlineSmall,
                            cursorColor: FlutterFlowTheme.of(context).overlay,
                            validator: _model.nameFieldControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            child: TextFormField(
                              controller: _model.secondNameFieldController,
                              focusNode: _model.secondNameFieldFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.secondNameFieldController',
                                Duration(milliseconds: 2000),
                                () => setState(() {}),
                              ),
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Фамилия',
                                labelStyle:
                                    FlutterFlowTheme.of(context).headlineSmall,
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
                                suffixIcon: _model.secondNameFieldController!
                                        .text.isNotEmpty
                                    ? InkWell(
                                        onTap: () async {
                                          _model.secondNameFieldController
                                              ?.clear();
                                          setState(() {});
                                        },
                                        child: Icon(
                                          Icons.clear,
                                          color: FlutterFlowTheme.of(context)
                                              .grey40,
                                          size: 24.0,
                                        ),
                                      )
                                    : null,
                              ),
                              style: FlutterFlowTheme.of(context).headlineSmall,
                              cursorColor: FlutterFlowTheme.of(context).overlay,
                              validator: _model
                                  .secondNameFieldControllerValidator
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
                              controller: _model.phoneNumberFieldController,
                              focusNode: _model.phoneNumberFieldFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.phoneNumberFieldController',
                                Duration(milliseconds: 2000),
                                () => setState(() {}),
                              ),
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Телефон',
                                labelStyle:
                                    FlutterFlowTheme.of(context).headlineSmall,
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
                                suffixIcon: _model.phoneNumberFieldController!
                                        .text.isNotEmpty
                                    ? InkWell(
                                        onTap: () async {
                                          _model.phoneNumberFieldController
                                              ?.clear();
                                          setState(() {});
                                        },
                                        child: Icon(
                                          Icons.clear,
                                          color: FlutterFlowTheme.of(context)
                                              .grey40,
                                          size: 24.0,
                                        ),
                                      )
                                    : null,
                              ),
                              style: FlutterFlowTheme.of(context).headlineSmall,
                              keyboardType: TextInputType.phone,
                              cursorColor: FlutterFlowTheme.of(context).overlay,
                              validator: _model
                                  .phoneNumberFieldControllerValidator
                                  .asValidator(context),
                              inputFormatters: [_model.phoneNumberFieldMask],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            child: TextFormField(
                              controller: _model.telegramController,
                              focusNode: _model.telegramFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.telegramController',
                                Duration(milliseconds: 2000),
                                () => setState(() {}),
                              ),
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Telegram',
                                labelStyle:
                                    FlutterFlowTheme.of(context).headlineSmall,
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
                                suffixIcon: _model
                                        .telegramController!.text.isNotEmpty
                                    ? InkWell(
                                        onTap: () async {
                                          _model.telegramController?.clear();
                                          setState(() {});
                                        },
                                        child: Icon(
                                          Icons.clear,
                                          color: FlutterFlowTheme.of(context)
                                              .grey40,
                                          size: 24.0,
                                        ),
                                      )
                                    : null,
                              ),
                              style: FlutterFlowTheme.of(context).headlineSmall,
                              cursorColor: FlutterFlowTheme.of(context).overlay,
                              validator: _model.telegramControllerValidator
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
                              controller: _model.instagramController,
                              focusNode: _model.instagramFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.instagramController',
                                Duration(milliseconds: 2000),
                                () => setState(() {}),
                              ),
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Instagram',
                                labelStyle:
                                    FlutterFlowTheme.of(context).headlineSmall,
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
                                suffixIcon: _model
                                        .instagramController!.text.isNotEmpty
                                    ? InkWell(
                                        onTap: () async {
                                          _model.instagramController?.clear();
                                          setState(() {});
                                        },
                                        child: Icon(
                                          Icons.clear,
                                          color: FlutterFlowTheme.of(context)
                                              .grey40,
                                          size: 24.0,
                                        ),
                                      )
                                    : null,
                              ),
                              style: FlutterFlowTheme.of(context).headlineSmall,
                              cursorColor: FlutterFlowTheme.of(context).overlay,
                              validator: _model.instagramControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 21.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (_model.userAgrees) {
                            setState(() {
                              _model.userAgrees = false;
                            });
                          } else {
                            setState(() {
                              _model.userAgrees = true;
                            });
                          }
                        },
                        child: Builder(
                          builder: (context) {
                            if (_model.userAgrees) {
                              return Container(
                                width: 30.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).primary,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  FFIcons.kcheck,
                                  color: Colors.white,
                                  size: 24.0,
                                ),
                              );
                            } else {
                              return Container(
                                width: 30.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).grey40,
                                    width: 1.5,
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 0.0, 0.0),
                          child: RichText(
                            textScaleFactor:
                                MediaQuery.of(context).textScaleFactor,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Я согласен зарегистрироваться в',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                        lineHeight: 1.28,
                                      ),
                                ),
                                TextSpan(
                                  text: ' программе лояльности',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w600,
                                        lineHeight: 1.28,
                                      ),
                                  mouseCursor: SystemMouseCursors.click,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () async {
                                      context.pushNamed('LoyaltyPage');
                                    },
                                ),
                                TextSpan(
                                  text: ' и получить \n',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                        lineHeight: 1.28,
                                      ),
                                ),
                                TextSpan(
                                  text: '50 бонусов ',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                  mouseCursor: SystemMouseCursors.click,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () async {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        barrierColor:
                                            FlutterFlowTheme.of(context)
                                                .botomBack,
                                        context: context,
                                        builder: (context) {
                                          return GestureDetector(
                                            onTap: () => _model
                                                    .unfocusNode.canRequestFocus
                                                ? FocusScope.of(context)
                                                    .requestFocus(
                                                        _model.unfocusNode)
                                                : FocusScope.of(context)
                                                    .unfocus(),
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: WelcomeBonusWidget(),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                ),
                                TextSpan(
                                  text: 'за регистрацию',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                        lineHeight: 1.28,
                                      ),
                                )
                              ],
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    lineHeight: 1.28,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 29.0, 0.0, 50.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      if (_model.formKey.currentState == null ||
                          !_model.formKey.currentState!.validate()) {
                        return;
                      }

                      await currentUserReference!.update(createUsersRecordData(
                        secondName: _model.secondNameFieldController.text,
                        phoneNumber: _model.phoneNumberFieldController.text,
                        email: currentUserEmail,
                        firstName: _model.nameFieldController.text,
                        telegram: _model.telegramController.text,
                        instagram: _model.instagramController.text,
                      ));
                      if (_model.userAgrees) {
                        await currentUserReference!
                            .update(createUsersRecordData(
                          loyaltyProgramActivated: true,
                        ));
                      } else {
                        await currentUserReference!
                            .update(createUsersRecordData(
                          loyaltyProgramActivated: false,
                        ));
                      }

                      await currentUserReference!.update(createUsersRecordData(
                        profileIsFilled: true,
                      ));

                      context.pushNamed('ChooseTheGender');
                    },
                    text: 'Далее',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
