// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'trending_model.freezed.dart';
part 'trending_model.g.dart';

@freezed
class FilmModel with _$FilmModel {
  factory FilmModel({
    bool? adult,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(ignore: true) @Default(false) bool? isFav,
    int? id,
    String? title,
    @JsonKey(name: 'original_language') String? originalLanguage,
    @JsonKey(name: 'original_title') String? originalTitle,
    String? overview,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'media_type') String? mediaType,
    @JsonKey(name: 'genre_ids') List<int>? genreIds,
    double? popularity,
    @JsonKey(name: 'release_date') String? releaseDate,
    bool? video,
    @JsonKey(name: 'vote_average') double? voteAverage,
    @JsonKey(name: 'vote_count') int? voteCount,
  }) = _FilmModel;

  factory FilmModel.fromJson(Map<String, Object?> json) =>
      _$FilmModelFromJson(json);

  // factory FilmModel.blank() => FilmModel(
  //       uuid: const Uuid().v4().toString(),
  //     );
}
