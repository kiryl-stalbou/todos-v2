import 'dart:convert';

import 'package:http/http.dart' as http;

import 'api_constants.dart';
import 'helpers/api_query.dart';
import 'helpers/error_handler.dart';
import 'helpers/typedef.dart';

class ApiProvider {
  final ErrorHandler _errorHandler;

  const ApiProvider({
    required ErrorHandler errorHandler,
  }) : _errorHandler = errorHandler;

  Future<T> get<T>(
    ApiQuery query, {
    required Parser<T> parser,
  }) async {
    return _safeRequest<T>(
      request: http.get(
        query.getEndpoint,
        headers: query.headers,
      ),
      parser: parser,
    );
  }

  Future<T> post<T>(
    ApiQuery query, {
    required Parser<T> parser,
  }) async {
    return _safeRequest<T>(
      request: http.post(
        query.getEndpoint,
        body: query.jsonEncodedBody,
        headers: query.headers,
      ),
      parser: parser,
    );
  }

  Future<T> patch<T>(
    ApiQuery query, {
    required Parser<T> parser,
  }) async {
    return _safeRequest<T>(
      request: http.patch(
        query.getEndpoint,
        body: query.jsonEncodedBody,
        headers: query.headers,
      ),
      parser: parser,
    );
  }

  Future<T> delete<T>(
    ApiQuery query, {
    required Parser<T> parser,
  }) async {
    return _safeRequest<T>(
      request: http.delete(
        query.getEndpoint,
        headers: query.headers,
      ),
      parser: parser,
    );
  }

  Future<T> _safeRequest<T>({
    required Future<http.Response> request,
    required Parser<T> parser,
  }) async {
    final http.Response rawResponse = await request;

    if (rawResponse.statusCode == 200) {
      final String response = utf8.decode(rawResponse.bodyBytes);
      final dynamic data = json.decode(response);

      if (data is Map<String, dynamic>) {
        return parser(data);
      } else if (data is List<dynamic>) {
        return parser(
          <String, dynamic>{ApiConstants.responseList: data},
        );
      } else {
        return parser(<String, dynamic>{});
      }
    } else {
      _errorHandler.handleError(rawResponse);
    }
  }
}
