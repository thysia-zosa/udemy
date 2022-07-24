import 'dart:io';

import 'package:clima/src/models/request_items.dart';
import 'package:clima/src/utilities/consts.dart';
import 'package:http/http.dart' as http;

import '../models/location.dart';

class WeatherService {
  Future<String> _sendRequest(Map<String, dynamic> options) async {
    http.Response response = await http.get(
      Uri.https(
        ClimaLits.url,
        ClimaLits.path,
        options,
      ),
    );
    if (response.statusCode != HttpStatus.ok) {
      throw const HttpException('Data could not be fetched.');
    }

    return response.body;
  }

  Future<String> getByCityName(String city) async => _sendRequest(
        RequestItems(
          q: city,
        ).toJson(),
      );

  Future<String> getByLocation(Location location) async => _sendRequest(
        RequestItems(
          lat: location.latitude.toString(),
          lon: location.longitude.toString(),
        ).toJson(),
      );
}
