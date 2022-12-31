// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'global_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GlobalState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) loaded,
    required TResult Function(String err, Object? stackTrace) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? loaded,
    TResult? Function(String err, Object? stackTrace)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? loaded,
    TResult Function(String err, Object? stackTrace)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initial<T> value) initial,
    required TResult Function(loading<T> value) loading,
    required TResult Function(loaded<T> value) loaded,
    required TResult Function(error<T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initial<T> value)? initial,
    TResult? Function(loading<T> value)? loading,
    TResult? Function(loaded<T> value)? loaded,
    TResult? Function(error<T> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initial<T> value)? initial,
    TResult Function(loading<T> value)? loading,
    TResult Function(loaded<T> value)? loaded,
    TResult Function(error<T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GlobalStateCopyWith<T, $Res> {
  factory $GlobalStateCopyWith(
          GlobalState<T> value, $Res Function(GlobalState<T>) then) =
      _$GlobalStateCopyWithImpl<T, $Res, GlobalState<T>>;
}

/// @nodoc
class _$GlobalStateCopyWithImpl<T, $Res, $Val extends GlobalState<T>>
    implements $GlobalStateCopyWith<T, $Res> {
  _$GlobalStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_initialCopyWith<T, $Res> {
  factory _$$_initialCopyWith(
          _$_initial<T> value, $Res Function(_$_initial<T>) then) =
      __$$_initialCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$_initialCopyWithImpl<T, $Res>
    extends _$GlobalStateCopyWithImpl<T, $Res, _$_initial<T>>
    implements _$$_initialCopyWith<T, $Res> {
  __$$_initialCopyWithImpl(
      _$_initial<T> _value, $Res Function(_$_initial<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_initial<T> implements _initial<T> {
  const _$_initial();

  @override
  String toString() {
    return 'GlobalState<$T>.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_initial<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) loaded,
    required TResult Function(String err, Object? stackTrace) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? loaded,
    TResult? Function(String err, Object? stackTrace)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? loaded,
    TResult Function(String err, Object? stackTrace)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initial<T> value) initial,
    required TResult Function(loading<T> value) loading,
    required TResult Function(loaded<T> value) loaded,
    required TResult Function(error<T> value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initial<T> value)? initial,
    TResult? Function(loading<T> value)? loading,
    TResult? Function(loaded<T> value)? loaded,
    TResult? Function(error<T> value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initial<T> value)? initial,
    TResult Function(loading<T> value)? loading,
    TResult Function(loaded<T> value)? loaded,
    TResult Function(error<T> value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _initial<T> implements GlobalState<T> {
  const factory _initial() = _$_initial<T>;
}

/// @nodoc
abstract class _$$loadingCopyWith<T, $Res> {
  factory _$$loadingCopyWith(
          _$loading<T> value, $Res Function(_$loading<T>) then) =
      __$$loadingCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$loadingCopyWithImpl<T, $Res>
    extends _$GlobalStateCopyWithImpl<T, $Res, _$loading<T>>
    implements _$$loadingCopyWith<T, $Res> {
  __$$loadingCopyWithImpl(
      _$loading<T> _value, $Res Function(_$loading<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$loading<T> implements loading<T> {
  const _$loading();

  @override
  String toString() {
    return 'GlobalState<$T>.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$loading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) loaded,
    required TResult Function(String err, Object? stackTrace) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? loaded,
    TResult? Function(String err, Object? stackTrace)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? loaded,
    TResult Function(String err, Object? stackTrace)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initial<T> value) initial,
    required TResult Function(loading<T> value) loading,
    required TResult Function(loaded<T> value) loaded,
    required TResult Function(error<T> value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initial<T> value)? initial,
    TResult? Function(loading<T> value)? loading,
    TResult? Function(loaded<T> value)? loaded,
    TResult? Function(error<T> value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initial<T> value)? initial,
    TResult Function(loading<T> value)? loading,
    TResult Function(loaded<T> value)? loaded,
    TResult Function(error<T> value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class loading<T> implements GlobalState<T> {
  const factory loading() = _$loading<T>;
}

/// @nodoc
abstract class _$$loadedCopyWith<T, $Res> {
  factory _$$loadedCopyWith(
          _$loaded<T> value, $Res Function(_$loaded<T>) then) =
      __$$loadedCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$loadedCopyWithImpl<T, $Res>
    extends _$GlobalStateCopyWithImpl<T, $Res, _$loaded<T>>
    implements _$$loadedCopyWith<T, $Res> {
  __$$loadedCopyWithImpl(_$loaded<T> _value, $Res Function(_$loaded<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$loaded<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$loaded<T> implements loaded<T> {
  const _$loaded(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'GlobalState<$T>.loaded(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$loaded<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$loadedCopyWith<T, _$loaded<T>> get copyWith =>
      __$$loadedCopyWithImpl<T, _$loaded<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) loaded,
    required TResult Function(String err, Object? stackTrace) error,
  }) {
    return loaded(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? loaded,
    TResult? Function(String err, Object? stackTrace)? error,
  }) {
    return loaded?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? loaded,
    TResult Function(String err, Object? stackTrace)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initial<T> value) initial,
    required TResult Function(loading<T> value) loading,
    required TResult Function(loaded<T> value) loaded,
    required TResult Function(error<T> value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initial<T> value)? initial,
    TResult? Function(loading<T> value)? loading,
    TResult? Function(loaded<T> value)? loaded,
    TResult? Function(error<T> value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initial<T> value)? initial,
    TResult Function(loading<T> value)? loading,
    TResult Function(loaded<T> value)? loaded,
    TResult Function(error<T> value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class loaded<T> implements GlobalState<T> {
  const factory loaded(final T data) = _$loaded<T>;

  T get data;
  @JsonKey(ignore: true)
  _$$loadedCopyWith<T, _$loaded<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$errorCopyWith<T, $Res> {
  factory _$$errorCopyWith(_$error<T> value, $Res Function(_$error<T>) then) =
      __$$errorCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String err, Object? stackTrace});
}

/// @nodoc
class __$$errorCopyWithImpl<T, $Res>
    extends _$GlobalStateCopyWithImpl<T, $Res, _$error<T>>
    implements _$$errorCopyWith<T, $Res> {
  __$$errorCopyWithImpl(_$error<T> _value, $Res Function(_$error<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
    Object? stackTrace = freezed,
  }) {
    return _then(_$error<T>(
      null == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == stackTrace ? _value.stackTrace : stackTrace,
    ));
  }
}

/// @nodoc

class _$error<T> implements error<T> {
  const _$error(this.err, this.stackTrace);

  @override
  final String err;
  @override
  final Object? stackTrace;

  @override
  String toString() {
    return 'GlobalState<$T>.error(err: $err, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$error<T> &&
            (identical(other.err, err) || other.err == err) &&
            const DeepCollectionEquality()
                .equals(other.stackTrace, stackTrace));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, err, const DeepCollectionEquality().hash(stackTrace));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$errorCopyWith<T, _$error<T>> get copyWith =>
      __$$errorCopyWithImpl<T, _$error<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) loaded,
    required TResult Function(String err, Object? stackTrace) error,
  }) {
    return error(err, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? loaded,
    TResult? Function(String err, Object? stackTrace)? error,
  }) {
    return error?.call(err, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? loaded,
    TResult Function(String err, Object? stackTrace)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(err, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initial<T> value) initial,
    required TResult Function(loading<T> value) loading,
    required TResult Function(loaded<T> value) loaded,
    required TResult Function(error<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initial<T> value)? initial,
    TResult? Function(loading<T> value)? loading,
    TResult? Function(loaded<T> value)? loaded,
    TResult? Function(error<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initial<T> value)? initial,
    TResult Function(loading<T> value)? loading,
    TResult Function(loaded<T> value)? loaded,
    TResult Function(error<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class error<T> implements GlobalState<T> {
  const factory error(final String err, final Object? stackTrace) = _$error<T>;

  String get err;
  Object? get stackTrace;
  @JsonKey(ignore: true)
  _$$errorCopyWith<T, _$error<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
