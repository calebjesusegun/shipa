import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/directions_repository.dart';
import '../model/route_model.dart';

part 'tracking_provider.g.dart';

sealed class RouteState {
  const RouteState();
}

class RouteInitial extends RouteState {
  const RouteInitial();
}

class RouteLoading extends RouteState {
  const RouteLoading();
}

class RouteSuccess extends RouteState {
  final RouteModel route;
  const RouteSuccess(this.route);
}

class RouteError extends RouteState {
  final String message;
  const RouteError(this.message);
}

@riverpod
class TrackingNotifier extends _$TrackingNotifier {
  final _repo = DirectionsRepository();

  @override
  RouteState build() => const RouteInitial();

  Future<void> loadRoute({
    required Position origin,
    required Position destination,
    required String originName,
    required String destinationName,
  }) async {
    state = const RouteLoading();
    try {
      final route = await _repo.getRoute(
        origin: origin,
        destination: destination,
        originName: originName,
        destinationName: destinationName,
      );
      state = RouteSuccess(route);
    } catch (e) {
      state = RouteError(e.toString());
    }
  }
}

@riverpod
class DriverSegmentNotifier extends _$DriverSegmentNotifier {
  @override
  int build() => 0;

  void advanceSegment() => state = state + 1;
  void reset() => state = 0;
}

