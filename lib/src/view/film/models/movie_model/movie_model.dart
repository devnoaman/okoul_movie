import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import 'belongs_to_collection.dart';
import 'genre.dart';
import 'production_company.dart';
import 'production_country.dart';
import 'spoken_language.dart';

@immutable
class MovieModel {
  final bool? adult;
  bool isFav;
  final String? backdropPath;
  final BelongsToCollection? belongsToCollection;
  final int? budget;
  final List<Genre>? genres;
  final String? homepage;
  final int? id;
  final String? imdbId;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final List<ProductionCompany>? productionCompanies;
  final List<ProductionCountry>? productionCountries;
  final String? releaseDate;
  final int? revenue;
  final int? runtime;
  final List<SpokenLanguage>? spokenLanguages;
  final String? status;
  final String? tagline;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  MovieModel({
    this.adult,
    this.isFav = false,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdbId,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  @override
  String toString() {
    return 'MovieModel(adult: $adult, backdropPath: $backdropPath, belongsToCollection: $belongsToCollection, budget: $budget, genres: $genres, homepage: $homepage, id: $id, imdbId: $imdbId, originalLanguage: $originalLanguage, originalTitle: $originalTitle, overview: $overview, popularity: $popularity, posterPath: $posterPath, productionCompanies: $productionCompanies, productionCountries: $productionCountries, releaseDate: $releaseDate, revenue: $revenue, runtime: $runtime, spokenLanguages: $spokenLanguages, status: $status, tagline: $tagline, title: $title, video: $video, voteAverage: $voteAverage, voteCount: $voteCount)';
  }

  factory MovieModel.fromMap(Map<String, dynamic> data) => MovieModel(
        adult: data['adult'] as bool?,
        backdropPath: data['backdrop_path'] as String?,
        belongsToCollection: data['belongs_to_collection'] == null
            ? null
            : BelongsToCollection.fromMap(
                data['belongs_to_collection'] as Map<String, dynamic>),
        budget: data['budget'] as int?,
        genres: (data['genres'] as List<dynamic>?)
            ?.map((e) => Genre.fromMap(e as Map<String, dynamic>))
            .toList(),
        homepage: data['homepage'] as String?,
        id: data['id'] as int?,
        isFav: data['isFav'] ?? false,
        imdbId: data['imdb_id'] as String?,
        originalLanguage: data['original_language'] as String?,
        originalTitle: data['original_title'] as String?,
        overview: data['overview'] as String?,
        popularity: (data['popularity'] as num?)?.toDouble(),
        posterPath: data['poster_path'] as String?,
        productionCompanies: (data['production_companies'] as List<dynamic>?)
            ?.map((e) => ProductionCompany.fromMap(e as Map<String, dynamic>))
            .toList(),
        productionCountries: (data['production_countries'] as List<dynamic>?)
            ?.map((e) => ProductionCountry.fromMap(e as Map<String, dynamic>))
            .toList(),
        releaseDate: data['release_date'] as String?,
        revenue: data['revenue'] as int?,
        runtime: data['runtime'] as int?,
        spokenLanguages: (data['spoken_languages'] as List<dynamic>?)
            ?.map((e) => SpokenLanguage.fromMap(e as Map<String, dynamic>))
            .toList(),
        status: data['status'] as String?,
        tagline: data['tagline'] as String?,
        title: data['title'] as String?,
        video: data['video'] as bool?,
        voteAverage: (data['vote_average'] as num?)?.toDouble(),
        voteCount: data['vote_count'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'adult': adult,
        'backdrop_path': backdropPath,
        'belongs_to_collection': belongsToCollection?.toMap(),
        'budget': budget,
        'genres': genres?.map((e) => e.toMap()).toList(),
        'homepage': homepage,
        'id': id,
        'isFav': isFav,
        'imdb_id': imdbId,
        'original_language': originalLanguage,
        'original_title': originalTitle,
        'overview': overview,
        'popularity': popularity,
        'poster_path': posterPath,
        'production_companies':
            productionCompanies?.map((e) => e.toMap()).toList(),
        'production_countries':
            productionCountries?.map((e) => e.toMap()).toList(),
        'release_date': releaseDate,
        'revenue': revenue,
        'runtime': runtime,
        'spoken_languages': spokenLanguages?.map((e) => e.toMap()).toList(),
        'status': status,
        'tagline': tagline,
        'title': title,
        'video': video,
        'vote_average': voteAverage,
        'vote_count': voteCount,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [MovieModel].
  factory MovieModel.fromJson(String data) {
    return MovieModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [MovieModel] to a JSON string.
  String toJson() => json.encode(toMap());

  MovieModel copyWith({
    bool? adult,
    bool? isFav,
    String? backdropPath,
    BelongsToCollection? belongsToCollection,
    int? budget,
    List<Genre>? genres,
    String? homepage,
    int? id,
    String? imdbId,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    double? popularity,
    String? posterPath,
    List<ProductionCompany>? productionCompanies,
    List<ProductionCountry>? productionCountries,
    String? releaseDate,
    int? revenue,
    int? runtime,
    List<SpokenLanguage>? spokenLanguages,
    String? status,
    String? tagline,
    String? title,
    bool? video,
    double? voteAverage,
    int? voteCount,
  }) {
    return MovieModel(
      adult: adult ?? this.adult,
      isFav: isFav ?? this.isFav,
      backdropPath: backdropPath ?? this.backdropPath,
      belongsToCollection: belongsToCollection ?? this.belongsToCollection,
      budget: budget ?? this.budget,
      genres: genres ?? this.genres,
      homepage: homepage ?? this.homepage,
      id: id ?? this.id,
      imdbId: imdbId ?? this.imdbId,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      originalTitle: originalTitle ?? this.originalTitle,
      overview: overview ?? this.overview,
      popularity: popularity ?? this.popularity,
      posterPath: posterPath ?? this.posterPath,
      productionCompanies: productionCompanies ?? this.productionCompanies,
      productionCountries: productionCountries ?? this.productionCountries,
      releaseDate: releaseDate ?? this.releaseDate,
      revenue: revenue ?? this.revenue,
      runtime: runtime ?? this.runtime,
      spokenLanguages: spokenLanguages ?? this.spokenLanguages,
      status: status ?? this.status,
      tagline: tagline ?? this.tagline,
      title: title ?? this.title,
      video: video ?? this.video,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! MovieModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      adult.hashCode ^
      backdropPath.hashCode ^
      belongsToCollection.hashCode ^
      budget.hashCode ^
      isFav.hashCode ^
      genres.hashCode ^
      homepage.hashCode ^
      id.hashCode ^
      imdbId.hashCode ^
      originalLanguage.hashCode ^
      originalTitle.hashCode ^
      overview.hashCode ^
      popularity.hashCode ^
      posterPath.hashCode ^
      productionCompanies.hashCode ^
      productionCountries.hashCode ^
      releaseDate.hashCode ^
      revenue.hashCode ^
      runtime.hashCode ^
      spokenLanguages.hashCode ^
      status.hashCode ^
      tagline.hashCode ^
      title.hashCode ^
      video.hashCode ^
      voteAverage.hashCode ^
      voteCount.hashCode;
}
