import 'package:clima/src/models/weather_data.dart';
import 'package:flutter/material.dart';
import '../utilities/consts.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherData _weatherData = WeatherData(
    temperature: '32°',
    symbol: '☀️',
    description: "It's 🍦 time in San Francisco!",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ClimaLits.locationBG),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.8),
              BlendMode.dstATop,
            ),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.near_me,
                  size: 50.0,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.location_city,
                  size: 50.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
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
                padding: EdgeInsets.only(
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
}
