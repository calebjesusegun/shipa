import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shipa/core/constants/app_colors.dart';
import 'package:shipa/core/router/app_router.dart';
import '../provider/permission_provider.dart';

class PermissionScreen extends ConsumerWidget {
  const PermissionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final permissionState = ref.watch(permissionProvider);

    ref.listen(permissionProvider, (_, state) {
      if (state is PermissionGranted) {
        context.go(AppRoutes.locationSearch);
      } else {
        context.go(AppRoutes.permission);
      }
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.location_on_rounded,
                size: 80,
                color: AppColors.primary300,
              ),
              const SizedBox(height: 24),
              const Text(
                'Location Access',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              const Text(
                'We need your location to show accurate routes '
                'and track deliveries in real time.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
              const SizedBox(height: 40),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: permissionState is PermissionPermanentlyDenied
                      ? () =>
                            ref.read(permissionProvider.notifier).openSettings()
                      : () => ref
                            .read(permissionProvider.notifier)
                            .requestPermission(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary300,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    permissionState is PermissionPermanentlyDenied
                        ? 'Open Settings'
                        : 'Allow Location',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              if (permissionState is PermissionDenied) ...[
                const SizedBox(height: 16),
                const Text(
                  'Permission was denied. Please allow location access.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.red, fontSize: 14),
                ),
              ],

              if (permissionState is PermissionPermanentlyDenied) ...[
                const SizedBox(height: 16),
                const Text(
                  'You permanently denied location access. '
                  'Open Settings to enable it.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.red, fontSize: 14),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
