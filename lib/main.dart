import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:okoul/providers/provider_container.dart';
import 'package:okoul/services/database/favorites/favorites.dart';
import 'package:okoul/src/app/app.dart';

///app tree
///main
///--|lib
///----|src
///-------|app
///----------|app.dart

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FavoritesImpl();
  runApp(
    UncontrolledProviderScope(
      container: cnt,
      child: MyApp(),
    ),
  );
}
