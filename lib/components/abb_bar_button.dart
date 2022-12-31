import 'package:flutter/material.dart';

class AppBarButton extends StatelessWidget {
  const AppBarButton({Key? key, this.onPressed, this.child, this.tag})
      : super(key: key);
  final VoidCallback? onPressed;
  final Widget? child;
  final Object? tag;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: RawMaterialButton(
        constraints: const BoxConstraints(minWidth: 45.0, minHeight: 45.0),
        onPressed: onPressed,
        child: Hero(
          tag: tag!,
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(16)),
            width: 55,
            height: 55,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
