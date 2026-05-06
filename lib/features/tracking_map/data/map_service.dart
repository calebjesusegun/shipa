import 'dart:math';
import 'package:flutter/services.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:shipa/core/constants/app_colors.dart';

class MapService {
  MapboxMap? _map;
  PointAnnotationManager? _pointManager;
  PolylineAnnotationManager? _polylineManager;

  PointAnnotation? _driverAnnotation;
  PolylineAnnotation? _traveledAnnotation;

  Future<void> init(MapboxMap map) async {
    _map = map;

    await map.compass.updateSettings(CompassSettings(enabled: false));
    await map.scaleBar.updateSettings(ScaleBarSettings(enabled: false));

    _polylineManager = await map.annotations.createPolylineAnnotationManager();
    _pointManager = await map.annotations.createPointAnnotationManager();
  }

  Future<void> drawRoute(List<Position> points) async {
    await _polylineManager!.create(
      PolylineAnnotationOptions(
        geometry: LineString(coordinates: points),
        lineColor: AppColors.primary300.toARGB32(),
        lineWidth: 10.0,
        lineOpacity: 1.0,
        lineJoin: LineJoin.ROUND,
      ),
    );
  }

  Future<Uint8List?> _loadAsset(String path) async {
    try {
      final data = await rootBundle.load(path);
      return data.buffer.asUint8List();
    } catch (_) {
      return null;
    }
  }

  Future<void> displayDriverIcon(Position position) async {
    final Uint8List? bytes = await _loadAsset('assets/png/driver.png');

    _driverAnnotation = await _pointManager!.create(
      PointAnnotationOptions(
        geometry: Point(coordinates: position),
        image: bytes,
        iconSize: 2,
        iconAnchor: IconAnchor.CENTER,
      ),
    );
  }

  Future<void> displayDestinationIcon(Position position, String label) async {
    final Uint8List? bytes = await _loadAsset('assets/png/destination.png');

    await _pointManager!.create(
      PointAnnotationOptions(
        geometry: Point(coordinates: position),
        image: bytes,
        iconSize: 3.5,
        iconAnchor: IconAnchor.TOP,
        textField: label,
        textSize: 12.0,
        textOffset: [0.0, 1.5],
        textColor: AppColors.neutral500.toARGB32(),
        textHaloColor: AppColors.neutralWhite.toARGB32(),
        textHaloWidth: 1.0,
      ),
    );
  }

  Future<void> moveDriver(Position position) async {
    if (_driverAnnotation == null) return;
    _driverAnnotation!.geometry = Point(coordinates: position);
    await _pointManager!.update(_driverAnnotation!);
  }

  Future<void> updateTraveledTrail(List<Position> traveled) async {
    if (_polylineManager == null) return;

    if (_traveledAnnotation == null) {
      _traveledAnnotation = await _polylineManager!.create(
        PolylineAnnotationOptions(
          geometry: LineString(coordinates: traveled),
          lineColor: AppColors.neutral100.toARGB32(),
          lineWidth: 5.0,
        ),
      );
    } else {
      _traveledAnnotation!.geometry = LineString(coordinates: traveled);
      await _polylineManager!.update(_traveledAnnotation!);
    }
  }

  Future<void> followDriver(Position position, double bearing) async {
    await _map?.flyTo(
      CameraOptions(
        center: Point(coordinates: position),
        zoom: 15.5,
        bearing: bearing,
        pitch: 50,
      ),
      MapAnimationOptions(duration: 300, startDelay: 0),
    );
  }

  Future<void> fitRoute(List<Position> points) async {
    if (points.isEmpty) return;

    var minLng = points.first.lng.toDouble();
    var maxLng = points.first.lng.toDouble();
    var minLat = points.first.lat.toDouble();
    var maxLat = points.first.lat.toDouble();

    for (final p in points) {
      final lng = p.lng.toDouble();
      final lat = p.lat.toDouble();
      if (lng < minLng) minLng = lng;
      if (lng > maxLng) maxLng = lng;
      if (lat < minLat) minLat = lat;
      if (lat > maxLat) maxLat = lat;
    }

    await _map?.flyTo(
      CameraOptions(
        center: Point(
          coordinates: Position((minLng + maxLng) / 2, (minLat + maxLat) / 2),
        ),
        zoom: 10,
        pitch: 0,
        bearing: 0,
        padding: MbxEdgeInsets(top: 80, left: 50, bottom: 280, right: 50),
      ),
      MapAnimationOptions(duration: 1000),
    );
  }
}

double calcBearing(Position from, Position to) {
  final lat1 = from.lat.toDouble() * pi / 180;
  final lat2 = to.lat.toDouble() * pi / 180;
  final dLon = (to.lng.toDouble() - from.lng.toDouble()) * pi / 180;
  final y = sin(dLon) * cos(lat2);
  final x = cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(dLon);
  return (atan2(y, x) * 180 / pi + 360) % 360;
}

Position lerpPosition(Position a, Position b, double t) => Position(
  a.lng.toDouble() + (b.lng.toDouble() - a.lng.toDouble()) * t,
  a.lat.toDouble() + (b.lat.toDouble() - a.lat.toDouble()) * t,
);

double lerpBearing(double from, double to, double t) {
  double diff = to - from;
  if (diff > 180) diff -= 360;
  if (diff < -180) diff += 360;
  return (from + diff * t + 360) % 360;
}
