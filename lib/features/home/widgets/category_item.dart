import 'package:flutter/material.dart';
import '../../../core/utils/size_config.dart';
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
    final orientation = MediaQuery.of(context).orientation;
    final isPortrait = orientation == Orientation.portrait;

    return LayoutBuilder(
      builder: (context, constraints) {
        final itemSize = isPortrait
            ? SizeConfig.getProportionateScreenWidth(65)
            : SizeConfig.getProportionateScreenHeight(65);

        return GestureDetector(
          onTap: onTap,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: itemSize,
                height: itemSize,
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.primary
                      : AppColors.inputBackground,
                  borderRadius: BorderRadius.circular(AppSizes.radiusL),
                ),
                child: Center(
                  child: Icon(
                    icon,
                    color: AppColors.textDark,
                    size: SizeConfig.getProportionateScreenWidth(24),
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.getProportionateScreenHeight(8)),
              Text(
                label,
                style: AppTextStyles.subtitle(context),
              ),
            ],
          ),
        );
      },
    );
  }
}
