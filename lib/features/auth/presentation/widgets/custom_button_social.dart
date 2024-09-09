import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rinavent/core/contants/constants.dart';
import 'package:rinavent/core/theme/app_palette.dart';

class CustomButtonSocial extends StatelessWidget {
  final String svgIcon;
  final VoidCallback onPressed;
  const CustomButtonSocial({super.key, required this.svgIcon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    const size = 65.0;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          color: AppPalette.backgroundColor,
          borderRadius: BorderRadius.circular(size),
          border: Border.all(color: AppPalette.borderColor, width: 1)),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppPalette.transparentColor,
          shadowColor: AppPalette.transparentColor,
          padding: EdgeInsets.zero,
        ),
        onPressed: onPressed,
        child: SvgPicture.asset(
          Constants.assetImg + svgIcon,
          fit: BoxFit.none,
        ),
      ),
    );
  }
}
