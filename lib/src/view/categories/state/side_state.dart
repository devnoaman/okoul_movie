import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

class SideItem {
  final String name;
  final bool? isSelected;
  final String? uuid;

  SideItem({
    String? uuid,
    required this.name,
    this.isSelected = false,
  }) : uuid = uuid ?? const Uuid().v4();

  SideItem copyWith({
    String? name,
    bool? isSelected,
    String? uuid,
  }) {
    return SideItem(
      name: name ?? this.name,
      isSelected: isSelected ?? this.isSelected,
      uuid: uuid ?? this.uuid,
    );
  }
}

final categoryProvider =
    StateNotifierProvider<CategoryNotifier, List<SideItem>>((ref) {
  return CategoryNotifier();
});

class CategoryNotifier extends StateNotifier<List<SideItem>> {
  var selectedIndex = 0;

  CategoryNotifier() : super([SideItem(name: 'hi'), SideItem(name: 'hello')]);

  void onSelect(String id) {
    state = state.map((e) {
      if (e.uuid == id) {
        return e.copyWith(isSelected: true);
      }
      return e;
    }).toList();
  }
}

final selectedProvider = StateProvider<String>((ref) {
  return '';
});
