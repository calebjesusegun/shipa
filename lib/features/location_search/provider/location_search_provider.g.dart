// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_search_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LocationSearchNotifier)
final locationSearchProvider = LocationSearchNotifierProvider._();

final class LocationSearchNotifierProvider
    extends $NotifierProvider<LocationSearchNotifier, SearchState> {
  LocationSearchNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'locationSearchProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$locationSearchNotifierHash();

  @$internal
  @override
  LocationSearchNotifier create() => LocationSearchNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SearchState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SearchState>(value),
    );
  }
}

String _$locationSearchNotifierHash() =>
    r'2e67d47177a15b16207e07a1b1d379b09e83700a';

abstract class _$LocationSearchNotifier extends $Notifier<SearchState> {
  SearchState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<SearchState, SearchState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SearchState, SearchState>,
              SearchState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(SelectedLocationsNotifier)
final selectedLocationsProvider = SelectedLocationsNotifierProvider._();

final class SelectedLocationsNotifierProvider
    extends $NotifierProvider<SelectedLocationsNotifier, SelectedLocations> {
  SelectedLocationsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedLocationsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedLocationsNotifierHash();

  @$internal
  @override
  SelectedLocationsNotifier create() => SelectedLocationsNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SelectedLocations value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SelectedLocations>(value),
    );
  }
}

String _$selectedLocationsNotifierHash() =>
    r'6c6771da2b41eaf6f8b462b6a136cbc8d4453e59';

abstract class _$SelectedLocationsNotifier
    extends $Notifier<SelectedLocations> {
  SelectedLocations build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<SelectedLocations, SelectedLocations>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SelectedLocations, SelectedLocations>,
              SelectedLocations,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
