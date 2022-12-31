import 'package:freezed_annotation/freezed_annotation.dart';

part 'global_state.freezed.dart';

///global state to use in every network request [StateNotifier]
@freezed
class GlobalState<T> with _$GlobalState<T> {
  const factory GlobalState.initial() = _initial;
  const factory GlobalState.loading() = loading;
  const factory GlobalState.loaded(T data) = loaded;
  const factory GlobalState.error(String err, Object? stackTrace) = error;
}
