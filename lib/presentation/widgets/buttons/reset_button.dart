import 'package:flutter/cupertino.dart';

import '../../../app/config/app_colors.dart';
import 'custom_icon_button.dart';

class ResetButton extends StatelessWidget {
  const ResetButton({Key? key, required this.onPressed}) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      onPressed: onPressed,
      backgroundColor: AppColors.surface,
      icon: const Icon(
        CupertinoIcons.restart,
        color: AppColors.onPrimary,
        size: 24,
      ),
    );
  }
}
