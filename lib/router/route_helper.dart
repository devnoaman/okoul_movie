import 'package:flutter/material.dart';
import 'package:okoul/components/hero_dialog.dart';

class RouteHelper {
  static Future<void> goWithHero(BuildContext context, Widget page) async {
    await Navigator.of(context, rootNavigator: true).push(HeroDialogRoute(
      builder: (context) {
        return page;
      },
    ));
  }
}
