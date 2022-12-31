import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:okoul/services/database/favorites/models/favorite_model.dart';
import 'package:okoul/services/database/favorites/providers/database_provider.dart';
import 'package:okoul/states/global/global_state.dart';

final providerProvider = FutureProvider((ref) async {
  var s = await ref.watch(favDatabaseProvider).allFav();
  return s;
});

final favsProvider =
    StateNotifierProvider<Notifier, GlobalState<List<FavoriteModel>>>((ref) {
  return Notifier(ref);
});

class Notifier extends StateNotifier<GlobalState<List<FavoriteModel>>> {
  Ref ref;
  Notifier(this.ref) : super(const GlobalState.initial()) {
    get();
  }

  get() async {
    state = const GlobalState.loading();
    var fav = await ref.read(favDatabaseProvider).allFav();
    print(fav);
    state = GlobalState.loaded(fav);
  }
}
