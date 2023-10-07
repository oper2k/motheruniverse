import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';
import '../cloud_functions/cloud_functions.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Cloudpayments Group Code

class CloudpaymentsGroup {
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
    String? publicId = 'pk_480c7674892e642b5baa1d3d2057a',
    int? amount,
    String? cardCryptogramPacket = '',
    String? email = '',
    String? accountId = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'PayByCardCall',
        'variables': {
          'publicId': publicId,
          'amount': amount,
          'cardCryptogramPacket': cardCryptogramPacket,
          'email': email,
          'accountId': accountId,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
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
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CheckDSCall',
        'variables': {
          'transactionId': transactionId,
          'paRes': paRes,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
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
    String? publicId = 'pk_95c3539932ce407838c78a72db586',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'SubscriptionsCreateCopyCall',
        'variables': {
          'publicId': publicId,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CheckSubscriptionsCopyCall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CheckSubscriptionsCopyCall',
        'variables': {
          'id': id,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CancelSubscriptionsCopyCall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CancelSubscriptionsCopyCall',
        'variables': {
          'id': id,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
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
