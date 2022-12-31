import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:okoul/constants/api.dart';
import 'package:okoul/services/dio_client.dart';
import 'package:okoul/src/view/film/models/movie_model/movie_model.dart';
import 'package:okoul/src/view/film/models/review_model/review_model.dart';
import 'package:okoul/states/global/global_state.dart';

final reviewsProvider =
    StateNotifierProvider<CastNotifier, GlobalState<List<ReviewModel>>>((ref) {
  return CastNotifier();
});

// use <List<MovieModel>> to retrive this type in ui
// rather than dynamic type
class CastNotifier extends StateNotifier<GlobalState<List<ReviewModel>>> {
  CastNotifier() : super(const GlobalState.initial());
  var page = 1;
  // getMore() {
  //   page++;
  // }

  get(int id) async {
    state = const GlobalState.loading();
    try {
      await Net()
          .dio
          .get(
            '${Api.movie}/$id${Api.reviews}',
          )
          .then((value) {
        // print(value);
        state = GlobalState.loaded(
          // MovieModel.fromMap(value.data),
          (value.data['results'] as List<dynamic>)
              .map(
                (e) => ReviewModel.fromMap(e),
              )
              .toList(),
        );
        // print(e);
        return;
      });

      // print(res.);
    } catch (e) {
      // print('object');
      // print(e);
      state = GlobalState.error(e.toString(), null);
      return;
    }
  }
}
