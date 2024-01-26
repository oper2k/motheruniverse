import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/bottom_sheet/child_bottom_sheet/change_the_age/change_the_age_widget.dart';
import '/components/bottom_sheet/child_bottom_sheet/delete_child_profile/delete_child_profile_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_child_info_page_model.dart';
export 'edit_child_info_page_model.dart';

class EditChildInfoPageWidget extends StatefulWidget {
  const EditChildInfoPageWidget({
    super.key,
    required this.child,
  });

  final ChildrenRecord? child;

  @override
  State<EditChildInfoPageWidget> createState() =>
      _EditChildInfoPageWidgetState();
}

class _EditChildInfoPageWidgetState extends State<EditChildInfoPageWidget> {
  late EditChildInfoPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditChildInfoPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.tempPhoto = widget.child?.photo;
        _model.conceptionDate = widget.child?.conceptionDate;
      });
    });

    _model.textController ??= TextEditingController(text: widget.child?.name);
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                child: DeleteChildProfileWidget(
                                  child: widget.child!,
                                ),
                              ),
                            );
                          },
                        ).then((value) => safeSetState(() {}));
                      },
                      child: Container(
                        width: 38.0,
                        height: 38.0,
                        decoration: BoxDecoration(),
                        child: Align(
                          alignment: AlignmentDirectional(1.0, 0.0),
                          child: Icon(
                            FFIcons.kdel,
                            color: FlutterFlowTheme.of(context).error,
                            size: 24.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              StreamBuilder<ChildrenRecord>(
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
                    width: double.infinity,
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 0.0),
                          child: AutoSizeText(
                            'Изменить данные',
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            style: FlutterFlowTheme.of(context).displayLarge,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 24.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Builder(
                                builder: (context) {
                                  if (_model.tempPhoto != null &&
                                      _model.tempPhoto != '') {
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
                                            _model.tempPhoto!,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            setState(() {
                                              _model.tempPhoto = null;
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
                                          maxWidth: 360.00,
                                          maxHeight: 360.00,
                                          imageQuality: 90,
                                          allowPhoto: true,
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
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
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
                                                          blurHash: m.blurHash,
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
                                          _model.tempPhoto =
                                              _model.uploadedFileUrl;
                                        });
                                      },
                                      child: Container(
                                        width: 112.0,
                                        height: 112.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          FFIcons.kcamera1,
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
                                            context.pushNamed(
                                              'ChangeChildPersonalisation',
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
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                FFIcons.kedit1,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                size: 24.0,
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          4.0, 0.0, 0.0, 0.0),
                                                  child: AutoSizeText(
                                                    'Персонализировать',
                                                    maxLines: 1,
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
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
                          child: Container(
                            width: double.infinity,
                            child: TextFormField(
                              controller: _model.textController,
                              focusNode: _model.textFieldFocusNode,
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
                                    16.0, 17.0, 16.0, 17.0),
                              ),
                              style: FlutterFlowTheme.of(context).headlineSmall,
                              cursorColor: FlutterFlowTheme.of(context).overlay,
                              validator: _model.textControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                        if (widget.child?.birthDate != null)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                setState(() {
                                  FFAppState().customPickerItemIndex1 =
                                      functions.getDayIndexFromDate(
                                          widget.child!.birthDate!)!;
                                  FFAppState().customPickerItemIndex2 =
                                      functions.getMonthIndexFromDate(
                                          widget.child!.birthDate!)!;
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
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: ChangeTheAgeWidget(
                                          child: widget.child!,
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              },
                              child: Container(
                                width: double.infinity,
                                height: 59.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).divider,
                                    width: 1.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 4.0, 16.0, 4.0),
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
                                              'Дата рождения',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        lineHeight: 1.28,
                                                      ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                functions
                                                    .formatDateInDayNumberMonthStringYearNumber(
                                                        containerChildrenRecord
                                                            .birthDate!),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          lineHeight: 1.5,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Icon(
                                        FFIcons.kright3,
                                        color:
                                            FlutterFlowTheme.of(context).grey40,
                                        size: 24.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        if (widget.child?.birthDate == null)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                final _datePickedDate = await showDatePicker(
                                  context: context,
                                  initialDate:
                                      (containerChildrenRecord.conceptionDate ??
                                          DateTime.now()),
                                  firstDate: DateTime(1900),
                                  lastDate:
                                      (getCurrentTimestamp ?? DateTime(2050)),
                                  builder: (context, child) {
                                    return wrapInMaterialDatePickerTheme(
                                      context,
                                      child!,
                                      headerBackgroundColor:
                                          FlutterFlowTheme.of(context).primary,
                                      headerForegroundColor:
                                          FlutterFlowTheme.of(context).info,
                                      headerTextStyle:
                                          FlutterFlowTheme.of(context)
                                              .headlineLarge
                                              .override(
                                                fontFamily: 'Inter',
                                                fontSize: 32.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                      pickerBackgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      pickerForegroundColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                      selectedDateTimeBackgroundColor:
                                          FlutterFlowTheme.of(context).tertiary,
                                      selectedDateTimeForegroundColor:
                                          FlutterFlowTheme.of(context).info,
                                      actionButtonForegroundColor:
                                          FlutterFlowTheme.of(context).primary,
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
                                if (_model.datePicked != null) {
                                  setState(() {
                                    _model.conceptionDate = _model.datePicked;
                                  });
                                }
                              },
                              child: Container(
                                width: double.infinity,
                                height: 59.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).divider,
                                    width: 1.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 4.0, 16.0, 4.0),
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
                                              'Дата зачатия',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        lineHeight: 1.28,
                                                      ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                functions
                                                    .formatDateInDayNumberMonthStringYearNumber(
                                                        _model.conceptionDate!),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          lineHeight: 1.5,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Icon(
                                        FFIcons.kright3,
                                        color:
                                            FlutterFlowTheme.of(context).grey40,
                                        size: 24.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        if (widget.child?.birthDate != null)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 4.0, 0.0, 0.0),
                            child: Text(
                              functions.calculateAgeAndMonths(
                                  containerChildrenRecord.birthDate!),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 57.0, 0.0, 45.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              unawaited(
                                () async {
                                  await widget.child!.reference
                                      .update(createChildrenRecordData(
                                    name: _model.textController.text,
                                  ));
                                }(),
                              );
                              if (_model.tempPhoto != null &&
                                  _model.tempPhoto != '') {
                                unawaited(
                                  () async {
                                    await widget.child!.reference
                                        .update(createChildrenRecordData(
                                      photo: _model.tempPhoto,
                                    ));
                                  }(),
                                );
                              } else {
                                unawaited(
                                  () async {
                                    await widget.child!.reference
                                        .update(createChildrenRecordData(
                                      photo: '',
                                    ));
                                  }(),
                                );
                              }

                              if (widget.child?.birthDate == null) {
                                unawaited(
                                  () async {
                                    await widget.child!.reference
                                        .update(createChildrenRecordData(
                                      conceptionDate: _model.conceptionDate,
                                    ));
                                  }(),
                                );
                              }

                              context.goNamed('MainPage');
                            },
                            text: 'Продолжить',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 56.0,
                              padding: EdgeInsets.all(0.0),
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
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
