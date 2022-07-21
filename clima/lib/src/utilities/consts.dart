import 'package:flutter/material.dart';

abstract class ClimaLits {
  static const String _spartanFont = 'Spartan';
  static const String locationBG = 'assets/images/location_background.jpg';
  static const String cityBG = 'assets/images/city_background.jpg';
}

abstract class ClimaTStyle {
  static const temp = TextStyle(
    fontFamily: ClimaLits._spartanFont,
    fontSize: 100.0,
  );
  static const message = TextStyle(
    fontFamily: ClimaLits._spartanFont,
    fontSize: 60.0,
  );
  static const button = TextStyle(
    fontFamily: ClimaLits._spartanFont,
    fontSize: 30.0,
  );
  static const condition = TextStyle(
    fontSize: 100.0,
  );
}
