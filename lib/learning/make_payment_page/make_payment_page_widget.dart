import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'make_payment_page_model.dart';
export 'make_payment_page_model.dart';

class MakePaymentPageWidget extends StatefulWidget {
  const MakePaymentPageWidget({
    Key? key,
    required this.price,
    this.usedBonuses,
    required this.lessonsReferences,
    required this.buyingAll,
    this.title,
  }) : super(key: key);

  final double? price;
  final double? usedBonuses;
  final List<String>? lessonsReferences;
  final bool? buyingAll;
  final String? title;

  @override
  _MakePaymentPageWidgetState createState() => _MakePaymentPageWidgetState();
}

class _MakePaymentPageWidgetState extends State<MakePaymentPageWidget> {
  late MakePaymentPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MakePaymentPageModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: Text(
                  'Произведите оплату',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).displayLarge,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                child: Container(
                  width: double.infinity,
                  child: TextFormField(
                    controller: _model.textController1,
                    focusNode: _model.textFieldFocusNode1,
                    onChanged: (_) => EasyDebounce.debounce(
                      '_model.textController1',
                      Duration(milliseconds: 200),
                      () => setState(() {}),
                    ),
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Номер карты',
                      labelStyle: FlutterFlowTheme.of(context).headlineSmall,
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
                          16.0, 22.0, 16.0, 22.0),
                    ),
                    style: FlutterFlowTheme.of(context).headlineSmall,
                    keyboardType: TextInputType.number,
                    cursorColor: FlutterFlowTheme.of(context).overlay,
                    validator:
                        _model.textController1Validator.asValidator(context),
                    inputFormatters: [_model.textFieldMask1],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        child: TextFormField(
                          controller: _model.textController2,
                          focusNode: _model.textFieldFocusNode2,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.textController2',
                            Duration(milliseconds: 200),
                            () => setState(() {}),
                          ),
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Срок действия',
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
                                16.0, 22.0, 16.0, 22.0),
                          ),
                          style: FlutterFlowTheme.of(context).headlineSmall,
                          keyboardType: TextInputType.number,
                          cursorColor: FlutterFlowTheme.of(context).overlay,
                          validator: _model.textController2Validator
                              .asValidator(context),
                          inputFormatters: [_model.textFieldMask2],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                      child: Container(
                        width: 120.0,
                        child: TextFormField(
                          controller: _model.textController3,
                          focusNode: _model.textFieldFocusNode3,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.textController3',
                            Duration(milliseconds: 200),
                            () => setState(() {}),
                          ),
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'CVC/CVV',
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
                                16.0, 22.0, 16.0, 22.0),
                          ),
                          style: FlutterFlowTheme.of(context).headlineSmall,
                          keyboardType: TextInputType.number,
                          cursorColor: FlutterFlowTheme.of(context).overlay,
                          validator: _model.textController3Validator
                              .asValidator(context),
                          inputFormatters: [_model.textFieldMask3],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Сумма',
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          fontFamily: 'Inter',
                          lineHeight: 1.5,
                        ),
                  ),
                  Text(
                    '${functions.formatDoubleWithSpaces(valueOrDefault<double>(
                      widget.price,
                      0.0,
                    ))} ₽',
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          lineHeight: 1.25,
                        ),
                  ),
                ],
              ),
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
                          children: List.generate(lesson.length, (lessonIndex) {
                            final lessonItem = lesson[lessonIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 22.0, 0.0, 45.0),
                              child: FFButtonWidget(
                                onPressed: !((_model.textController1.text !=
                                                null &&
                                            _model.textController1.text !=
                                                '') &&
                                        (_model.textController2.text != null &&
                                            _model.textController2.text !=
                                                '') &&
                                        (_model.textController3.text != null &&
                                            _model.textController3.text != ''))
                                    ? null
                                    : () async {
                                        var _shouldSetState = false;
                                        _model.validateCartNumber =
                                            await actions.validateCardNumber(
                                          _model.textController1.text,
                                        );
                                        _shouldSetState = true;
                                        if (_model.validateCartNumber!) {
                                          _model.validateCardDate =
                                              await actions
                                                  .validateCardExpireDate(
                                            _model.textController2.text,
                                          );
                                          _shouldSetState = true;
                                          if (_model.validateCardDate!) {
                                            _model.cryptogramCard = await actions
                                                .returnStringCardCryptogramForCloudpayments(
                                              _model.textController1.text,
                                              _model.textController2.text,
                                              _model.textController3.text,
                                              FFAppState().cloudPublicID,
                                            );
                                            _shouldSetState = true;
                                            _model.apiResult2li =
                                                await CloudpaymentsGroup
                                                    .payByCardCall
                                                    .call(
                                              publicId:
                                                  FFAppState().cloudPublicID,
                                              amount: widget.price!.round(),
                                              cardCryptogramPacket:
                                                  _model.cryptogramCard,
                                              email: currentUserEmail,
                                              accountId: currentUserEmail,
                                            );
                                            _shouldSetState = true;
                                            if ((_model
                                                    .apiResult2li?.succeeded ??
                                                true)) {
                                              if (CloudpaymentsGroup
                                                  .payByCardCall
                                                  .isSuccess(
                                                (_model.apiResult2li
                                                        ?.jsonBody ??
                                                    ''),
                                              )) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      CloudpaymentsGroup
                                                          .payByCardCall
                                                          .successMessage(
                                                            (_model.apiResult2li
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )
                                                          .toString(),
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .tertiary,
                                                  ),
                                                );
                                                if (widget.buyingAll!) {
                                                  await currentUserReference!
                                                      .update({
                                                    ...createUsersRecordData(
                                                      loyaltyBonuses: functions
                                                          .returnDifferenceBetwenTwoDouble(
                                                              valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.loyaltyBonuses,
                                                                  0.0),
                                                              widget
                                                                  .usedBonuses!),
                                                    ),
                                                    ...mapToFirestore(
                                                      {
                                                        'purchased_lessons':
                                                            functions.mergeLists(
                                                                (currentUserDocument
                                                                            ?.purchasedLessons
                                                                            ?.toList() ??
                                                                        [])
                                                                    .toList(),
                                                                widget
                                                                    .lessonsReferences!
                                                                    .toList()),
                                                      },
                                                    ),
                                                  });
                                                  setState(() {
                                                    FFAppState()
                                                        .lessonsAddedToCart = [];
                                                  });
                                                  await CloudpaymentsGroup
                                                      .payByCardCall
                                                      .call();
                                                  await CloudpaymentsGroup
                                                      .recieptCall
                                                      .call(
                                                    accountId: currentUserEmail,
                                                    price:
                                                        widget.price!.round(),
                                                    label: 'Лекции',
                                                  );

                                                  context.goNamed(
                                                      'SuccessfulPaymentAll');
                                                } else {
                                                  await currentUserReference!
                                                      .update({
                                                    ...createUsersRecordData(
                                                      loyaltyBonuses: functions
                                                          .returnDifferenceBetwenTwoDouble(
                                                              valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.loyaltyBonuses,
                                                                  0.0),
                                                              widget
                                                                  .usedBonuses!),
                                                    ),
                                                    ...mapToFirestore(
                                                      {
                                                        'purchased_lessons':
                                                            functions.mergeLists(
                                                                (currentUserDocument
                                                                            ?.purchasedLessons
                                                                            ?.toList() ??
                                                                        [])
                                                                    .toList(),
                                                                widget
                                                                    .lessonsReferences!
                                                                    .toList()),
                                                      },
                                                    ),
                                                  });
                                                  setState(() {
                                                    FFAppState()
                                                        .lessonsAddedToCart = [];
                                                  });
                                                  await CloudpaymentsGroup
                                                      .recieptCall
                                                      .call(
                                                    accountId: currentUserEmail,
                                                    price:
                                                        widget.price!.round(),
                                                    label:
                                                        widget.lessonsReferences!
                                                                    .length >
                                                                1
                                                            ? 'Лекции'
                                                            : lessonItem.title,
                                                  );

                                                  context.goNamed(
                                                      'SuccessfulPurchases');
                                                }
                                              } else {
                                                if (CloudpaymentsGroup
                                                        .payByCardCall
                                                        .reasonCode(
                                                      (_model.apiResult2li
                                                              ?.jsonBody ??
                                                          ''),
                                                    ) !=
                                                    null) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Что-то пошло не так: ${CloudpaymentsGroup.payByCardCall.message(
                                                              (_model.apiResult2li
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ).toString()}',
                                                        style:
                                                            GoogleFonts.getFont(
                                                          'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                    ),
                                                  );
                                                  if (_shouldSetState)
                                                    setState(() {});
                                                  return;
                                                }
                                                if (CloudpaymentsGroup
                                                            .payByCardCall
                                                            .urlForConfirm(
                                                              (_model.apiResult2li
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )
                                                            .toString() !=
                                                        null &&
                                                    CloudpaymentsGroup
                                                            .payByCardCall
                                                            .urlForConfirm(
                                                              (_model.apiResult2li
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )
                                                            .toString() !=
                                                        '') {
                                                  _model.check3DS = await actions
                                                      .check3DSCloudPayments(
                                                    CloudpaymentsGroup
                                                        .payByCardCall
                                                        .urlForConfirm(
                                                          (_model.apiResult2li
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )
                                                        .toString(),
                                                    CloudpaymentsGroup
                                                        .payByCardCall
                                                        .transactionId(
                                                          (_model.apiResult2li
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )
                                                        .toString(),
                                                    CloudpaymentsGroup
                                                        .payByCardCall
                                                        .paReq(
                                                          (_model.apiResult2li
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )
                                                        .toString(),
                                                  );
                                                  _shouldSetState = true;
                                                  if (_model.check3DS!.length >
                                                      0) {
                                                    _model.apiResult5ny =
                                                        await CloudpaymentsGroup
                                                            .checkDSCall
                                                            .call(
                                                      transactionId: int.parse(
                                                          _model
                                                              .check3DS!.first),
                                                      paRes:
                                                          _model.check3DS?.last,
                                                    );
                                                    _shouldSetState = true;
                                                    if ((_model.apiResult5ny
                                                            ?.succeeded ??
                                                        true)) {
                                                      if (CloudpaymentsGroup
                                                          .checkDSCall
                                                          .isSuccess(
                                                        (_model.apiResult5ny
                                                                ?.jsonBody ??
                                                            ''),
                                                      )) {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              CloudpaymentsGroup
                                                                  .checkDSCall
                                                                  .message(
                                                                    (_model.apiResult5ny
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )
                                                                  .toString(),
                                                              style: GoogleFonts
                                                                  .getFont(
                                                                'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary,
                                                          ),
                                                        );
                                                        if (widget.buyingAll!) {
                                                          await currentUserReference!
                                                              .update({
                                                            ...createUsersRecordData(
                                                              loyaltyBonuses: functions.returnDifferenceBetwenTwoDouble(
                                                                  valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.loyaltyBonuses,
                                                                      0.0),
                                                                  widget
                                                                      .usedBonuses!),
                                                            ),
                                                            ...mapToFirestore(
                                                              {
                                                                'purchased_lessons': functions.mergeLists(
                                                                    (currentUserDocument?.purchasedLessons?.toList() ??
                                                                            [])
                                                                        .toList(),
                                                                    widget
                                                                        .lessonsReferences!
                                                                        .toList()),
                                                              },
                                                            ),
                                                          });
                                                          setState(() {
                                                            FFAppState()
                                                                .lessonsAddedToCart = [];
                                                          });
                                                          await CloudpaymentsGroup
                                                              .recieptCall
                                                              .call(
                                                            accountId:
                                                                currentUserEmail,
                                                            price: widget.price!
                                                                .round(),
                                                            label: 'Лекции',
                                                          );

                                                          context.goNamed(
                                                              'SuccessfulPaymentAll');
                                                        } else {
                                                          await currentUserReference!
                                                              .update({
                                                            ...createUsersRecordData(
                                                              loyaltyBonuses: functions.returnDifferenceBetwenTwoDouble(
                                                                  valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.loyaltyBonuses,
                                                                      0.0),
                                                                  widget
                                                                      .usedBonuses!),
                                                            ),
                                                            ...mapToFirestore(
                                                              {
                                                                'purchased_lessons': functions.mergeLists(
                                                                    (currentUserDocument?.purchasedLessons?.toList() ??
                                                                            [])
                                                                        .toList(),
                                                                    widget
                                                                        .lessonsReferences!
                                                                        .toList()),
                                                              },
                                                            ),
                                                          });
                                                          setState(() {
                                                            FFAppState()
                                                                .lessonsAddedToCart = [];
                                                          });
                                                          await CloudpaymentsGroup
                                                              .recieptCall
                                                              .call(
                                                            accountId:
                                                                currentUserEmail,
                                                            price: widget.price!
                                                                .round(),
                                                            label: widget
                                                                        .lessonsReferences!
                                                                        .length >
                                                                    1
                                                                ? 'Лекции'
                                                                : lessonItem
                                                                    .title,
                                                          );

                                                          context.goNamed(
                                                              'SuccessfulPurchases');
                                                        }
                                                      } else {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Что-то пошло не так: ${CloudpaymentsGroup.checkDSCall.message(
                                                                    (_model.apiResult5ny
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ).toString()}',
                                                              style: GoogleFonts
                                                                  .getFont(
                                                                'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary,
                                                          ),
                                                        );
                                                      }
                                                    } else {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Что-то пошло не так: ${(_model.apiResult5ny?.statusCode ?? 200).toString()}',
                                                            style: GoogleFonts
                                                                .getFont(
                                                              'Inter',
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .tertiary,
                                                        ),
                                                      );
                                                    }
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Ошибка 3DS',
                                                          style: GoogleFonts
                                                              .getFont(
                                                            'Inter',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 4000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                      ),
                                                    );
                                                  }
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Что-то пошло не так: ${CloudpaymentsGroup.payByCardCall.message(
                                                              (_model.apiResult2li
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ).toString()}',
                                                        style:
                                                            GoogleFonts.getFont(
                                                          'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                    ),
                                                  );
                                                }
                                              }
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Что-то пошло не так: ${(_model.apiResult2li?.statusCode ?? 200).toString()}',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .tertiary,
                                                ),
                                              );
                                            }
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Срок карты введен неверно',
                                                  style: GoogleFonts.getFont(
                                                    'Inter',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                              ),
                                            );
                                            if (_shouldSetState)
                                              setState(() {});
                                            return;
                                          }
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Номер карты введён неверно',
                                                style: GoogleFonts.getFont(
                                                  'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                            ),
                                          );
                                          if (_shouldSetState) setState(() {});
                                          return;
                                        }

                                        if (_shouldSetState) setState(() {});
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
                                  disabledColor:
                                      FlutterFlowTheme.of(context).grey20,
                                  disabledTextColor:
                                      FlutterFlowTheme.of(context).primaryText,
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
            ],
          ),
        ),
      ),
    );
  }
}
