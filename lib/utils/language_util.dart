import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final lang = StateNotifierProvider<AppLanguage, Locale>((refrence) {
  return AppLanguage();
});

class AppLanguage extends StateNotifier<Locale> {
  AppLanguage() : super(const Locale('en')) {
    fetchLocale();
  }
  bool get isAr => state == const Locale('ar');

  fetchLocale() async {
    var prefs = await SharedPreferences.getInstance();
    if (prefs.getString('language_code') == null) {
      state = const Locale('en');
      return null;
    }
    state = Locale(prefs.getString('language_code')!);
    return null;
  }

  void toggleLocale() async {
    var prefs = await SharedPreferences.getInstance();
    if (state == const Locale("en")) {
      state = const Locale("ar");

      await prefs.setString('language_code', 'ar');
    } else {
      state = const Locale("en");

      await prefs.setString('language_code', 'en');
    }
    log(state.toString());
  }

  void changeLanguage(Locale type) async {
    var prefs = await SharedPreferences.getInstance();
    if (state == type) {
      return;
    }
    if (type == const Locale("ar")) {
      state = const Locale("ar");
    } else {
      state = const Locale("en");
    }
  }
}
