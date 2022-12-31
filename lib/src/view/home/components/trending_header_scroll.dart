import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:okoul/constants/api.dart';
import 'package:okoul/src/view/film/providers/film_casts_provider.dart';
import 'package:okoul/src/view/film/providers/film_provider.dart';
import 'package:okoul/src/view/film/providers/film_reviews.dart';
import 'package:okoul/src/view/film/providers/films_stack_provider.dart';
import 'package:okoul/src/view/film/providers/similar_films_provider.dart';
import 'package:okoul/src/view/home/components/trending_movies.dart';
import 'package:okoul/src/view/home/models/trending/trending_model.dart';
import 'package:okoul/utils/extentions.dart';

class TreandingHeaderScroll extends StatefulHookConsumerWidget {
  const TreandingHeaderScroll({
    Key? key,
    required this.items,
  }) : super(key: key);
  final List<FilmModel> items;

  @override
  ConsumerState<TreandingHeaderScroll> createState() =>
      _TreandingHeaderScrollState();
}

class _TreandingHeaderScrollState extends ConsumerState<TreandingHeaderScroll>
    with TickerProviderStateMixin {
  int _currentPage = 0;
  late Timer _timer;
  late PageController? _pageController;
  late AnimationController? slideAnim;
  double viewportFraction = 0.8;

  double? pageOffset = 0;
  var currentPage = 0.0;
  @override
  void initState() {
    super.initState();
    slideAnim = AnimationController(vsync: this);

    _pageController = PageController(
      initialPage: 0,
    )..addListener(() {
        setState(() {
          pageOffset = _pageController!.page;
          currentPage = _pageController!.page!;
        });
      });
    if (mounted) {
      drive();
    }
  }

  drive() {
    _timer = Timer.periodic(
      3.seconds,
      (Timer timer) {
        if (_currentPage < widget.items.length - 2) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }
        if (mounted) {
          _pageController!
              .animateToPage(
                _currentPage,
                duration: 350.ms,
                curve: Curves.easeIn,
              )
              .then((value) => slideAnim!.forward(from: 0));
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    slideAnim!.dispose();
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: _pageController,
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          double scale = max(viewportFraction,
              (1 - (pageOffset! - index).abs()) + viewportFraction);

          double angle = (pageOffset! - index).abs();

          if (angle > 0.5) {
            angle = 1 - angle;
          }

          return GestureDetector(
            onTap: () async {
              // pause animation to continue when pop
              _timer.cancel();
              // ref.read(reviewsProvider.notifier).get(widget.items[index].id!);
              await ref
                  .read(filmsStackProvider.notifier)
                  .push(widget.items[index].id!)
                  .then(
                (value) async {
                  context.push(
                    '/film/${widget.items[index].id!}',
                    extra: widget.items[index].id!,
                  );
                },
              );
              // ref
              //     .read(filmProvider(widget.items[index].id!).notifier)
              //     .get(widget.items[index].id!);
              // ref.read(castsProvider.notifier).get(widget.items[index].id!);
              // ref
              //     .watch(similarFilmsProvider.notifier)
              //     .get(widget.items[index].id!);

              // context.push(
              //   '/film/${widget.items[index].id!}',
              //   extra: widget.items[index],
              // );
              //  continue with last animation
              drive();
            },
            child: Stack(
              children: [
                Hero(
                  tag: widget.items[index].id!,
                  child: TrendingMovie(
                    child: Container(
                      height: context.height,
                      width: context.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                              '${Api.resprcePath}${widget.items[index].backdropPath}',
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 16,
                  right: 16,
                  bottom: 16,

                  //  MediaQuery.of(context).padding.top - 16,
                  child: AnimatedOpacity(
                    opacity:
                        angle == 0 && ((pageOffset! - index).abs() * 0.5) == 0.0
                            ? 1
                            : 0,
                    duration: 100.ms,
                    curve: Curves.easeInOutCubic,
                    child: Container(
                      // height: context.height * .2 + 150,
                      // width: context.width ,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                          child: Container(
                            // height: context.height * .2 + 80,
                            width: context.width,
                            padding: 16.0.allpd,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey.withOpacity(.5),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  height: context.height * .15,
                                  width: context.height * .15,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          '${Api.resprcePath}${widget.items[index].posterPath}',
                                        ),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.items[index].title!,
                                          maxLines: 2,
                                          style: const TextStyle(
                                            fontSize: 26,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          widget.items[index].releaseDate!,
                                          maxLines: 1,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                        .animate()
                        .fadeIn()
                        .animate(controller: slideAnim)
                        .slideY(begin: 1, end: 0)
                        .fadeIn(),
                  ),
                )
              ],
            ),
          );
        });
  }
}
