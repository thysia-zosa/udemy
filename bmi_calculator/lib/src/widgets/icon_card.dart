import 'package:bmi_calculator/src/consts.dart';
import 'package:flutter/material.dart';

const double _iconSize = 80.0;
const double _distance = 15.0;

class IconCard extends StatelessWidget {
  const IconCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Icon(
            icon,
            size: _iconSize,
          ),
          SizedBox(
            height: _distance,
          ),
          Text(
            text,
            style: Texts.label,
          ),
        ],
      ),
    );
  }
}
