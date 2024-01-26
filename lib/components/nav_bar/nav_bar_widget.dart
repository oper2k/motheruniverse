import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nav_bar_model.dart';
export 'nav_bar_model.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({
    super.key,
    required this.nevBarPage,
  });

  final int? nevBarPage;

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  late NavBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarModel());

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
        height: 85.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).backgroundMain,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(27.0, 16.0, 27.0, 16.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    HapticFeedback.mediumImpact();

                    context.goNamed(
                      'MainPage',
                      extra: <String, dynamic>{
                        kTransitionInfoKey: TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                        ),
                      },
                    );
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Builder(
                        builder: (context) {
                          if (widget.nevBarPage == 1) {
                            return Icon(
                              FFIcons.khome1,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 24.0,
                            );
                          } else {
                            return Icon(
                              FFIcons.khome2,
                              color: FlutterFlowTheme.of(context).grey60,
                              size: 24.0,
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    HapticFeedback.mediumImpact();

                    context.goNamed(
                      'TrackersPage',
                      extra: <String, dynamic>{
                        kTransitionInfoKey: TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                        ),
                      },
                    );
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Builder(
                        builder: (context) {
                          if (widget.nevBarPage == 2) {
                            return Icon(
                              FFIcons.kcalendarActive2,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 24.0,
                            );
                          } else {
                            return Icon(
                              FFIcons.kcalendar,
                              color: FlutterFlowTheme.of(context).grey60,
                              size: 24.0,
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    HapticFeedback.mediumImpact();

                    context.goNamed(
                      'LearningPage',
                      extra: <String, dynamic>{
                        kTransitionInfoKey: TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                        ),
                      },
                    );
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Builder(
                        builder: (context) {
                          if (widget.nevBarPage == 3) {
                            return Icon(
                              FFIcons.kbookActive,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 24.0,
                            );
                          } else {
                            return Icon(
                              FFIcons.kbook,
                              color: FlutterFlowTheme.of(context).grey60,
                              size: 24.0,
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    HapticFeedback.mediumImpact();

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
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Builder(
                        builder: (context) {
                          if (widget.nevBarPage == 4) {
                            return Icon(
                              FFIcons.kcompasActive,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 24.0,
                            );
                          } else {
                            return Icon(
                              FFIcons.kcompas,
                              color: FlutterFlowTheme.of(context).grey60,
                              size: 24.0,
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    HapticFeedback.mediumImpact();

                    context.goNamed(
                      'ProfilePage',
                      extra: <String, dynamic>{
                        kTransitionInfoKey: TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                        ),
                      },
                    );
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Builder(
                        builder: (context) {
                          if (widget.nevBarPage == 5) {
                            return Icon(
                              FFIcons.kuserActive,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 24.0,
                            );
                          } else {
                            return Icon(
                              FFIcons.kuser,
                              color: FlutterFlowTheme.of(context).grey60,
                              size: 24.0,
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ].divide(SizedBox(width: 38.0)),
          ),
        ),
      ),
    );
  }
}
