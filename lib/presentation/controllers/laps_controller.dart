import 'package:get/get.dart';
import 'package:stopwatch/data/models/lap.dart';

class LapsController extends GetxController {
  List<Lap> laps = [];

  void addLap(Duration duration) {
    laps.add(Lap(
      index: laps.length + 1,
      time: laps.isEmpty
          ? duration
          : duration - laps[laps.length - 1].overallTime,
      overallTime: duration,
    ));
    update();
  }

  void clear() {
    laps = [];
    update();
  }
}
