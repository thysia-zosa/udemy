import 'package:flutter/material.dart';

import '../interfaces/backend.dart';
import '../models/weather_data.dart';
import '../utilities/consts.dart';
import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({
    Key? key,
    required this.weatherData,
  }) : super(key: key);

  final WeatherData weatherData;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  Backend backend = Backend();
  late WeatherData _weatherData;

  @override
  void initState() {
    super.initState();
    _weatherData = widget.weatherData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage(ClimaLits.locationBG),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.8),
              BlendMode.dstATop,
            ),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              IconButton(
                onPressed: _fetchData,
                icon: const Icon(
                  Icons.near_me,
                  size: 50.0,
                ),
              ),
              IconButton(
                onPressed: getCityWeather,
                icon: const Icon(
                  Icons.location_city,
                  size: 50.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    Text(
                      _weatherData.temperature,
                      style: ClimaTStyle.temp,
                    ),
                    Text(
                      _weatherData.symbol,
                      style: ClimaTStyle.condition,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 15.0,
                ),
                child: Text(
                  _weatherData.description,
                  textAlign: TextAlign.right,
                  style: ClimaTStyle.message,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getCityWeather() async {
    String? cityName = await Navigator.push(
      context,
      MaterialPageRoute<String>(
        builder: (context) => const CityScreen(),
      ),
    );
    if (cityName == null) return;
    await _fetchData(cityName);
  }

  Future<void> _fetchData([String? cityName]) async {
    WeatherData newWeatherData = await backend.getWeatherData();
    setState(() {
      _weatherData = newWeatherData;
    });
  }
}
