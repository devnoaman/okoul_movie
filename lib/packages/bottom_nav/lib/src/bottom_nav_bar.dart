import 'package:flutter/material.dart';

import '../bottom_nav.dart';

class BottomNavyBar extends StatefulWidget {
  BottomNavyBar({
    Key? key,
    required this.items,
    this.onItemSelected,
    this.color,
    int? selecetedIndex,
  }) : super(key: key) {
    _selecetedItem = selecetedIndex ?? 0;
  }
  final List<BottomNavyModel> items;
  final Function(int)? onItemSelected;
  final Color? color;
  int? _selecetedItem;

  @override
  State<BottomNavyBar> createState() => _BottomNavyBarState();
}

class _BottomNavyBarState extends State<BottomNavyBar> {
  @override
  Widget build(BuildContext context) {
    onItemSelect(int i) {
      setState(() {
        widget._selecetedItem = i;
      });
    }

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(
            12,
          ),
          topRight: Radius.circular(
            12,
          ),
        ),
      ),

      width: double.infinity,
      // height: 55,
      color: widget.color,
      child: SafeArea(
          child: SizedBox(
        height: 55,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ...widget.items
                .map(
                  (e) => RawMaterialButton(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(0.0),
                    // color: widget.selecetedItem == widget.items.indexOf(e)
                    //     ? Colors.red
                    //     : null,
                    onPressed: () async {
                      await onItemSelect(widget.items.indexOf(e));
                      widget.onItemSelected!(
                        widget.items.indexOf(e),
                      );
                      print(widget._selecetedItem);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: widget._selecetedItem == widget.items.indexOf(e)
                            ? Theme.of(context).primaryColor.withOpacity(.3)
                            : null,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 6),
                        child: e.icon,
                      ),
                    ),
                  ),
                )
                .toList()
          ],
        ),
        // height: MediaQuery.of(context). ,
      )),
    );
  }
}
