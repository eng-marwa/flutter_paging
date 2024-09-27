import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'constants.dart';

class DioConfig {
  DioConfig._();

  static const _timeOut = Duration(milliseconds: 6000);
  static Dio? _dio;

  static Dio getDio() {
    _dio ??= Dio()
      ..options.baseUrl = '${Constants.baseUrl}${Constants.path}'
      ..options.queryParameters = {'api_key': Constants.apiKey}
      ..options.connectTimeout = _timeOut
      ..options.receiveTimeout = _timeOut
      ..interceptors.add(PrettyDioLogger(
          requestHeader: true, responseBody: true, error: true));
    return _dio!;
  }
}
