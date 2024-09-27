import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../logic/popular/popular_cubit.dart';
import '../../logic/popular/popular_state.dart';
import '../common_widgets/movie_date_release.dart';
import '../common_widgets/rating_widget.dart';
import '../common_widgets/tag_widget.dart';
import '../di/module.dart';
import '../network/constants.dart';
import '../theme/text_styles.dart';

class PopularMovies extends StatefulWidget {
  const PopularMovies({super.key});

  @override
  State<PopularMovies> createState() => _PopularMoviesState();
}

class _PopularMoviesState extends State<PopularMovies> {
  late PopularCubit popularCubit;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    popularCubit = getIt<PopularCubit>();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        popularCubit.emitPopularState(isRefresh: true);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    popularCubit.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PopularCubit>(
        create: (context) => popularCubit..emitPopularState(),
        child: Scaffold(
            body: SafeArea(
                child: Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 24.w),
              child: BlocBuilder<PopularCubit, PopularState>(
                buildWhen: (previous, current) =>
                    current is! PageLoading && current is! PageEnding,
                builder: (context, state) {
                  if (state is Loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is Error) {
                    return Center(
                      child: Text(state.e.message, style: TextStyles.error),
                    );
                  } else if (state is Success) {
                    return NotificationListener<ScrollNotification>(
                        onNotification: (notification) {
                          if (notification.metrics.pixels ==
                                  notification.metrics.maxScrollExtent &&
                              notification is ScrollUpdateNotification) {
                            popularCubit.emitPopularState(isRefresh: true);
                          }
                          return true;
                        },
                        child: (state.data.isEmpty)
                            ? Center(
                                child: Text('No more movies to load',
                                    style: TextStyles.error),
                              )
                            : ListView.builder(
                                controller: _scrollController,
                                shrinkWrap: true,
                                itemCount: state.data.length,
                                itemBuilder: (context, index) {
                                  final movie = state.data[index];
                                  return Padding(
                                    padding: EdgeInsets.only(bottom: 16.0.h),
                                    child: Container(
                                        height: 120.h,
                                        margin: EdgeInsetsDirectional.only(
                                            end: 16.w),
                                        child: Row(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: Image.network(
                                                '${Constants.imageBaseUrl}${movie.posterPath}',
                                                width: 85.w,
                                                height: 120.h,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 8.w,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: 150.w,
                                                  child: Text(
                                                    movie.title,
                                                    style:
                                                        TextStyles.movieTitle,
                                                    maxLines: 2,
                                                  ),
                                                ),
                                                RatingWidget(movie.voteAverage),
                                                SizedBox(
                                                  height: 8.h,
                                                ),
                                                TagWidget(movie.genreIds),
                                                SizedBox(
                                                  height: 8.h,
                                                ),
                                                MovieDateRelease(movie)
                                              ],
                                            )
                                          ],
                                        )),
                                  );
                                },
                              ));
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            )),
            bottomNavigationBar: BlocBuilder<PopularCubit, PopularState>(
              buildWhen: (previous, current) =>
                  current is PageLoading ||
                  current is Success ||
                  current is PageEnding,
              builder: (context, state) {
                if (state is PageLoading) {
                  return const LinearProgressIndicator(
                    minHeight: 5,
                  );
                } else if (state is PageEnding) {
                  return SafeArea(
                    child: Container(
                      height: 60.h,
                      alignment: Alignment.center,
                      child: const Text('No more movies to load',
                          textAlign: TextAlign.center),
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            )));
  }
}
