import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'entry_finished_page_model.dart';
export 'entry_finished_page_model.dart';

class EntryFinishedPageWidget extends StatefulWidget {
  const EntryFinishedPageWidget({Key? key}) : super(key: key);

  @override
  _EntryFinishedPageWidgetState createState() =>
      _EntryFinishedPageWidgetState();
}

class _EntryFinishedPageWidgetState extends State<EntryFinishedPageWidget> {
  late EntryFinishedPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EntryFinishedPageModel());
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
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Align(
          alignment: AlignmentDirectional(0.00, 0.00),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 45.0, 20.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/check_mark.webp',
                    height: 168.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                  child: Text(
                    'Вы успешно',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).displayLarge,
                  ),
                ),
                Stack(
                  alignment: AlignmentDirectional(1.0, 1.0),
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/exclamation_mark.webp',
                        height: 47.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 0.0, 0.0),
                      child: Text(
                        'записаны   ',
                        style: FlutterFlowTheme.of(context).displayLarge,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Вебинар пройдет онлайн, дату скоро объявим. Обязательно оставьте ваши актуальные данные для обратной связи, чтобы мы могли сообщить о старте курса',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        fontSize: 16.0,
                        lineHeight: 1.5,
                      ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 45.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      context.goNamed('CalendarOfEventsPage');
                    },
                    text: 'Отлично!',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 56.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
