import 'package:flutter/material.dart';

/// colors
abstract class Cols {
  static const Color darkPurple = Color(0xff0a0e21);
  static const Color purple = Color(0xff111328);
  static const Color lightPurple = Color(0xff1d1e33);
  static const Color red = Color(0xffeb1555);
  static const Color lightGrey = Color(0xff8d8e98);
  static const Color white = Color(0xffffffff);
  static const Color wine = Color(0x29eb1555);
  static const Color darkGrey = Color(0xff4c4f5e);
}

abstract class Texts {
  static const label = TextStyle(
    fontSize: 18.0,
    color: Cols.purple,
  );
  static const big = TextStyle(
    fontSize: 50.0,
    fontWeight: FontWeight.bold,
  );
  static const button = TextStyle(
    fontSize: 25.0,
    fontWeight: FontWeight.bold,
  );
  static const result = TextStyle(
    fontSize: 22.0,
    fontWeight: FontWeight.bold,
    color: Cols.purple,
  );
  static const body = TextStyle(
    fontSize: 22.0,
  );
  static const veryBig = TextStyle(
    fontSize: 100.0,
    fontWeight: FontWeight.bold,
  );
}
