import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

import '../../../core/constants/app_constants.dart';
import '../model/route_model.dart';

class DirectionsRepository {
  Future<RouteModel> getRoute({
    required Position origin,
    required Position destination,
    required String originName,
    required String destinationName,
  }) async {
    final uri = Uri.parse(
      '${AppConstants.directionsBaseUrl}'
      '/${origin.lng},${origin.lat}'
      ';${destination.lng},${destination.lat}'
      '?geometries=geojson'
      '&overview=full'
      '&access_token=${AppConstants.mapboxToken}',
    );

    final response = await http.get(uri);

    if (response.statusCode != 200) {
      throw Exception('Directions API error: ${response.statusCode}');
    }

    final data = jsonDecode(response.body) as Map<String, dynamic>;
    final routes = data['routes'] as List;

    if (routes.isEmpty) throw Exception('No route found');

    final route = routes[0];
    final coords = route['geometry']['coordinates'] as List;
    final points = coords
        .map(
          (c) => Position((c[0] as num).toDouble(), (c[1] as num).toDouble()),
        )
        .toList();

    return RouteModel(
      points: points,
      originName: originName,
      destinationName: destinationName,
      durationSeconds: (route['duration'] as num).toInt(),
      distanceMeters: (route['distance'] as num).toDouble(),
    );
  }
}
