import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  static TextStyle getStyle(BuildContext context, TextStyle baseStyle) {
    final textScaler = MediaQuery.textScalerOf(context);
    return baseStyle.copyWith(
      fontSize: textScaler.scale(baseStyle.fontSize ?? 14),
    );
  }

  static TextStyle heading(BuildContext context) => getStyle(
        context,
        GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.textDark,
        ),
      );

  static TextStyle subtitle(BuildContext context) => getStyle(
        context,
        GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.textSubtitle,
        ),
      );

  static TextStyle buttonText(BuildContext context) => getStyle(
        context,
        GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.textDark,
        ),
      );

  static TextStyle body(BuildContext context) => getStyle(
        context,
        GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.textDark,
        ),
      );

  static TextStyle productTitle(BuildContext context) => getStyle(
        context,
        GoogleFonts.poppins(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: AppColors.textDark,
        ),
      );

  static TextStyle productPrice(BuildContext context) => getStyle(
        context,
        GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      );
}
