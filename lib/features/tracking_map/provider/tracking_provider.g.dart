// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracking_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TrackingNotifier)
final trackingProvider = TrackingNotifierProvider._();

final class TrackingNotifierProvider
    extends $NotifierProvider<TrackingNotifier, RouteState> {
  TrackingNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'trackingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$trackingNotifierHash();

  @$internal
  @override
  TrackingNotifier create() => TrackingNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RouteState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RouteState>(value),
    );
  }
}

String _$trackingNotifierHash() => r'c29823db175017108d435ec164d3a16fd7ed8af3';

abstract class _$TrackingNotifier extends $Notifier<RouteState> {
  RouteState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<RouteState, RouteState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<RouteState, RouteState>,
              RouteState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(DriverSegmentNotifier)
final driverSegmentProvider = DriverSegmentNotifierProvider._();

final class DriverSegmentNotifierProvider
    extends $NotifierProvider<DriverSegmentNotifier, int> {
  DriverSegmentNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'driverSegmentProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$driverSegmentNotifierHash();

  @$internal
  @override
  DriverSegmentNotifier create() => DriverSegmentNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$driverSegmentNotifierHash() =>
    r'3c135909a36b13a6be268fe083f1eb488513b3bd';

abstract class _$DriverSegmentNotifier extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
