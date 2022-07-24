import 'package:flutter/material.dart';

import '../interfaces/backend.dart';
import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Backend backend = Backend();

  @override
  void initState() async {
    super.initState();
    backend.getWeatherData().then((weatherData) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return LocationScreen(
              weatherData: weatherData,
            );
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
