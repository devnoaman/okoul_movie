// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'casts_model.freezed.dart';
part 'casts_model.g.dart';

@freezed
class CastsModel with _$CastsModel {
  factory CastsModel({
    bool? adult,
    @JsonKey(name: 'known_for_department') String? knownForDepartment,
    int? id,
    int? order,
    String? name,
    int? gender,
    @JsonKey(name: 'original_name') String? originalName,
    @JsonKey(name: 'profile_path') String? profilePath,
    @JsonKey(name: 'character') String? character,
    String? department,
    String? job,
    // @JsonKey(name: 'genre_ids') List<int>? genreIds,
    double? popularity,
    // @JsonKey(name: 'cast_id') int? castId,
    @JsonKey(name: 'credit_id') String? creditId,
  }) = _CastsModel;

  factory CastsModel.fromJson(Map<String, Object?> json) =>
      _$CastsModelFromJson(json);

  // factory CastsModel.blank() => CastsModel(
  //       uuid: const Uuid().v4().toString(),
  //     );
}
