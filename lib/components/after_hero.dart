import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_animate/extensions/extensions.dart';

class AfterHero extends StatefulWidget {
  const AfterHero({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  State<AfterHero> createState() => _AfterHeroState();
}

class _AfterHeroState extends State<AfterHero> {
  bool animate = false;
  tgl() {
    setState(() {
      animate = true;
    });
  }

  @override
  void initState() {
    if (mounted) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await Future.delayed(300.ms, () {}).whenComplete(() => null);

        if (mounted) tgl();
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: !animate ? SizedBox() : widget.child,
    );
  }
}
