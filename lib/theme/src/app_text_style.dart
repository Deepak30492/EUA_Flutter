import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTextStyle {
  ///APPBAR HEADINGS
  static get appBarTitleTextStyle => GoogleFonts.openSans(
        color: AppColors.white,
        fontWeight: FontWeight.w600,
        fontSize: 18,
      );

  ///HEADINGS
  static get heading1TextStyle => GoogleFonts.inter(
        color: AppColors.primaryLightBlue007BFF,
        fontWeight: FontWeight.w700,
        fontSize: 30,
      );

  static get heading2TextStyle => GoogleFonts.openSans(
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 24,
      );

  static get heading3TextStyle => GoogleFonts.openSans(
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      );

  static get heading4TextStyle => GoogleFonts.openSans(
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      );

  ///SUB HEADINGS
  static get subHeading1TextStyle => GoogleFonts.openSans(
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 18,
      );

  static get subHeading2TextStyle => GoogleFonts.openSans(
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      );

  static get subHeading3TextStyle => GoogleFonts.inter(
        color: AppColors.black,
        fontWeight: FontWeight.w600,
        fontSize: 14,
      );

  static get subHeading4TextStyle => GoogleFonts.openSans(
        color: AppColors.grey8B8B8B,
        fontWeight: FontWeight.w400,
        fontSize: 12,
      );

  static get subHeading5TextStyle => GoogleFonts.openSans(
        color: AppColors.black,
        fontWeight: FontWeight.w400,
        fontSize: 10,
      );

  ///NORMAL
  static get normal1TextStyle => GoogleFonts.openSans(
        color: AppColors.black,
        fontWeight: FontWeight.w400,
        fontSize: 12,
      );

  ///BUTTON
  static get button1TextStyle => GoogleFonts.inter(
        color: AppColors.white,
        fontWeight: FontWeight.w700,
        fontSize: 13,
      );

  static get button2TextStyle => GoogleFonts.inter(
        color: AppColors.white,
        fontWeight: FontWeight.w600,
        fontSize: 12,
      );

  ///TEXTFIELD
  static get textFieldTextStyle => GoogleFonts.openSans(
        color: AppColors.black,
        fontWeight: FontWeight.w400,
        fontSize: 12,
      );

  static get textFieldHintTextStyle => GoogleFonts.openSans(
        color: AppColors.greyHint828282,
        fontWeight: FontWeight.w400,
        fontSize: 12,
      );

  ///DROPDOWN
  static get dropdownTextStyle => GoogleFonts.openSans(
        color: AppColors.black,
        fontWeight: FontWeight.w400,
        fontSize: 12,
      );
}
