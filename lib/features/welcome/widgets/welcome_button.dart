import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';

class WelcomeButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isPrimary;

  const WelcomeButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isPrimary = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isPrimary ? AppColors.primary : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.r),
            side: BorderSide(
              color: isPrimary ? Colors.transparent : AppColors.textDark,
              width: 1,
            ),
          ),
          elevation: 0,
        ),
        child: Text(
          text,
          style: AppTextStyles.buttonText(context).copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: isPrimary ? Colors.black : AppColors.textDark,
          ),
        ),
      ),
    );
  }
}
