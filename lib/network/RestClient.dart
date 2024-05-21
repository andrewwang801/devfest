import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' show Client, Response;

import 'index.dart';

class RestClient implements IClient {
  late Map<String, String> authHeaders;
  Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
  };

  late Client _client;

  RestClient({Client? client}) {
    _client = client ?? Client();

    authHeaders = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
    };
  }

  @override
  Future<MappedNetworkServiceResponse<T>> getAsync<T>(String resourcePath, {bool customHeaders = false}) async {
    var response = await _client.get(
      Uri.parse(resourcePath),
      headers: customHeaders == true ? authHeaders : headers,
    );
    return await processResponse<T>(response);
  }
  
  @override
  Future<MappedNetworkServiceResponse<T>> postAsync<T>(String resourcePath, data, {bool customHeaders = false}) async {
    if (customHeaders) {
      authHeaders.putIfAbsent("Authorization", () => "Token (if any)");
    }
    var content = json.encoder.convert(data);
    var response = await _client.post(Uri.parse(resourcePath), body: content, headers: customHeaders ? authHeaders : headers);
    return await processResponse<T>(response);
  }

  Future<MappedNetworkServiceResponse<T>> processResponse<T>(Response response) async {
    try {
      if (!((response.statusCode < HttpStatus.ok) ||
            (response.statusCode >= HttpStatus.multipleChoices)))
      {
        var resultClass = await compute(jsonParserIsolate, response.body);
        return MappedNetworkServiceResponse<T>(
          mappedResult: resultClass,
          networkServiceResponse: NetworkServiceResponse<T>(success: true)
        );
      } else {
        var errorResponse = response.body;
        return MappedNetworkServiceResponse<T>(
          networkServiceResponse: NetworkServiceResponse<T>(
            success: false,
            message: "(${response.statusCode}) (${errorResponse.toString()})",
          ),
        );
      }
    } on SocketException catch(_) {
      return MappedNetworkServiceResponse<T>(
        networkServiceResponse: NetworkServiceResponse<T>(
          success: false,
          message: "(${response.statusCode}) Can't reach the servers, \n Please check your internet connection.",
        ),
      );
    }
  }

  static Map<String, dynamic> jsonParserIsolate(String res) {
    return jsonDecode(res);
  }
}