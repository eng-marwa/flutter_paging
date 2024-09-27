import 'dart:convert';

import 'package:dio/dio.dart';

import '../model/movie_response.dart';
import 'api_exception.dart';
import 'api_result.dart';
import 'constants.dart';

abstract class ApiService {
  Future<ApiResult<MovieResponse>> fetchPopularMovies({int page = 1});
}

class ApiServiceImpl implements ApiService {
  final Dio _dio;

  ApiServiceImpl(this._dio);

  @override
  Future<ApiResult<MovieResponse>> fetchPopularMovies({int page = 1}) async {
    try {
      Response response = await _dio
          .get(Constants.popularEndPoint, queryParameters: {'page': page});
      if (response.statusCode == 200) {
        return ApiResult<MovieResponse>.success(
            MovieResponse.fromJson(response.data));
      } else {
        return ApiResult<MovieResponse>.failure(
            ApiException.fromJson(response.data));
      }
    } on DioException catch (e) {
      return ApiResult<MovieResponse>.failure(
        ApiException.fromJson(e.response!.data),
      );
    }
  }
}
