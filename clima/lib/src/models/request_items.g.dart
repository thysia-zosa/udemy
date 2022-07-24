// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestItems _$RequestItemsFromJson(Map<String, dynamic> json) => RequestItems(
      appid: json['appid'] as String? ?? ClimaLits.apiKey,
      units: json['units'] as String? ?? ClimaLits.units,
      q: json['q'] as String?,
      lat: json['lat'] as String?,
      lon: json['lon'] as String?,
    );

Map<String, dynamic> _$RequestItemsToJson(RequestItems instance) {
  final val = <String, dynamic>{
    'appid': instance.appid,
    'units': instance.units,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('q', instance.q);
  writeNotNull('lat', instance.lat);
  writeNotNull('lon', instance.lon);
  return val;
}
