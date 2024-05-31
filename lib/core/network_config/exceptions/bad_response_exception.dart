import 'package:dio/dio.dart';
import 'package:my_cripto/core/errors/failure.dart';
import 'package:my_cripto/utils/app_logger.dart';


import 'get_error.dart';

class BadResponseException extends DioException implements Failure {
  final _logger = appLogger(BadResponseException);
  final RequestOptions request;
  final Response? serverResponse;
  final String errorKey;
  BadResponseException(this.request, [this.serverResponse, this.errorKey = ''])
      : super(requestOptions: request, response: serverResponse);

  @override
  String get title {
    if (serverResponse == null) {
      return "Bad Request";
    }
    return serverResponse?.data['message'] ?? "";
  }

  @override
  String get message {
    _logger.d(serverResponse?.data);
    if (serverResponse == null) {
      return "An unknown error occurred ";
    } else {
      return getErrorInfo(serverResponse?.data, errorKey);
    }
  }

  String getErrorInfo(error, [String key = '']) {
    return getErrorInfoFromResponse(error);
  }
}
