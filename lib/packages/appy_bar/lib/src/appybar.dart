import 'package:flutter/material.dart';

class AppyBar extends StatelessWidget {
  const AppyBar({
    Key? key,
    this.leading,
    this.trealing,
    this.title,
    required this.size,
    this.onLeadingClick,
    this.onTrealingClick,
  }) : super(key: key);

  final Widget? leading;
  final Widget? trealing;
  final Widget? title;
  final double? size;
  final VoidCallback? onLeadingClick;
  final VoidCallback? onTrealingClick;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: size,
        // color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(onTap: () => onLeadingClick, child: leading!),
            GestureDetector(onTap: () => onLeadingClick, child: title!),
            GestureDetector(onTap: () => onLeadingClick, child: trealing!),
          ],
        ),
      ),
    );
  }
}
