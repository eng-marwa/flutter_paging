import '../model/movie_response.dart';
import '../network/api_result.dart';
import '../network/api_service.dart';

class MovieRepository {
  final ApiService _apiService;

  MovieRepository(this._apiService);

  Future<ApiResult<MovieResponse>> getPopularMovies({int page = 1}) async {
    return await _apiService.fetchPopularMovies(page: page);
  }
}
