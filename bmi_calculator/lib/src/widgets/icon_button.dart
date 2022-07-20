import 'package:bmi_calculator/src/consts.dart';
import 'package:flutter/material.dart';

const double _size = 56.0;

class IconButton extends StatelessWidget {
  const IconButton({
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
      onPressed: enabled ? onPressed : null,
      fillColor: enabled ? Cols.darkGrey : Cols.lightGrey,
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(
        width: _size,
        height: _size,
      ),
    );
  }
}
