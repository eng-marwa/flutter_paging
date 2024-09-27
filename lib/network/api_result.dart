import 'package:freezed_annotation/freezed_annotation.dart';

import 'api_exception.dart';
part 'api_result.freezed.dart';

@freezed
class ApiResult<T> with _$ApiResult<T> {
  factory ApiResult.success(T data) = _Success<T>;

  factory ApiResult.failure(ApiException e) = _Failure<T>;
}
