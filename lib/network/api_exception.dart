import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_exception.g.dart';

@JsonSerializable()
class ApiException extends DioError {
  @JsonKey(name: 'status_message')
  final String message;
  @JsonKey(name: 'status_code')
  final int code;

  ApiException({
    required this.message,
    required this.code,
    RequestOptions? requestOptions,
    super.response,
    super.type,
    dynamic super.error,
  }) : super(
          requestOptions: requestOptions ?? RequestOptions(path: ''),
        );

  factory ApiException.fromJson(Map<String, dynamic> json) =>
      _$ApiExceptionFromJson(json);
}
