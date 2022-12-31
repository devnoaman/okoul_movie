import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// to access it from other widget
///
final scrollControllerProvider =
    StateProvider.autoDispose<ScrollController>((ref) {
  return ScrollController();
});
