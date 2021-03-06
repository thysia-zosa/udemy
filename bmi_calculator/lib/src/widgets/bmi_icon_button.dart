import 'package:bmi_calculator/src/consts.dart';
import 'package:flutter/material.dart';

const double _size = 45.0;

class BmiIconButton extends StatelessWidget {
  const BmiIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    required this.enabled,
  }) : super(key: key);

  final bool enabled;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 10.0,
      onPressed: enabled ? onPressed : null,
      fillColor: enabled ? Cols.darkGrey : Cols.lightGrey,
      constraints: const BoxConstraints.tightFor(
        width: _size,
        height: _size,
      ),
      shape: const CircleBorder(),
      child: Icon(icon),
    );
  }
}
