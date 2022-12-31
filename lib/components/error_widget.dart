import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

import 'package:okoul/utils/extentions.dart';

class MyErrorWidget extends StatelessWidget {
  const MyErrorWidget({Key? key, this.message, this.onRefresh, this.title})
      : super(key: key);
  final String? message;
  final String? title;
  final VoidCallback? onRefresh;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset('assets/lottie/not_found.json',
              height: context.width * .4, width: context.width * .4),
          Text(
            message ?? '',
            style: TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          ),
          RawMaterialButton(
            onPressed: onRefresh,
            child: Text(
              title ?? 'Refresh',
              style: TextStyle(
                  fontSize: 24, color: Theme.of(context).primaryColor),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
