import 'package:bmi_calculator/src/consts.dart';
import 'package:flutter/material.dart';

const _height = 80.0;
const _marginTop = 10.0;
const _paddingBottom = 20.0;

class BmiBottomButton extends StatelessWidget {
  const BmiBottomButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(
          top: _marginTop,
        ),
        width: double.infinity,
        color: Cols.red,
        height: _height,
        padding: EdgeInsets.only(
          bottom: _paddingBottom,
        ),
        child: Center(
          child: Text(
            text,
            style: Texts.button,
          ),
        ),
      ),
      onTap: onPressed,
    );
  }
}
