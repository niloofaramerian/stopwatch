import 'package:flutter/material.dart';

import '../../../app/config/app_colors.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    required this.onPressed,
    required this.backgroundColor,
    required this.icon,
  }) : super(key: key);

  final VoidCallback onPressed;
  final Color backgroundColor;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Ink(
        width: 50,
        height: 50,
        // padding: padding12,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: AppColors.shadow,
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: icon,
      ),
    );
  }
}
