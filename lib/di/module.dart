import 'package:dio/dio.dart';
import 'package:fpaging/network/api_service.dart';
import 'package:fpaging/network/dio_config.dart';
import 'package:get_it/get_it.dart';

import '../logic/popular/popular_cubit.dart';
import '../repository/movie_repository.dart';

GetIt getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerLazySingleton<Dio>(
    () => DioConfig.getDio(),
  );
  getIt.registerLazySingleton<ApiService>(
    () => ApiServiceImpl(getIt<Dio>()),
  );
  getIt.registerFactory<MovieRepository>(() => MovieRepository(getIt()));
  getIt.registerLazySingleton<PopularCubit>(
    () => PopularCubit(getIt()),
  );
}
