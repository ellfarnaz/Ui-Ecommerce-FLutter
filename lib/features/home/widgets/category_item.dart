import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/constants/app_sizes.dart';

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 65.w,
            height: 65.w,
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary : AppColors.inputBackground,
              borderRadius: BorderRadius.circular(AppSizes.radiusL),
            ),
            child: Center(
              child: Icon(
                icon,
                color: AppColors.textDark,
                size: 24.w,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            label,
            style: AppTextStyles.subtitle(context),
          ),
        ],
      ),
    );
  }
}
