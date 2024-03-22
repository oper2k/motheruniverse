import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'create_the_growth_model.dart';
export 'create_the_growth_model.dart';

class CreateTheGrowthWidget extends StatefulWidget {
  const CreateTheGrowthWidget({
    super.key,
    required this.child,
  });

  final ChildrenRecord? child;

  @override
  State<CreateTheGrowthWidget> createState() => _CreateTheGrowthWidgetState();
}

class _CreateTheGrowthWidgetState extends State<CreateTheGrowthWidget> {
  late CreateTheGrowthModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateTheGrowthModel());

    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 1.0),
      child: StreamBuilder<ChildrenRecord>(
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
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).backgroundMain,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(24.0),
                topRight: Radius.circular(24.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Container(
                      width: 40.0,
                      height: 4.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).divider,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            'Добавить рост',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
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
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 28.0, 0.0, 0.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: TextFormField(
                        controller: _model.textController ??=
                            TextEditingController(
                          text: containerChildrenRecord.growthList.last.growth
                              .toString(),
                        ),
                        focusNode: _model.textFieldFocusNode,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.textController',
                          const Duration(milliseconds: 2000),
                          () => setState(() {}),
                        ),
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Введите рост',
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
                          contentPadding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 22.0, 16.0, 22.0),
                          suffixIcon: _model.textController!.text.isNotEmpty
                              ? InkWell(
                                  onTap: () async {
                                    _model.textController?.clear();
                                    setState(() {});
                                  },
                                  child: Icon(
                                    Icons.clear,
                                    color: FlutterFlowTheme.of(context).grey40,
                                    size: 24.0,
                                  ),
                                )
                              : null,
                        ),
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: 'Inter',
                                  lineHeight: 1.5,
                                ),
                        cursorColor: FlutterFlowTheme.of(context).overlay,
                        validator:
                            _model.textControllerValidator.asValidator(context),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                    child: Text(
                      'Текущее значение ${containerChildrenRecord.growthList.last.growth.toString()} см',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            lineHeight: 1.28,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 68.0, 0.0, 45.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        if (dateTimeFormat(
                              'd/M',
                              containerChildrenRecord.growthList.last.date,
                              locale: FFLocalizations.of(context).languageCode,
                            ) !=
                            dateTimeFormat(
                              'd/M',
                              getCurrentTimestamp,
                              locale: FFLocalizations.of(context).languageCode,
                            )) {
                          await widget.child!.reference.update({
                            ...mapToFirestore(
                              {
                                'growth_list': FieldValue.arrayUnion([
                                  getGrowthListFirestoreData(
                                    createGrowthListStruct(
                                      growth: int.tryParse(
                                          _model.textController.text),
                                      date: getCurrentTimestamp,
                                      clearUnsetFields: false,
                                    ),
                                    true,
                                  )
                                ]),
                              },
                            ),
                          });
                        }
                        Navigator.pop(context);
                      },
                      text: 'Применить',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 56.0,
                        padding: const EdgeInsets.all(0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle: FlutterFlowTheme.of(context).displaySmall,
                        elevation: 0.0,
                        borderSide: const BorderSide(
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
          );
        },
      ),
    );
  }
}
