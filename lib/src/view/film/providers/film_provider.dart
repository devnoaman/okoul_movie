import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:okoul/services/database/favorites/models/favorite_model.dart';
import 'package:okoul/services/database/favorites/providers/database_provider.dart';
import 'package:okoul/services/dio_client.dart';
import 'package:okoul/src/view/film/models/movie_model/movie_model.dart';
import 'package:okoul/src/view/film/providers/film_casts_provider.dart';
import 'package:okoul/src/view/film/providers/film_reviews.dart';
import 'package:okoul/src/view/film/providers/similar_films_provider.dart';
import 'package:okoul/states/global/global_state.dart';

final filmProvider =
    StateNotifierProvider.family<FilmNotifier, GlobalState<MovieModel>, int>(
        (ref, id) {
  return FilmNotifier(ref, id);
});

// use <List<MovieModel>> to retrive this type in ui
// rather than dynamic type
class FilmNotifier extends StateNotifier<GlobalState<MovieModel>> {
  FilmNotifier(this.ref, this.filmId) : super(const GlobalState.initial()) {
    if (mounted) get(filmId);
  }
  Ref ref;
  final int filmId;
  MovieModel? model;
  Future<void> get(int id) async {
    state = const GlobalState.initial();
    state = const GlobalState.loading();

    print('getting film info');
    state = const GlobalState.loading();
    try {
      await Net()
          .dio
          .get(
            '/movie/$id',
          )
          .then((value) async {
        // print(value);

        model = MovieModel.fromMap(value.data);
        var s = await ref.read(favDatabaseProvider.notifier).find(id);
        print('in fav $s');
        var m = model!.copyWith(
          isFav: s != null,
        );
        print(m.isFav);
        state = GlobalState.loaded(m);
        ref.read(reviewsProvider.notifier).get(filmId);
        ref.read(castsProvider.notifier).get(filmId);
        ref.read(similarFilmsProvider.notifier).get(filmId);

        // print(m.isFav);
        return;
      });

      // print(res.);
    } catch (e) {
      state = GlobalState.error(e.toString(), null);
      return;
    }
  }

  addFav({required FavoriteModel item, required bool isFav}) async {
    var e = ref.read(favDatabaseProvider);
    var f = await e.find(item.id!);

    print(isFav);
    var m;
    if (f == null) {
      e.insertFav(item);
      m = model!.copyWith(
        isFav: true,
      );
    } else {
      e.deleteFav(item.id!).then((value) => print('fav deleted: '));
      m = model!.copyWith(
        isFav: false,
      );
    }

    print(f);

    state = GlobalState.loaded(m);
  }
}
