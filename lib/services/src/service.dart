import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'app_exception.dart';

class BaseClient {
  ///Timout duration
  static const int timeOutDuration = 15;

  final String? url;
  final dynamic body;

  var client = http.Client();

  BaseClient({
    this.url,
    this.body,
  });

  //Get request to server
  Future<dynamic> get() async {
    // log("Url ${url}", name: "URL");

    try {
      var response = await client.get(
        Uri.parse(url!),
        headers: {
          'Accept': 'application/json',
          'Content-type': 'application/json',
          'Content-Language': 'mobile',
        },
      ).timeout(const Duration(seconds: timeOutDuration));

      return _processResponse(response);
    } on SocketException {
      throw NoInternetConnectionException('No internet connection', url);
    } on TimeoutException {
      throw RequestTimeoutException('Request timeout', url);
    } on FormatException {
      throw FetchDataException("Something went wrong", url);
    } on HandshakeException {
      throw NoInternetConnectionException("No internet connection", url);
    }
  }

  //Post request to server
  Future<dynamic> post() async {
    log("Url ${url}", name: "URL");
    log("Request ${jsonEncode(body)}", name: "REQUEST");

    try {
      var response = await client
          .post(
            Uri.parse(url!),
            headers: {
              'Accept': 'application/json',
              'Content-type': 'application/json',
              'Content-Language': 'mobile',
            },
            body: jsonEncode(body),
          )
          .timeout(const Duration(seconds: timeOutDuration));

      return _processResponse(response);
    } on SocketException {
      throw NoInternetConnectionException('No internet connection', url);
    } on TimeoutException {
      throw RequestTimeoutException('Request timeout', url);
    } on FormatException {
      throw FetchDataException("Something went wrong", url);
    } on HandshakeException {
      throw NoInternetConnectionException("No internet connection", url);
    }
  }

  ///DECODE JSON IF SUCCESS ELSE THROWS AN EXCEPTION
  dynamic _processResponse(http.Response response) {
    log("Url ${response.request!.url}", name: "URL");
    log("Response ${response.body}", name: "RESPONSE");

    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(utf8.decode(response.bodyBytes));
        return responseJson;

      case 201:
        var responseJson = json.decode(utf8.decode(response.bodyBytes));
        return responseJson;

      case 204:
        var responseJson = json.decode(utf8.decode(response.bodyBytes));
        return responseJson;

      case 400:
        throw FetchDataException(
          "Servers are busy, Please try again or contact support",
          response.request!.url.toString(),
        );

      case 401:
        throw UnAuthorizedException(
          json.decode(response.body)['message'],
          response.request!.url.toString(),
        );

      case 403:
        throw ForbiddenException(
          json.decode(response.body)['message'],
          response.request!.url.toString(),
        );

      case 409:
        throw BadRequestException(
          json.decode(response.body)['message'],
          response.request!.url.toString(),
        );

      case 422:
        throw BadRequestException(
          json.decode(response.body)['message'],
          response.request!.url.toString(),
        );

      case 500:
        throw BadRequestException(
          "Servers are busy, Please try again or contact support",
          response.request!.url.toString(),
        );

      default:
        throw FetchDataException(
          "Servers are busy, Please try again or contact support",
          response.request!.url.toString(),
        );
    }
  }
}
