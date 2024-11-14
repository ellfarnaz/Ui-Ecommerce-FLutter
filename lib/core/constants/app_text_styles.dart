import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  static TextStyle getStyle(BuildContext context, TextStyle style) {
    return style.copyWith(
      fontSize: (style.fontSize ?? 14).sp,
    );
  }

  static TextStyle heading(BuildContext context) => GoogleFonts.poppins(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.textDark,
      );

  static TextStyle subtitle(BuildContext context) => GoogleFonts.poppins(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.textSubtitle,
      );

  static TextStyle buttonText(BuildContext context) => GoogleFonts.poppins(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.textDark,
      );

  static TextStyle body(BuildContext context) => GoogleFonts.poppins(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.textDark,
      );

  static TextStyle productTitle(BuildContext context) => GoogleFonts.poppins(
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.textDark,
      );

  static TextStyle productPrice(BuildContext context) => GoogleFonts.poppins(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      );
}
