import 'package:flutter/material.dart';
import 'package:rinavent/core/theme/app_palette.dart';

class AppTheme {
  static _border([Color color = AppPalette.borderColor]) => OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      );

  static _textStyle(
          {Color color = Colors.black,
          FontWeight fontWeight = FontWeight.normal}) =>
      TextStyle(fontFamily: 'Inter', color: color, fontWeight: fontWeight);
  static final lightThemeMode = ThemeData.light().copyWith(
    checkboxTheme: const CheckboxThemeData(
        fillColor: WidgetStatePropertyAll(AppPalette.gradient1)),
    scaffoldBackgroundColor: AppPalette.backgroundColor,
    chipTheme: ChipThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: const WidgetStatePropertyAll(AppPalette.borderColor),
        side: BorderSide.none),
    appBarTheme: const AppBarTheme(
        surfaceTintColor: AppPalette.backgroundColor,
        backgroundColor: AppPalette.backgroundColor,
        iconTheme: IconThemeData(color: AppPalette.gradient1, size: 30)),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: const TextStyle(color: AppPalette.greyColor, fontSize: 12),
      contentPadding: const EdgeInsets.all(15),
      border: _border(),
      enabledBorder: _border(),
      focusedBorder: _border(AppPalette.gradient1),
      errorBorder: _border(AppPalette.errorColor),
    ),
    textTheme: TextTheme(
        headlineSmall: _textStyle(
          fontWeight: FontWeight.w500,
        ),
        titleLarge: _textStyle(
          fontWeight: FontWeight.w500,
        ),
        titleSmall: _textStyle(),
        titleMedium: _textStyle(color: Colors.white),
        bodySmall: _textStyle(color: AppPalette.greyColor)),
  );
}
