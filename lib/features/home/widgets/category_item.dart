import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_colors.dart';
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
        children: [
          Container(
            width: AppSizes.categoryItemSize,
            height: AppSizes.categoryItemSize,
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary : AppColors.inputBackground,
              borderRadius: BorderRadius.circular(AppSizes.radiusL),
            ),
            child: Center(
              child: Icon(
                icon,
                color: AppColors.textDark,
                size: AppSizes.iconM,
              ),
            ),
          ),
          const SizedBox(height: AppSizes.paddingS),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: AppColors.textDark,
            ),
          ),
        ],
      ),
    );
  }
}
