import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:okoul/components/components.dart';
import 'package:okoul/utils/language_util.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    super.key,
    required this.left,
    required this.lng,
    required this.right,
  });

  final AnimationController left;
  final AppLanguage lng;
  final AnimationController right;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(0),
            child: AppBarButton(
              tag: 'drawer',
              onPressed: () => context.push('/drawer'),
              child: Icon(
                Iconsax.menu,
                color: Theme.of(context).canvasColor,
              ),
            ),
          ).animate(controller: left).slideX(
                begin: lng.isAr ? 12 : -12,
                end: 0,
                duration: const Duration(
                  milliseconds: 500,
                ),
              ),
          Text.rich(
            TextSpan(
                text: 'Okoul',
                style: Theme.of(context).textTheme.titleLarge,
                children: [
                  TextSpan(
                    text: 'Movies',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ]),
          ).animate().scale(
                duration: const Duration(
                  milliseconds: 400,
                ),
              ),
          Padding(
            padding: const EdgeInsets.all(0),
            child: AppBarButton(
              tag: 'notification',
              child: Icon(
                key: Key('value'),
                Iconsax.search_normal,
                color: Theme.of(context).canvasColor,
              ),
              onPressed: () => context.push('/notification'),
            ),
          ).animate(controller: right).slideX(
                begin: lng.isAr ? -20 : 12,
                end: 0,
                duration: const Duration(
                  milliseconds: 500,
                ),
              ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(55);
}
