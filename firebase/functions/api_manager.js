const axios = require("axios").default;
const qs = require("qs");

/// Start Cloudpayments Group Code

const cloudpaymentsGroup = {
  baseUrl: "https://api.cloudpayments.ru",
  headers: { "Content-Type": `application/json` },
};

async function _payByCardCall(context, ffVariables) {
  var publicId = ffVariables["publicId"];
  var amount = ffVariables["amount"];
  var cardCryptogramPacket = ffVariables["cardCryptogramPacket"];
  var email = ffVariables["email"];
  var accountId = ffVariables["accountId"];

  var url = `${cloudpaymentsGroup.baseUrl}/payments/cards/charge`;
  var headers = {
    "Content-Type": `application/json`,
    Authorization: `Basic cGtfNDgwYzc2NzQ4OTJlNjQyYjViYWExZDNkMjA1N2E6ODM1YTE5MzU2Y2JiYWI3ZTIxYTc1ZDQ2NjcyN2QyNWU=`,
  };
  var params = {};
  var ffApiRequestBody = `
{
  "publicId": "${publicId}",
  "Amount": ${amount},
  "Currency": "RUB",
  "CardCryptogramPacket": "${cardCryptogramPacket}",
  "Email": "${email}",
  "AccountId": "${accountId}"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
  });
}

async function _checkDSCall(context, ffVariables) {
  var transactionId = ffVariables["transactionId"];
  var paRes = ffVariables["paRes"];

  var url = `${cloudpaymentsGroup.baseUrl}/payments/cards/post3ds`;
  var headers = {
    "Content-Type": `application/json`,
    Authorization: `Basic cGtfNDgwYzc2NzQ4OTJlNjQyYjViYWExZDNkMjA1N2E6ODM1YTE5MzU2Y2JiYWI3ZTIxYTc1ZDQ2NjcyN2QyNWU=`,
  };
  var params = {};
  var ffApiRequestBody = `
{
  "TransactionId": ${transactionId},
  "PaRes": "${paRes}"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
  });
}

async function _subscriptionsCreateCopyCall(context, ffVariables) {
  var publicId = ffVariables["publicId"];

  var url = `${cloudpaymentsGroup.baseUrl}/subscriptions/create`;
  var headers = {
    "Content-Type": `application/json`,
    Authorization: `Basic cGtfNDgwYzc2NzQ4OTJlNjQyYjViYWExZDNkMjA1N2E6ODM1YTE5MzU2Y2JiYWI3ZTIxYTc1ZDQ2NjcyN2QyNWU=`,
  };
  var params = {};
  var ffApiRequestBody = `
{
  "Token": "<Token>",
  "AccountId": "<AccountId>",
  "Description": "<Description>",
  "Email": "<Email>",
  "Amount": 0,
  "Currency": "RUB",
  "publicId": "${publicId}",
  "RequireConfirmation": false,
  "StartDate": "<StartDate>",
  "Interval": "<Interval>",
  "Period": 1
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
  });
}

async function _checkSubscriptionsCopyCall(context, ffVariables) {
  var id = ffVariables["id"];

  var url = `${cloudpaymentsGroup.baseUrl}/subscriptions/get`;
  var headers = {
    "Content-Type": `application/json`,
    Authorization: `Basic cGtfNDgwYzc2NzQ4OTJlNjQyYjViYWExZDNkMjA1N2E6ODM1YTE5MzU2Y2JiYWI3ZTIxYTc1ZDQ2NjcyN2QyNWU=`,
  };
  var params = {};
  var ffApiRequestBody = `
{
  "Id": "${id}"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
  });
}

async function _cancelSubscriptionsCopyCall(context, ffVariables) {
  var id = ffVariables["id"];

  var url = `${cloudpaymentsGroup.baseUrl}/subscriptions/cancel`;
  var headers = {
    "Content-Type": `application/json`,
    Authorization: `Basic cGtfNDgwYzc2NzQ4OTJlNjQyYjViYWExZDNkMjA1N2E6ODM1YTE5MzU2Y2JiYWI3ZTIxYTc1ZDQ2NjcyN2QyNWU=`,
  };
  var params = {};
  var ffApiRequestBody = `
{
  "Id": "${id}"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
  });
}

async function _recieptCall(context, ffVariables) {
  var inn = ffVariables["inn"];
  var invoiceId = ffVariables["invoiceId"];
  var accountId = ffVariables["accountId"];
  var label = ffVariables["label"];
  var price = ffVariables["price"];
  var taxationSystem = ffVariables["taxationSystem"];

  var url = `${cloudpaymentsGroup.baseUrl}/kkt/receipt`;
  var headers = {
    "Content-Type": `application/json`,
    Authorization: `Basic cGtfNDgwYzc2NzQ4OTJlNjQyYjViYWExZDNkMjA1N2E6ODM1YTE5MzU2Y2JiYWI3ZTIxYTc1ZDQ2NjcyN2QyNWU=`,
  };
  var params = {};
  var ffApiRequestBody = `
{
  "Inn": "${inn}",
  "InvoiceId": "${invoiceId}",
  "AccountId": "${accountId}",
  "Type": "Income",
  "CustomerReceipt": {
    "customerInfo": "${accountId}",
    "email": "${accountId}",
    "taxationSystem": ${taxationSystem},
    "Items": [
      {
        "label": "${label}",
        "price": ${price},
        "quantity": 1,
        "amount": ${price},
        "vat": 0,
        "method": 0,
        "object": 0,
        "measurementUnit": "шт"
      }
    ]
  }
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
  });
}

/// End Cloudpayments Group Code

/// Helper functions to route to the appropriate API Call.

async function makeApiCall(context, data) {
  var callName = data["callName"] || "";
  var variables = data["variables"] || {};

  const callMap = {
    PayByCardCall: _payByCardCall,
    CheckDSCall: _checkDSCall,
    SubscriptionsCreateCopyCall: _subscriptionsCreateCopyCall,
    CheckSubscriptionsCopyCall: _checkSubscriptionsCopyCall,
    CancelSubscriptionsCopyCall: _cancelSubscriptionsCopyCall,
    RecieptCall: _recieptCall,
  };

  if (!(callName in callMap)) {
    return {
      statusCode: 400,
      error: `API Call "${callName}" not defined as private API.`,
    };
  }

  var apiCall = callMap[callName];
  var response = await apiCall(context, variables);
  return response;
}

async function makeApiRequest({
  method,
  url,
  headers,
  params,
  body,
  returnBody,
}) {
  return axios
    .request({
      method: method,
      url: url,
      headers: headers,
      params: params,
      ...(body && { data: body }),
    })
    .then((response) => {
      return {
        statusCode: response.status,
        headers: response.headers,
        ...(returnBody && { body: response.data }),
      };
    })
    .catch(function (error) {
      return {
        statusCode: error.response.status,
        headers: error.response.headers,
        ...(returnBody && { body: error.response.data }),
        error: error.message,
      };
    });
}

const _unauthenticatedResponse = {
  statusCode: 401,
  headers: {},
  error: "API call requires authentication",
};

function createBody({ headers, params, body, bodyType }) {
  switch (bodyType) {
    case "JSON":
      headers["Content-Type"] = "application/json";
      return body;
    case "TEXT":
      headers["Content-Type"] = "text/plain";
      return body;
    case "X_WWW_FORM_URL_ENCODED":
      headers["Content-Type"] = "application/x-www-form-urlencoded";
      return qs.stringify(params);
  }
}

module.exports = { makeApiCall };
