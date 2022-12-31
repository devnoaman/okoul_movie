// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FavoriteModel _$$_FavoriteModelFromJson(Map<String, dynamic> json) =>
    _$_FavoriteModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      img: json['img'] as String?,
      release: json['release'] as String?,
      rate: (json['rate'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_FavoriteModelToJson(_$_FavoriteModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'img': instance.img,
      'release': instance.release,
      'rate': instance.rate,
    };
