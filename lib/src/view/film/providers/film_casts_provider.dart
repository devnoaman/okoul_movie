import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:okoul/services/dio_client.dart';
import 'package:okoul/src/view/film/models/casts_model.dart';
import 'package:okoul/src/view/home/models/trending/trending_model.dart';
import 'package:okoul/states/global/global_state.dart';

// final provider = StateNotifierProvider<Notifier<int, String>, String>((ref) {
//   return Notifier<int, String>('');
// });

// class Notifier<T, E> extends StateNotifier<E> {
//   Notifier(super.state) {
//     print(state);
//   }
// }

final castsProvider =
    StateNotifierProvider<CastNotifier, GlobalState<List<CastsModel>>>((ref) {
  return CastNotifier();
});

// use <List<CastsModel>> to retrive this type in ui
// rather than dynamic type
class CastNotifier extends StateNotifier<GlobalState<List<CastsModel>>> {
  CastNotifier() : super(const GlobalState.initial());

  get(int id) async {
    print('getting casts');
    state = const GlobalState.loading();
    try {
      var res = await Net()
          .dio
          .get(
            '/movie/$id/credits',
          )
          .then((value) {
        // print(value);
        state = GlobalState.loaded(
          (value.data['cast'] as List<dynamic>)
              .map(
                (e) => CastsModel.fromJson(e),
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
