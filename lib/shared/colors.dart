import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Theme Color
  static const Color primaryColor = Colors.blue;
  static const Color primary2Color = Color(0xFFEBF5E9);
  static const Color secondaryColor = Color(0xFF253237);

  static const Color primary3Color = Color(0xFF91CBE8);

  // Custom Color
  static const Color disabledTextColor = Color(0xFF9B9B9B);
  static const Color disabledColor = Color(0xFFE4E4E4);
  static const Color inputBgColor = Color(0xFFFAFAFA);
  static const Color black4bColor = Color(0xFF4B4B4B);
  static const Color black75Color = Color(0xFF757575);
  static const Color blackD8Color = Color(0xFFD8D8D8);
  static const Color whiteF9Color = Color(0xFFF9F9F9);
  static const Color redErrorColor = Color(0xFFC80000);
  static const Color whiteF2Color = Color(0xFFF2F4F5);
  static const Color appWhite = Color(0xFFFFFFFF);
  static const Color orangeColor = Color(0xFFF2994A);
  static const Color blueColor = Color(0xFF3887F0);

  static const Color supportProcessedColor = Color(0xFFCEE3FF);
  static const Color supportShippedColor = Color(0xFFFFF0C0);
  static const Color supportCompleteColor = Color(0xFFCCFFE5);
  static const Color supportDeclineColor = Color(0xFFFFE1E1);

  static const Color blueDark = Color(0xFF4267B2);
  static const Color redDark = Color(0xFFDB4437);
  static const Color red = Color(0xFFFF6160);

  static const Color dark = Color(0xFF333333);
  static const Color greyDark = Color(0xFF888888);
  static const Color grey2 = Color(0xFFDDDDDD);
  static const Color grey3 = Color(0xFFF7F7F7);
  static const Color bgGrey = Color(0xFFEEEEEE);
  static const Color bgGrey2 = Color(0xFFE5E5E5);
  static const Color bgScaffold = Color(0xFFF5F5F5);

  // gradient
  static LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      primaryColor,
      primaryColor,
    ],
    tileMode: TileMode.repeated
  );
}
