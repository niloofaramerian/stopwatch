import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stopwatch/app/extensions/duration.dart';

import '../../app/config/app_text_styles.dart';
import '../controllers/elapsed_controller.dart';

class ElapsedTimeText extends StatelessWidget {
  const ElapsedTimeText({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ElapsedController>(
      builder: (_) {
        final minutes = _.elapsed.getMinutes();
        final seconds = _.elapsed.getSeconds();
        final hundreds = _.elapsed.getHundreds();
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _TimeDigit(minutes.substring(0, 1)),
            _TimeDigit(minutes.substring(1, 2)),
            const _TimeDigit(':', width: 6),
            _TimeDigit(seconds.substring(0, 1)),
            _TimeDigit(seconds.substring(1, 2)),
            const _TimeDigit(':', width: 6),
            _TimeDigit(hundreds.substring(0, 1)),
            _TimeDigit(hundreds.substring(1, 2)),
          ],
        );
      },
    );
  }
}

class _TimeDigit extends StatelessWidget {
  const _TimeDigit(this.text, {Key? key, this.width = 12.0}) : super(key: key);
  final String text;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Text(
        text,
        style: AppTextStyles.bodyMedium,
        textAlign: TextAlign.center,
      ),
    );
  }
}
