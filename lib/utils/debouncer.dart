import 'dart:async';

import 'package:flutter/material.dart';

class Debouncer {
  final Duration duration;
  VoidCallback? action;
  Timer? _timer;
  Debouncer({
    required this.duration,
    this.action,
  });

  run(VoidCallback action) {
    if (null != _timer) {
      _timer!.cancel();
    }
    _timer = Timer(duration, action);
  }
}
