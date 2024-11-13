import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  static final heading = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textDark,
  );

  static final subtitle = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textSubtitle,
  );

  static final buttonText = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textDark,
  );

  static final productTitle = GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.textDark,
  );

  static final productPrice = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
}
