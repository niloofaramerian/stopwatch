import 'package:flutter/material.dart';

import '../../../app/config/app_colors.dart';
import 'custom_icon_button.dart';

class StartButton extends StatelessWidget {
  const StartButton({Key? key, required this.onPressed}) : super(key: key);
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      onPressed: onPressed,
      backgroundColor: AppColors.secondary,
      icon: const Icon(
       Icons.play_arrow_rounded,
        color: AppColors.onSecondary,
        size: 36,
      ),
    );
  }
}
