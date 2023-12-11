import 'package:flutter/material.dart';
import 'package:intertech/core/theme/app_colors.dart';

final class AppTextStyles {
    static AppTextStyles shared = AppTextStyles._();
  AppTextStyles._();

    TextStyle appbarTextStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );
    TextStyle titleTextStyle = TextStyle(
    color: AppColors.shared.primaryText,
    fontWeight: FontWeight.w700,
    fontSize: 17,
  );
    TextStyle bodyTextStyle = TextStyle(
    color: AppColors.shared.primaryText,
    fontWeight: FontWeight.w500,
    fontSize: 13,
  );
}
