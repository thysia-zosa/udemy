import 'package:clima/src/utilities/consts.dart';
import 'package:json_annotation/json_annotation.dart';

part 'request_items.g.dart';

@JsonSerializable(includeIfNull: false)
class RequestItems {
  final String appid;
  final String units;
  final String? q;
  final String? lat;
  final String? lon;

  RequestItems({
    this.appid = ClimaLits.apiKey,
    this.units = ClimaLits.units,
    this.q,
    this.lat,
    this.lon,
  }) {
    if ((q != null && (lat != null || lon != null)) ||
        q == null && (lat == null || lon == null)) {
      throw ArgumentError(
          'For q and lat/lon: one must be null, the other must not be null.');
    }
  }

  factory RequestItems.fromJson(Map<String, dynamic> json) =>
      _$RequestItemsFromJson(json);

  Map<String, dynamic> toJson() => _$RequestItemsToJson(this);
}
