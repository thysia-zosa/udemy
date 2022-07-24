class Location {
  final double _latitude;
  final double _longitude;

  Location({
    required double latitude,
    required double longitude,
  })  : _latitude = latitude,
        _longitude = longitude;

  double get latitude => _latitude;
  double get longitude => _longitude;
}
