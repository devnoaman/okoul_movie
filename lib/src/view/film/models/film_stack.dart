import 'dart:async';
import 'dart:developer';

import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class FilmStackBase {
  FutureOr<String?>? push(int id);
  FutureOr<String?>? pop(int id);
}

class FlilmStack extends StateNotifier<List<int>> implements FilmStackBase {
  FlilmStack() : super([]);

  @override
  Future<String?> push(int film) async {
    try {
      if (state.contains(film)) {
        return null;
      } else {
        state.add(film);
        log('Film pushed into the stack');
        log(state.toString());
        return 'Film pushed into the stack';
      }
    } catch (e) {
      return 'an error occurred';
    }
  }

  @override
  Future<String?> pop(int film) async {
    try {
      if (state.contains(film)) {
        state.remove(film);
        log('Film poped from the stack');
        log(state.toString());
        return 'Film poped from the stack';
      } else {
        return null;
      }
    } catch (e) {
      return 'an error occurred';
    }
  }

  // getter for reading the state of the custom stack
  List<int> get films => state;
  int get last => state.last;
  bool get shouldPop => state.length == 1;

  logAll() {
    log(state.toString());
  }
}
