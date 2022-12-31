import 'package:flutter/gestures.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

import 'package:okoul/src/view/film/models/movie_model/genre.dart';

class GeneresTitles extends StatelessWidget {
  const GeneresTitles({
    Key? key,
    this.genres,
  }) : super(key: key);
  final List<Genre>? genres;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: Center(
        child: ListView.separated(
            dragStartBehavior: DragStartBehavior.down,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Text(
                  genres![index].name!,
                  style: TextStyle(fontSize: 22),
                ),
            separatorBuilder: (context, index) => const Text(
                  ' | ',
                  style: TextStyle(fontSize: 22),
                ),
            itemCount: genres!.length),
      ),
    );
  }
}
