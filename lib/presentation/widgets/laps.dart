import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stopwatch/app/extensions/duration.dart';

import '../../app/config/app_colors.dart';
import '../../app/config/app_constants.dart';
import '../../app/config/app_dimensions.dart';
import '../../app/config/app_text_styles.dart';
import '../../data/models/lap.dart';
import '../controllers/laps_controller.dart';

class Laps extends StatelessWidget {
  const Laps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LapsController>(
      builder: (controller) {
        return controller.laps.isNotEmpty
            ? Column(
                children: [
                  const _LapsHeader(),
                  sizedBoxH12,
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (_, index) {
                        return _LapItem(
                            lap: controller
                                .laps[controller.laps.length - 1 - index]);
                      },
                      separatorBuilder: (_, __) => sizedBoxH12,
                      itemCount: controller.laps.length,
                    ),
                  ),
                ],
              )
            : const SizedBox();
      },
    );
  }
}

class _LapsHeader extends StatelessWidget {
  const _LapsHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
        color: AppColors.primary,
      ),
      padding: paddingV12,
      child: Row(
        children: [
          _buildItem(lap),
          _buildItem(lapTime),
          _buildItem(overall),
        ],
      ),
    );
  }

  Widget _buildItem(String title) {
    return Expanded(
      child: Text(
        title,
        style: AppTextStyles.title,
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _LapItem extends StatelessWidget {
  const _LapItem({Key? key, required this.lap}) : super(key: key);

  final Lap lap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildItem('${lap.index}'),
        _buildItem(lap.time.toStringDuration()),
        _buildItem(lap.overallTime.toStringDuration()),
      ],
    );
  }

  Expanded _buildItem(String text) {
    return Expanded(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: AppTextStyles.display,
      ),
    );
  }
}
