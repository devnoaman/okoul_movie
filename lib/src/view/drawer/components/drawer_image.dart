import 'package:flutter/material.dart';

class DrawerImage extends StatelessWidget {
  const DrawerImage({
    Key? key,
    this.size,
    this.radius,
    this.image,
    this.spacing,
    this.borderWidth,
  }) : super(key: key);
  final Size? size;
  final double? radius;
  final double? spacing;
  final double? borderWidth;

  final ImageProvider? image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      // clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          width: size == null ? 150 : size!.width,
          height: size == null ? 150 : size!.height,
          //
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                  radius == null ? 150 : radius!.toDouble())),
        ),
        ImageBordered(
            size: size,
            spacing: spacing,
            radius: radius,
            borderWidth: borderWidth),
      ],
    );
  }
}

class ImageBordered extends StatelessWidget {
  const ImageBordered({
    super.key,
    required this.size,
    required this.spacing,
    this.count,
    this.borderWidth,
    required this.radius,
  });

  final Size? size;
  final double? spacing;
  final double? radius;
  final double? borderWidth;
  final int? count;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: List.generate(
        count ?? 3,
        (index) => Container(
          width: size == null
              ? spacing == null
                  ? 160 + (16 * (index + 1))
                  : 160 + (spacing! * (index + 1))
              : size!.width,
          height: size == null
              ? spacing == null
                  ? 160 + (16 * (index + 1))
                  : 160 + (spacing! * (index + 1))
              : size!.height,
          //
          decoration: BoxDecoration(
            // color: Colors.white,
            border: Border.all(
              width: borderWidth ?? 4,
              color: Colors.white.withOpacity((5 - (index + 1)) / 10),
            ),
            borderRadius: BorderRadius.circular(
              radius == null ? 150 : radius!.toDouble(),
            ),
          ),
        ),
      ),
    );
  }
}
