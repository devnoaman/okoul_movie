import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:okoul/src/view/film/components/shimmer_casts.dart';

import 'package:okoul/src/view/film/providers/film_casts_provider.dart';
import 'package:okoul/src/view/film/providers/film_provider.dart';
import 'package:okoul/src/view/film/providers/film_reviews.dart';
import 'package:okoul/src/view/film/providers/similar_films_provider.dart';
import 'package:okoul/src/view/home/components/now_playing_img.dart';
import 'package:okoul/states/global/global_state.dart';
import 'package:okoul/utils/extentions.dart';

class MoviesList<T> extends StatefulHookConsumerWidget {
  final double padding;
  final double spacing;
  final Widget? child;
  // final List<T> items;
  final GlobalState<T>? state;
  final Function(int) onTap;

  const MoviesList({
    Key? key,
    required this.padding,
    required this.spacing,
    this.child,
    required this.onTap,
    this.state,
  }) : super(key: key);

  @override
  ConsumerState<MoviesList> createState() => _MoviesListState();
}

class _MoviesListState extends ConsumerState<MoviesList> {
  static const _imageWidth = 200.0;

  final ScrollController _scrollController = ScrollController();
  double _indexFactor = 0.0;

  double _imageOffset = 0.0;

  @override
  void initState() {
    calculate();

    super.initState();
  }

  calculate() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final deviceWidth = context.width;
      _indexFactor = (widget.spacing + _imageWidth) / deviceWidth;
      _imageOffset = -widget.padding / deviceWidth;

      // _scrollController =;
      _scrollController.addListener(() {
        setState(() {
          _imageOffset =
              ((_scrollController.offset - widget.padding) / deviceWidth);
        });
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: widget.state!.maybeWhen(
          initial: () => Text('init'),
          loading: () => ShimmerCasts(),
          error: (err, stackTrace) => Text(err),
          loaded: (data) => SizedBox(
                height: 300,
                width: context.width,
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: widget.padding),
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (_, __) => SizedBox(width: widget.spacing),
                  itemCount: data.length,
                  itemBuilder: (_, index) => GestureDetector(
                    onTap: () => widget.onTap(data[index].id!)

                    // {
                    // prepare casts & reviews of the film
                    // ref.read(reviewsProvider.notifier).get(data[index].id!);
                    // ref.read(filmProvider.notifier).get(data[index].id!);
                    // ref.read(castsProvider.notifier).get(data[index].id!);
                    // ref
                    //     .watch(similarFilmsProvider.notifier)
                    //     .get(data[index].id!);

                    // context.push(
                    //   '/film/${data[index].id!}',
                    //   extra: data[index],
                    // );
                    // }

                    ,
                    child: DestinationItem(
                      index: index,
                      details: data[index],
                      imageWidth: _imageWidth,
                      imageOffset: _imageOffset,
                      indexFactor: _indexFactor,
                    )
                        .animate()
                        .fadeIn(duration: 300.ms, delay: 100.ms)
                        .scale()
                        .scaleX(),
                  ),
                ),
              ),
          orElse: () => const Text('data')),
    );
  }
}
