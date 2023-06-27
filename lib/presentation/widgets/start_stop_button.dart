import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/elapsed_controller.dart';

class StartStopButton extends StatelessWidget {
  const StartStopButton({Key? key, required this.onPressed}) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ElapsedController>(
      builder: (_) {
        return ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            fixedSize: const Size(80, 80),
            backgroundColor:
                _.isRunning ? Colors.red.shade700 : Colors.green.shade700,
          ),
          child: Text(_.isRunning ? 'Stop' : 'Start'),
        );
      },
    );
  }
}
