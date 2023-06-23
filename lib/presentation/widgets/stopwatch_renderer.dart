import 'package:flutter/material.dart';

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
        return Stack(
          children: [
            for (var i = 0; i < 60; i++)
              Positioned(
                top: radius,
                left: radius,
                child: ClockMarkers(seconds: i, radius: radius),
              ),
            Positioned(
              left: radius,
              top: radius,
              child: ClockHand(handLength: radius),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: radius * 1.5,
              child: const ElapsedTimeText(),
            ),
          ],
        );
      },
    );
  }
}
