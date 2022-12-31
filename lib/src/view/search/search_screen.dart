import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/extensions/extensions.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:okoul/components/after_hero.dart';
import 'package:okoul/components/film_card_2.dart';
import 'package:okoul/services/database/favorites/models/favorite_model.dart';
import 'package:okoul/src/view/home/models/trending/trending_model.dart';
import 'package:okoul/src/view/search/providers/search_film_provider.dart';
import 'package:okoul/utils/assets_manager.dart';
import 'package:okoul/utils/debouncer.dart';
import 'package:okoul/utils/extentions.dart';

class NotificationScreen extends HookConsumerWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(searchProvider);
    return Hero(
      tag: 'notification',
      child: Container(
        color: Theme.of(context).primaryColor,
        child: AfterHero(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: CustomScrollView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              slivers: [
                SliverAppBar.large(
                  backgroundColor: Colors.transparent,
                  // title: Text(
                  //   'الاشعارات',
                  //   textAlign: TextAlign.start,
                  // ),
                  pinned: false,
                  // snap: true,
                  stretch: true,
                  // floating: true,
                  expandedHeight: 200,
                  flexibleSpace: const FlexibleSpaceBar(
                    // centerTitle: false,
                    expandedTitleScale: 2,
                    titlePadding:
                        EdgeInsets.symmetric(vertical: 55, horizontal: 16),
                    title: Text(
                      'البحث',
                      textAlign: TextAlign.start,
                    ),
                  ),
                  bottom: PreferredSize(
                    preferredSize: Size(MediaQuery.of(context).size.width, 55),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Container(
                        width: context.width,
                        height: 55,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              onChanged: (r) async {
                                final _debouncer = Debouncer(duration: 800.ms);
                                _debouncer.run(() {
                                  ref.read(searchProvider.notifier).search(r);
                                });
                              },
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  suffix: Icon(
                                    key: const Key('value'),
                                    Iconsax.search_normal,
                                    color: Theme.of(context).primaryColor,
                                  )
                                  // counterText: 'Search Movie',
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: state.maybeWhen(
                    loaded: (data) => ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: data.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final FilmModel film = data[index];

                        final FavoriteModel model = FavoriteModel(
                          id: film.id,
                          name: film.title,
                          description: film.overview,
                          img: film.posterPath,
                          release: film.releaseDate,
                          rate: film.voteAverage,
                        );
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FilmCard(model: model, index: index),
                        );
                      },
                    ),
                    loading: () => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: SpinKitFadingCube(
                              color: Theme.of(context).canvasColor),
                        ),
                      ],
                    ),
                    error: (err, stackTrace) => Center(
                      child: Column(
                        children: [
                          Lottie.asset(
                            AssetsManager.lottie.notFoundFilm,
                          ),
                          Text(
                            err,
                            style: const TextStyle(fontSize: 28),
                          )
                        ],
                      ),
                    ),
                    orElse: () => Lottie.asset(AssetsManager.lottie.search),
                  ),
                )
              ],
            ),
            // body:
            // color: Colors.red,
          ),
        ),
      ),
    );
  }
}
