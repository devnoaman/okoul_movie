import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:okoul/src/view/film/providers/films_stack_provider.dart';

import 'package:okoul/src/view/home/components/now_playing_list.dart';
import 'package:okoul/src/view/home/components/trending_header_scroll.dart';
import 'package:okoul/src/view/home/providers/now_playing_provider.dart';
import 'package:okoul/src/view/home/providers/trending_provider.dart';
import 'package:okoul/src/view/home/providers/upcomming_provider.dart';
import 'package:okoul/utils/assets_manager.dart';
import 'package:okoul/utils/extentions.dart';

class HomeScreen extends StatefulHookConsumerWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var state = ref.watch(trendingProvider);
    var _now = ref.watch(nowPlayingProvider);
    var _upcomming = ref.watch(upcommingProvider);

    // var n = ref.watch(nowPlayingProvider);
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        SizedBox(
          height: context.height * .5,
          width: context.width,
          child: state.maybeWhen(
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            error: (err, stackTrace) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(AssetsManager.lottie.error),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Text(
                      err,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 22),
                    ),
                  ),
                ],
              ),
            ),
            loaded: (data) {
              // },
              return TreandingHeaderScroll(
                items: data.take(5).toList(),
              );
            },
            orElse: () => const SizedBox(),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'Now Playing',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
            .animate()
            .fade(
              begin: 0,
              end: 1,
              duration: 300.ms,
              delay: 300.ms,
            )
            .slide(delay: 300.ms),
        MoviesList(
          padding: 24,
          spacing: 12,
          state: _now,
          // onTap: (id) {
          //   print(id);
          // },
          onTap: (id) async {
            ref.read(filmsStackProvider.notifier).push(id).then(
              (value) async {
                context.push(
                  '/film/$id',
                  extra: id,
                );
              },
            );
            // context.push(
            //   '/film/${id}',
            //   extra: id,
            // );
          },
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'Upcomming',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
            .animate()
            .fade(
              begin: 0,
              end: 1,
              duration: 300.ms,
              delay: 300.ms,
            )
            .slide(delay: 300.ms),
        // SizedBox(
        //   height: MediaQuery.of(context).padding.bottom,
        // ),
        MoviesList(
          padding: 24,
          spacing: 12,
          state: _upcomming,
          // onTap: (id) {
          //   print(id);
          // },
          onTap: (id) async {
            ref.read(filmsStackProvider.notifier).push(id).then(
              (value) async {
                context.push(
                  '/film/$id',
                  extra: id,
                );
              },
            );
            // context.push(
            //   '/film/${id}',
            //   extra: id,
            // );
          },
        ),
        SizedBox(
          height: MediaQuery.of(context).padding.bottom,
        ),
      ],
    );
  }
}
