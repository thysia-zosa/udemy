import 'package:bmi_calculator/src/consts.dart';
import 'package:flutter/material.dart';

class BmiCard extends StatelessWidget {
  const BmiCard({
    Key? key,
    this.child,
    this.onPressed,
    this.color = Cols.lightPurple,
    this.flex = 1,
    this.horizontalPadding,
  }) : super(key: key);

  final Widget? child;
  final Color color;
  final VoidCallback? onPressed;
  final int flex;
  final double? horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: horizontalPadding != null
              ? EdgeInsets.symmetric(horizontal: horizontalPadding!)
              : null,
          margin: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: color,
          ),
          child: child,
        ),
      ),
    );
  }
}
