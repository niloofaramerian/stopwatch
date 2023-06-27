import 'package:get/get.dart';

class ElapsedController extends GetxController {
  Duration previouslyElapsed = Duration.zero;
  Duration currentlyElapsed = Duration.zero;

  bool isRunning = false;

  Duration get elapsed => previouslyElapsed + currentlyElapsed;

  void setCurrentlyElapsed(Duration elapsed) {
    currentlyElapsed = elapsed;
    update();
  }

  void setPreviouslyElapsed(Duration elapsed) {
    previouslyElapsed = elapsed;
    update();
  }

  void resetElapsed() {
    currentlyElapsed = Duration.zero;
    previouslyElapsed = Duration.zero;
  }

  void setRunning(bool value) {
    isRunning = value;
    update();
  }

  void reverseRunning() {
    isRunning = !isRunning;
    update();
  }
}
