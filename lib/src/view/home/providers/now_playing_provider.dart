import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:okoul/constants/api.dart';
import 'package:okoul/services/dio_client.dart';
import 'package:okoul/src/view/home/models/trending/trending_model.dart';
import 'package:okoul/states/global/global_state.dart';

final nowPlayingProvider =
    StateNotifierProvider<TrendingNotifier, GlobalState<List<FilmModel>>>(
        (ref) {
  return TrendingNotifier();
});

class TrendingNotifier extends StateNotifier<GlobalState<List<FilmModel>>> {
  TrendingNotifier() : super(const GlobalState.initial()) {
    get();
  }

  get() async {
    state = const GlobalState.loading();
    try {
      await Net()
          .dio
          .get(
            Api.nowPlayingMovies,
          )
          .then((value) {
        print(value);
        state = GlobalState.loaded(
          (value.data['results'] as List<dynamic>)
              .map(
                (e) => FilmModel.fromJson(e),
              )
              .toList(),
        );
      });

      // print(res.);
    } catch (e) {
      state = GlobalState.error(e.toString(), null);
    }
  }
}
