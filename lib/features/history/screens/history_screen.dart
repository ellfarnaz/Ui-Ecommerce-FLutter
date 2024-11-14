import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.history,
                size: 120.w,
                color: AppColors.textSubtitle,
              ),
              SizedBox(height: 16.h),
              Text(
                'Belum Ada Riwayat',
                style: AppTextStyles.heading(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
