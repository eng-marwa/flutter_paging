import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpaging/network/api_exception.dart';
import '../../model/movie_response.dart';
import '../../repository/movie_repository.dart';
import 'popular_state.dart';

class PopularCubit extends Cubit<PopularState> {
  final MovieRepository _movieRepository;
  int _page = 1;
  bool _isFetching = false;

  List _updatedResults = [];

  PopularCubit(this._movieRepository) : super(Initial());

  void emitPopularState({bool isRefresh = false}) {
    if (_isFetching) return; // Prevent multiple calls while fetching
    if (isRefresh) {
      emit(PageLoading()); // Show refresh loading state
    } else {
      print('state cubit: $state');
      emit(Loading()); // Show initial loading state if not Success
    }

    _isFetching = true;
    _movieRepository.getPopularMovies(page: _page).then((result) {
      result.when(
        success: (data) {
          if (data.results.isNotEmpty) {
            _page++; // Increment page after success
            _isFetching = false;
            _updatedResults.addAll(data.results);
          }
          emit(Success(_updatedResults));
          // }
        },
        failure: (e) {
          _isFetching = false;
          if (e.code == 22) {
            emit(PageEnding(e.message));
          } else {
            emit(Error(e));
          }
        },
      );
    });
  }
}
