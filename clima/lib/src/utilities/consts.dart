import 'package:flutter/material.dart';

abstract class ClimaLits {
  static const String _spartanFont = 'Spartan';
  static const String locationBG = 'assets/images/location_background.jpg';
  static const String cityBG = 'assets/images/city_background.jpg';
  static const String url = 'api.openweathermap.org';
  static const String path = '/data/2.5/weather';
  static const String units = 'metric';
  static const String apiKey = '41424e6874a9bdc5039cc4c3cc6f0beb';
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
