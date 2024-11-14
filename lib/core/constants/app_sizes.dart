import '../utils/size_config.dart';

class AppSizes {
  // Padding & Margin
  static double get paddingXS => SizeConfig.getProportionateScreenWidth(4.0);
  static double get paddingS => SizeConfig.getProportionateScreenWidth(8.0);
  static double get paddingM => SizeConfig.getProportionateScreenWidth(16.0);
  static double get paddingL => SizeConfig.getProportionateScreenWidth(24.0);
  static double get paddingXL => SizeConfig.getProportionateScreenWidth(32.0);
  static double get paddingXXL => SizeConfig.getProportionateScreenWidth(40.0);

  // Border Radius
  static double get radiusS => SizeConfig.getProportionateScreenWidth(4.0);
  static double get radiusM => SizeConfig.getProportionateScreenWidth(8.0);
  static double get radiusL => SizeConfig.getProportionateScreenWidth(12.0);
  static double get radiusXL => SizeConfig.getProportionateScreenWidth(16.0);
  static double get radiusXXL => SizeConfig.getProportionateScreenWidth(20.0);

  // Button Heights
  static double get buttonHeight =>
      SizeConfig.getProportionateScreenHeight(45.0);
  static double get buttonIconSize =>
      SizeConfig.getProportionateScreenWidth(24.0);

  // Icon Sizes
  static double get iconXS => SizeConfig.getProportionateScreenWidth(12.0);
  static double get iconS => SizeConfig.getProportionateScreenWidth(16.0);
  static double get iconM => SizeConfig.getProportionateScreenWidth(24.0);
  static double get iconL => SizeConfig.getProportionateScreenWidth(32.0);
  static double get iconXL => SizeConfig.getProportionateScreenWidth(48.0);

  // Container Sizes
  static double get categoryItemSize =>
      SizeConfig.getProportionateScreenWidth(65.0);
  static double get productCardHeight =>
      SizeConfig.getProportionateScreenHeight(200.0);
  static double get searchBarHeight =>
      SizeConfig.getProportionateScreenHeight(50.0);
}
