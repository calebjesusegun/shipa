import 'package:flutter/material.dart';
import 'package:shipa/core/constants/app_colors.dart';

class CircleDot extends StatefulWidget {
  const CircleDot({super.key});

  @override
  State<CircleDot> createState() => CircleDotState();
}

class CircleDotState extends State<CircleDot>
    with SingleTickerProviderStateMixin {
  late final AnimationController _opacityController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 900),
  )..repeat(reverse: true);

  @override
  void dispose() {
    _opacityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => FadeTransition(
    opacity: _opacityController,
    child: Container(
      width: 4,
      height: 4,
      decoration: const BoxDecoration(
        color: AppColors.primary100,
        shape: BoxShape.circle,
      ),
    ),
  );
}
