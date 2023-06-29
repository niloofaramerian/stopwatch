import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTextStyles {
  // Body
  static TextStyle bodyMedium = GoogleFonts.chakraPetch(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.onPrimary,
  );

  static TextStyle bodySmall = GoogleFonts.chakraPetch(
    fontSize: 16,
    color: AppColors.secondaryText,
  );

  // Title
  static const title = TextStyle(
    fontSize: 16,
    color: AppColors.onPrimary,
    fontWeight: FontWeight.w700,
  );

  static const display = TextStyle(
    fontSize: 16,
    color: AppColors.secondaryText,
  );
}
