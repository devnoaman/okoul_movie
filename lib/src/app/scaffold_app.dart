import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax/iconsax.dart';

import 'package:okoul/packages/bottom_nav/lib/bottom_nav.dart';
import 'package:okoul/providers/bottom_nav_provider.dart';
import 'package:okoul/src/view/favorite/providers/db_provider.dart';
import 'package:okoul/utils/language_util.dart';

import 'package:okoul/components/components.dart' show MyAppBar;

class ScaffoldApp extends HookConsumerWidget {
  const ScaffoldApp({
    super.key,
    this.child,
  });
  final Widget? child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var flt = useAnimationController();
    var left = useAnimationController();
    var right = useAnimationController();
    final lng = ref.watch(lang.notifier);
    var currentIndex = ref.watch(bottomNavProvider);

    return Scaffold(
      appBar: MyAppBar(left: left, lng: lng, right: right),
      body: child,
      extendBodyBehindAppBar: true,

      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavyBar(
        selecetedIndex: currentIndex,
        onItemSelected: (item) async {
          ref.read(bottomNavProvider.notifier).state = item;
          print(item);

          switch (item) {
            case 1:
              context.go('/favorites');

              break;

              break;
            case 0:
              context.go('/');

              break;
            default:
          }
        },
        items: [
          BottomNavyModel(
            index: 0,
            title: '',
            icon: Icon(
              Iconsax.home,
              color: Theme.of(context).primaryColor,
            ),
          ),
          BottomNavyModel(
            index: 1,
            title: '',
            icon: Icon(
              Iconsax.heart,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ).animate().slideY(
          begin: 12, duration: const Duration(milliseconds: 800), end: 0),
      // floatingActionButton: FloatingActionButton(
      //   shape: const CircleBorder(),
      //   onPressed: () async {
      //     print('hi');
      //     left.animateTo(0, duration: const Duration(milliseconds: 600));
      //     right.animateTo(0, duration: const Duration(milliseconds: 600));
      //     await flt.animateTo(0, duration: const Duration(milliseconds: 400));
      //     await showCartDialog(context);
      //     await flt.forward();
      //     left.forward();
      //     right.forward();
      //   },
      //   tooltip: 'Increment',
      //   child: Icon(
      //     Iconsax.bag_2,
      //     color: Theme.of(context).canvasColor,
      //   ),
      // ).animate(controller: flt).slideY(
      //     begin: 12, duration: const Duration(milliseconds: 600), end: 0),
    );
  }
}
