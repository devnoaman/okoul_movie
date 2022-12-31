import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:okoul/components/abb_bar_button.dart';
import 'package:okoul/components/error_widget.dart';
import 'package:okoul/constants/api.dart';
import 'package:okoul/router/router_notifier.dart';
import 'package:okoul/services/database/favorites/models/favorite_model.dart';
import 'package:okoul/src/view/film/components/casts_wdget.dart';
import 'package:okoul/src/view/film/components/generes.dart';
import 'package:okoul/src/view/film/components/production_companies.dart';
import 'package:okoul/src/view/film/components/reviews_widget.dart';
import 'package:okoul/src/view/film/models/movie_model/movie_model.dart';
import 'package:okoul/src/view/film/providers/film_casts_provider.dart';
import 'package:okoul/src/view/film/providers/film_provider.dart';
import 'package:okoul/src/view/film/providers/film_reviews.dart';
import 'package:okoul/src/view/film/providers/films_stack_provider.dart';
import 'package:okoul/src/view/film/providers/similar_films_provider.dart';
import 'package:okoul/src/view/home/components/now_playing_list.dart';
import 'package:okoul/src/view/home/components/trending_movies.dart';
import 'package:okoul/utils/extentions.dart';

//! null check just for working offline

class FilmScreen extends HookConsumerWidget {
  const FilmScreen({
    required this.id,
  });
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(filmProvider(id));

    // ref.listen(filmProvider, (p, n) async {
    //   await ref.read(reviewsProvider.notifier).get(id);
    //   await ref.read(filmProvider.notifier).get(id);
    //   await ref.read(castsProvider.notifier).get(id);
    //   await ref.read(similarFilmsProvider.notifier).get(id);
    // });

    return Material(
      child: state.maybeWhen(
        loaded: (data) => Film(film: data),
        loading: () => Center(
          child: SpinKitFoldingCube(
            color: Theme.of(context).primaryColor,
            size: 65,
          ),
        ),
        error: (err, stackTrace) => Container(
          // color: Colors.red,
          width: context.width,
          height: context.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyErrorWidget(
                message: err,
                title: 'Back',
                onRefresh: () => context.pop(),
              ),
            ],
          ),
        ),
        orElse: () => SizedBox(),
      ),
    );
  }
}

class Film extends StatefulHookConsumerWidget {
  const Film({
    Key? key,
    required this.film,
  }) : super(key: key);
  // final TrendingModel? film;
  final MovieModel? film;

  @override
  ConsumerState<Film> createState() => _FilmState();
}

class _FilmState extends ConsumerState<Film> {
  ScrollController? _scrollController;
  double? _scrollingOffset = 0.0;

  @override
  void initState() {
    // getting casts of the film

    _scrollController = ScrollController()
      ..addListener(() {
        _onScroll();
      });
    super.initState();
  }

  void _onScroll() {
    setState(() {
      _scrollingOffset = _scrollController!.offset;
      print(_scrollingOffset);
    });
  }

  @override
  void dispose() {
    _scrollController!.dispose();
    super.dispose();
  }

  double top = 0;
  double speed1 = 0.5;
  double speed2 = 0.6;
  double speed3 = 0.42;
  double speed4 = 0.375;
  _onBack(filmsStack) {
    filmsStack.shouldPop
        ? {
            ref.read(filmsStackProvider.notifier).pop(widget.film!.id!).then(
              (value) {
                print('poped');
                context.pop();
              },
            ),
            print('poped2'),
            // GoRouter.of(context).pop()
            // context.pop()
          }
        : ref
            .read(filmsStackProvider.notifier)
            .pop(widget.film!.id!)
            .then((value) {
            filmsStack.logAll();
            ref
                .read(filmProvider(filmsStack.last).notifier)
                .get(filmsStack.last);
            context.pushReplacement(
              '/film/${filmsStack.last}',
              extra: filmsStack.last,
            );
          });
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = context.height;
    var screenWidth = context.width;
    print('rebuilded');

    var films = ref.watch(similarFilmsProvider);
    var filmsStack = ref.read(filmsStackProvider.notifier);
    return WillPopScope(
      onWillPop: () async {
        // filmsStack.shouldPop
        //     ? ref
        //         .read(filmsStackProvider.notifier)
        //         .pop(widget.film!.id!)
        //         .then((value) => context.pop())
        //     : ref
        //         .read(filmsStackProvider.notifier)
        //         .pop(widget.film!.id!)
        //         .then((value) {
        //         filmsStack.logAll();
        //         ref
        //             .read(filmProvider(filmsStack.last).notifier)
        //             .get(filmsStack.last);
        //         context.pushReplacement(
        //           '/film/${filmsStack.last}',
        //           extra: filmsStack.last,
        //         );
        //       });
        return true;
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: Material(
          child: Stack(
            children: [
              SingleChildScrollView(
                controller: _scrollController,
                child: Stack(
                  children: [
                    Consumer(builder: (context, ref, _) {
                      return Column(
                        children: [
                          AnimatedContainer(
                            duration: 30.ms,
                            height: screenHeight * .88 +
                                (12 + _scrollingOffset!) / 12 * -1,
                            child: Stack(
                              alignment: Alignment.topLeft,
                              children: [
                                Positioned(
                                  top: speed1 * _scrollingOffset! / 10,
                                  child: TrendingMovie(
                                    child: Image.network(
                                      '${Api.resprcePath}${widget.film!.backdropPath}',
                                      fit: BoxFit.cover,
                                    ),

                                    // ),
                                    // ),
                                  ),
                                ),
                                // profile img
                                Positioned(
                                  top: screenHeight * .4 +
                                      speed1 +
                                      2 * _scrollingOffset! / 10 * -1,
                                  left: 0,
                                  right: 0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        height: screenWidth * .4,
                                        width: screenWidth * .4,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            image: widget.film == null
                                                ? null
                                                : DecorationImage(
                                                    image: NetworkImage(
                                                      '${Api.resprcePath}${widget.film!.posterPath}',
                                                    ),
                                                    fit: BoxFit.cover,
                                                  ),
                                            color:
                                                Theme.of(context).primaryColor),
                                        // color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ),
                                // title and information
                                Positioned(
                                  top: screenHeight * .4 +
                                      speed2 +
                                      1 * _scrollingOffset! / 10 * -1,
                                  left: 0,
                                  right: 0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Container(
                                        height: screenWidth * .4,
                                        width: screenWidth * .5,
                                        // color: Colors.red,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            // using 8 rule
                                            Text(
                                              widget.film == null
                                                  ? 'Noaman Film'
                                                  : widget.film!.title!,
                                              maxLines: 2,
                                              style: const TextStyle(
                                                fontSize: 30,
                                                height: 1.5,
                                                fontWeight: FontWeight.w800,
                                              ),
                                            ),
                                            Text(
                                              widget.film == null
                                                  ? '2022-12-20'
                                                  : widget.film!.releaseDate!,
                                              style: const TextStyle(
                                                fontSize: 30 - 8,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            RatingBar.builder(
                                              initialRating: widget.film == null
                                                  ? 5
                                                  : widget.film!.voteAverage! /
                                                      2,
                                              maxRating: 5,
                                              minRating: 1,
                                              ignoreGestures: true,
                                              itemSize: 24,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              itemPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 2.0),
                                              itemBuilder: (context, index) =>
                                                  Icon(
                                                Icons.star,
                                                color:
                                                    Colors.amber[index * 200],
                                                size: 12,
                                              ),
                                              onRatingUpdate: (rating) {
                                                // print(rating);
                                              },
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: screenHeight * .6 +
                                      speed2 * _scrollingOffset! / 4 * -1,
                                  left: 0,
                                  right: 0,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: GeneresTitles(
                                          genres: widget.film!.genres,
                                        ),
                                      ),
                                      ProductionCompanies(
                                        productionCompanies:
                                            widget.film!.productionCompanies,
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                    // color: Colors.red,
                                    height: screenHeight * 2,
                                    width: screenWidth,
                                    margin: EdgeInsets.only(
                                      top: 100,
                                      left: 100,
                                    )),
                              ],
                            ),
                          ),
                          Container(
                            // color: Colors.red,
                            // height: screenHeight + (),
                            width: screenWidth,
                            margin: const EdgeInsets.only(
                                // top: 100,
                                // left: 100,
                                ),
                            child: SafeArea(
                              top: false,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: context.width,
                                    height: max(0, .15 * _scrollingOffset!),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: Text(
                                      'Over View',
                                      style: TextStyle(
                                          fontSize: 28,
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    width: context.width,
                                    height: 16,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: Text(
                                      widget.film!.overview!,
                                      textAlign: TextAlign.justify,
                                      style: const TextStyle(
                                          fontSize: 18, height: 1.3),
                                    ),
                                  ),
                                  //todo add casts here
                                  CastsWidget(
                                    filmId: widget.film!.id!,
                                  ),
                                  SizedBox(
                                    child: films.whenOrNull(
                                      loaded: (data) {
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16.0),
                                              child: Text(
                                                'Similar to ${widget.film!.title!}',
                                                style: TextStyle(
                                                    fontSize: 28,
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            MoviesList(
                                              padding: 16,
                                              spacing: 12,
                                              state: films,
                                              onTap: (id) async {
                                                ref
                                                    .read(filmsStackProvider
                                                        .notifier)
                                                    .push(id)
                                                    .then(
                                                  (value) async {
                                                    context.pushReplacement(
                                                        '/film/$id');
                                                    // await ref
                                                    //     .read(filmProvider(id)
                                                    //         .notifier)
                                                    //     .get(id);
                                                  },
                                                );
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                  const ReviewsWidget(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top,
                  left: 16,
                  right: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppBarButton(
                      tag: '12',
                      child: GestureDetector(
                        child: Icon(Icons.arrow_back_ios),
                        onTap: () => _onBack(filmsStack),
                      ),
                    ),
                    Builder(builder: (context) {
                      print('inside builder : ${widget.film!.isFav}');
                      return AppBarButton(
                        tag: '14',
                        child: GestureDetector(
                          onTap: () {
                            final item = FavoriteModel(
                                id: widget.film!.id!,
                                name: widget.film!.title,
                                description: widget.film!.overview,
                                img: widget.film!.posterPath,
                                release: widget.film!.releaseDate,
                                rate: widget.film!.voteAverage);
                            ref.read(filmProvider(item.id!).notifier).addFav(
                                  item: item,
                                  isFav: widget.film!.isFav,
                                );
                          },
                          child: Icon(widget.film!.isFav
                              ? Icons.favorite
                              : Icons.favorite_outline),
                        ),
                      );
                    })
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
