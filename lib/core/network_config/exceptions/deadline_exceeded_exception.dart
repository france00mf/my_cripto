import 'package:dio/dio.dart';
import 'package:my_cripto/core/errors/failure.dart';

import 'get_error.dart';


class DeadlineExceededException extends DioException implements Failure {
  DeadlineExceededException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'title: $title message: $message';
  }

  @override
  String get message => "The connection has timed out, please try again.";

  @override
  String get title => "Network error";

  String getErrorInfo(error, [String key = '']) {
    return getErrorInfoFromResponse(error);
  }
}
