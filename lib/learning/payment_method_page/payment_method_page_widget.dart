import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'payment_method_page_model.dart';
export 'payment_method_page_model.dart';

class PaymentMethodPageWidget extends StatefulWidget {
  const PaymentMethodPageWidget({
    Key? key,
    required this.goodsCount,
    required this.price,
    required this.buyingAll,
    required this.lessonsReferences,
  }) : super(key: key);

  final int? goodsCount;
  final double? price;
  final bool? buyingAll;
  final List<String>? lessonsReferences;

  @override
  _PaymentMethodPageWidgetState createState() =>
      _PaymentMethodPageWidgetState();
}

class _PaymentMethodPageWidgetState extends State<PaymentMethodPageWidget> {
  late PaymentMethodPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentMethodPageModel());
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
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 45.0, 20.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                height: 38.0,
                decoration: BoxDecoration(),
                child: Align(
                  alignment: AlignmentDirectional(-1.00, 0.00),
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
                        alignment: AlignmentDirectional(-1.00, 0.00),
                        child: Icon(
                          FFIcons.kleft,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              AutoSizeText(
                'Выберите способ оплаты',
                textAlign: TextAlign.center,
                maxLines: 2,
                style: FlutterFlowTheme.of(context).displayLarge,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed(
                      'MakePaymentPage',
                      queryParameters: {
                        'price': serializeParam(
                          _model.useBonuses
                              ? (valueOrDefault(
                                          currentUserDocument?.loyaltyBonuses,
                                          0.0) <=
                                      widget.price!
                                  ? 1.0
                                  : functions.returnDifferenceBetwenTwoDouble(
                                      widget.price!,
                                      valueOrDefault(
                                          currentUserDocument?.loyaltyBonuses,
                                          0.0)))
                              : widget.price,
                          ParamType.double,
                        ),
                        'usedBonuses': serializeParam(
                          () {
                            if ((valueOrDefault(
                                        currentUserDocument?.loyaltyBonuses,
                                        0.0) >=
                                    widget.price!) &&
                                _model.useBonuses) {
                              return (widget.price! - 1);
                            } else if ((valueOrDefault(
                                        currentUserDocument?.loyaltyBonuses,
                                        0.0) <
                                    widget.price!) &&
                                _model.useBonuses) {
                              return valueOrDefault(
                                  currentUserDocument?.loyaltyBonuses, 0.0);
                            } else {
                              return 0.0;
                            }
                          }(),
                          ParamType.double,
                        ),
                        'lessonsReferences': serializeParam(
                          widget.lessonsReferences,
                          ParamType.String,
                          true,
                        ),
                        'buyingAll': serializeParam(
                          widget.buyingAll,
                          ParamType.bool,
                        ),
                      }.withoutNulls,
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 18.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            FFIcons.kcreditCard,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 24.0,
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Оплата картой',
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      lineHeight: 1.25,
                                    ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: Icon(
                              FFIcons.kright2,
                              color: FlutterFlowTheme.of(context).grey40,
                              size: 24.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              if (widget.goodsCount == 1)
                Container(
                  width: double.infinity,
                  height: 1.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).divider,
                  ),
                ),
              if ((widget.goodsCount == 1) && (_model.useBonuses == false))
                StreamBuilder<List<LearningRecord>>(
                  stream: queryLearningRecord(),
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
                    List<LearningRecord> containerLearningRecordList =
                        snapshot.data!;
                    return Container(
                      decoration: BoxDecoration(),
                      child: Builder(
                        builder: (context) {
                          final lesson = containerLearningRecordList
                              .where((e) =>
                                  e.reference.id ==
                                  widget.lessonsReferences?.first)
                              .toList();
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children:
                                List.generate(lesson.length, (lessonIndex) {
                              final lessonItem = lesson[lessonIndex];
                              return Visibility(
                                visible: (widget.goodsCount == 1) &&
                                    (_model.useBonuses == false),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    // в переменную данные урока который покупаем поле revenuecatID
                                    _model.revenuePurch =
                                        await revenue_cat.purchasePackage(
                                            lessonItem.revenueCatID);
                                    if (_model.revenuePurch!) {
                                      await currentUserReference!.update({
                                        'purchased_lessons':
                                            functions.mergeLists(
                                                (currentUserDocument
                                                            ?.purchasedLessons
                                                            ?.toList() ??
                                                        [])
                                                    .toList(),
                                                widget.lessonsReferences!
                                                    .toList()),
                                      });
                                      setState(() {
                                        FFAppState().lessonsAddedToCart = [];
                                      });

                                      context.goNamed('SuccessfulPurchases');
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Произошла ошибка при покупке',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                        ),
                                      );
                                    }

                                    setState(() {});
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 18.0, 0.0, 18.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            FFIcons.kmoney,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 24.0,
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                'Купить в приложении',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          lineHeight: 1.25,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 0.0, 0.0),
                                            child: Icon(
                                              FFIcons.kright2,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .grey40,
                                              size: 24.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          );
                        },
                      ),
                    );
                  },
                ),
              Spacer(),
              if (valueOrDefault(currentUserDocument?.loyaltyBonuses, 0.0) >
                  0.0)
                AuthUserStreamWidget(
                  builder: (context) => Container(
                    width: double.infinity,
                    height: 64.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          20.0, 16.0, 20.0, 16.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/Medal.webp',
                              width: 32.0,
                              height: 32.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Списать ${valueOrDefault(currentUserDocument?.loyaltyBonuses, 0.0) > widget.price! ? widget.price?.toString() : valueOrDefault(currentUserDocument?.loyaltyBonuses, 0.0).toString()} бонусов',
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                      lineHeight: 1.25,
                                    ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 0.0, 0.0),
                            child: Switch.adaptive(
                              value: _model.switchValue ??= false,
                              onChanged: (newValue) async {
                                setState(() => _model.switchValue = newValue!);
                                if (newValue!) {
                                  setState(() {
                                    _model.useBonuses = true;
                                  });
                                } else {
                                  setState(() {
                                    _model.useBonuses = false;
                                  });
                                }
                              },
                              activeColor: FlutterFlowTheme.of(context).primary,
                              activeTrackColor:
                                  FlutterFlowTheme.of(context).tertiary,
                              inactiveTrackColor:
                                  FlutterFlowTheme.of(context).grey20,
                              inactiveThumbColor:
                                  FlutterFlowTheme.of(context).alternate,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 23.0, 0.0, 50.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Сумма',
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                fontFamily: 'Inter',
                                lineHeight: 1.5,
                              ),
                    ),
                    Builder(
                      builder: (context) {
                        if (_model.useBonuses) {
                          return AuthUserStreamWidget(
                            builder: (context) => Text(
                              '${valueOrDefault(currentUserDocument?.loyaltyBonuses, 0.0) > widget.price! ? '0' : functions.formatDoubleWithSpaces(functions.returnDifferenceBetwenTwoDouble(widget.price!, valueOrDefault(currentUserDocument?.loyaltyBonuses, 0.0)))} ₽',
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                    lineHeight: 1.25,
                                  ),
                            ),
                          );
                        } else {
                          return Text(
                            '${functions.formatDoubleWithSpaces(widget.price!)} ₽',
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                  lineHeight: 1.25,
                                ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
