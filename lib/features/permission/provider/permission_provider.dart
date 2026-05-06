import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/permission_repository.dart';

part 'permission_provider.g.dart';

sealed class PermissionState {
  const PermissionState();
}

class PermissionInitial extends PermissionState {
  const PermissionInitial();
}

class PermissionGranted extends PermissionState {
  const PermissionGranted();
}

class PermissionDenied extends PermissionState {
  const PermissionDenied();
}

class PermissionPermanentlyDenied extends PermissionState {
  const PermissionPermanentlyDenied();
}

@riverpod
class PermissionNotifier extends _$PermissionNotifier {
  late final _repo = PermissionRepository();

  @override
  PermissionState build() {
    _checkInitialStatus();
    return const PermissionInitial();
  }

  Future<void> _checkInitialStatus() async {
    final granted = await _repo.isLocationGranted();
    if (granted) state = const PermissionGranted();
  }

  Future<void> requestPermission() async {
    final result = await _repo.requestLocation();

    state = switch (result) {
      PermissionStatus.granted => const PermissionGranted(),
      PermissionStatus.permanentlyDenied => const PermissionPermanentlyDenied(),
      _ => const PermissionDenied(),
    };
  }

  Future<void> openSettings() => _repo.openSettings();
}
