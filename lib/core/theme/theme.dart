import 'package:flutter/material.dart';
import 'package:mourinavent/core/theme/app_palette.dart';

class AppTheme {
  static _border([Color color = AppPalette.borderColor]) => OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      );

  static _textStyle({Color color = Colors.black, FontWeight fontWeight = FontWeight.normal}) => TextStyle(
        fontFamily: 'Inter',
        color: color,
        fontWeight: fontWeight
      );
  static final lightThemeMode = ThemeData.light().copyWith(
    checkboxTheme: const CheckboxThemeData(
        fillColor: WidgetStatePropertyAll(AppPalette.gradient1)),
    scaffoldBackgroundColor: AppPalette.backgroundColor,
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: const TextStyle(color: AppPalette.greyColor, fontSize: 12),
      contentPadding: const EdgeInsets.all(15),
      border: _border(),
      enabledBorder: _border(),
      focusedBorder: _border(AppPalette.gradient1),
      errorBorder: _border(AppPalette.errorColor),
    ),
    textTheme:  TextTheme(
      headlineSmall: _textStyle( fontWeight: FontWeight.w500,),
      titleLarge: _textStyle( fontWeight: FontWeight.w500,),
      titleSmall: _textStyle() ,
      titleMedium: _textStyle(color: Colors.white),
      bodySmall: _textStyle(color: AppPalette.greyColor)
    ),
  );
}
