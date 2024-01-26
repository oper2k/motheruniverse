import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/components/networking_profile/networking_profile_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'networking_searching_user_model.dart';
export 'networking_searching_user_model.dart';

class NetworkingSearchingUserWidget extends StatefulWidget {
  const NetworkingSearchingUserWidget({super.key});

  @override
  State<NetworkingSearchingUserWidget> createState() =>
      _NetworkingSearchingUserWidgetState();
}

class _NetworkingSearchingUserWidgetState
    extends State<NetworkingSearchingUserWidget> {
  late NetworkingSearchingUserModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NetworkingSearchingUserModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));

      await currentUserReference!.update(createUsersRecordData(
        lastTimeCheckedLocation: getCurrentTimestamp,
        lastLocation: currentUserLocationValue,
      ));
    });

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
        body: Container(
          decoration: BoxDecoration(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 45.0, 0.0, 0.0),
            child: Stack(
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 13.0, 20.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Container(
                              width: 100.0,
                              child: TextFormField(
                                controller: _model.textController,
                                focusNode: _model.textFieldFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.textController',
                                  Duration(milliseconds: 200),
                                  () async {
                                    setState(() {
                                      _model.input = _model.textController.text;
                                      _model.firstName = functions
                                          .extractFirstName(_model.input);
                                      _model.secondName =
                                          functions.extractSecondNameOrEmpty(
                                              _model.input);
                                    });
                                  },
                                ),
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .headlineSmall,
                                  hintText: 'Найти людей',
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
                                    borderRadius: BorderRadius.circular(14.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(14.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(14.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(14.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          16.0, 15.0, 16.0, 15.0),
                                  prefixIcon: Icon(
                                    FFIcons.ksearch,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                  ),
                                ),
                                style:
                                    FlutterFlowTheme.of(context).headlineSmall,
                                cursorColor:
                                    FlutterFlowTheme.of(context).overlay,
                                validator: _model.textControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.goNamed(
                                  'NetworkingPage',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              },
                              child: Text(
                                'Отменить',
                                style: FlutterFlowTheme.of(context)
                                    .headlineLarge
                                    .override(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.normal,
                                      lineHeight: 1.28,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if ((FFAppState().lastResultsUser.length > 0) &&
                              (_model.firstName == null ||
                                  _model.firstName == ''))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 19.0, 0.0, 0.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'ПОСЛЕДНИЕ РЕЗУЛЬТАТЫ',
                                          style: FlutterFlowTheme.of(context)
                                              .headlineMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w600,
                                                lineHeight: 1.28,
                                              ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            setState(() {
                                              FFAppState().lastResultsUser = [];
                                            });
                                          },
                                          child: Icon(
                                            FFIcons.kclose3,
                                            color: FlutterFlowTheme.of(context)
                                                .grey40,
                                            size: 24.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
                                      child: Builder(
                                        builder: (context) {
                                          final recentUsers = FFAppState()
                                              .lastResultsUser
                                              .toList();
                                          return SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: List.generate(
                                                      recentUsers.length,
                                                      (recentUsersIndex) {
                                                final recentUsersItem =
                                                    recentUsers[
                                                        recentUsersIndex];
                                                return StreamBuilder<
                                                    UsersRecord>(
                                                  stream:
                                                      UsersRecord.getDocument(
                                                          recentUsersItem),
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
                                                    final containerUsersRecord =
                                                        snapshot.data!;
                                                    return Container(
                                                      width: double.infinity,
                                                      height: 48.0,
                                                      decoration:
                                                          BoxDecoration(),
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
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            context: context,
                                                            builder: (context) {
                                                              return GestureDetector(
                                                                onTap: () => _model
                                                                        .unfocusNode
                                                                        .canRequestFocus
                                                                    ? FocusScope.of(
                                                                            context)
                                                                        .requestFocus(_model
                                                                            .unfocusNode)
                                                                    : FocusScope.of(
                                                                            context)
                                                                        .unfocus(),
                                                                child: Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      NetworkingProfileWidget(
                                                                    user:
                                                                        containerUsersRecord,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                  () {}));

                                                          setState(() {
                                                            FFAppState().lastResultsUser = functions
                                                                .updateRecentResultsList(
                                                                    FFAppState()
                                                                        .lastResultsUser
                                                                        .toList(),
                                                                    containerUsersRecord
                                                                        .reference)
                                                                .toList()
                                                                .cast<
                                                                    DocumentReference>();
                                                          });
                                                        },
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Builder(
                                                              builder:
                                                                  (context) {
                                                                if (containerUsersRecord
                                                                            .photoUrl !=
                                                                        null &&
                                                                    containerUsersRecord
                                                                            .photoUrl !=
                                                                        '') {
                                                                  return Container(
                                                                    width: 48.0,
                                                                    height:
                                                                        48.0,
                                                                    clipBehavior:
                                                                        Clip.antiAlias,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child: Image
                                                                        .network(
                                                                      containerUsersRecord
                                                                          .photoUrl,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  );
                                                                } else {
                                                                  return Container(
                                                                    width: 48.0,
                                                                    height:
                                                                        48.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .tertiary,
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child: Icon(
                                                                      FFIcons
                                                                          .kcamera,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  );
                                                                }
                                                              },
                                                            ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  '${containerUsersRecord.firstName} ${containerUsersRecord.secondName}',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                              ),
                                                            ),
                                                            Icon(
                                                              FFIcons.kright10,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .grey40,
                                                              size: 24.0,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              })
                                                  .divide(
                                                      SizedBox(height: 14.0))
                                                  .addToStart(
                                                      SizedBox(height: 7.0)),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          if (_model.firstName != null &&
                              _model.firstName != '')
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 19.0, 0.0, 0.0),
                              child: StreamBuilder<List<UsersRecord>>(
                                stream: queryUsersRecord(
                                  queryBuilder: (usersRecord) => usersRecord
                                      .where(
                                        'first_name',
                                        isEqualTo: _model.firstName != ''
                                            ? _model.firstName
                                            : null,
                                      )
                                      .where(
                                        'second_name',
                                        isEqualTo: _model.secondName != ''
                                            ? _model.secondName
                                            : null,
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
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<UsersRecord>
                                      searchResultsUsersRecordList = snapshot
                                          .data!
                                          .where((u) => u.uid != currentUserUid)
                                          .toList();
                                  return Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Text(
                                              '${searchResultsUsersRecordList.length.toString()} ${functions.formOfResultWord(searchResultsUsersRecordList.length)}',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        lineHeight: 1.28,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 0.0, 0.0),
                                            child: Builder(
                                              builder: (context) {
                                                final user =
                                                    searchResultsUsersRecordList
                                                        .toList();
                                                return SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: List.generate(
                                                            user.length,
                                                            (userIndex) {
                                                      final userItem =
                                                          user[userIndex];
                                                      return Container(
                                                        width: double.infinity,
                                                        height: 48.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return GestureDetector(
                                                                  onTap: () => _model
                                                                          .unfocusNode
                                                                          .canRequestFocus
                                                                      ? FocusScope.of(
                                                                              context)
                                                                          .requestFocus(_model
                                                                              .unfocusNode)
                                                                      : FocusScope.of(
                                                                              context)
                                                                          .unfocus(),
                                                                  child:
                                                                      Padding(
                                                                    padding: MediaQuery
                                                                        .viewInsetsOf(
                                                                            context),
                                                                    child:
                                                                        NetworkingProfileWidget(
                                                                      user:
                                                                          userItem,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                safeSetState(
                                                                    () {}));

                                                            setState(() {
                                                              FFAppState().lastResultsUser = functions
                                                                  .updateRecentResultsList(
                                                                      FFAppState()
                                                                          .lastResultsUser
                                                                          .toList(),
                                                                      userItem
                                                                          .reference)
                                                                  .toList()
                                                                  .cast<
                                                                      DocumentReference>();
                                                            });
                                                          },
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Builder(
                                                                builder:
                                                                    (context) {
                                                                  if (userItem.photoUrl !=
                                                                          null &&
                                                                      userItem.photoUrl !=
                                                                          '') {
                                                                    return Container(
                                                                      width:
                                                                          48.0,
                                                                      height:
                                                                          48.0,
                                                                      clipBehavior:
                                                                          Clip.antiAlias,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                      child: Image
                                                                          .network(
                                                                        userItem
                                                                            .photoUrl,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    );
                                                                  } else {
                                                                    return Container(
                                                                      width:
                                                                          48.0,
                                                                      height:
                                                                          48.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiary,
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                      child:
                                                                          Icon(
                                                                        FFIcons
                                                                            .kcamera,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                    );
                                                                  }
                                                                },
                                                              ),
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    '${userItem.firstName} ${userItem.secondName}',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium,
                                                                  ),
                                                                ),
                                                              ),
                                                              Icon(
                                                                FFIcons
                                                                    .kright10,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .grey40,
                                                                size: 24.0,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    })
                                                        .divide(SizedBox(
                                                            height: 14.0))
                                                        .addToStart(SizedBox(
                                                            height: 7.0)),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
                wrapWithModel(
                  model: _model.navBarModel,
                  updateCallback: () => setState(() {}),
                  child: NavBarWidget(
                    nevBarPage: 4,
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
