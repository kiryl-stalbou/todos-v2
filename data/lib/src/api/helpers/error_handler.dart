import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:http/http.dart' as http;

class ErrorHandler {
  Never handleError(Object exception) {
    if (exception is http.Response) {
      throw AppException(message: exception.reasonPhrase);
    }

    throw AppException(
      message: LocaleKeys.exceptions_unknownException.tr(
        namedArgs: <String, String>{'exception': exception.toString()},
      ),
    );
  }
}
