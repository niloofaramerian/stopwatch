import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../controllers/elapsed_controller.dart';
import '../widgets/elapsed_time_text.dart';

class StopwatchPage extends StatefulWidget {
  const StopwatchPage({Key? key}) : super(key: key);

  @override
  State<StopwatchPage> createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage>
    with TickerProviderStateMixin {
  late final Ticker _ticker;

  final _controller = Get.put(ElapsedController());

  @override
  void initState() {
    _ticker = createTicker((elapsed) {
      _controller.setElapsed(elapsed);
    });
    _ticker.start();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const AnnotatedRegion<SystemUiOverlayStyle>(
      // Customize the system UI overlay like the status bar appearance
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(24.0),
            child: AspectRatio(
              aspectRatio: 1.0,
              child: ElapsedTimeText(),
            ),
          ),
        ),
      ),
    );
  }
}
