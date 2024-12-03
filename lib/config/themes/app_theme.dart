import 'package:almabad/core/constant/app_color.dart';
import 'package:almabad/core/constant/app_font_family.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData? appTheme() {
    return ThemeData(
        scaffoldBackgroundColor: AppColor.bardyColor,
        fontFamily: AppFontFamily.egyptian);
  }
}
