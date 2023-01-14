import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:okoul/components/film_card_2.dart';
import 'package:okoul/constants/api.dart';
import 'package:okoul/services/database/favorites/models/favorite_model.dart';
import 'package:okoul/src/view/favorite/providers/db_provider.dart';
import 'package:okoul/src/view/film/providers/film_casts_provider.dart';
import 'package:okoul/src/view/film/providers/film_provider.dart';
import 'package:okoul/src/view/film/providers/film_reviews.dart';
import 'package:okoul/src/view/film/providers/films_stack_provider.dart';
import 'package:okoul/src/view/film/providers/similar_films_provider.dart';
import 'package:okoul/utils/extentions.dart';

class FavouriteScreen extends ConsumerWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(providerProvider);
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
        child: state.maybeWhen(
          data: (data) => Padding(
            padding: const EdgeInsets.only(
              left: 8,
              top: 8,
              right: 8,
            ),
            child: ListView.separated(
              itemCount: data.length,
              separatorBuilder: (context, index) => const SizedBox(
                height: 16,
              ),
              itemBuilder: (context, index) => FilmCard(
                index: index,
                model: data[index],
                onClick: () async {
                  print('clicked');
                  await ref
                      .read(filmsStackProvider.notifier)
                      .push(data[index].id!)
                      .then(
                    (value) async {
                      context.push(
                        '/film/${data[index].id!}',
                        extra: data[index].id!,
                      );
                    },
                  );
                  // ref.read(reviewsProvider.notifier).get(data[index].id!);
                  // ref
                  //     .read(filmProvider(data[index].id!).notifier)
                  //     .get(data[index].id!);
                  // ref.read(castsProvider.notifier).get(data[index].id!);
                  // ref.watch(similarFilmsProvider.notifier).get(data[index].id!);

                  // context.push(
                  //   '/film/${data[index].id!}',
                  //   extra: data[index],
                  // );
                },
              ),
            ),
          ),
          orElse: () {
            return SizedBox();
          },
        ),
        // child: state.maybeWhen(
        //   orElse: () => const SizedBox(),
        //   loaded: (data) => ListView.separated(
        //     itemCount: data.length,
        //     separatorBuilder: (context, index) => const SizedBox(
        //       height: 16,
        //     ),
        //     itemBuilder: (context, index) => Text(data[index].name!),
        //   ),
        // ),
      ),
    );
  }
}
