import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

@immutable
class AuthorDetails {
  final String? name;
  final String? username;
  final String? avatarPath;
  final double? rating;

  const AuthorDetails({
    this.name,
    this.username,
    this.avatarPath,
    this.rating,
  });

  @override
  String toString() {
    return 'AuthorDetails(name: $name, username: $username, avatarPath: $avatarPath, rating: $rating)';
  }

  factory AuthorDetails.fromMap(Map<String, dynamic> data) => AuthorDetails(
        name: data['name'] as String?,
        username: data['username'] as String?,
        avatarPath: data['avatar_path'] as String?,
        rating: data['rating'] as double?,
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'username': username,
        'avatar_path': avatarPath,
        'rating': rating,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AuthorDetails].
  factory AuthorDetails.fromJson(String data) {
    return AuthorDetails.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AuthorDetails] to a JSON string.
  String toJson() => json.encode(toMap());

  AuthorDetails copyWith({
    String? name,
    String? username,
    String? avatarPath,
    double? rating,
  }) {
    return AuthorDetails(
      name: name ?? this.name,
      username: username ?? this.username,
      avatarPath: avatarPath ?? this.avatarPath,
      rating: rating ?? this.rating,
    );
  }
}
