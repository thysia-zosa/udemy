import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// colors
abstract class Cols {
  /// primary, scaffold background
  static const Color darkPurple = Color(0xff0a0e21);

  /// inactive Card
  static const Color purple = Color(0xff111328);

  /// active Card
  static const Color lightPurple = Color(0xff1d1e33);

  /// bottom container, slider thumb
  static const Color red = Color(0xffeb1555);

  /// inactive slider
  static const Color lightGrey = Color(0xff8d8e98);

  /// active slider
  static const Color white = Color(0xffffffff);

  /// overlay slider
  static const Color wine = Color(0x29eb1555);

  /// icon button fill
  static const Color darkGrey = Color(0xff4c4f5e);

  /// result
  static const Color green = Color(0xff24d876);
}

abstract class Texts {
  static const label = TextStyle(
    fontSize: 16.0,
    color: Cols.lightGrey,
  );

  /// number, title
  static const big = TextStyle(
    fontSize: 40.0,
    fontWeight: FontWeight.bold,
  );

  /// large button
  static const button = TextStyle(
    fontSize: 25.0,
    fontWeight: FontWeight.bold,
  );
  static const result = TextStyle(
    fontSize: 22.0,
    fontWeight: FontWeight.bold,
    color: Cols.green,
  );
  static const body = TextStyle(
    fontSize: 22.0,
  );

  /// bmi text
  static const veryBig = TextStyle(
    fontSize: 100.0,
    fontWeight: FontWeight.bold,
  );
}

abstract class Ikons {
  static const plus = FontAwesomeIcons.plus;
  static const minus = FontAwesomeIcons.minus;
  static const male = FontAwesomeIcons.mars;
  static const female = FontAwesomeIcons.venus;
}
