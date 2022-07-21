import 'package:flutter/material.dart';

const String _spartanFont = 'Spartan';

abstract class ClimaTStyle {
  static const temp = TextStyle(
    fontFamily: _spartanFont,
    fontSize: 100.0,
  );
  static const message = TextStyle(
    fontFamily: _spartanFont,
    fontSize: 60.0,
  );
  static const button = TextStyle(
    fontFamily: _spartanFont,
    fontSize: 30.0,
  );
  static const condition = TextStyle(
    fontSize: 100.0,
  );
}
