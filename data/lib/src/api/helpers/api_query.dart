import 'dart:convert';

import '../api_constants.dart';

class ApiQuery {
  final String? endpoint;
  final Map<String, String>? params;
  final Map<String, dynamic>? body;
  final Map<String, String>? headers;

  String get jsonEncodedBody => jsonEncode(body);

  Uri get getEndpoint => Uri.http(
        ApiConstants.domain,
        '${ApiConstants.baseUrl}${endpoint ?? ''}',
        params,
      );

  ApiQuery({
    this.endpoint,
    this.body = const <String, dynamic>{},
    this.params = const <String, String>{},
    this.headers,
  });
}
