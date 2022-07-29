import 'package:flutter/material.dart';

class HeroIcon extends StatelessWidget {
  const HeroIcon({
    Key? key,
    required this.height,
  }) : super(key: key);

  final String tag = 'heroIcon';
  final double height;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: SizedBox(
        height: height,
        child: Image.asset('images/logo.png'),
      ),
    );
  }
}
