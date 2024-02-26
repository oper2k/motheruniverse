import '/auth/firebase_auth/auth_util.dart';
import '/components/bottom_sheet/loyalty_bottom_sheet/family_super_power/family_super_power_widget.dart';
import '/components/bottom_sheet/loyalty_bottom_sheet/remind_to_fill_profile/remind_to_fill_profile_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'entry_page_model.dart';
export 'entry_page_model.dart';

class EntryPageWidget extends StatefulWidget {
  const EntryPageWidget({super.key});

  @override
  State<EntryPageWidget> createState() => _EntryPageWidgetState();
}

class _EntryPageWidgetState extends State<EntryPageWidget> {
  late EntryPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EntryPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 1000));
      if (valueOrDefault<bool>(currentUserDocument?.profileIsFilled, false)) {
        if (valueOrDefault<bool>(
            currentUserDocument?.atLeastOneChildIsAdded, false)) {
          setState(() {
            FFAppState().entryCounter = FFAppState().entryCounter + 1;
          });
          if (functions.isTwoFiveOrMultipleOfTen(FFAppState().entryCounter)) {
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

            await Future.delayed(const Duration(milliseconds: 200));
            await showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              barrierColor: FlutterFlowTheme.of(context).botomBack,
              context: context,
              builder: (context) {
                return GestureDetector(
                  onTap: () => _model.unfocusNode.canRequestFocus
                      ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                      : FocusScope.of(context).unfocus(),
                  child: Padding(
                    padding: MediaQuery.viewInsetsOf(context),
                    child: FamilySuperPowerWidget(),
                  ),
                );
              },
            ).then((value) => safeSetState(() {}));
          } else {
            if (functions.every5thEntry(FFAppState().entryCounter)) {
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

              await Future.delayed(const Duration(milliseconds: 200));
              await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                barrierColor: FlutterFlowTheme.of(context).botomBack,
                context: context,
                builder: (context) {
                  return GestureDetector(
                    onTap: () => _model.unfocusNode.canRequestFocus
                        ? FocusScope.of(context)
                            .requestFocus(_model.unfocusNode)
                        : FocusScope.of(context).unfocus(),
                    child: Padding(
                      padding: MediaQuery.viewInsetsOf(context),
                      child: RemindToFillProfileWidget(),
                    ),
                  );
                },
              ).then((value) => safeSetState(() {}));
            } else {
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
            }
          }
        } else {
          context.goNamed(
            'ChooseTheGender',
            extra: <String, dynamic>{
              kTransitionInfoKey: TransitionInfo(
                hasTransition: true,
                transitionType: PageTransitionType.fade,
                duration: Duration(milliseconds: 0),
              ),
            },
          );
        }
      } else {
        context.goNamed(
          'FillProfile',
          extra: <String, dynamic>{
            kTransitionInfoKey: TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.fade,
              duration: Duration(milliseconds: 0),
            ),
          },
        );
      }
    });

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
      ),
    );
  }
}
