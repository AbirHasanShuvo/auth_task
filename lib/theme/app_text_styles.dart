import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  static const fontFamily = 'Roboto';

  static TextStyle heading1 = GoogleFonts.manrope(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static TextStyle heading2 = GoogleFonts.manrope(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  static TextStyle body = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

  static TextStyle caption = GoogleFonts.inter(
    fontSize: 12,
    color: AppColors.textSecondaryLight,
  );
}