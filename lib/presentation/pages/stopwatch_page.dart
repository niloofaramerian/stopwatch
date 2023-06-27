import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../controllers/elapsed_controller.dart';
import '../widgets/reset_button.dart';
import '../widgets/start_stop_button.dart';
import '../widgets/stopwatch_renderer.dart';

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
      _controller.setCurrentlyElapsed(elapsed);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      // Customize the system UI overlay like the status bar appearance
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    StopwatchRenderer(radius: constraints.maxWidth / 2),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        ResetButton(onPressed: _reset),
                        const Spacer(),
                        StartStopButton(onPressed: _toggleRunning),
                      ],
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void _toggleRunning() {
    _controller.reverseRunning();

    if (_controller.isRunning) {
      _ticker.start();
    } else {
      _ticker.stop();
      _controller
        ..setPreviouslyElapsed(
          _controller.previouslyElapsed + _controller.currentlyElapsed,
        )
        ..setCurrentlyElapsed(Duration.zero);
      ;
    }
  }

  void _reset() {
    _ticker.stop();

    _controller
      ..resetElapsed()
      ..setRunning(false);
  }
}
