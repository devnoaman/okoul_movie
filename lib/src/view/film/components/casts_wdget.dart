import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:okoul/components/error_widget.dart';
import 'package:okoul/constants/api.dart';
import 'package:okoul/src/view/film/components/shimmer_casts.dart';

import 'package:okoul/src/view/film/providers/film_casts_provider.dart';
import 'package:okoul/utils/extentions.dart';

class CastsWidget extends HookConsumerWidget {
  const CastsWidget({
    super.key,
    required this.filmId,
  });
  final int filmId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(castsProvider);
    var notifier = ref.read(castsProvider.notifier);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          // height: context.height * .3,
          child: state.maybeWhen(
              // initial: () => const Text('init'),
              loading: () => const ShimmerCasts(),
              loaded: (data) => Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Casts',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor),
                            ),
                            // GestureDetector(
                            //   onTap: () {},
                            //   child: Text(
                            //     'All',
                            //     style: Theme.of(context)
                            //         .textTheme
                            //         .titleLarge!
                            //         .copyWith(
                            //           fontSize: 24,
                            //           color: Theme.of(context).primaryColor,
                            //         ),
                            //   ),
                            // )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: context.height * .3,
                        child: ListView.separated(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: data[index].profilePath == null
                                    ? Container(
                                        height: context.height * .3,
                                        width: context.width * .4,
                                        color: Theme.of(context).primaryColor,
                                      )
                                    : CachedNetworkImage(
                                        height: context.height * .3,
                                        width: context.width * .4,
                                        imageUrl: Api.resprcePath +
                                            data[index].profilePath!,
                                        progressIndicatorBuilder:
                                            (context, url, downloadProgress) =>
                                                const Center(
                                          child: SizedBox(
                                            width: 55,
                                            height: 55,
                                            child: SpinKitFadingCube(
                                              color: Colors.white,
                                              size: 50.0,
                                            ),
                                          ),
                                        ),
                                        fit: BoxFit.cover,
                                        errorWidget: (context, url, error) =>
                                            const MyErrorWidget(),
                                      ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                width: 16,
                              );
                            },
                            itemCount: data.take(5).length),
                      ),
                    ],
                  ),
              error: (err, stackTrace) => MyErrorWidget(
                    message: err,
                    onRefresh: () {
                      ref.read(castsProvider.notifier).get(filmId);
                    },
                  ),
              orElse: () => const SizedBox()),
        ),
      ],
    );
  }
}
