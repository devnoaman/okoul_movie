import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

@immutable
class BelongsToCollection {
  final int? id;
  final String? name;
  final String? posterPath;
  final String? backdropPath;

  const BelongsToCollection({
    this.id,
    this.name,
    this.posterPath,
    this.backdropPath,
  });

  @override
  String toString() {
    return 'BelongsToCollection(id: $id, name: $name, posterPath: $posterPath, backdropPath: $backdropPath)';
  }

  factory BelongsToCollection.fromMap(Map<String, dynamic> data) {
    return BelongsToCollection(
      id: data['id'] as int?,
      name: data['name'] as String?,
      posterPath: data['poster_path'] as String?,
      backdropPath: data['backdrop_path'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'poster_path': posterPath,
        'backdrop_path': backdropPath,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [BelongsToCollection].
  factory BelongsToCollection.fromJson(String data) {
    return BelongsToCollection.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [BelongsToCollection] to a JSON string.
  String toJson() => json.encode(toMap());

  BelongsToCollection copyWith({
    int? id,
    String? name,
    String? posterPath,
    String? backdropPath,
  }) {
    return BelongsToCollection(
      id: id ?? this.id,
      name: name ?? this.name,
      posterPath: posterPath ?? this.posterPath,
      backdropPath: backdropPath ?? this.backdropPath,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! BelongsToCollection) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^ posterPath.hashCode ^ backdropPath.hashCode;
}
