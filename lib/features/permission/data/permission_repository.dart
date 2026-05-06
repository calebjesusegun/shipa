import 'package:permission_handler/permission_handler.dart';

class PermissionRepository {
  Future<bool> isLocationGranted() async {
    final status = await Permission.locationWhenInUse.status;
    return status.isGranted;
  }

  Future<PermissionStatus> requestLocation() async {
    return Permission.locationWhenInUse.request();
  }

  Future<void> openSettings() => openAppSettings();
}
