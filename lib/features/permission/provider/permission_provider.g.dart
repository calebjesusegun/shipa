// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PermissionNotifier)
final permissionProvider = PermissionNotifierProvider._();

final class PermissionNotifierProvider
    extends $NotifierProvider<PermissionNotifier, PermissionState> {
  PermissionNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'permissionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$permissionNotifierHash();

  @$internal
  @override
  PermissionNotifier create() => PermissionNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PermissionState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PermissionState>(value),
    );
  }
}

String _$permissionNotifierHash() =>
    r'ee550f4d78727aeda825f2f2f18014990c766410';

abstract class _$PermissionNotifier extends $Notifier<PermissionState> {
  PermissionState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<PermissionState, PermissionState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PermissionState, PermissionState>,
              PermissionState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
