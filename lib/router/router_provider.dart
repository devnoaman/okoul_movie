import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:okoul/router/router_notifier.dart';
import 'package:okoul/src/view/categories/categories.dart';
import 'package:okoul/src/view/favorite/providers/favourite_screen.dart';
import 'package:okoul/src/view/film/providers/film_casts_provider.dart';
import 'package:okoul/src/view/film/providers/film_provider.dart';
import 'package:okoul/src/view/film/providers/film_reviews.dart';
import 'package:okoul/src/view/film/providers/similar_films_provider.dart';
import 'package:okoul/src/view/home/home.dart' show HomeScreen;
import 'package:okoul/src/view/home/models/trending/trending_model.dart';
import 'package:okoul/src/view/settings/settings.dart';
import 'package:okoul/src/view/view.dart';

import '../src/view/film/film_screen2.dart';

final GlobalKey<NavigatorState> _shellNavigator =
    GlobalKey(debugLabel: 'shell');
final GlobalKey<NavigatorState> mainNavigator = GlobalKey(debugLabel: 'root');
final routerProvider = Provider<GoRouter>((ref) {
  final notifier = ref.read(goRouterNotifierProvider);
  bool isDuplicate = false;

  return GoRouter(
    debugLogDiagnostics: true,
    refreshListenable: notifier,

    navigatorKey: mainNavigator,
    observers: [HeroController()],
    restorationScopeId: 'RestorationScope',
    // mainNavigator
    initialLocation: '/',

    routes: <RouteBase>[
      ShellRoute(
        navigatorKey: _shellNavigator,
        pageBuilder: (context, state, child) {
          return MaterialPage(
            key: state.pageKey,
            child: HeroControllerScope(
              controller: MaterialApp.createMaterialHeroController(),
              child: ScaffoldApp(
                child: child,
              ),
            ),
          );
        },
        routes: <RouteBase>[
          GoRoute(
            path: '/',
            pageBuilder: (context, state) {
              // final query = state.queryParams['q'] ?? '';
              return FadeTransitionPage(
                child: const HomeScreen(),
                key: state.pageKey,
              );
            },
          ),
          GoRoute(
            path: '/categories',
            // parentNavigatorKey: mainNavigator,
            pageBuilder: (context, state) {
              // final query = state.queryParams['q'] ?? '';
              return FadeTransitionPage(
                child: const Categories(),
                key: state.pageKey,
              );
            },
          ),
          GoRoute(
            path: '/favorites',
            // parentNavigatorKey: _shellNavigator,
            pageBuilder: (context, state) {
              // final query = state.queryParams['q'] ?? '';
              return FadeTransitionPage(
                child: const FavouriteScreen(),
                key: state.pageKey,
              );
            },
          ),
        ],
      ),
      // GoRoute(
      //   path: '/categories',
      //   parentNavigatorKey: mainNavigator,
      //   pageBuilder: (context, state) {
      //     // final query = state.queryParams['q'] ?? '';
      //     return FadeTransitionPage(
      //       child: const Categories(),
      //       key: state.pageKey,
      //     );
      //   },
      // ),

      GoRoute(
        path: '/test',
        parentNavigatorKey: mainNavigator,
        pageBuilder: (context, state) {
          // final query = state.queryParams['q'] ?? '';
          return FadeTransitionPage(
            child: Scaffold(
              appBar: AppBar(),
            ),
            key: state.pageKey,
          );
        },
      ),
      GoRoute(
        path: '/notification',
        parentNavigatorKey: mainNavigator,
        pageBuilder: (context, state) {
          // final query = state.queryParams['q'] ?? '';
          return FadeTransitionPage(
            child: NotificationScreen(),
            key: state.pageKey,
          );
        },
      ),
      GoRoute(
        path: '/film/:filmsId',
        parentNavigatorKey: mainNavigator,
        // redirect: (context, state) async {
        //   // called on each navigation
        //   // print('inside redirection 2');
        //   // print(state.location);
        //   // print(state.path);
        //   // log('${state.params["filmsIdv"]}');
        //   // log('${state.extra}');

        //   // // final isLoaded = notifier.isLoadedFilm;
        //   final isGoingToFilm = state.subloc.contains('/film');
        //   // print(isGoingToFilm);
        //   if (isGoingToFilm) {
        //     print('path is ${state.subloc.substring(5)}');

        //     var film = state.extra! as FilmModel;
        //     await goFilm(film.id, ref.read);
        //   }

        //   // else {
        //   //   return '/';
        //   // }
        //   // if (!isLoaded && !isGoingToFilm && !isDuplicate) {
        //   //   isDuplicate = true;

        //   //   // return '/';
        //   // }
        //   // if (isLoaded && isGoingToFilm && !isDuplicate) {
        //   //   isDuplicate = true;
        //   //   return '/';
        //   // }

        //   // if (isDuplicate) {
        //   //   isDuplicate = false;
        //   // }

        //   return null;
        // },
        pageBuilder: (context, state) {
          var id = int.tryParse(state.params["filmsId"]!) as int;

          return FadeTransitionPage(
            key: state.pageKey,
            child: HeroControllerScope(
              controller: MaterialApp.createMaterialHeroController(),
              child: FilmScreen(
                // film: film,
                id: id,
              ),
            ),
          );

          // return FadeTransitionPage(
          //   child: FilmScreen(
          //     film: film,
          //   ),
          //   key: state.pageKey,
          // ), key: state.pageKey;
        },
      ),
      GoRoute(
        path: '/drawer',
        name: 'Drawer',
        parentNavigatorKey: mainNavigator,
        pageBuilder: (context, state) {
          return FadeTransitionPage(
            key: state.pageKey,

            child: DrawerScreen(),
            // key: UniqueKey(), /
          );
        },
        routes: [
          GoRoute(
            path: 'settings',
            // Display on the root Navigator

            pageBuilder: (context, state) {
              return FadeTransitionPage(
                child: HeroControllerScope(
                  controller: MaterialApp.createMaterialHeroController(),
                  child: Settings(),
                ),
                key: UniqueKey(),
              );
            },
          ),
        ],
      ),
    ],
  );
});

// Future<void> goFilm(
//     int? id, Function(ProviderListenable<dynamic> provider) read) async {
//   await read(reviewsProvider.notifier).get(id);
//   read(filmProvider.notifier).get(id);
//   read(castsProvider.notifier).get(id);
//   read(similarFilmsProvider.notifier).get(id);
// }
// final GoRouter _router = ;

/// A page that fades in an out.
class FadeTransitionPage extends CustomTransitionPage<void> {
  /// Creates a [FadeTransitionPage].
  FadeTransitionPage({
    required LocalKey key,
    required Widget child,
  }) : super(
            key: key,
            transitionsBuilder: (BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    Widget child) =>
                FadeTransition(
                  opacity: animation.drive(_curveTween),
                  child: child,
                ),
            child: child);

  static final CurveTween _curveTween = CurveTween(curve: Curves.easeIn);
}
