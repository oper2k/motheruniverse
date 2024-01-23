import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'all_check_lists_page_model.dart';
export 'all_check_lists_page_model.dart';

class AllCheckListsPageWidget extends StatefulWidget {
  const AllCheckListsPageWidget({Key? key}) : super(key: key);

  @override
  _AllCheckListsPageWidgetState createState() =>
      _AllCheckListsPageWidgetState();
}

class _AllCheckListsPageWidgetState extends State<AllCheckListsPageWidget> {
  late AllCheckListsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllCheckListsPageModel());

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
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 38.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
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
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: Text(
                          'Чек-листы',
                          style: FlutterFlowTheme.of(context).displayLarge,
                        ),
                      ),
                      TextFormField(
                        controller: _model.textController,
                        focusNode: _model.textFieldFocusNode,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.textController',
                          Duration(milliseconds: 100),
                          () async {
                            setState(() {
                              _model.filter = _model.textController.text;
                            });
                          },
                        ),
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'Найдите название чек-листа',
                          hintStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context).grey40,
                                    fontSize: 16.0,
                                    lineHeight: 1.5,
                                  ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 0.0,
                            ),
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 0.0,
                            ),
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 0.0,
                            ),
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 0.0,
                            ),
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(
                            FFIcons.ksearch,
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).headlineSmall,
                        cursorColor: FlutterFlowTheme.of(context).secondaryText,
                        validator:
                            _model.textControllerValidator.asValidator(context),
                      ),
                      StreamBuilder<List<CheckListRecord>>(
                        stream: queryCheckListRecord(
                          queryBuilder: (checkListRecord) =>
                              checkListRecord.orderBy('sort', descending: true),
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
                          List<CheckListRecord> containerCheckListRecordList =
                              snapshot.data!;
                          return Container(
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 24.0, 0.0, 0.0),
                              child: Builder(
                                builder: (context) {
                                  final checkList = containerCheckListRecordList
                                      .where((e) =>
                                          functions.searchStringInList(
                                              e.title, _model.filter))
                                      .toList();
                                  return GridView.builder(
                                    padding: EdgeInsets.zero,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 16.0,
                                      mainAxisSpacing: 16.0,
                                      childAspectRatio: 0.77,
                                    ),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: checkList.length,
                                    itemBuilder: (context, checkListIndex) {
                                      final checkListItem =
                                          checkList[checkListIndex];
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'CheckViewPDF',
                                            queryParameters: {
                                              'check': serializeParam(
                                                checkListItem,
                                                ParamType.Document,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'check': checkListItem,
                                            },
                                          );
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                                child: Image.network(
                                                  checkListItem.image,
                                                  width: 159.0,
                                                  height: 159.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 8.0, 0.0, 0.0),
                                                child: Text(
                                                  checkListItem.title,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        lineHeight: 1.25,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          );
                        },
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
