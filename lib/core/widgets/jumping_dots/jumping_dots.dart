import 'package:flutter/material.dart';
import 'dart:math' as math;

class JumpingDots extends StatefulWidget {
  const JumpingDots({super.key});

  @override
  State<JumpingDots> createState() => _JumpingDotsState();
}

class _JumpingDotsState extends State<JumpingDots> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  double _calculateDotSize(double controllerValue, double phaseOffset) {
    const minSize = 6.0;
    const maxSize = 8.0;
    const amplitude = (maxSize - minSize) / 2;
    const midPoint = minSize + amplitude;
    return midPoint + amplitude * math.sin((controllerValue - phaseOffset) * 2 * math.pi);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: _calculateDotSize(_animationController.value, 0.0),
              height: _calculateDotSize(_animationController.value, 0.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              width: _calculateDotSize(_animationController.value, 0.33),
              height: _calculateDotSize(_animationController.value, 0.33),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              width: _calculateDotSize(_animationController.value, 0.66),
              height: _calculateDotSize(_animationController.value, 0.66),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ],
        );
      },
    );
  }
}
