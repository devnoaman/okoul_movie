import 'package:okoul/utils/extentions.dart';

class AssetsManager {
  static Lotties lottie = const Lotties();
}

class Lotties {
  const Lotties();
  String get error => "film_error".lottie;
  String get search => "search".lottie;
  String get notFoundFilm => "not_found_film".lottie;
}
