class WeatherData {
  final String _temperature;
  final String _symbol;
  final String _description;

  WeatherData({
    required String temperature,
    required String symbol,
    required String description,
  })  : _temperature = temperature,
        _symbol = symbol,
        _description = description;

  String get temperature => _temperature;
  String get symbol => _symbol;
  String get description => _description;
}
