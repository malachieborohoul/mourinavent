// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:rinavent/core/theme/theme_helper.dart';
import 'package:rinavent/core/utils/size_utils.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLargeBlack900 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.black900,
      );

  static get bodyLargeGray600 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.hintColor,
      );

  static get bodyLargeGray700_1 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray700,
      );

  static get titleMedium18 => theme.textTheme.titleMedium!.copyWith(
        fontSize: 18.fSize,
      );

  static get bodyLargeGray100 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray100,
      );

  static get bodyLargePrimary => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.primary,
      );

  static get bodyLargeRed400 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.red400,
      );

  static get bodyLargeSatoshiBlack900 =>
      theme.textTheme.bodyLarge!.satoshi.copyWith(
        color: appTheme.black900,
      );

  static get bodyLargeff000000 => theme.textTheme.bodyLarge!.copyWith(
        color: const Color(0XFF000000),
      );

  static get bodyLargeff5486e9 => theme.textTheme.bodyLarge!.copyWith(
        color: const Color(0XFF5486E9),
      );

  static get bodyMediumBlack900 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.black900,
        fontSize: 13.fSize,
      );

  static get bodyMediumBlack900_1 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.black900,
      );

  // Headline text style
  static get headlineMediumWhiteA700 =>
      theme.textTheme.headlineMedium!.copyWith(
        color: appTheme.whiteA700,
      );

  static get headlineMediumff000000 => theme.textTheme.headlineMedium!.copyWith(
        color: const Color(0XFF000000),
      );

  static get homeWelcome => theme.textTheme.headlineMedium!.copyWith(
        color: appTheme.whiteA700,
      );

  static get headlineMediumff000000Regular =>
      theme.textTheme.headlineMedium!.copyWith(
        color: const Color(0XFF000000),
        fontWeight: FontWeight.w400,
      );

  // Title text style
  static get titleLarge22 => theme.textTheme.titleLarge!.copyWith(
        fontSize: 22.fSize,
      );

  static get titleLargeBlack900 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.black900,
        fontSize: 22.fSize,
        fontWeight: FontWeight.w700,
      );

  static get titleLargeBlack900_1 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.black900,
      );

  static get titleMediumPrimary => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
      );

  static get titleMediumPrimaryMedium => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 16.fSize,
        fontWeight: FontWeight.w500,
      );

  static get titleMediumWhiteA700 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 18.fSize,
        fontWeight: FontWeight.w700,
      );

  static get titleSmallBlack900 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black900,
      );

  static get titleSmallGray700 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray700,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w600,
      );

  static get titleSmallSemiBold => theme.textTheme.titleSmall!.copyWith(
        fontWeight: FontWeight.w600,
      );

  static get titleSmallSemiBold14 => theme.textTheme.titleSmall!.copyWith(
        fontSize: 14.fSize,
        fontWeight: FontWeight.w600,
      );

  static get titleMediumOnPrimaryContainerMedium =>
      theme.textTheme.titleMedium!.copyWith(
        // color: theme.colorScheme.onPrimaryContainer,
        color: appTheme.whiteA700,
        fontSize: 16.fSize,
        fontWeight: FontWeight.w500,
      );
}

extension on TextStyle {
  TextStyle get satoshi {
    return copyWith(
      fontFamily: 'Satoshi',
    );
  }

  TextStyle get sFProDisplay {
    return copyWith(
      fontFamily: 'SF Pro Display',
    );
  }
}
