import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:shipa/core/constants/app_colors.dart';
import 'package:shipa/core/constants/app_strings.dart';
import 'package:shipa/features/location_search/widgets/search_text_field.dart';

import '../../../core/router/app_router.dart';
import '../provider/location_search_provider.dart';

class LocationSearchScreen extends ConsumerWidget {
  const LocationSearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(selectedLocationsProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          AppStrings.searchHeader,
          style: TextStyle(
            color: AppColors.neutral500,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              AppStrings.from,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.neutral100,
              ),
            ),
            const SizedBox(height: 6),

            SearchField(
              hint: AppStrings.pickupLocation,
              icon: Icons.circle,
              iconColor: AppColors.primary300,
              onSelected: (place) =>
                  ref.read(selectedLocationsProvider.notifier).setOrigin(place),
              selectedLabel: selected.origin?.placeName,
            ),

            const SizedBox(height: 20),
            const Text(
              AppStrings.to,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.neutral100,
              ),
            ),
            const SizedBox(height: 6),

            SearchField(
              hint: AppStrings.destination,
              icon: Icons.location_on_rounded,
              iconColor: AppColors.neutral500,
              onSelected: (place) => ref
                  .read(selectedLocationsProvider.notifier)
                  .setDestination(place),
              selectedLabel: selected.destination?.placeName,
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: selected.isReady
                    ? () {
                        final origin = selected.origin!;
                        final destination = selected.destination!;
                        context.go(
                          AppRoutes.tracking,
                          extra: {
                            'origin': Position(
                              origin.longitude,
                              origin.latitude,
                            ),
                            'destination': Position(
                              destination.longitude,
                              destination.latitude,
                            ),
                            'originName': origin.placeName,
                            'destinationName': destination.placeName,
                          },
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary300,
                  foregroundColor: AppColors.neutralWhite,
                  disabledBackgroundColor: Colors.grey[200],
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  AppStrings.viewRoute,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
