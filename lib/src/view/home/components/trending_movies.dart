import 'package:flutter/material.dart';
import 'package:okoul/utils/extentions.dart';

class TrendingMovie extends StatelessWidget {
  const TrendingMovie({
    Key? key,
    this.child,
  }) : super(key: key);
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * .5,
      width: context.width,
      child: ShaderMask(
        blendMode: BlendMode.dstOut,
        shaderCallback: (bounds) {
          return LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.decal,
              stops: const [
                0,
                0.80,
                0.67,
                0.5,
                6
              ],
              colors: [
                Theme.of(context).canvasColor,
                Colors.transparent,
                Colors.transparent,
                Colors.transparent,
                // Colors.transparent,
                Theme.of(context).canvasColor,
              ]).createShader(bounds);
        },
        child: Container(
          // color: Colors.amber,
          height: context.height * .45,
          child: child,
        ),
      ),
    );
  }
}
