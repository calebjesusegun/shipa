import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

part 'route_model.freezed.dart';

@freezed
abstract class RouteModel with _$RouteModel {
  const factory RouteModel({
    required List<Position> points,
    required String originName,
    required String destinationName,
    required int durationSeconds,
    required double distanceMeters,
  }) = _RouteModel;
}
