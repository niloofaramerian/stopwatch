import 'package:flutter/cupertino.dart';

import '../../../app/config/app_colors.dart';
import 'custom_icon_button.dart';

class StopButton extends StatelessWidget {
  const StopButton({Key? key, required this.onPressed}) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      onPressed: onPressed,
      backgroundColor: AppColors.secondary,
      icon: const Icon(
        CupertinoIcons.pause_fill,
        color: AppColors.onSecondary,
        size: 24,
      ),
    );
  }
}
