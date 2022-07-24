import 'dart:convert';

import '../models/weather_data.dart';

class WeatherInterpretator {
  final List<_DescItem> _symbols = [
    _DescItem(300, '🌩'),
    _DescItem(400, '🌧'),
    _DescItem(600, '☔️'),
    _DescItem(700, '☃️'),
    _DescItem(800, '🌫'),
    _DescItem(801, '☀️'),
    _DescItem(805, '☁️'),
    _DescItem(1000, '🤷‍'),
  ];

  final List<_DescItem> _temps = [
    _DescItem(25, "It's 🍦 time"),
    _DescItem(20, 'Time for shorts and 👕'),
    _DescItem(10, 'Bring a 🧥 just in case'),
    _DescItem(-100, "You'll need 🧣 and 🧤"),
  ];

  String _getSymbol(int conditionStatus) {
    return _symbols
        .firstWhere((element) => conditionStatus < element.statusCode)
        .description;
  }

  String _getDescription(
    double temperature,
    String cityName,
  ) {
    String interpretation = _temps
        .firstWhere((element) => temperature > element.statusCode)
        .description;
    return '$interpretation in $cityName';
  }

  WeatherData interpretWeatherData(String apiResponse) {
    Map<String, dynamic> apiData = json.decode(apiResponse);
    double temperature = apiData['main']['temp'];
    return WeatherData(
      temperature: temperature.toStringAsFixed(1),
      symbol: _getSymbol(
        apiData['weather'].first['id'],
      ),
      description: _getDescription(
        temperature,
        apiData['name'],
      ),
    );
  }
}

class _DescItem {
  final int statusCode;
  final String description;

  _DescItem(
    this.statusCode,
    this.description,
  );
}
