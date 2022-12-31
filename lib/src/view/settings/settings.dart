import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:okoul/utils/language_util.dart';
import 'package:okoul/components/tile_button.dart';

class Settings extends ConsumerWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lng = ref.watch(lang.notifier);

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0,
        title: Text('تخصيص'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text('عام'),
            TileButton(
              icon: Iconsax.global,
              title: 'اللغة',
              onTap: () {
                lng.toggleLocale();
              },
            )
          ],
        ),
      ),
    );
  }
}
