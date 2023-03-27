import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test_app/data/models/response/error_response.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  final String appBaseUrl;
  static const String noInternetMessage =
      'Connection failed to API server failed due to internet connection';
  final int timeoutInSeconds = 30;

  String? token = '';
  final Map<String, String> _mainHeaders = {};

  ApiClient({required this.appBaseUrl});


  Future<Response> getData(String uri,
      {Map<String, dynamic>? query, Map<String, String>? headers}) async {
    try {
      debugPrint('====> API Call: $uri\nHeader: $_mainHeaders');
      http.Response response = await http.get(
        Uri.parse(appBaseUrl + uri),
        headers: headers ?? _mainHeaders,
      ).timeout(Duration(seconds: timeoutInSeconds));
      return handleResponse(response, uri);
    } catch (e) {
      return Response(
          requestOptions: RequestOptions(path: ''),
          statusCode: 1,
          statusMessage: noInternetMessage);
    }
  }

  Future<Response> postData(String uri, dynamic body, {Map<String, String>? headers}) async {
    try {
      debugPrint('====> API Call: $uri\nHeader: $_mainHeaders');
      debugPrint('====> API Body: $body');
      http.Response _response = await http.post(
        Uri.parse(appBaseUrl + uri),
        body: jsonEncode(body),
        headers: headers ?? _mainHeaders,
      ).timeout(Duration(seconds: timeoutInSeconds));
      return handleResponse(_response, uri);
    } catch (e) {
      return Response(
          requestOptions: RequestOptions(path: ''),
          statusCode: 1,
          statusMessage: noInternetMessage);
    }
  }


  Response handleResponse(http.Response response, String uri) {
    dynamic body;
    try {
      body = jsonDecode(response.body);
    } catch (e) {}
    Response _response = Response(
      data: body ?? response.body,
      statusMessage: response.reasonPhrase,
      requestOptions: RequestOptions(
          path: response.request!.url.path,
          method: response.request!.method,
          baseUrl: response.request!.url.toString(),
          headers: response.request!.headers),
      statusCode: response.statusCode,
    );
    if (_response.statusCode != 200 && _response.data != null && _response.data is! String) {
      if (_response.data.toString().startsWith('{errors: [{code:')) {
        ErrorResponse errorResponse = ErrorResponse.fromJson(_response.data);
        _response = Response(
            statusCode: _response.statusCode,
            data: _response.data,
            statusMessage: errorResponse.errors![0].message,
            requestOptions: _response.requestOptions);
      } else if (_response.data.toString().startsWith('{message')) {
        _response = Response(
            statusCode: _response.statusCode,
            data: _response.data,
            statusMessage: _response.data['message'],
            requestOptions: _response.requestOptions);
      }
    } else if (_response.statusCode != 200 && _response.data == null) {
      _response = Response(
          statusCode: 0,
          statusMessage: noInternetMessage,
          requestOptions: _response.requestOptions);
    }
    debugPrint('====> API Response: [${_response.statusCode}] $uri\n${_response.data}');
    return _response;
  }
}

