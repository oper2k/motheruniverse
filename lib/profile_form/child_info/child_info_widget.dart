import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'child_info_model.dart';
export 'child_info_model.dart';

class ChildInfoWidget extends StatefulWidget {
  const ChildInfoWidget({Key? key}) : super(key: key);

  @override
  _ChildInfoWidgetState createState() => _ChildInfoWidgetState();
}

class _ChildInfoWidgetState extends State<ChildInfoWidget> {
  late ChildInfoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChildInfoModel());

    _model.nameFieldController ??= TextEditingController();
    _model.nameFieldFocusNode ??= FocusNode();

    _model.growthFieldController ??= TextEditingController();
    _model.growthFieldFocusNode ??= FocusNode();

    _model.weightFieldController ??= TextEditingController();
    _model.weightFieldFocusNode ??= FocusNode();
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
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 45.0, 20.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                height: 38.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
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
                        child: Icon(
                          FFIcons.kleft,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 38.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 8.0, 0.0),
                              child: Container(
                                width: 48.0,
                                height: 4.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).primary,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 8.0, 0.0),
                              child: Container(
                                width: 48.0,
                                height: 4.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).primary,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                            Container(
                              width: 48.0,
                              height: 4.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 0.0),
                            child: AutoSizeText(
                              'Добавьте данные о ребенке',
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              style: FlutterFlowTheme.of(context).displayLarge,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: AutoSizeText(
                              'Персонализируем приложение \nпо этим данным',
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    lineHeight: 1.5,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Builder(
                                  builder: (context) {
                                    if (FFAppState().tempChild.photo != null &&
                                        FFAppState().tempChild.photo != '') {
                                      return Stack(
                                        alignment:
                                            AlignmentDirectional(1.0, -1.0),
                                        children: [
                                          Container(
                                            width: 112.0,
                                            height: 112.0,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.network(
                                              FFAppState().tempChild.photo,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await FirebaseStorage.instance
                                                  .refFromURL(FFAppState()
                                                      .tempChild
                                                      .photo)
                                                  .delete();
                                              setState(() {
                                                FFAppState()
                                                    .updateTempChildStruct(
                                                  (e) => e..photo = null,
                                                );
                                              });
                                            },
                                            child: Container(
                                              width: 28.0,
                                              height: 28.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Icon(
                                                FFIcons.kclose3,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    } else {
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          final selectedMedia =
                                              await selectMediaWithSourceBottomSheet(
                                            context: context,
                                            allowPhoto: true,
                                          );
                                          if (selectedMedia != null &&
                                              selectedMedia.every((m) =>
                                                  validateFileFormat(
                                                      m.storagePath,
                                                      context))) {
                                            setState(() =>
                                                _model.isDataUploading = true);
                                            var selectedUploadedFiles =
                                                <FFUploadedFile>[];

                                            var downloadUrls = <String>[];
                                            try {
                                              showUploadMessage(
                                                context,
                                                'Файл заргужается',
                                                showLoading: true,
                                              );
                                              selectedUploadedFiles =
                                                  selectedMedia
                                                      .map(
                                                          (m) => FFUploadedFile(
                                                                name: m
                                                                    .storagePath
                                                                    .split('/')
                                                                    .last,
                                                                bytes: m.bytes,
                                                                height: m
                                                                    .dimensions
                                                                    ?.height,
                                                                width: m
                                                                    .dimensions
                                                                    ?.width,
                                                                blurHash:
                                                                    m.blurHash,
                                                              ))
                                                      .toList();

                                              downloadUrls = (await Future.wait(
                                                selectedMedia.map(
                                                  (m) async => await uploadData(
                                                      m.storagePath, m.bytes),
                                                ),
                                              ))
                                                  .where((u) => u != null)
                                                  .map((u) => u!)
                                                  .toList();
                                            } finally {
                                              ScaffoldMessenger.of(context)
                                                  .hideCurrentSnackBar();
                                              _model.isDataUploading = false;
                                            }
                                            if (selectedUploadedFiles.length ==
                                                    selectedMedia.length &&
                                                downloadUrls.length ==
                                                    selectedMedia.length) {
                                              setState(() {
                                                _model.uploadedLocalFile =
                                                    selectedUploadedFiles.first;
                                                _model.uploadedFileUrl =
                                                    downloadUrls.first;
                                              });
                                              showUploadMessage(
                                                  context, 'Успешно!');
                                            } else {
                                              setState(() {});
                                              showUploadMessage(context,
                                                  'Ошибка загрузки данных');
                                              return;
                                            }
                                          }

                                          setState(() {
                                            FFAppState().updateTempChildStruct(
                                              (e) => e
                                                ..photo =
                                                    _model.uploadedFileUrl,
                                            );
                                          });
                                        },
                                        child: Container(
                                          width: 112.0,
                                          height: 112.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFFE6D9),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            FFIcons.kcamera,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 24.0,
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if (FFAppState().tempChild.photo !=
                                                null &&
                                            FFAppState().tempChild.photo != '')
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context
                                                  .pushNamed('Personalisation');
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Icon(
                                                  FFIcons.kedit3,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  size: 24.0,
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(4.0, 0.0,
                                                                0.0, 0.0),
                                                    child: AutoSizeText(
                                                      'Персонализировать',
                                                      maxLines: 1,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .headlineLarge
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            lineHeight: 1.28,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 24.0, 0.0, 0.0),
                                          child: Text(
                                            'Будет отображаться \nв личном кабинете, поможет ускорить работу и персонализирует приложение',
                                            style: FlutterFlowTheme.of(context)
                                                .displayMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  fontSize: 12.0,
                                                  lineHeight: 1.33,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 32.0, 0.0, 0.0),
                            child: Builder(
                              builder: (context) {
                                if (FFAppState().tempChild.genderIsUnknown &&
                                    _model.nameIsUnknown) {
                                  return Container(
                                    width: double.infinity,
                                    height: 56.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .divider,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 7.0, 16.0, 7.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Имя',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .displayMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 14.0,
                                                          lineHeight: 1.28,
                                                        ),
                                              ),
                                              Text(
                                                'Ребёнок',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .displayMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 16.0,
                                                          lineHeight: 1.3,
                                                        ),
                                              ),
                                            ],
                                          ),
                                          Icon(
                                            FFIcons.klock,
                                            color: FlutterFlowTheme.of(context)
                                                .grey40,
                                            size: 24.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                } else if (_model.nameIsUnknown &&
                                    (FFAppState().tempChild.gender == 'male')) {
                                  return Container(
                                    width: double.infinity,
                                    height: 56.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .divider,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 7.0, 16.0, 7.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Имя',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .displayMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 14.0,
                                                          lineHeight: 1.28,
                                                        ),
                                              ),
                                              Text(
                                                'Сын',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .displayMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 16.0,
                                                          lineHeight: 1.3,
                                                        ),
                                              ),
                                            ],
                                          ),
                                          Icon(
                                            FFIcons.klock,
                                            color: FlutterFlowTheme.of(context)
                                                .grey40,
                                            size: 24.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                } else if (_model.nameIsUnknown &&
                                    (FFAppState().tempChild.gender ==
                                        'female')) {
                                  return Container(
                                    width: double.infinity,
                                    height: 56.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .divider,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 7.0, 16.0, 7.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Имя',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .displayMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 14.0,
                                                          lineHeight: 1.28,
                                                        ),
                                              ),
                                              Text(
                                                'Дочка',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .displayMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 16.0,
                                                          lineHeight: 1.3,
                                                        ),
                                              ),
                                            ],
                                          ),
                                          Icon(
                                            FFIcons.klock,
                                            color: FlutterFlowTheme.of(context)
                                                .grey40,
                                            size: 24.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                } else {
                                  return Form(
                                    key: _model.formKey1,
                                    autovalidateMode: AutovalidateMode.disabled,
                                    child: Container(
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
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmall,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .divider,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 22.0, 16.0, 22.0),
                                          suffixIcon: _model
                                                  .nameFieldController!
                                                  .text
                                                  .isNotEmpty
                                              ? InkWell(
                                                  onTap: () async {
                                                    _model.nameFieldController
                                                        ?.clear();
                                                    setState(() {});
                                                  },
                                                  child: Icon(
                                                    Icons.clear,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .grey40,
                                                    size: 24.0,
                                                  ),
                                                )
                                              : null,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall,
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .overlay,
                                        validator: _model
                                            .nameFieldControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Еще не выбрали',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w600,
                                        lineHeight: 1.25,
                                      ),
                                ),
                                Switch.adaptive(
                                  value: _model.switchValue ??= false,
                                  onChanged: (newValue) async {
                                    setState(
                                        () => _model.switchValue = newValue!);
                                    if (newValue!) {
                                      setState(() {
                                        _model.nameIsUnknown = true;
                                      });
                                    } else {
                                      setState(() {
                                        _model.nameIsUnknown = false;
                                      });
                                      setState(() {
                                        _model.nameFieldController?.clear();
                                      });
                                    }
                                  },
                                  activeColor:
                                      FlutterFlowTheme.of(context).primary,
                                  activeTrackColor:
                                      FlutterFlowTheme.of(context).tertiary,
                                  inactiveTrackColor:
                                      FlutterFlowTheme.of(context).grey20,
                                  inactiveThumbColor:
                                      FlutterFlowTheme.of(context).alternate,
                                ),
                              ],
                            ),
                          ),
                          if (FFAppState().tempChild.childIsBorn == true)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: Form(
                                key: _model.formKey2,
                                autovalidateMode: AutovalidateMode.disabled,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      child: TextFormField(
                                        controller:
                                            _model.growthFieldController,
                                        focusNode: _model.growthFieldFocusNode,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.growthFieldController',
                                          Duration(milliseconds: 2000),
                                          () => setState(() {}),
                                        ),
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Рост',
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmall,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .divider,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 22.0, 16.0, 22.0),
                                          suffixIcon: _model
                                                  .growthFieldController!
                                                  .text
                                                  .isNotEmpty
                                              ? InkWell(
                                                  onTap: () async {
                                                    _model.growthFieldController
                                                        ?.clear();
                                                    setState(() {});
                                                  },
                                                  child: Icon(
                                                    Icons.clear,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .grey40,
                                                    size: 24.0,
                                                  ),
                                                )
                                              : null,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall,
                                        keyboardType: TextInputType.number,
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .overlay,
                                        validator: _model
                                            .growthFieldControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 16.0, 0.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        child: TextFormField(
                                          controller:
                                              _model.weightFieldController,
                                          focusNode:
                                              _model.weightFieldFocusNode,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.weightFieldController',
                                            Duration(milliseconds: 2000),
                                            () => setState(() {}),
                                          ),
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'Вес',
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmall,
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .divider,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 22.0, 16.0, 22.0),
                                            suffixIcon: _model
                                                    .weightFieldController!
                                                    .text
                                                    .isNotEmpty
                                                ? InkWell(
                                                    onTap: () async {
                                                      _model
                                                          .weightFieldController
                                                          ?.clear();
                                                      setState(() {});
                                                    },
                                                    child: Icon(
                                                      Icons.clear,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .grey40,
                                                      size: 24.0,
                                                    ),
                                                  )
                                                : null,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall,
                                          keyboardType: TextInputType.number,
                                          cursorColor:
                                              FlutterFlowTheme.of(context)
                                                  .overlay,
                                          validator: _model
                                              .weightFieldControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 57.0, 0.0, 45.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                setState(() {
                                  FFAppState().updateTempChildStruct(
                                    (e) => e
                                      ..name = () {
                                        if (_model.nameIsUnknown &&
                                            (FFAppState().tempChild.gender ==
                                                'male')) {
                                          return 'Сын';
                                        } else if (_model.nameIsUnknown &&
                                            (FFAppState().tempChild.gender ==
                                                'female')) {
                                          return 'Дочь';
                                        } else if (_model.nameIsUnknown &&
                                            (FFAppState().tempChild.gender ==
                                                'unknown')) {
                                          return 'Ребенок';
                                        } else {
                                          return _model
                                              .nameFieldController.text;
                                        }
                                      }()
                                      ..growth = int.tryParse(
                                          _model.growthFieldController.text)
                                      ..weight = double.tryParse(
                                          _model.weightFieldController.text),
                                  );
                                });

                                await ChildrenRecord.createDoc(
                                        currentUserReference!)
                                    .set({
                                  ...createChildrenRecordData(
                                    name: FFAppState().tempChild.name,
                                    gender: FFAppState().tempChild.gender,
                                    growth: FFAppState().tempChild.growth,
                                    weight: FFAppState().tempChild.weight,
                                    birthDate: FFAppState().tempChild.birthDate,
                                    photo: FFAppState().tempChild.photo,
                                    imageLeft: FFAppState().tempChild.imageLeft,
                                    imageRight:
                                        FFAppState().tempChild.imageRight,
                                    childIsBorn:
                                        FFAppState().tempChild.childIsBorn,
                                    genderIsUnknown:
                                        FFAppState().tempChild.genderIsUnknown,
                                    conceptionDate:
                                        FFAppState().tempChild.conceptionDate,
                                    age: FFAppState().tempChild.age,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'growth_list': [
                                        getGrowthListFirestoreData(
                                          createGrowthListStruct(
                                            growth:
                                                FFAppState().tempChild.growth,
                                            date: FFAppState()
                                                .tempChild
                                                .birthDate,
                                            clearUnsetFields: false,
                                            create: true,
                                          ),
                                          true,
                                        )
                                      ],
                                      'weight_list': [
                                        getWeightListFirestoreData(
                                          createWeightListStruct(
                                            weight:
                                                FFAppState().tempChild.weight,
                                            date: FFAppState()
                                                .tempChild
                                                .birthDate,
                                            clearUnsetFields: false,
                                            create: true,
                                          ),
                                          true,
                                        )
                                      ],
                                    },
                                  ),
                                });

                                await currentUserReference!
                                    .update(createUsersRecordData(
                                  atLeastOneChildIsAdded: true,
                                ));

                                context.goNamed('MainPage');
                              },
                              text: 'Продолжить',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 56.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle:
                                    FlutterFlowTheme.of(context).displaySmall,
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
                    ],
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
