import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_state.freezed.dart';

@freezed
class ThemeState with _$ThemeState {
  const factory ThemeState.system() = system;
  const factory ThemeState.light() = light;
  const factory ThemeState.dark() = dark;
}
