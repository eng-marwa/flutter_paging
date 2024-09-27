import 'package:json_annotation/json_annotation.dart';

part 'movie_response.g.dart';

@JsonSerializable()
class MovieResponse {
  List<Result> results = [];

  MovieResponse({required this.results});

  factory MovieResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseFromJson(json);
}

@JsonSerializable()
class Result {
  final int id;
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  final String title;
  final String overview;
  @JsonKey(name: 'poster_path')
  final String posterPath;
  @JsonKey(name: 'release_date')
  final String releaseDate;
  @JsonKey(name: 'vote_average')
  final double voteAverage;
  @JsonKey(name: 'genre_ids')
  final List<int> genreIds;
  @JsonKey(name: 'original_language')
  final String originalLanguage;
  final bool video;

  Result(
      {required this.id,
      this.backdropPath,
      required this.title,
      required this.overview,
      required this.posterPath,
      required this.releaseDate,
      required this.voteAverage,
      required this.genreIds,
      required this.originalLanguage,
      required this.video});

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}
