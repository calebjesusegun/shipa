import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:shipa/core/constants/app_colors.dart';
import 'package:shipa/core/constants/app_strings.dart';
import 'package:shipa/core/router/app_router.dart';
import 'package:shipa/features/tracking_map/entities/delivery_details.dart';
import 'package:shipa/features/tracking_map/widgets/courier_bottom_sheet.dart';
import 'package:shipa/features/tracking_map/widgets/custom_icon_button.dart';

import '../data/map_service.dart';
import '../provider/tracking_provider.dart';

class TrackingMapScreen extends ConsumerStatefulWidget {
  final Position origin;
  final Position destination;
  final String originName;
  final String destinationName;

  const TrackingMapScreen({
    super.key,
    required this.origin,
    required this.destination,
    required this.originName,
    required this.destinationName,
  });

  @override
  ConsumerState<TrackingMapScreen> createState() => _TrackingMapScreenState();
}

class _TrackingMapScreenState extends ConsumerState<TrackingMapScreen> {
  final _mapService = MapService();

  Timer? _timer;
  int _step = 0;
  double _progress = 0.0;
  static const double _stepSize = 0.05;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(trackingProvider.notifier)
          .loadRoute(
            origin: widget.origin,
            destination: widget.destination,
            originName: widget.originName,
            destinationName: widget.destinationName,
          );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _onMapCreated(MapboxMap map) async {
    await _mapService.init(map);

    ref.listenManual(trackingProvider, (_, next) async {
      if (next is RouteSuccess) await _onRouteReady(next.route.points);
    });

    final current = ref.read(trackingProvider);
    if (current is RouteSuccess) {
      await _onRouteReady(current.route.points);
    }
  }

  Future<void> _onRouteReady(List<Position> points) async {
    await _mapService.drawRoute(points);
    await _mapService.displayDriverIcon(points.first);
    await _mapService.displayDestinationIcon(
      points.last,
      widget.destinationName,
    );
    await _mapService.fitRoute(points);

    await Future.delayed(const Duration(milliseconds: 900));
    _startSimulation(points);
  }

  void _startSimulation(List<Position> points) {
    _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) async {
      if (_step >= points.length - 1) {
        timer.cancel();
        ref.read(driverSegmentProvider.notifier).advanceSegment();
        return;
      }

      _progress += _stepSize;

      if (_progress >= 1.0) {
        _progress = 0.0;
        _step++;
        if (_step >= points.length - 1) return;
        ref.read(driverSegmentProvider.notifier).advanceSegment();
      }

      final segStart = points[_step];
      final segEnd = points[(_step + 1).clamp(0, points.length - 1)];

      final pos = lerpPosition(segStart, segEnd, _progress);
      final bearing = calcBearing(segStart, segEnd);

      await _mapService.moveDriver(pos);
      await _mapService.updateTraveledTrail([
        ...points.sublist(0, _step + 1),
        pos,
      ]);
      await _mapService.followDriver(pos, bearing);
    });
  }

  @override
  Widget build(BuildContext context) {
    final routeState = ref.watch(trackingProvider);

    return Scaffold(
      body: Stack(
        children: [
          MapWidget(
            key: const ValueKey('trackingMap'),
            styleUri: MapboxStyles.MAPBOX_STREETS,
            viewport: CameraViewportState(
              center: Point(coordinates: widget.origin),
              zoom: 12.0,
            ),
            onMapCreated: _onMapCreated,
          ),

          if (routeState is RouteLoading)
            const ColoredBox(
              color: AppColors.neutral500,
              child: Center(
                child: CircularProgressIndicator(color: AppColors.primary300),
              ),
            ),

          if (routeState is RouteError)
            Positioned(
              top: 100,
              left: 20,
              right: 20,
              child: Material(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.errorLight,
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Text(
                    (routeState).message,
                    style: const TextStyle(color: AppColors.error),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  CustomIconButton(
                    onTap: () => context.go(AppRoutes.locationSearch),
                    icon: Icons.arrow_back_ios_new_rounded,
                  ),
                  const Spacer(),
                  Text(
                    AppStrings.trackingScreenTitle,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                  ),
                  const Spacer(),
                  CustomIconButton(
                    icon: Icons.my_location_rounded,
                    onTap: () {
                      final s = ref.read(trackingProvider);
                      if (s is RouteSuccess) {
                        _mapService.fitRoute(s.route.points);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: CourierBottomSheet(details: DeliveryDetails.testData()),
          ),
        ],
      ),
    );
  }
}
