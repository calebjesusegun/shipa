// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LocationData _$LocationDataFromJson(Map<String, dynamic> json) =>
    _LocationData(
      id: json['id'] as String,
      placeName: json['placeName'] as String,
      longitude: (json['longitude'] as num).toDouble(),
      latitude: (json['latitude'] as num).toDouble(),
    );

Map<String, dynamic> _$LocationDataToJson(_LocationData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'placeName': instance.placeName,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
    };
