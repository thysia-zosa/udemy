import '../backend/geo_service.dart';
import '../backend/weather_interpretator.dart';
import '../backend/weather_service.dart';
import '../models/location.dart';
import '../models/weather_data.dart';

abstract class Backend {
  Future<WeatherData> getWeatherData([String? cityName]);

  factory Backend() => _Backend();
}

class _Backend implements Backend {
  final GeoService _geoService;
  final WeatherService _weatherService;
  final WeatherInterpretator _interpretator;

  static _Backend? _instance;

  _Backend._()
      : _geoService = GeoService(),
        _weatherService = WeatherService(),
        _interpretator = WeatherInterpretator();

  factory _Backend() => _instance ??= _Backend._();

  @override
  Future<WeatherData> getWeatherData([String? cityName]) async {
    try {
      String response;
      if (cityName != null) {
        response = await _weatherService.getByCityName(cityName);
      } else {
        Location location = await _geoService.getLocation();
        response = await _weatherService.getByLocation(location);
      }
      return _interpretator.interpretWeatherData(response);
    } catch (e, s) {
      print('error in backend:\n$e\n$s');
      return WeatherData(
        temperature: '0',
        symbol: 'Error',
        description: 'Unable to get weather data.',
      );
    }
  }
}
