// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite_model.freezed.dart';
part 'favorite_model.g.dart';

@freezed
class FavoriteModel with _$FavoriteModel {
  factory FavoriteModel({
    @required int? id,
    @required String? name,
    @required String? description,
    @required String? img,
    @required String? release,
    @required double? rate,
  }) = _FavoriteModel;

  factory FavoriteModel.fromJson(Map<String, Object?> json) =>
      _$FavoriteModelFromJson(json);
}
