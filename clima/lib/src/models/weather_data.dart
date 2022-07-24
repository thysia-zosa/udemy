class WeatherData {
  final String _temperature;
  final String _symbol;
  final String _condition;

  WeatherData({
    required String temperature,
    required String symbol,
    required String condition,
  })  : _temperature = temperature,
        _symbol = symbol,
        _condition = condition;

  String get temperature => _temperature;
  String get symbol => _symbol;
  String get condition => _condition;
}
