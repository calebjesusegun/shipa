import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shipa/core/constants/app_colors.dart';
import 'package:shipa/core/constants/app_constants.dart';
import 'package:shipa/core/constants/app_strings.dart';
import 'package:shipa/features/tracking_map/entities/delivery_details.dart';
import 'package:shipa/features/tracking_map/widgets/circle_dot.dart';
import 'package:shipa/features/tracking_map/widgets/timeline_step.dart';

class CourierBottomSheet extends StatelessWidget {
  final DeliveryDetails details;
  const CourierBottomSheet({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 32),
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: AppColors.neutralWhite,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(32),
          bottom: Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.neutral100,
            blurRadius: 1,
            spreadRadius: 0,
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: IntrinsicHeight(
          child: Column(
            children: [
              const SizedBox(height: 8),
              Row(
                spacing: 12,
                children: [
                  const SizedBox(width: 8),
                  SvgPicture.asset(AppConstants.timer, width: 20, height: 20),
                  Flexible(
                    child: Text(
                      AppStrings.deliveryDesc,
                      style: TextStyle(
                        color: AppColors.neutral500,
                        fontSize: 14,
                      ),
                      softWrap: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppColors.neutral100.withValues(alpha: .15),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 26,
                          backgroundImage: NetworkImage(
                            details.courier.profileImageUrl,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                details.courier.name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.neutral500,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                AppStrings.courier,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.neutral100,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary300.withValues(
                              alpha: 0.9,
                            ),
                            foregroundColor: AppColors.neutralWhite,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            elevation: 0,
                          ),
                          icon: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: AppColors.neutralWhite,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.phone,
                              size: 18,
                              color: AppColors.primary300.withValues(
                                alpha: 0.8,
                              ),
                            ),
                          ),
                          label: const Text(AppStrings.call),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppStrings.orderId,
                              style: TextStyle(
                                color: AppColors.neutral100,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              details.orderId,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary100.withValues(alpha: .06),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              CircleDot(),
                              const SizedBox(width: 4),
                              const Text(
                                AppStrings.onDelivery,
                                style: TextStyle(
                                  color: AppColors.primary100,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    ...details.timeline.map(
                      (step) => TimelineStep(
                        step: step,
                        index: details.timeline.indexOf(step),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
