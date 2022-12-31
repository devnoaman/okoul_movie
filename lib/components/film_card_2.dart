import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:okoul/constants/api.dart';
import 'package:okoul/services/database/favorites/models/favorite_model.dart';
import 'package:okoul/utils/extentions.dart';

class FilmCard extends StatelessWidget {
  const FilmCard(
      {super.key, this.onClick, required this.model, required this.index});
  final VoidCallback? onClick;
  final FavoriteModel model;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: SizedBox(
        height: context.height * .2,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 24,
              child: Container(
                  width: context.width * .9,
                  height: context.height * .18,
                  padding: EdgeInsets.only(left: context.height * .17),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Theme.of(context).canvasColor),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.name!,
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        model.release!,
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        model.rate!.toString(),
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: model.img == null
                    ? Container(
                        width: context.height * .18,
                        height: context.height * .18,
                        child: Center(
                          child: Text(
                            model.name![0],
                            style: TextStyle(fontSize: 55),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColorDark,
                            borderRadius: 12.0.cRadius),
                      )
                    : CachedNetworkImage(
                        fit: BoxFit.cover,
                        width: context.height * .18,
                        height: context.height * .18,
                        imageUrl: '${Api.resprcePath}${model.img}',
                      ),
              ),
            ),
          ],
        ),
      ).animate().slide(
            delay: (80 * index).ms,
            begin: const Offset(-1, 0),
            end: const Offset(0, 0),
          ),
    );
  }
}
