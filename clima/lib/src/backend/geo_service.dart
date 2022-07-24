import 'package:geolocator/geolocator.dart';

import '../models/location.dart';

class GeoService {
  Future<Position> _getPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return Future.error('Location services are disabled.');

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied and cannot be requested.');
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<Location> getLocation() async {
    Position position = await _getPosition();
    return Location(
      latitude: position.accuracy,
      longitude: position.longitude,
    );
  }
}
