import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:okoul/router/route_helper.dart';
import 'package:okoul/utils/extentions.dart';

import '../models/trending/trending_model.dart';

class ImageCard extends StatefulWidget {
  const ImageCard({
    Key? key,
    required this.img,
    required this.tag,
    required this.film,
    required this.onTap,
    this.relativePosition = 0.0,
  }) : super(key: key);
  final String img;
  final Object tag;
  final FilmModel film;
  final VoidCallback onTap;
  final double relativePosition;

  @override
  State<ImageCard> createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {
  var relativePosition = 0.5;
  RenderBox? renderObject;
  @override
  void initState() {
    findRender();

    super.initState();
  }

  findRender() async {
    WidgetsBinding.instance.addPostFrameCallback((t) {
      Future.delayed(0.0.ms, () {
        renderObject = context.findRenderObject() as RenderBox;
        final offsetX = renderObject!.localToGlobal(Offset.zero).dx;
        final deviceWidth = context.width;
        relativePosition = offsetX / deviceWidth;
      });
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    print(relativePosition);
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: widget.onTap,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: context.width * .5,
            height: context.height,
            child: Stack(
              children: [
                Positioned.fill(
                  top: 0,
                  left: widget.relativePosition * .2,
                  child: Container(
                    width: context.width,
                    height: context.width * 2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: NetworkImage(widget.img),
                        fit: BoxFit.cover,
                        alignment: Alignment(relativePosition * .2, 0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
