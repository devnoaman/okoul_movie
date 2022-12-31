import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:okoul/constants/api.dart';
import 'package:okoul/src/view/film/providers/film_reviews.dart';
import 'package:okoul/utils/extentions.dart';

class ReviewsWidget extends ConsumerWidget {
  const ReviewsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(reviewsProvider);
    return state.maybeWhen(
        error: (err, stackTrace) => Text(err),
        loaded: (data) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Reviews',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                  ),
                  ListView.separated(
                      padding: 0.0.allpd,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => SizedBox(
                            height: 150,
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 65 / 2,
                                  left: 65 / 2,
                                  child: Container(
                                    width: (context.width - (65 / 2) - 32),
                                    height: 150 - (65 / 2),
                                    decoration: BoxDecoration(
                                      borderRadius: 12.0.cRadius,
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                    ),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(left: 65 / 2 + 8),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                  '@${data[index].authorDetails!.username!}'),
                                              RatingBar.builder(
                                                initialRating: data[index]
                                                            .authorDetails!
                                                            .rating ==
                                                        null
                                                    ? 0
                                                    : data[index]
                                                            .authorDetails!
                                                            .rating! /
                                                        2,
                                                maxRating: 5,
                                                minRating: 1,
                                                ignoreGestures: true,
                                                itemSize: 24,
                                                direction: Axis.horizontal,
                                                allowHalfRating: true,
                                                itemCount: 5,
                                                itemPadding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 2.0),
                                                itemBuilder: (context, index) =>
                                                    Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                  size: 12,
                                                ),
                                                onRatingUpdate: (rating) {
                                                  // print(rating);
                                                },
                                              )
                                            ],
                                          ),
                                          Divider(),

                                          Text(
                                            data[index].content!,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),

                                          // ExpansionPanelList(
                                          //   children: [

                                          //   ],
                                          //   // child: Text(
                                          //   //   data[index].content!,
                                          //   //   maxLines: 2,
                                          //   // ),
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  left: 0,
                                  child:
                                      data[index].authorDetails!.avatarPath ==
                                              null
                                          ? Container(
                                              width: 65,
                                              height: 65,
                                              decoration: BoxDecoration(
                                                  borderRadius: 65.0.cRadius,
                                                  color: Theme.of(context)
                                                      .primaryColor),
                                              child: Center(
                                                child: Text(data[index]
                                                    .authorDetails!
                                                    .username![0]),
                                              ),
                                            )
                                          : Container(
                                              width: 65,
                                              height: 65,
                                              decoration: BoxDecoration(
                                                  borderRadius: 65.0.cRadius,
                                                  color: Theme.of(context)
                                                      .primaryColor
                                                      .withOpacity(.3)),
                                              child: ClipRRect(
                                                borderRadius: 65.0.cRadius,
                                                child: CachedNetworkImage(
                                                    width: 65,
                                                    height: 65,
                                                    fit: BoxFit.cover,
                                                    imageUrl: pathTo(data[index]
                                                        .authorDetails!
                                                        .avatarPath!)),
                                              ),
                                            ),
                                ),
                              ],
                            ),
                          ),
                      separatorBuilder: (context, index) => SizedBox(
                            height: 16,
                          ),
                      itemCount: data.length)
                ],
              ),
            ),
        orElse: () => SizedBox());
  }

  pathTo(String s) {
    var path =
        s.startsWith('/http') ? s.substring(1, s.length) : Api.resprcePath + s;
    return path;
  }
}
