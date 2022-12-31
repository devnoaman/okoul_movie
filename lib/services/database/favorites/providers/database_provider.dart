import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:okoul/services/database/favorites/favorites_database.dart';
import 'package:okoul/services/database/favorites/favorites_impl.dart';

final favDatabaseProvider = ChangeNotifierProvider<FavoritesImpl>((_) {
  return FavoritesImpl();
});
