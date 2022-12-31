import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final goRouterNotifierProvider = Provider<GoRouterNotifier>((ref) {
  return GoRouterNotifier();
});

class GoRouterNotifier extends ChangeNotifier {
  bool _isLoadedFilm = false;
  bool get isLoadedFilm => _isLoadedFilm;
  set isLoadedFilm(bool value) {
    _isLoadedFilm = value;
    notifyListeners();
  }
}
