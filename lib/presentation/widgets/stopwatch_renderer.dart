import 'package:flutter/material.dart';

import 'clock_hand.dart';
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
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 3, color: Colors.grey.shade500),
                borderRadius: BorderRadius.circular(radius),
              ),
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
