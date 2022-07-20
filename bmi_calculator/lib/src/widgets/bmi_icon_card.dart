import 'package:bmi_calculator/src/consts.dart';
import 'package:flutter/material.dart';

const double _iconSize = 60.0;
const double _distance = 15.0;

class IconCard extends StatelessWidget {
  const IconCard({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: _iconSize,
        ),
        const SizedBox(
          height: _distance,
        ),
        Text(
          text,
          style: Texts.label,
        ),
      ],
    );
  }
}
