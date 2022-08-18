import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';
import 'dimensions.dart';

ThemeData lightTheme = ThemeData(
  // brightness: Brightness.light,
  visualDensity: const VisualDensity(vertical: 0.5, horizontal: 0.5),
  primaryColor: const Color(0xFF8958AF),
  canvasColor: Colors.transparent,
  cardColor: AppColors.white,
  dividerColor: AppColors.separatorColor,
  focusColor: AppColors.primaryColor,
  inputDecorationTheme: const InputDecorationTheme(
    isDense: true,
    focusColor: AppColors.primaryColor,
    focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryColor)),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: AppColors.separatorColor),
    ),
    errorBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.red),
    ),
    disabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: AppColors.separatorColor),
    ),
    border: UnderlineInputBorder(
      borderSide: BorderSide(color: AppColors.separatorColor),
    ),
  ),
  checkboxTheme: CheckboxThemeData(
    checkColor:
        MaterialStateProperty.resolveWith((_) => AppColors.primaryColor),
    fillColor: MaterialStateProperty.resolveWith((_) => Colors.transparent),
    side: AlwaysActiveBorderSide(),
  ),
  unselectedWidgetColor: AppColors.unSelectedColor,
  appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      titleTextStyle: TextStyle(
        color: AppColors.black,
        fontSize: Dimens.textLarge,
      ),
      centerTitle: true),
  scaffoldBackgroundColor: AppColors.offWhite,
  backgroundColor: AppColors.white,
  colorScheme: ColorScheme.fromSwatch(
      primarySwatch: const MaterialColor(
    0xFF8958AF,
    <int, Color>{
      50: Color(0xFF8958AF),
      100: Color(0xFF8958AF),
      200: Color(0xFF8958AF),
      300: Color(0xFF8958AF),
      400: Color(0xFF8958AF),
      500: Color(0xFF8958AF),
      600: Color(0xFF8958AF),
      700: Color(0xFF8958AF),
      800: Color(0xFF8958AF),
      900: Color(0xFF8958AF)
    },
  )).copyWith(secondary: Colors.white),
);

class AlwaysActiveBorderSide extends MaterialStateBorderSide {
  @override
  BorderSide? resolve(Set<MaterialState> states) =>
      const BorderSide(color: AppColors.primaryColor, width: 2);
}
