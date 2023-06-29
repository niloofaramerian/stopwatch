import 'dart:math';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../app/config/app_colors.dart';
import '../controllers/elapsed_controller.dart';

class ClockHand extends StatelessWidget {
  const ClockHand({super.key, required this.handLength});

  final double handLength;

  @override
  Widget build(BuildContext context) {
    const width = 2.5;
    return GetBuilder<ElapsedController>(
      builder: (_) {
        return Transform(
          transform: Matrix4.identity()
            ..translate(width / 2, 0, 0.0)
            ..rotateZ(pi + (2 * pi / 60000) * _.elapsed.inMilliseconds),
          child: Container(
            width: width,
            height: handLength,
            color: AppColors.secondary,
          ),
        );
      },
    );
  }
}
