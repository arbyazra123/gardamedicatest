import 'package:flutter/material.dart';

import 'colors.dart';
import 'dimens.dart';


class LightTheme {
  static final String latoFF = "Lato";
  static final String pattayaFF = "Pattaya";
  static ThemeData themeData = ThemeData(fontFamily: latoFF).copyWith(
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.appWhite,
      accentColor: AppColors.primaryColor,
      toggleableActiveColor: AppColors.primaryColor,
      dividerColor: AppColors.appWhite,
      bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: AppColors.appWhite,
          elevation: 5,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(5)))));

/*  static BottomNavigationBarThemeData bottomNavTheme =
      BottomNavigationBarThemeData(
    backgroundColor: AppColors.appWhite,
    type: BottomNavigationBarType.fixed,
    elevation: 12,
    unselectedItemColor: AppColors.blackD8Color,
    unselectedIconTheme: IconThemeData(size: Dimens.dp24),
  );*/
}


class TextStylesTheme{
  static TextStyle appbarWhiteText = TextStyle(
    fontWeight: FontWeight.w700,
    color: AppColors.appWhite,
    fontSize: Dimens.dp16,
  );
static TextStyle appbarBlackText = TextStyle(
    fontWeight: FontWeight.w500,
    color: AppColors.greyDark,
    fontSize: Dimens.dp14,
  );

  static TextStyle primaryText = TextStyle(
    fontWeight: FontWeight.w500,
    color: AppColors.secondaryColor,
    fontSize: Dimens.dp14,
  );

}