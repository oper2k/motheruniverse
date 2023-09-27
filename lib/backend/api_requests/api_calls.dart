import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Cloudpayments Group Code

class CloudpaymentsGroup {
  static String baseUrl = 'https://api.cloudpayments.ru';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static PayByCardCall payByCardCall = PayByCardCall();
  static CheckDSCall checkDSCall = CheckDSCall();
  static SubscriptionsCreateCopyCall subscriptionsCreateCopyCall =
      SubscriptionsCreateCopyCall();
  static CheckSubscriptionsCopyCall checkSubscriptionsCopyCall =
      CheckSubscriptionsCopyCall();
  static CancelSubscriptionsCopyCall cancelSubscriptionsCopyCall =
      CancelSubscriptionsCopyCall();
}

class PayByCardCall {
  Future<ApiCallResponse> call({
    String? publicId = '',
    int? amount,
    String? cardCryptogramPacket = '',
    String? email = '',
    String? accountId = '',
  }) {
    final ffApiRequestBody = '''
{
  "publicId": "${publicId}",
  "Amount": ${amount},
  "Currency": "RUB",
  "CardCryptogramPacket": "${cardCryptogramPacket}",
  "Email": "${email}",
  "AccountId": "${accountId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Pay by card',
      apiUrl: '${CloudpaymentsGroup.baseUrl}/payments/cards/charge',
      callType: ApiCallType.POST,
      headers: {
        ...CloudpaymentsGroup.headers,
        'Authorization': 'Basic ApiCloud',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
    );
  }

  dynamic isSuccess(dynamic response) => getJsonField(
        response,
        r'''$.Success''',
      );
  dynamic urlForConfirm(dynamic response) => getJsonField(
        response,
        r'''$.Model.AcsUrl''',
      );
  dynamic transactionId(dynamic response) => getJsonField(
        response,
        r'''$.Model.TransactionId''',
      );
  dynamic paReq(dynamic response) => getJsonField(
        response,
        r'''$.Model.PaReq''',
      );
  dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.Message''',
      );
  dynamic successMessage(dynamic response) => getJsonField(
        response,
        r'''$.Model.CardHolderMessage''',
      );
  dynamic accountId(dynamic response) => getJsonField(
        response,
        r'''$.Model.AccountId''',
      );
  dynamic token(dynamic response) => getJsonField(
        response,
        r'''$.Model.Token''',
      );
  dynamic reasonCode(dynamic response) => getJsonField(
        response,
        r'''$.Model.ReasonCode''',
      );
}

class CheckDSCall {
  Future<ApiCallResponse> call({
    int? transactionId,
    String? paRes = '',
  }) {
    final ffApiRequestBody = '''
{
  "TransactionId": ${transactionId},
  "PaRes": "${paRes}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CheckDS',
      apiUrl: '${CloudpaymentsGroup.baseUrl}/payments/cards/post3ds',
      callType: ApiCallType.POST,
      headers: {
        ...CloudpaymentsGroup.headers,
        'Authorization': 'Basic ApiCloud',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
    );
  }

  dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.Model.CardHolderMessage''',
      );
  dynamic isSuccess(dynamic response) => getJsonField(
        response,
        r'''$.Success''',
      );
  dynamic accountID(dynamic response) => getJsonField(
        response,
        r'''$.Model.AccountId''',
      );
  dynamic token(dynamic response) => getJsonField(
        response,
        r'''$.Model.Token''',
      );
}

class SubscriptionsCreateCopyCall {
  Future<ApiCallResponse> call({
    String? apiCloud = '',
  }) {
    final ffApiRequestBody = '''
{
  "Token": "<Token>",
  "AccountId": "<AccountId>",
  "Description": "<Description>",
  "Email": "<Email>",
  "Amount": 0,
  "Currency": "RUB",
  "publicId": "<publicId>",
  "RequireConfirmation": false,
  "StartDate": "<StartDate>",
  "Interval": "<Interval>",
  "Period": 1
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Subscriptions create Copy',
      apiUrl: '${CloudpaymentsGroup.baseUrl}/subscriptions/create',
      callType: ApiCallType.POST,
      headers: {
        ...CloudpaymentsGroup.headers,
        'Authorization': 'Basic ${apiCloud}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CheckSubscriptionsCopyCall {
  Future<ApiCallResponse> call({
    String? apiCloud = '',
    String? id = '',
  }) {
    final ffApiRequestBody = '''
{
  "Id": "${id}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Check subscriptions Copy',
      apiUrl: '${CloudpaymentsGroup.baseUrl}/subscriptions/get',
      callType: ApiCallType.POST,
      headers: {
        ...CloudpaymentsGroup.headers,
        'Authorization': 'Basic ${apiCloud}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CancelSubscriptionsCopyCall {
  Future<ApiCallResponse> call({
    String? apiCloud = '',
    String? id = '',
  }) {
    final ffApiRequestBody = '''
{
  "Id": "${id}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Cancel subscriptions Copy',
      apiUrl: '${CloudpaymentsGroup.baseUrl}/subscriptions/cancel',
      callType: ApiCallType.POST,
      headers: {
        ...CloudpaymentsGroup.headers,
        'Authorization': 'Basic ${apiCloud}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End Cloudpayments Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
