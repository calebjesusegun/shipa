import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../core/constants/app_constants.dart';
import '../model/location_data.dart';

class GeocodingRepository {
  Future<List<LocationData>> search(String query) async {
    if (query.trim().isEmpty) return [];

    final uri = Uri.parse(
      '${AppConstants.geocodingBaseUrl}'
      '/${Uri.encodeComponent(query)}.json'
      '?country=ng&bbox=3.1000,6.4000,3.7000,6.7000'
      '&access_token=${AppConstants.mapboxToken}'
      '&autocomplete=true'
      '&limit=5',
    );

    final response = await http.get(uri);

    if (response.statusCode != 200) return [];

    final data = jsonDecode(response.body) as Map<String, dynamic>;
    final features = data['features'] as List;

    return features.map((f) {
      final coords = f['geometry']['coordinates'] as List;
      return LocationData(
        id: f['id'] as String,
        placeName: f['place_name'] as String,
        longitude: (coords[0] as num).toDouble(),
        latitude: (coords[1] as num).toDouble(),
      );
    }).toList();
  }
}
