import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stopwatch/app/config/app_colors.dart';

import '../../app/config/app_text_styles.dart';

class ClockMarkers extends StatelessWidget {
  const ClockMarkers({
    super.key,
    required this.seconds,
    required this.radius,
  });

  final int seconds;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final color = seconds % 5 == 0 ? AppColors.onPrimary : Colors.grey.shade700;
    const width = 2.5;
    const height = 12.0;
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..translate(-width / 2, -height / 2, 0.0)
        ..rotateZ(2 * pi * (seconds / 60))
        ..translate(0.0, radius - (height / 2), 0.0),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        ),
      ),
    );
  }
}

class ClockTextMarker extends StatelessWidget {
  const ClockTextMarker({
    super.key,
    required this.value,
    required this.maxValue,
    required this.radius,
  });

  final int value, maxValue;
  final double radius;

  @override
  Widget build(BuildContext context) {
    const width = 40.0;
    const height = 30.0;
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..translate(-width / 2, -height / 2, 0.0)
        ..rotateZ(pi + 2 * pi * (value / maxValue))
        ..translate(0.0, radius - 35, 0.0)
        ..rotateZ(pi - 2 * pi * (value / maxValue)),
      child: SizedBox(
        width: width,
        height: height,
        child: Text(
          '$value',
          style: AppTextStyles.bodySmall,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
