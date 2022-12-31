import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import 'author_details.dart';

@immutable
class ReviewModel {
  final String? author;
  final AuthorDetails? authorDetails;
  final String? content;
  final DateTime? createdAt;
  final String? id;
  final DateTime? updatedAt;
  final String? url;

  const ReviewModel({
    this.author,
    this.authorDetails,
    this.content,
    this.createdAt,
    this.id,
    this.updatedAt,
    this.url,
  });

  @override
  String toString() {
    return 'ReviewModel(author: $author, authorDetails: $authorDetails, content: $content, createdAt: $createdAt, id: $id, updatedAt: $updatedAt, url: $url)';
  }

  factory ReviewModel.fromMap(Map<String, dynamic> data) => ReviewModel(
        author: data['author'] as String?,
        authorDetails: data['author_details'] == null
            ? null
            : AuthorDetails.fromMap(
                data['author_details'] as Map<String, dynamic>),
        content: data['content'] as String?,
        createdAt: data['created_at'] == null
            ? null
            : DateTime.parse(data['created_at'] as String),
        id: data['id'] as String?,
        updatedAt: data['updated_at'] == null
            ? null
            : DateTime.parse(data['updated_at'] as String),
        url: data['url'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'author': author,
        'author_details': authorDetails?.toMap(),
        'content': content,
        'created_at': createdAt?.toIso8601String(),
        'id': id,
        'updated_at': updatedAt?.toIso8601String(),
        'url': url,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ReviewModel].
  factory ReviewModel.fromJson(String data) {
    return ReviewModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ReviewModel] to a JSON string.
  String toJson() => json.encode(toMap());

  ReviewModel copyWith({
    String? author,
    AuthorDetails? authorDetails,
    String? content,
    DateTime? createdAt,
    String? id,
    DateTime? updatedAt,
    String? url,
  }) {
    return ReviewModel(
      author: author ?? this.author,
      authorDetails: authorDetails ?? this.authorDetails,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      id: id ?? this.id,
      updatedAt: updatedAt ?? this.updatedAt,
      url: url ?? this.url,
    );
  }
}
