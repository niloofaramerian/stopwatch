import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:stopwatch/app/config/app_colors.dart';

import '../../app/config/app_constants.dart';
import '../../app/config/app_dimensions.dart';
import '../controllers/elapsed_controller.dart';
import '../controllers/laps_controller.dart';
import '../widgets/buttons/buttons.dart';
import '../widgets/laps.dart';
import '../widgets/stopwatch_renderer.dart';

class StopwatchPage extends StatefulWidget {
  const StopwatchPage({Key? key}) : super(key: key);

  @override
  State<StopwatchPage> createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage>
    with TickerProviderStateMixin {
  late final Ticker _ticker;

  final _elapsedController = Get.put(ElapsedController());

  final _lapsController = Get.put(LapsController());

  @override
  void initState() {
    _ticker = createTicker((elapsed) {
      _elapsedController.setCurrentlyElapsed(elapsed);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      // Customize the system UI overlay like the status bar appearance
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColors.surface,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(stopwatch),
          elevation: 0.0,
        ),
        body: SafeArea(
          child: Padding(
            padding: paddingH24V12,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Padding(
                  padding: paddingH36,
                  child: StopwatchRenderer(),
                ),
                sizedBoxH24,
                const Expanded(child: Laps()),
                sizedBoxH12,
                GetBuilder<ElapsedController>(
                  builder: (_) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        sizedBoxW12,
                        ResetButton(onPressed: _reset),
                        sizedBoxW12,
                        _.isRunning
                            ? StopButton(onPressed: _stop)
                            : StartButton(onPressed: _start),
                        sizedBoxW12,
                        LapButton(),
                        sizedBoxW12,
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _stop() {
    _elapsedController.reverseRunning();

    _ticker.stop();
    _elapsedController
      ..setPreviouslyElapsed(_elapsedController.previouslyElapsed +
          _elapsedController.currentlyElapsed)
      ..setCurrentlyElapsed(Duration.zero);
  }

  void _start() {
    _elapsedController.reverseRunning();

    _ticker.start();
  }

  void _reset() {
    _ticker.stop();

    _elapsedController
      ..resetElapsed()
      ..setRunning(false);

    _lapsController.clear();
  }
}
