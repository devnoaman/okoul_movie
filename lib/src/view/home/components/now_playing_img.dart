import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:okoul/constants/api.dart';
import 'package:okoul/src/view/home/models/trending/trending_model.dart';

class DestinationItem extends StatelessWidget {
  final int index;
  final FilmModel details;
  final double imageWidth;
  final double imageOffset;
  final double indexFactor;

  const DestinationItem({
    Key? key,
    required this.index,
    required this.details,
    required this.imageWidth,
    required this.imageOffset,
    required this.indexFactor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: imageWidth,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          fit: StackFit.expand,
          children: [
            NowPlayImage(
              details: details,
              imageOffset: imageOffset,
              indexFactor: indexFactor,
              index: index,
            ),
            RaitingWidget(details: details),
            // FavoriteIcon(),
            TitleSection(details: details),
          ],
        ),
      ),
    );
  }
}

class RaitingWidget extends StatelessWidget {
  const RaitingWidget({
    super.key,
    required this.details,
  });

  final FilmModel details;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(32),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: Container(
              height: 48,
              color: Colors.grey.withOpacity(0.4),
              child: Padding(
                padding: const EdgeInsets.only(left: 12, right: 16),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.star,
                      color: Color(0xFFFFD600),
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(
                        details.voteAverage!.toString(),
                        style: TextStyle(
                          color: Theme.of(context).textTheme.titleLarge!.color,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NowPlayImage extends StatelessWidget {
  const NowPlayImage({
    super.key,
    required this.details,
    required this.imageOffset,
    required this.indexFactor,
    required this.index,
  });

  final FilmModel details;
  final double imageOffset;
  final double indexFactor;
  final int index;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: Api.resprcePath +
          (details.backdropPath != null
              ? details.backdropPath!
              : details.posterPath!),
      fit: BoxFit.cover,
      errorWidget: (context, url, error) => Icon(Icons.error),
      alignment: Alignment(-imageOffset + indexFactor * index, 0),
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({
    super.key,
    required this.details,
  });

  final FilmModel details;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: Container(
              height: 90,
              color: Colors.grey.withOpacity(0.4),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    // Icon(
                    //   Icons.movie,
                    //   color: Theme.of(context).textTheme.titleLarge!.color,
                    // ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            details.title!,
                            maxLines: 2,
                            style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.titleLarge!.color,
                              fontSize: 20,
                              height: 1.2,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${details.releaseDate}',
                            maxLines: 1,
                            style: TextStyle(
                              color: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .color!
                                  .withOpacity(0.8),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(32),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: Container(
              width: 48,
              height: 48,
              color: Colors.red.withOpacity(0.4),
              child: Icon(
                Icons.favorite,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
