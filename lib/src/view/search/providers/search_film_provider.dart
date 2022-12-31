import 'package:flutter_animate/extensions/extensions.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:okoul/services/dio_client.dart';
import 'package:okoul/src/view/home/models/trending/trending_model.dart';
import 'package:okoul/states/global/global_state.dart';

final searchProvider =
    StateNotifierProvider<CastNotifier, GlobalState<List<FilmModel>>>((ref) {
  // ref.read(FavoriteIds.provider);
  return CastNotifier(ref);
});

// use <List<MovieModel>> to retrive this type in ui
// rather than dynamic type
class CastNotifier extends StateNotifier<GlobalState<List<FilmModel>>> {
  CastNotifier(this.ref) : super(const GlobalState.initial());
  Ref ref;
  FilmModel? model;
  search(String q) async {
    if (q == null || q.isEmpty) {
      state = const GlobalState.initial();
      return;
    }

    print('searching film ');
    state = const GlobalState.loading();
    try {
      await Net().dio.get(
        '/search/movie',
        queryParameters: {
          'language': 'en-US',
          'include_adult': false,
          'query': q,
        },
      ).then((value) async {
        print(value);
        List<FilmModel> m = (value.data['results'] as List<dynamic>?)!
            .map((e) => FilmModel.fromJson(e))
            .toList();
        model = FilmModel.fromJson(value.data);
        if (m.isEmpty) {
          state = const GlobalState.error('No result found', null);
          return;
        }

        state = GlobalState.loaded(m);
        return;
      });

      // print(res.);
    } catch (e) {
      state = GlobalState.error(e.toString(), null);
      return;
    }
  }
}
