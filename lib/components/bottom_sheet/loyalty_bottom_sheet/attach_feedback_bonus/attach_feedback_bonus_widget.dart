import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/bottom_sheet/loyalty_bottom_sheet/feedback_is_sent/feedback_is_sent_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'attach_feedback_bonus_model.dart';
export 'attach_feedback_bonus_model.dart';

class AttachFeedbackBonusWidget extends StatefulWidget {
  const AttachFeedbackBonusWidget({super.key});

  @override
  State<AttachFeedbackBonusWidget> createState() =>
      _AttachFeedbackBonusWidgetState();
}

class _AttachFeedbackBonusWidgetState extends State<AttachFeedbackBonusWidget> {
  late AttachFeedbackBonusModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AttachFeedbackBonusModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).backgroundMain,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(24.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40.0,
                height: 4.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).divider,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        'Прикрепить отзыв',
                        textAlign: TextAlign.center,
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                  lineHeight: 1.25,
                                ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 28.0,
                        height: 28.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).grey20,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          FFIcons.kclose3,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Builder(
                      builder: (context) {
                        if (_model.screenshot != null &&
                            _model.screenshot != '') {
                          return Stack(
                            alignment: AlignmentDirectional(1.0, -1.0),
                            children: [
                              Container(
                                width: 112.0,
                                height: 112.0,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.network(
                                  _model.screenshot!,
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
                                    _model.screenshot = null;
                                  });
                                },
                                child: Container(
                                  width: 28.0,
                                  height: 28.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    FFIcons.kclose3,
                                    color: FlutterFlowTheme.of(context).grey60,
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
                                imageQuality: 75,
                                allowPhoto: true,
                              );
                              if (selectedMedia != null &&
                                  selectedMedia.every((m) => validateFileFormat(
                                      m.storagePath, context))) {
                                setState(() => _model.isDataUploading = true);
                                var selectedUploadedFiles = <FFUploadedFile>[];

                                var downloadUrls = <String>[];
                                try {
                                  showUploadMessage(
                                    context,
                                    'Файл заргужается',
                                    showLoading: true,
                                  );
                                  selectedUploadedFiles = selectedMedia
                                      .map((m) => FFUploadedFile(
                                            name: m.storagePath.split('/').last,
                                            bytes: m.bytes,
                                            height: m.dimensions?.height,
                                            width: m.dimensions?.width,
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
                                    _model.uploadedFileUrl = downloadUrls.first;
                                  });
                                  showUploadMessage(context, 'Успешно!');
                                } else {
                                  setState(() {});
                                  showUploadMessage(
                                      context, 'Ошибка загрузки данных');
                                  return;
                                }
                              }

                              setState(() {
                                _model.screenshot = _model.uploadedFileUrl;
                              });
                            },
                            child: Container(
                              width: 112.0,
                              height: 112.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).tertiary,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                FFIcons.kcamera1,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 24.0,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Сделайте скриншот вашего отзыва и отправьте на подтверждение администратору',
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'Inter',
                                fontSize: 12.0,
                                lineHeight: 1.33,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 65.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(
                        'Вы получите',
                        style:
                            FlutterFlowTheme.of(context).displayMedium.override(
                                  fontFamily: 'Inter',
                                  lineHeight: 1.5,
                                ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: Image.asset(
                        'assets/images/Medal.webp',
                        width: 32.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                      child: Text(
                        '100 баллов',
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                  lineHeight: 1.25,
                                ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 45.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    if (_model.screenshot != null && _model.screenshot != '') {
                      await FeedbackScreenshotsRecord.collection
                          .doc()
                          .set(createFeedbackScreenshotsRecordData(
                            screenshot: _model.screenshot,
                            userId: currentUserUid,
                          ));

                      await currentUserReference!.update(createUsersRecordData(
                        loyaltyBonuses: functions.addBonusesToUser(
                            valueOrDefault(
                                currentUserDocument?.loyaltyBonuses, 0.0),
                            100.0),
                        feedbackSentBonusClaimed: true,
                      ));
                      Navigator.pop(context);
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        barrierColor: FlutterFlowTheme.of(context).botomBack,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: FeedbackIsSentWidget(),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    }
                  },
                  text: 'Отправить',
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
    );
  }
}
