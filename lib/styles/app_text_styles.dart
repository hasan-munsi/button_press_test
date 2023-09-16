import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppTextStyles {
  static const String fontFamily = 'Roboto';
  static const normalText = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    color: AppColors.kDark,
    fontFamily: fontFamily
  );

  static const titleText = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w700,
    color: AppColors.kDark,
    fontFamily: fontFamily
  );
}
