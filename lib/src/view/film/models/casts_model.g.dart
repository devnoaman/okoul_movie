// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'casts_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CastsModel _$$_CastsModelFromJson(Map<String, dynamic> json) =>
    _$_CastsModel(
      adult: json['adult'] as bool?,
      knownForDepartment: json['known_for_department'] as String?,
      id: json['id'] as int?,
      order: json['order'] as int?,
      name: json['name'] as String?,
      gender: json['gender'] as int?,
      originalName: json['original_name'] as String?,
      profilePath: json['profile_path'] as String?,
      character: json['character'] as String?,
      department: json['department'] as String?,
      job: json['job'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      creditId: json['credit_id'] as String?,
    );

Map<String, dynamic> _$$_CastsModelToJson(_$_CastsModel instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'known_for_department': instance.knownForDepartment,
      'id': instance.id,
      'order': instance.order,
      'name': instance.name,
      'gender': instance.gender,
      'original_name': instance.originalName,
      'profile_path': instance.profilePath,
      'character': instance.character,
      'department': instance.department,
      'job': instance.job,
      'popularity': instance.popularity,
      'credit_id': instance.creditId,
    };
