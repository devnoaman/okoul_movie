import 'package:flutter/material.dart';

extension AppSize on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
}

extension Assets on String {
  String get lottie => "assets/lottie/$this.json";
}

extension Pading on double {
  EdgeInsets get allpd => EdgeInsets.all(this);
}

extension BRadius on double {
  /// getting the border radius from double
  BorderRadius get cRadius => BorderRadius.circular(this);
}
