import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:okoul/src/view/categories/state/side_state.dart';

class Categories extends ConsumerWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(categoryProvider);
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'الفئات',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Divider(),
                  Expanded(
                    child: Column(
                      children: state
                          .map(
                            (e) => RawMaterialButton(
                              onPressed: () {
                                ref.read(selectedProvider.notifier).state =
                                    e.name;
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6)),
                              elevation: 0,
                              focusElevation: 0.0,
                              hoverElevation: 0.0,
                              highlightElevation: 0.0,
                              disabledElevation: 0.0,
                              fillColor: ref.watch(selectedProvider) == e.name
                                  ? Theme.of(context).primaryColor
                                  : Colors.transparent,
                              child: Container(
                                // width: MediaQuery.of(context).size.width,
                                child: Text(
                                  e.name,
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  )
                ],
              ),
            ).animate().slideX(begin: 1, end: 0),
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Expanded(flex: 3, child: SizedBox())
      ],
    );
  }
}
