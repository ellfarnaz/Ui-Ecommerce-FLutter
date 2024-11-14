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

  void _handleTap() async {
    await Future.delayed(const Duration(milliseconds: 100));
    onTap();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          color: isSelected ? AppColors.primary : AppColors.inputBackground,
          borderRadius: BorderRadius.circular(AppSizes.radiusL),
          child: InkWell(
            borderRadius: BorderRadius.circular(AppSizes.radiusL),
            splashColor: AppColors.primary.withOpacity(0.1),
            highlightColor: AppColors.primary.withOpacity(0.1),
            onTap: _handleTap,
            child: SizedBox(
              width: 65.w,
              height: 65.w,
              child: Center(
                child: Icon(
                  icon,
                  color: AppColors.textDark,
                  size: 24.w,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          label,
          style: AppTextStyles.subtitle(context),
        ),
      ],
    );
  }
}
