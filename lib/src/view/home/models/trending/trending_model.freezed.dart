// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trending_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FilmModel _$FilmModelFromJson(Map<String, dynamic> json) {
  return _FilmModel.fromJson(json);
}

/// @nodoc
mixin _$FilmModel {
  bool? get adult => throw _privateConstructorUsedError;
  @JsonKey(name: 'backdrop_path')
  String? get backdropPath => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  bool? get isFav => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'original_language')
  String? get originalLanguage => throw _privateConstructorUsedError;
  @JsonKey(name: 'original_title')
  String? get originalTitle => throw _privateConstructorUsedError;
  String? get overview => throw _privateConstructorUsedError;
  @JsonKey(name: 'poster_path')
  String? get posterPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'media_type')
  String? get mediaType => throw _privateConstructorUsedError;
  @JsonKey(name: 'genre_ids')
  List<int>? get genreIds => throw _privateConstructorUsedError;
  double? get popularity => throw _privateConstructorUsedError;
  @JsonKey(name: 'release_date')
  String? get releaseDate => throw _privateConstructorUsedError;
  bool? get video => throw _privateConstructorUsedError;
  @JsonKey(name: 'vote_average')
  double? get voteAverage => throw _privateConstructorUsedError;
  @JsonKey(name: 'vote_count')
  int? get voteCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FilmModelCopyWith<FilmModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilmModelCopyWith<$Res> {
  factory $FilmModelCopyWith(FilmModel value, $Res Function(FilmModel) then) =
      _$FilmModelCopyWithImpl<$Res, FilmModel>;
  @useResult
  $Res call(
      {bool? adult,
      @JsonKey(name: 'backdrop_path') String? backdropPath,
      @JsonKey(ignore: true) bool? isFav,
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
      @JsonKey(name: 'vote_count') int? voteCount});
}

/// @nodoc
class _$FilmModelCopyWithImpl<$Res, $Val extends FilmModel>
    implements $FilmModelCopyWith<$Res> {
  _$FilmModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adult = freezed,
    Object? backdropPath = freezed,
    Object? isFav = freezed,
    Object? id = freezed,
    Object? title = freezed,
    Object? originalLanguage = freezed,
    Object? originalTitle = freezed,
    Object? overview = freezed,
    Object? posterPath = freezed,
    Object? mediaType = freezed,
    Object? genreIds = freezed,
    Object? popularity = freezed,
    Object? releaseDate = freezed,
    Object? video = freezed,
    Object? voteAverage = freezed,
    Object? voteCount = freezed,
  }) {
    return _then(_value.copyWith(
      adult: freezed == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool?,
      backdropPath: freezed == backdropPath
          ? _value.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String?,
      isFav: freezed == isFav
          ? _value.isFav
          : isFav // ignore: cast_nullable_to_non_nullable
              as bool?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      originalLanguage: freezed == originalLanguage
          ? _value.originalLanguage
          : originalLanguage // ignore: cast_nullable_to_non_nullable
              as String?,
      originalTitle: freezed == originalTitle
          ? _value.originalTitle
          : originalTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      overview: freezed == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String?,
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaType: freezed == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String?,
      genreIds: freezed == genreIds
          ? _value.genreIds
          : genreIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      popularity: freezed == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double?,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String?,
      video: freezed == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as bool?,
      voteAverage: freezed == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double?,
      voteCount: freezed == voteCount
          ? _value.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FilmModelCopyWith<$Res> implements $FilmModelCopyWith<$Res> {
  factory _$$_FilmModelCopyWith(
          _$_FilmModel value, $Res Function(_$_FilmModel) then) =
      __$$_FilmModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? adult,
      @JsonKey(name: 'backdrop_path') String? backdropPath,
      @JsonKey(ignore: true) bool? isFav,
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
      @JsonKey(name: 'vote_count') int? voteCount});
}

/// @nodoc
class __$$_FilmModelCopyWithImpl<$Res>
    extends _$FilmModelCopyWithImpl<$Res, _$_FilmModel>
    implements _$$_FilmModelCopyWith<$Res> {
  __$$_FilmModelCopyWithImpl(
      _$_FilmModel _value, $Res Function(_$_FilmModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adult = freezed,
    Object? backdropPath = freezed,
    Object? isFav = freezed,
    Object? id = freezed,
    Object? title = freezed,
    Object? originalLanguage = freezed,
    Object? originalTitle = freezed,
    Object? overview = freezed,
    Object? posterPath = freezed,
    Object? mediaType = freezed,
    Object? genreIds = freezed,
    Object? popularity = freezed,
    Object? releaseDate = freezed,
    Object? video = freezed,
    Object? voteAverage = freezed,
    Object? voteCount = freezed,
  }) {
    return _then(_$_FilmModel(
      adult: freezed == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool?,
      backdropPath: freezed == backdropPath
          ? _value.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String?,
      isFav: freezed == isFav
          ? _value.isFav
          : isFav // ignore: cast_nullable_to_non_nullable
              as bool?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      originalLanguage: freezed == originalLanguage
          ? _value.originalLanguage
          : originalLanguage // ignore: cast_nullable_to_non_nullable
              as String?,
      originalTitle: freezed == originalTitle
          ? _value.originalTitle
          : originalTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      overview: freezed == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String?,
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaType: freezed == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String?,
      genreIds: freezed == genreIds
          ? _value._genreIds
          : genreIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      popularity: freezed == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double?,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String?,
      video: freezed == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as bool?,
      voteAverage: freezed == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double?,
      voteCount: freezed == voteCount
          ? _value.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FilmModel implements _FilmModel {
  _$_FilmModel(
      {this.adult,
      @JsonKey(name: 'backdrop_path') this.backdropPath,
      @JsonKey(ignore: true) this.isFav = false,
      this.id,
      this.title,
      @JsonKey(name: 'original_language') this.originalLanguage,
      @JsonKey(name: 'original_title') this.originalTitle,
      this.overview,
      @JsonKey(name: 'poster_path') this.posterPath,
      @JsonKey(name: 'media_type') this.mediaType,
      @JsonKey(name: 'genre_ids') final List<int>? genreIds,
      this.popularity,
      @JsonKey(name: 'release_date') this.releaseDate,
      this.video,
      @JsonKey(name: 'vote_average') this.voteAverage,
      @JsonKey(name: 'vote_count') this.voteCount})
      : _genreIds = genreIds;

  factory _$_FilmModel.fromJson(Map<String, dynamic> json) =>
      _$$_FilmModelFromJson(json);

  @override
  final bool? adult;
  @override
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  @override
  @JsonKey(ignore: true)
  final bool? isFav;
  @override
  final int? id;
  @override
  final String? title;
  @override
  @JsonKey(name: 'original_language')
  final String? originalLanguage;
  @override
  @JsonKey(name: 'original_title')
  final String? originalTitle;
  @override
  final String? overview;
  @override
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @override
  @JsonKey(name: 'media_type')
  final String? mediaType;
  final List<int>? _genreIds;
  @override
  @JsonKey(name: 'genre_ids')
  List<int>? get genreIds {
    final value = _genreIds;
    if (value == null) return null;
    if (_genreIds is EqualUnmodifiableListView) return _genreIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final double? popularity;
  @override
  @JsonKey(name: 'release_date')
  final String? releaseDate;
  @override
  final bool? video;
  @override
  @JsonKey(name: 'vote_average')
  final double? voteAverage;
  @override
  @JsonKey(name: 'vote_count')
  final int? voteCount;

  @override
  String toString() {
    return 'FilmModel(adult: $adult, backdropPath: $backdropPath, isFav: $isFav, id: $id, title: $title, originalLanguage: $originalLanguage, originalTitle: $originalTitle, overview: $overview, posterPath: $posterPath, mediaType: $mediaType, genreIds: $genreIds, popularity: $popularity, releaseDate: $releaseDate, video: $video, voteAverage: $voteAverage, voteCount: $voteCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FilmModel &&
            (identical(other.adult, adult) || other.adult == adult) &&
            (identical(other.backdropPath, backdropPath) ||
                other.backdropPath == backdropPath) &&
            (identical(other.isFav, isFav) || other.isFav == isFav) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.originalLanguage, originalLanguage) ||
                other.originalLanguage == originalLanguage) &&
            (identical(other.originalTitle, originalTitle) ||
                other.originalTitle == originalTitle) &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            (identical(other.posterPath, posterPath) ||
                other.posterPath == posterPath) &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType) &&
            const DeepCollectionEquality().equals(other._genreIds, _genreIds) &&
            (identical(other.popularity, popularity) ||
                other.popularity == popularity) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            (identical(other.video, video) || other.video == video) &&
            (identical(other.voteAverage, voteAverage) ||
                other.voteAverage == voteAverage) &&
            (identical(other.voteCount, voteCount) ||
                other.voteCount == voteCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      adult,
      backdropPath,
      isFav,
      id,
      title,
      originalLanguage,
      originalTitle,
      overview,
      posterPath,
      mediaType,
      const DeepCollectionEquality().hash(_genreIds),
      popularity,
      releaseDate,
      video,
      voteAverage,
      voteCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FilmModelCopyWith<_$_FilmModel> get copyWith =>
      __$$_FilmModelCopyWithImpl<_$_FilmModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FilmModelToJson(
      this,
    );
  }
}

abstract class _FilmModel implements FilmModel {
  factory _FilmModel(
      {final bool? adult,
      @JsonKey(name: 'backdrop_path') final String? backdropPath,
      @JsonKey(ignore: true) final bool? isFav,
      final int? id,
      final String? title,
      @JsonKey(name: 'original_language') final String? originalLanguage,
      @JsonKey(name: 'original_title') final String? originalTitle,
      final String? overview,
      @JsonKey(name: 'poster_path') final String? posterPath,
      @JsonKey(name: 'media_type') final String? mediaType,
      @JsonKey(name: 'genre_ids') final List<int>? genreIds,
      final double? popularity,
      @JsonKey(name: 'release_date') final String? releaseDate,
      final bool? video,
      @JsonKey(name: 'vote_average') final double? voteAverage,
      @JsonKey(name: 'vote_count') final int? voteCount}) = _$_FilmModel;

  factory _FilmModel.fromJson(Map<String, dynamic> json) =
      _$_FilmModel.fromJson;

  @override
  bool? get adult;
  @override
  @JsonKey(name: 'backdrop_path')
  String? get backdropPath;
  @override
  @JsonKey(ignore: true)
  bool? get isFav;
  @override
  int? get id;
  @override
  String? get title;
  @override
  @JsonKey(name: 'original_language')
  String? get originalLanguage;
  @override
  @JsonKey(name: 'original_title')
  String? get originalTitle;
  @override
  String? get overview;
  @override
  @JsonKey(name: 'poster_path')
  String? get posterPath;
  @override
  @JsonKey(name: 'media_type')
  String? get mediaType;
  @override
  @JsonKey(name: 'genre_ids')
  List<int>? get genreIds;
  @override
  double? get popularity;
  @override
  @JsonKey(name: 'release_date')
  String? get releaseDate;
  @override
  bool? get video;
  @override
  @JsonKey(name: 'vote_average')
  double? get voteAverage;
  @override
  @JsonKey(name: 'vote_count')
  int? get voteCount;
  @override
  @JsonKey(ignore: true)
  _$$_FilmModelCopyWith<_$_FilmModel> get copyWith =>
      throw _privateConstructorUsedError;
}
