import 'package:flutter/material.dart';
import 'package:okoul/components/shimmer.dart';
import 'package:okoul/utils/extentions.dart';

class ShimmerCasts extends StatelessWidget {
  const ShimmerCasts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShimmerWrapper(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 64,
                height: 24,
                color: Colors.grey,
              ),
              Container(
                width: 64,
                height: 24,
                color: Colors.grey,
              )
            ],
          ),
          SizedBox(
            height: 16,
          ),
          SizedBox(
            height: context.height * .3,
            width: context.width,
            child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    height: context.height * .3,
                    width: context.width * .4,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(12)),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 16,
                  );
                },
                itemCount: 5),
          ),
        ],
      ),
    );
  }
}
