// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FavoriteModel _$FavoriteModelFromJson(Map<String, dynamic> json) {
  return _FavoriteModel.fromJson(json);
}

/// @nodoc
mixin _$FavoriteModel {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get img => throw _privateConstructorUsedError;
  String? get release => throw _privateConstructorUsedError;
  double? get rate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FavoriteModelCopyWith<FavoriteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteModelCopyWith<$Res> {
  factory $FavoriteModelCopyWith(
          FavoriteModel value, $Res Function(FavoriteModel) then) =
      _$FavoriteModelCopyWithImpl<$Res, FavoriteModel>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? description,
      String? img,
      String? release,
      double? rate});
}

/// @nodoc
class _$FavoriteModelCopyWithImpl<$Res, $Val extends FavoriteModel>
    implements $FavoriteModelCopyWith<$Res> {
  _$FavoriteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? img = freezed,
    Object? release = freezed,
    Object? rate = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      img: freezed == img
          ? _value.img
          : img // ignore: cast_nullable_to_non_nullable
              as String?,
      release: freezed == release
          ? _value.release
          : release // ignore: cast_nullable_to_non_nullable
              as String?,
      rate: freezed == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FavoriteModelCopyWith<$Res>
    implements $FavoriteModelCopyWith<$Res> {
  factory _$$_FavoriteModelCopyWith(
          _$_FavoriteModel value, $Res Function(_$_FavoriteModel) then) =
      __$$_FavoriteModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? description,
      String? img,
      String? release,
      double? rate});
}

/// @nodoc
class __$$_FavoriteModelCopyWithImpl<$Res>
    extends _$FavoriteModelCopyWithImpl<$Res, _$_FavoriteModel>
    implements _$$_FavoriteModelCopyWith<$Res> {
  __$$_FavoriteModelCopyWithImpl(
      _$_FavoriteModel _value, $Res Function(_$_FavoriteModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? img = freezed,
    Object? release = freezed,
    Object? rate = freezed,
  }) {
    return _then(_$_FavoriteModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      img: freezed == img
          ? _value.img
          : img // ignore: cast_nullable_to_non_nullable
              as String?,
      release: freezed == release
          ? _value.release
          : release // ignore: cast_nullable_to_non_nullable
              as String?,
      rate: freezed == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FavoriteModel implements _FavoriteModel {
  _$_FavoriteModel(
      {this.id,
      this.name,
      this.description,
      this.img,
      this.release,
      this.rate});

  factory _$_FavoriteModel.fromJson(Map<String, dynamic> json) =>
      _$$_FavoriteModelFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? img;
  @override
  final String? release;
  @override
  final double? rate;

  @override
  String toString() {
    return 'FavoriteModel(id: $id, name: $name, description: $description, img: $img, release: $release, rate: $rate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FavoriteModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.img, img) || other.img == img) &&
            (identical(other.release, release) || other.release == release) &&
            (identical(other.rate, rate) || other.rate == rate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, description, img, release, rate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FavoriteModelCopyWith<_$_FavoriteModel> get copyWith =>
      __$$_FavoriteModelCopyWithImpl<_$_FavoriteModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FavoriteModelToJson(
      this,
    );
  }
}

abstract class _FavoriteModel implements FavoriteModel {
  factory _FavoriteModel(
      {final int? id,
      final String? name,
      final String? description,
      final String? img,
      final String? release,
      final double? rate}) = _$_FavoriteModel;

  factory _FavoriteModel.fromJson(Map<String, dynamic> json) =
      _$_FavoriteModel.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get description;
  @override
  String? get img;
  @override
  String? get release;
  @override
  double? get rate;
  @override
  @JsonKey(ignore: true)
  _$$_FavoriteModelCopyWith<_$_FavoriteModel> get copyWith =>
      throw _privateConstructorUsedError;
}
