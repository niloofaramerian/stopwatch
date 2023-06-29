import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../app/config/app_colors.dart';
import '../../controllers/elapsed_controller.dart';
import '../../controllers/laps_controller.dart';
import 'custom_icon_button.dart';

class LapButton extends StatelessWidget {
  LapButton({Key? key}) : super(key: key);

  final _lapController = Get.put(LapsController());

  final _elapsedController = Get.put(ElapsedController());

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      onPressed: () {
        _lapController.addLap(_elapsedController.elapsed);
      },
      backgroundColor: AppColors.surface,
      icon: const Icon(
        CupertinoIcons.flag,
        color: AppColors.onPrimary,
        size: 24,
      ),
    );
  }
}
