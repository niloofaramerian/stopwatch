import 'package:flutter/material.dart';

import 'clock_hand.dart';
import 'clock_markers.dart';
import 'elapsed_time_text.dart';

class StopwatchRenderer extends StatelessWidget {
  const StopwatchRenderer({super.key, required this.radius});

  final double radius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: radius,
      height: radius * 2,
      child: Stack(
        fit: StackFit.loose,
        children: [
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
              child: ClockTextMarker(value: i, maxValue: 60, radius: radius),
            ),
          Positioned(
            left: radius,
            top: radius,
            child: ClockHand(handLength: radius),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: radius * 1.3,
            child: const ElapsedTimeText(),
          ),
        ],
      ),
    );
  }
}
