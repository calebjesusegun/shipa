import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shipa/core/constants/app_colors.dart';
import 'package:shipa/core/constants/app_constants.dart';
import 'package:shipa/core/constants/app_strings.dart';
import 'package:shipa/core/enum/delivery_status.dart';
import 'package:shipa/features/tracking_map/entities/delivery_timeline_step.dart';

class TimelineStep extends StatelessWidget {
  final DeliveryTimelineStep step;
  final int index;
  const TimelineStep({super.key, required this.step, required this.index});

  @override
  Widget build(BuildContext context) {
    return (step.title != DeliveryStatus.delivered.label)
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  if (index == 0) const SizedBox(height: 12),
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: AppColors.primary300.withValues(
                      alpha: 0.8,
                    ),
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primary300.withValues(alpha: 0.8),
                        border: Border.all(
                          color: AppColors.neutralWhite,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  CustomPaint(
                    painter: DottedLinePainter(),
                    child: SizedBox(height: 60),
                  ),
                ],
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      step.title,
                      style: TextStyle(
                        color: AppColors.neutral100,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      step.subtitle,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.neutral500,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      step.eta,
                      style: TextStyle(
                        color: AppColors.neutral100,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    step.time!,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.neutral100,
                    ),
                  ),
                  Text(
                    step.date!,
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.neutral500,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(AppConstants.pin, width: 24, height: 24),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      step.title,
                      style: TextStyle(
                        color: AppColors.neutral100,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      step.subtitle,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.neutral500,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.noData,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: AppColors.neutral100,
                    ),
                  ),
                  Text(
                    AppStrings.noData,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.neutral500,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          );
  }
}

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashHeight = 2, dashSpace = 2, startX = 0;
    final paint = Paint()
      ..color = AppColors.neutral100
      ..strokeWidth = 0.5;

    while (startX < size.height) {
      canvas.drawLine(Offset(0, startX), Offset(0, startX + dashHeight), paint);
      startX += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
