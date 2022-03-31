import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppColors {
  ///INITIALIZE THEME MODE CONTROLLER
  static final ThemeModeController themeModeController =
      Get.put(ThemeModeController());

  ///White
  static get white => themeModeController.themeMode
      ? _lightThemeWhiteColor
      : _darkThemeWhiteColor;

  static const Color _lightThemeWhiteColor = Color(0xFFFFFFFF);

  static const Color _darkThemeWhiteColor = Colors.red;

  ///Black
  static get black => themeModeController.themeMode
      ? _lightThemeBlackColor
      : _darkThemeBlackColor;

  static const Color _lightThemeBlackColor = Color(0xFF000000);

  static const Color _darkThemeBlackColor = Colors.red;

  ///Background White Color
  static get backgroundWhiteColorFBFCFF => themeModeController.themeMode
      ? _lightThemeBackgroundWhiteColorFBFCFF
      : _darkThemeBackgroundWhiteColor;

  static const Color _lightThemeBackgroundWhiteColorFBFCFF = Color(0xFFFBFCFF);

  static const Color _darkThemeBackgroundWhiteColor = Colors.red;

  ///Primary Light Blue
  static get primaryLightBlue007BFF => themeModeController.themeMode
      ? _lightThemePrimaryLightBlueColor
      : _darkThemePrimaryGreyColor;

  static const Color _lightThemePrimaryLightBlueColor = Color(0xFF007BFF);

  static const Color _darkThemePrimaryGreyColor = Colors.grey;

  ///Secondary Orange
  static get secondaryOrangeFF8A07 => themeModeController.themeMode
      ? _lightThemeSecondaryOrangeColor
      : _darkThemeSecondaryOrangeColor;

  static const Color _lightThemeSecondaryOrangeColor = Color(0xFFFF8A07);

  static const Color _darkThemeSecondaryOrangeColor = Colors.grey;

  ///Grey Text Color
  static get grey8B8B8B => themeModeController.themeMode
      ? _lightThemeGreyColor8B8B8B
      : _darkThemeGreyColor;

  static const Color _lightThemeGreyColor8B8B8B = Color(0xFF8B8B8B);

  static const Color _darkThemeGreyColor = Colors.grey;

  ///Grey Hint Text Color
  static get greyHint828282 => themeModeController.themeMode
      ? _lightThemeGreyHintColor828282
      : _darkThemeGreyHintColor;

  static const Color _lightThemeGreyHintColor828282 = Color(0xFF828282);

  static const Color _darkThemeGreyHintColor = Colors.grey;

  ///Dark Grey Icon Color
  static get darkGrey323232 => themeModeController.themeMode
      ? _lightThemeGreyHintColor828282
      : _darkThemeGreyHintColor;

  static const Color _lightThemeDarkGreyColor323232 = Color(0xFF828282);

  static const Color _darkThemeDarkGreyColor323232 = Colors.grey;
}

class ThemeModeController extends GetxController {
  ///`themeMode` boolean variable used to toggle the theme
  bool themeMode = true;

  toggleThemeMode() {
    themeMode = !themeMode;
    update();
  }
}
