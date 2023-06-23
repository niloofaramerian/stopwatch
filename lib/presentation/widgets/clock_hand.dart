import 'dart:math';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../controllers/elapsed_controller.dart';

class ClockHand extends StatelessWidget {
  const ClockHand({super.key, required this.handLength});

  final double handLength;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ElapsedController>(
      builder: (_) {
        return Transform(
          transform: Matrix4.identity()
            ..rotateZ(pi + (2 * pi / 60000) * _.elapsed.inMilliseconds),
          child: Container(
            width: 2,
            height: handLength,
            color: Colors.orange,
          ),
        );
      },
    );
  }
}
