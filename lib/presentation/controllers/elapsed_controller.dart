import 'package:get/get.dart';

class ElapsedController extends GetxController {
  Duration _elapsed = Duration.zero;

  Duration get elapsed => _elapsed;

  void setElapsed(Duration elapsed) {
    _elapsed = elapsed;
    update();
  }
}
