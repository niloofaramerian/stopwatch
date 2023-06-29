import 'package:flutter/material.dart';

import '../../app/config/app_colors.dart';
import 'clock_hand.dart';
import 'clock_markers.dart';
import 'elapsed_time_text.dart';

class StopwatchRenderer extends StatelessWidget {
  const StopwatchRenderer({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final radius = constraints.maxWidth / 2;
        return SizedBox(
          width: radius,
          height: radius * 2,
          child: Stack(
            fit: StackFit.loose,
            children: [
              Container(
                width: radius * 2,
                height: radius * 2,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.surface,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadow,
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
              ),
              for (var i = 0; i < 60; i++)
                Positioned(
                  top: radius,
                  left: radius,
                  child: ClockMarkers(seconds: i, radius: radius),
                ),
              for (var i = 5; i <= 60; i += 5)
                Positioned(
                  top: radius,
                  left: radius,
                  child:
                      ClockTextMarker(value: i, maxValue: 60, radius: radius),
                ),
              Positioned(
                left: radius,
                top: radius,
                child: ClockHand(handLength: radius),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: radius * 1.2,
                child: const ElapsedTimeText(),
              ),
            ],
          ),
        );
      },
    );
  }
}
